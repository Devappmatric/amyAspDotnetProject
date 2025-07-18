using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Runtime.Serialization;
using System.Security.Authentication;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using AuthorizeNet;
using Square;

namespace ProductivityPointGlobal.cart
{
    public partial class Payment : Page
    {
        public string Username { get; private set; }
        public decimal ShoppingCartTotal { get; set; }
        public decimal ShoppingCartTotalReg { get; set; }
        public decimal CouponCodeTotal { get; set; }
        public decimal CouponCodeAmount { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            //AppHelpers.PageTitle("Productivity Point Learning Solutions - Payment Summary");
            AppHelpers.MetaData("description", "");
            AppHelpers.MetaData("keywords", "Payment Summary, Productivity Point Learning Solutions");

			if (Request.Cookies["UserSettings"] != null)
            {
                Username = Request.Cookies["UserSettings"].Value;
            }
            else
            {
                Response.Redirect("~/cart/login.aspx", true);
            }
            ltrSquare.Text = "<script>var applicationId='" + ConfigurationManager.AppSettings["Square.applicationId"] + "';"
                + "var locationId='" + ConfigurationManager.AppSettings["Square.locationId"] + "';</script>";
            lblCouponStatus.ForeColor = ColorTranslator.FromHtml("#c9302c");
            GetUserInfo();
            BillingInfo();
            //StudentInfo();
            //CreditCardYear();
            //BindBasket();

            //ctlCheckPanel.Visible = false;
            ctlDDPanel.Visible = false;
            if (Page.IsPostBack && this.ctlBillingInfoPaymentMethod.SelectedValue == "CC")
            {
                ProcessCC();
            }
        }
        private void ProcessCC()
        {
            if (string.IsNullOrEmpty(nonce.Value))
            {
                phCCError.Visible = true;
                ltrErr.Text = "<li>Cart Nonce isn't available</li>";
                return;
            }
            using (var cnn = new SqlConnection(AppConfiguration.DbConnectionString))
            {
                var cmd = new SqlCommand("ShoppingCartInvoice", cnn) { CommandType = CommandType.StoredProcedure };
                try
                {
                    cnn.Open();
                    cmd.Transaction = cnn.BeginTransaction();
                    cmd.Parameters.Add("@userName", SqlDbType.NVarChar, -1).Value = Username;
                    cmd.Parameters.Add("@invoiceId", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.ExecuteNonQuery();
                    int invoiceId = (int)cmd.Parameters["@invoiceId"].Value;
                    cmd.CommandText = "ShoppingCartOrder";
                    cmd.Parameters.Clear();
                    cmd.Parameters.Add("@userName", SqlDbType.NVarChar, -1).Value = Username;
                    cmd.Parameters.Add("@orderId", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.ExecuteNonQuery();
                    int orderId = (int)cmd.Parameters["@orderId"].Value;
                    var amount = decimal.Parse(ltrTotal.Text); //ShoppingCartAccess.GetTotalAmount();
                    long intAmt = (long)decimal.Round(amount, 2) * 100;
                    //square
                    Square.Connect.Client.Configuration.Default.AccessToken = ConfigurationManager.AppSettings["Square.AccessToken"];
                    var idempotencyKey = Guid.NewGuid().ToString();

                    Square.Connect.Model.ChargeRequest rq = new Square.Connect.Model.ChargeRequest(IdempotencyKey: idempotencyKey,
                        AmountMoney: new Square.Connect.Model.Money(intAmt,"USD"),
                        CardNonce:nonce.Value,
                        ReferenceId:orderId.ToString());
                    var trans = new Square.Connect.Api.TransactionsApi();
                    decimal paidAmt = 0;
                    try
                    {
                        var rs = trans.Charge(ConfigurationManager.AppSettings["Square.locationId"], rq);
                        cmd.CommandText = "dbo.tblOrderPayment_i";
                        cmd.Parameters.Clear();
                        cmd.Parameters.Add("@orderId", SqlDbType.Int).Value = orderId;
                        cmd.Parameters.Add("@transInfo", SqlDbType.NVarChar, -1).Value = rs.ToJson();
                        if (rs.Transaction != null && rs.Transaction.Tenders != null && rs.Transaction.Tenders[0] != null)
                        {
                            paidAmt = (decimal)rs.Transaction.Tenders[0].AmountMoney.Amount / 100;
                            cmd.Parameters.Add("@amount", SqlDbType.Money).Value = paidAmt;
                            cmd.Parameters.Add("@status", SqlDbType.VarChar, 20).Value = "Paid";
                        }
                        cmd.ExecuteNonQuery();
                    }
                    catch (Square.Connect.Client.ApiException e)
                    {
                        //Newtonsoft.Json.JsonSerializer.Create()
                        var sqErr = Newtonsoft.Json.JsonConvert.DeserializeObject<PayErrors>(e.ErrorContent);
                        //throw new Exception(e.ErrorContent);
                        throw new Exception(string.Format("Payment Error: {0}", e.ErrorContent));
                    }
                    decimal subtotal = decimal.Parse(ltrSubTotal.Text);
                    decimal discount = subtotal - amount;
                    SaveAsOrder(cmd, "Card", "Paid", (string)Session["CouponCode"], subtotal, discount, paidAmt, orderId);
                    cmd.Transaction.Commit();
                    //Response.Redirect("~/cart/confirmation-cc.aspx?invoice=" + "&order=" + orderId.ToString() + "&method=CC");
                    Response.Redirect("~/cart/receipt.aspx", true);
                }
                catch (SqlException e)
                {
                    if (cmd.Transaction != null)
                        cmd.Transaction.Rollback();
                    phCCError.Visible = true;
                    //lblCCError.Text = e.Message;
                    ltrErr.Text = "<li>" + e.Message + "</li>";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "payment", "togglePayment();setTimeout(function(){ window.scrollTo(0,$('.payment').offset().top);},200);", true);
                    return;
                }
                catch(PayException e)
                {
                    if (cmd.Transaction != null)
                        cmd.Transaction.Rollback();
                    phCCError.Visible = true;
                    ltrErr.Text = string.Join("", e.PayErrors.errors.Select(er => "<li>" + er.Detail + "</li>").ToArray());
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "payment", "togglePayment();setTimeout(function(){ window.scrollTo(0,$('.payment').offset().top);},200);", true);
                    return;
                }
                catch(Exception e)
                {
                    if (cmd.Transaction != null)
                        cmd.Transaction.Rollback();
                    phCCError.Visible = true;
                    //lblCCError.Text = e.Message;
                    ltrErr.Text = "<li>" + e.Message + "</li>";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "payment", "togglePayment();setTimeout(function(){ window.scrollTo(0,$('.payment').offset().top);},200);", true);
                    return;
                }
                finally
                {
                    if (cnn.State != ConnectionState.Closed)
                        cnn.Close();
                    cmd.Dispose();
                }
            }
            //Trace.Write("square", rq.ToJson());
            //Trace.Write("square", rs.ToJson());
            //result.Text = rs.ToJson();

        }
        private void SaveAsOrder(SqlCommand cmd, string paymentMethod, string orderstatus, string couponCode,
            decimal subtotal, decimal discount, decimal total, int orderid, string purchaseOrder = "")
        {
            cmd.CommandText = "dbo.order_u";
            cmd.Parameters.Clear();
            cmd.Parameters.Add("@paymentMethod", SqlDbType.VarChar, 10).Value = paymentMethod;
            cmd.Parameters.Add("@orderstatus", SqlDbType.VarChar, 20).Value = orderstatus;
            if (!string.IsNullOrEmpty(purchaseOrder))
                cmd.Parameters.Add("@purchaseOrder", SqlDbType.VarChar, 50).Value = purchaseOrder;
            if (!string.IsNullOrEmpty(couponCode))
            {
                cmd.Parameters.Add("@couponCode", SqlDbType.VarChar, 20).Value = couponCode;
                cmd.Parameters.Add("@discount", SqlDbType.Money).Value = discount;
            }
            cmd.Parameters.Add("@subtotal", SqlDbType.Money).Value = subtotal;
            cmd.Parameters.Add("@total", SqlDbType.Money).Value = total;
            cmd.Parameters.Add("@orderid", SqlDbType.Int).Value = orderid;
            cmd.Parameters.Add("@userinfo", SqlDbType.NVarChar, -1).Value = string.Format("IP: {0} UserAgent: {1}", Request.UserHostAddress, Request.UserAgent);
            cmd.ExecuteNonQuery();

            cmd.CommandText = "dbo.ShoppingCartToOrderLines_i";
            cmd.Parameters.Clear();
            cmd.Parameters.Add("@orderid", SqlDbType.Int).Value = orderid;
            string cartId = null;
            if (Request.Cookies["CartID"] != null)
            {
                cartId = Request.Cookies["CartID"].Value;
            }
            else
            {
                throw new Exception("Shopping cart has been lost");
            }

            cmd.Parameters.Add("@CartId", SqlDbType.Char, 36).Value = cartId;
            cmd.ExecuteNonQuery();

            //clear cart
            cmd.CommandText = "dbo.ShoppingCartDeleteAllItems";
            cmd.Parameters.Clear();
            cmd.Parameters.Add("@CartId", SqlDbType.Char, 36).Value = cartId;
            cmd.ExecuteNonQuery();

            //remove cart cookie
            var coo = new System.Web.HttpCookie("CartID", "")
            {
                HttpOnly = true,
                Expires = DateTime.Now.AddDays(-30)
            };
            Response.Cookies.Add(coo);
            Session["orderid"] = orderid;
        }
        //      protected void CreditCardYear()
        //      {
        //          var startYear = DateTime.Today.ToString("yyyy");
        //          var starYear2Digit = Convert.ToInt32(startYear);
        //       ctlBillingInfoCCYear.Items.Insert(0, new ListItem("YYYY", ""));
        //	ctlBillingInfoCCYear.DataSource = Enumerable.Range(starYear2Digit, +6);
        //          ctlBillingInfoCCYear.DataBind();            
        //}

        //protected void BindBasket()
        //{
        //    ctlCartInfo.DataSource = ShoppingCartAccess.GetItems();
        //    ctlCartInfo.DataBind();

        //    ShoppingCartTotal = ShoppingCartAccess.GetTotalAmount();
        //    ShoppingCartTotalReg = ShoppingCartAccess.GetTotalAmount();
        //    ctlTotalCost.ForeColor = ColorTranslator.FromHtml("#6B6B6B");

        //    var couponCodeTotalFormat = ShoppingCartTotal.ToString("N");
        //    var shoppingCartTotalFormatted = couponCodeTotalFormat.Replace("-", "");

        //    var totalReg = ShoppingCartTotalReg.ToString("N");
        //    var totalRegFormatted = totalReg.Replace("-", "");
        //    ctlTotalCostReg.Text = "$" + totalRegFormatted;

        //    if (Session["DiscountAppliedValue"] == null)
        //    {
        //        pnlCouponApplied.Visible = false;
        //        ctlTotalCost.Text = "$" + shoppingCartTotalFormatted;                
        //    }
        //    else
        //    {
        //        var couponCodeValue = Session["DiscountAppliedValue"];
        //        if (couponCodeValue != null) CouponCodeTotal = (decimal)couponCodeValue;

        //        var cc1 = CouponCodeTotal.ToString("N");
        //        var cc1Formatted = cc1.Replace("-", "");

        //        var couponAmount = Session["DiscountAmount"];
        //        if (couponAmount != null) CouponCodeAmount = (decimal)couponAmount;

        //        ctlTotalCost.Text = "$" + cc1Formatted;                
        //        tbCouponCode.Text = "Offer Code Applied";
        //        tbCouponCode.Enabled = false;

        //        pnlCouponApplied.Visible = true;
        //        ctlDiscountTotal.Text = "-" + $"{CouponCodeAmount:c}";
        //    }
        //}

        //protected void StudentInfo()
        //{
        //    ctlStudentList.DataSource = ShoppingCartAccess.GetStudentInfo(Username);
        //    ctlStudentList.DataBind();
        //}

        protected void GetUserInfo()
        {
            ctlUserInfo.DataSource = ShoppingCartAccess.GetUserInfo(Username);
            ctlUserInfo.DataBind();
        }

        protected void BillingInfo()
        {
            ctlBillingInfoGrid.DataSource = ShoppingCartAccess.GetBillingInfo(Username);
            ctlBillingInfoGrid.DataBind();
        }

        public void ctlSubmitOrder_Click(object sender, EventArgs e)
        {
            Trace.Write("payment", "ctlSubmitOrder_Click");
            //if (ctlBillingInfoPaymentMethod.SelectedValue == "CC")
            //{
            //    foreach (GridViewRow row in ctlUserInfo.Rows) //always single row
            //    {
            //        var cFirstName = ((Label)row.FindControl("ctlFirstName")).Text;
            //        var cLastName = ((Label)row.FindControl("ctlLastName")).Text;
            //        var cPhone = ((Label)row.FindControl("ctlPhone")).Text;
            //        var cCompany = ((Label)row.FindControl("ctlCompany")).Text;
            //        var cAddress = ((Label)row.FindControl("ctlAddress")).Text;
            //        var cCity = ((Label)row.FindControl("ctlCity")).Text;
            //        var cCountry = ((Label)row.FindControl("ctlCountry")).Text;
            //        var cState = ((Label)row.FindControl("ctlState")).Text;
            //        var cZipcode = ((Label)row.FindControl("ctlZipCode")).Text;

            //        foreach (GridViewRow row2 in ctlBillingInfoGrid.Rows) //always single row
            //        {
            //            var bFirstName = ((Label)row2.FindControl("ctlFirstName")).Text;
            //            var bLastName = ((Label)row2.FindControl("ctlLastName")).Text;
            //            var bCompany = ((Label)row2.FindControl("ctlCompany")).Text;
            //            var bAddress = ((Label)row2.FindControl("ctlAddress")).Text;
            //            var bCity = ((Label)row2.FindControl("ctlCity")).Text;
            //            var bCountry = ((Label)row2.FindControl("ctlCountry")).Text;
            //            var bState = ((Label)row2.FindControl("ctlState")).Text;
            //            var bZipcode = ((Label)row2.FindControl("ctlZipCode")).Text;

            //            var amount = ShoppingCartAccess.GetTotalAmount();
            //            ctlTotalCost.Text = $"{amount:c}";
            //            var ccNumber = ctlBillingInfoCardNumber.Text;
            //            var ccExpDate = ctlBillingInfoCCMonth.SelectedValue + ctlBillingInfoCCYear.SelectedValue;

            //            // Get Selected Courses From DataGrid
            //            var rowsCount = ctlCartInfo.Rows.Count;

            //            var sb = new StringBuilder();

            //            for (var i = 0; i < rowsCount; i++)
            //            {
            //                var gridRow = ctlCartInfo.Rows[i];
            //                var courses = (Label)gridRow.FindControl("ctlCourseName");
            //                //var courseChecked = (CheckBox)gridRow.FindControl("ctlCourseChecked");

            //                //if (courseChecked.Checked)
            //                //{
            //                //    sb.Append("[");
            //                //    sb.Append(courses.Text);
            //                //    sb.Append("]");
            //                //    sb.Append(" - ");
            //                //    sb.Replace(" ", "");
            //                //}                            
            //            }

            //            // Get Invoice #                        
            //            var strConnString = AppConfiguration.DbConnectionString;
            //            var con = new SqlConnection(strConnString);

            //            con.Open();

            //            const string sp = ("ShoppingCartInvoice");
            //            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            //            var p1 = new SqlParameter("userName", SqlDbType.NVarChar) { Value = Username };
            //            var p2 = new SqlParameter("invoiceId", SqlDbType.Int) { Direction = ParameterDirection.Output };

            //            cmd.Parameters.Add(p1);
            //            cmd.Parameters.Add(p2);

            //            cmd.ExecuteNonQuery();

            //            // Get Order #                        

            //            const string sp2 = ("ShoppingCartOrder");
            //            var cmd2 = new SqlCommand(sp2, con) { CommandType = CommandType.StoredProcedure };

            //            var p3 = new SqlParameter("userName", SqlDbType.NVarChar) { Value = Username };
            //            var p4 = new SqlParameter("orderId", SqlDbType.Int) { Direction = ParameterDirection.Output };

            //            cmd2.Parameters.Add(p3);
            //            cmd2.Parameters.Add(p4);

            //            cmd2.ExecuteNonQuery();

            //            var invoiceNumber = (int)cmd.Parameters["invoiceId"].Value;
            //            var orderNumber = (int)cmd2.Parameters["orderId"].Value;

            //            // Get Payment Method
            //            var paymentMethod = ctlBillingInfoPaymentMethod.SelectedValue;

            //            // Send Authorization Request To Payment Gateway
            //            var request = new AuthorizationRequest(ccNumber, ccExpDate, amount, "Productivity Point Learning Solutions");
            //            //request.AddCustomer(Username, cFirstName, cLastName, cAddress, cState, cZipcode);
            //            //request.AddShipping(Username, bFirstName, bLastName, bAddress, bState, bZipcode);
            //            request.AddMerchantValue("x_cust_id", Username);
            //            request.AddMerchantValue("x_invoice_num", invoiceNumber.ToString(CultureInfo.InvariantCulture));
            //            request.AddMerchantValue("x_po_num", ctlPO.Text);
            //            request.AddMerchantValue("x_description", sb.ToString());
            //            request.AddMerchantValue("x_city", cCity);
            //            request.AddMerchantValue("x_country", cCountry);
            //            request.AddMerchantValue("x_company", cCompany);
            //            request.AddMerchantValue("x_phone", cPhone);
            //            request.AddMerchantValue("x_email", Username);
            //            request.AddMerchantValue("x_ship_to_city", bCity);
            //            request.AddMerchantValue("x_ship_to_country", bCountry);
            //            request.AddMerchantValue("x_ship_to_company", bCompany);
            //            request.AddMerchantValue("x_card_code", ctlBillingInfoCCVNumber.Text);

            //            //Production account
            //            var gate = new Gateway("9mHxh2hQC4e", "79Eb66CM4L69gpkt", false);

            //            //Test account
            //            //var gate = new Gateway("2e3h4CPb3f7", "6m6fv5yMJ3W4967F", true);

            //            const SslProtocols _Tls12 = (SslProtocols)0x00000C00;
            //            const SecurityProtocolType Tls12 = (SecurityProtocolType)_Tls12;
            //            ServicePointManager.SecurityProtocol = Tls12;

            //            var response = gate.Send(request);

            //            if (response.Approved)
            //            {
            //                // Authorize Purchase
            //                Response.Redirect("~/cart/confirmation-cc.aspx?invoice=" + "&order=" + orderNumber + "&method=" + paymentMethod);
            //            }
            //            else
            //            {
            //                //ctlMerchantStatus.Text = string.Format(response.ResponseCode + " - " + response.Message);
            //                ctlMerchantStatus.Text = "Merchant Status: " + string.Format(response.Message);
            //            }
            //        }
            //    }
            //}

            //else
                if (ctlBillingInfoPaymentMethod.SelectedValue == "Check")
            {
                // Get Invoice #     
                using (var cnn=new SqlConnection(ConfigurationManager.ConnectionStrings["SQLConnectionProd"].ConnectionString))
                {
                    var cmd = new SqlCommand("ShoppingCartInvoice", cnn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    try
                    {
                        cnn.Open();
                        cmd.Transaction = cnn.BeginTransaction();
                        cmd.Parameters.Add("@username", SqlDbType.NVarChar, 100).Value = Username;
                        cmd.Parameters.Add("@invoiceId", SqlDbType.Int);
                        cmd.Parameters["@invoiceId"].Direction = ParameterDirection.Output;
                        cmd.ExecuteNonQuery();
                        var invoiceNumber = (int)cmd.Parameters["@invoiceId"].Value;

                        cmd.CommandText = "ShoppingCartOrder";
                        cmd.Parameters.Clear();
                        cmd.Parameters.Add("@username", SqlDbType.NVarChar, 100).Value = Username;
                        cmd.Parameters.Add("@orderId", SqlDbType.Int);
                        cmd.Parameters["@orderId"].Direction = ParameterDirection.Output;
                        cmd.ExecuteNonQuery();
                        var orderNumber = (int)cmd.Parameters["@orderId"].Value;
                        var amount = decimal.Parse(ltrTotal.Text); //ShoppingCartAccess.GetTotalAmount();
                        decimal subtotal = decimal.Parse(ltrSubTotal.Text);
                        decimal discount = subtotal - amount;
                        SaveAsOrder(cmd, "Check", "Pending", (string)Session["CouponCode"], subtotal, discount, amount, orderNumber, ctlPO.Text);
                        cmd.Transaction.Commit();
                        Response.Redirect("~/cart/receipt.aspx", true);
                    }
                    catch (SqlException ex)
                    {
                        if (cmd.Transaction != null)
                            cmd.Transaction.Rollback();
                        phCCError.Visible = true;
                        //lblCCError.Text = e.Message;
                        ltrErr.Text = "<li>" + ex.Message + "</li>";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "payment", "togglePayment();setTimeout(function(){ window.scrollTo(0,$('.payment').offset().top);},200);", true);
                        return;
                    }
                    catch (Exception ex)
                    {
                        if (cmd.Transaction != null)
                            cmd.Transaction.Rollback();
                        phCCError.Visible = true;
                        //lblCCError.Text = e.Message;
                        ltrErr.Text = "<li>" + ex.Message + "</li>";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "payment", "togglePayment();setTimeout(function(){ window.scrollTo(0,$('.payment').offset().top);},200);", true);
                        return;
                    }
                    finally
                    {
                        if (cnn.State != ConnectionState.Closed)
                            cnn.Close();
                        cmd.Dispose();
                    }
                }
                //var strConnString = AppConfiguration.DbConnectionString;
                //var con = new SqlConnection(strConnString);

                //con.Open();

                //const string sp = ("ShoppingCartInvoice");
                ////var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

                //var p1 = new SqlParameter("userName", SqlDbType.NVarChar) { Value = Username };
                //var p2 = new SqlParameter("invoiceId", SqlDbType.Int) { Direction = ParameterDirection.Output };

                //cmd.Parameters.Add(p1);
                //cmd.Parameters.Add(p2);

                //cmd.ExecuteNonQuery();

                //// Get Order #                        

                //const string sp2 = ("ShoppingCartOrder");
                //var cmd2 = new SqlCommand(sp2, con) { CommandType = CommandType.StoredProcedure };

                //var p3 = new SqlParameter("userName", SqlDbType.NVarChar) { Value = Username };
                //var p4 = new SqlParameter("orderId", SqlDbType.Int) { Direction = ParameterDirection.Output };

                //cmd2.Parameters.Add(p3);
                //cmd2.Parameters.Add(p4);

                //cmd2.ExecuteNonQuery();

                ////var invoiceNumber = (int)cmd.Parameters["invoiceId"].Value;
                //var orderNumber = (int)cmd2.Parameters["orderId"].Value;

                //// Get Payment Method
                //var paymentMethod = ctlBillingInfoPaymentMethod.SelectedValue;

                //// Send Email
                //Response.Redirect("~/cart/confirmation-check.aspx?po=" + ctlPO.Text + "&invoice=" + invoiceNumber + "&order=" + orderNumber + "&method=" + paymentMethod);
            }
      //      else if (ctlBillingInfoPaymentMethod.SelectedValue == "DD")
      //      {
      //          foreach (GridViewRow row in ctlUserInfo.Rows)
      //          {
      //              var cFirstName = ((Label)row.FindControl("ctlFirstName")).Text;
      //              var cLastName = ((Label)row.FindControl("ctlLastName")).Text;
      //              var cPhone = ((Label)row.FindControl("ctlPhone")).Text;
      //              var cCompany = ((Label)row.FindControl("ctlCompany")).Text;
      //              var cAddress = ((Label)row.FindControl("ctlAddress")).Text;
      //              var cCity = ((Label)row.FindControl("ctlCity")).Text;
      //              var cCountry = ((Label)row.FindControl("ctlCountry")).Text;
      //              var cState = ((Label)row.FindControl("ctlState")).Text;
      //              var cZipcode = ((Label)row.FindControl("ctlZipCode")).Text;

      //              foreach (GridViewRow row2 in ctlBillingInfoGrid.Rows)
      //              {
      //                  var bFirstName = ((Label)row2.FindControl("ctlFirstName")).Text;
      //                  var bLastName = ((Label)row2.FindControl("ctlLastName")).Text;
      //                  var bCompany = ((Label)row2.FindControl("ctlCompany")).Text;
      //                  var bAddress = ((Label)row2.FindControl("ctlAddress")).Text;
      //                  var bCity = ((Label)row2.FindControl("ctlCity")).Text;
      //                  var bCountry = ((Label)row2.FindControl("ctlCountry")).Text;
      //                  var bState = ((Label)row2.FindControl("ctlState")).Text;
      //                  var bZipcode = ((Label)row2.FindControl("ctlZipCode")).Text;

      //                  var amount = ShoppingCartAccess.GetTotalAmount();
      //                  ctlTotalCost.Text = $"{amount:c}";
      //                  var ccNumber = ctlBillingInfoCardNumber.Text;
      //                  var ccExpDate = ctlBillingInfoCCMonth.SelectedItem.Value + ctlBillingInfoCCYear.SelectedItem.Value;

      //                  // Get Selected Courses From DataGrid
      //                  var rowsCount = ctlCartInfo.Rows.Count;

      //                  var sb = new StringBuilder();

      //                  for (var i = 0; i < rowsCount; i++)
      //                  {
      //                      var gridRow = ctlCartInfo.Rows[i];
      //                      var courses = (Label)gridRow.FindControl("ctlCourseName");
      //                      //var courseChecked = (CheckBox)gridRow.FindControl("ctlCourseChecked");

      //                      //if (courseChecked.Checked)
      //                      //{
      //                      //    sb.Append("[");
      //                      //    sb.Append(courses.Text);
      //                      //    sb.Append("]");
      //                      //    sb.Append(" - ");
      //                      //    sb.Replace(" ", "");
      //                      //}                             
      //                  }

      //                  // Get Invoice #                        
      //                  var strConnString = AppConfiguration.DbConnectionString;
      //                  var con = new SqlConnection(strConnString);

      //                  con.Open();

      //                  const string sp = ("ShoppingCartInvoice");
      //                  var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

      //                  var p1 = new SqlParameter("userName", SqlDbType.NVarChar) { Value = Username };
      //                  var p2 = new SqlParameter("invoiceId", SqlDbType.Int) { Direction = ParameterDirection.Output };

      //                  cmd.Parameters.Add(p1);
      //                  cmd.Parameters.Add(p2);
      //                  cmd.ExecuteNonQuery();

      //                  // Get Order #                        

      //                  const string sp2 = ("ShoppingCartOrder");
      //                  var cmd2 = new SqlCommand(sp2, con) { CommandType = CommandType.StoredProcedure };

      //                  var p3 = new SqlParameter("userName", SqlDbType.NVarChar) { Value = Username };
      //                  var p4 = new SqlParameter("orderId", SqlDbType.Int) { Direction = ParameterDirection.Output };

      //                  cmd2.Parameters.Add(p3);
      //                  cmd2.Parameters.Add(p4);

      //                  cmd2.ExecuteNonQuery();

      //                  var invoiceNumber = (int)cmd.Parameters["invoiceId"].Value;
      //                  var orderNumber = (int)cmd2.Parameters["orderId"].Value;

      //                  // Get Payment Method
      //                  var paymentMethod = ctlBillingInfoPaymentMethod.SelectedValue;

      //                  // Send Authorization Request To Payment Gateway
      //                  var request = new AuthorizationRequest(ccNumber, ccExpDate, amount, "Productivity Point Learning Solutions");
      //                  //request.AddCustomer(Username, cFirstName, cLastName, cAddress, cState, cZipcode);
      //                  //request.AddShipping(Username, bFirstName, bLastName, bAddress, bState, bZipcode);
      //                  request.AddMerchantValue("x_method", "ECHECK");
      //                  request.AddMerchantValue("x_cust_id", Username);
      //                  request.AddMerchantValue("x_invoice_num", invoiceNumber.ToString(CultureInfo.InvariantCulture));
      //                  request.AddMerchantValue("x_po_num", ctlPO.Text);
      //                  request.AddMerchantValue("x_description", sb.ToString());
      //                  request.AddMerchantValue("x_city", cCity);
      //                  request.AddMerchantValue("x_country", cCountry);
      //                  request.AddMerchantValue("x_company", cCompany);
      //                  request.AddMerchantValue("x_phone", cPhone);
      //                  request.AddMerchantValue("x_email", Username);
      //                  request.AddMerchantValue("x_ship_to_city", bCity);
      //                  request.AddMerchantValue("x_ship_to_country", bCountry);
      //                  request.AddMerchantValue("x_ship_to_company", bCompany);

      //                  request.AddMerchantValue("x_bank_aba_code", ctlRoutingNumber.Text);
      //                  request.AddMerchantValue("x_bank_acct_num", ctlAccountNumber.Text);
      //                  request.AddMerchantValue("x_bank_acct_type", ctlAccountType.SelectedValue);
      //                  request.AddMerchantValue("x_bank_name", ctlBankName.Text);
      //                  request.AddMerchantValue("x_bank_acct_name", ctlBankAccountName.Text);
      //                  request.AddMerchantValue("x_echeck_type", "WEB");
      //                  request.AddMerchantValue("x_relay_response", "false");
      //                  request.AddMerchantValue("x_delim_data", "true");
      //                  request.AddMerchantValue("x_recurring_billing", "false");

      //                  //Production account
      //                  var gate = new Gateway("9mHxh2hQC4e", "79Eb66CM4L69gpkt", false);

						////Test account
						////var gate = new Gateway("9G6H4QExwzj", "62J7cFyJ8Byf8D9J", true);

						//const SslProtocols _Tls12 = (SslProtocols)0x00000C00;
	     //               const SecurityProtocolType Tls12 = (SecurityProtocolType)_Tls12;
	     //               ServicePointManager.SecurityProtocol = Tls12;

						//var response = gate.Send(request);

      //                  if (response.Approved)
      //                  {
      //                      // Authorize Purchase
      //                      Response.Redirect("~/cart/confirmation-cc.aspx?invoice=" + "&order=" + orderNumber + "&method=" + paymentMethod);
      //                  }
      //                  else
      //                  {
      //                      ctlMerchantStatus.Text = string.Format(response.ResponseCode + " - " + response.Message);
      //                      //ctlMerchantStatus.Text = string.Format(response.Message);
      //                  }
      //              }
      //          }
      //      }
        }

        protected void ctlBillingInfoPaymentMethod_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (ctlBillingInfoPaymentMethod.SelectedValue)
            {
                case "CC":
                    ctlCCPanel.Visible = true;
                    ctlCheckPanel.Visible = false;
                    ctlDDPanel.Visible = false;
                    ctlPO.Text = "";
                    ctlRoutingNumber.Text = "";
                    ctlAccountNumber.Text = "";
                    ctlAccountType.SelectedIndex = 0;
                    ctlBankName.Text = "";
                    ctlBankAccountName.Text = "";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "square", "buildSqPayment()", true);
                    break;

                case "Check":
                    ctlCheckPanel.Visible = true;
                    ctlCCPanel.Visible = false;
                    ctlDDPanel.Visible = false;
                    //ctlBillingInfoNameOnCard.Text = "";
                    //ctlBillingInfoCardNumber.Text = "";
                    //ctlBillingInfoCCVNumber.Text = "";
                    //ctlBillingInfoCCMonth.SelectedIndex = 0;
                    //ctlBillingInfoCCYear.SelectedIndex = 0;
                    ctlRoutingNumber.Text = "";
                    ctlAccountNumber.Text = "";
                    ctlAccountType.SelectedIndex = 0;
                    ctlBankName.Text = "";
                    ctlBankAccountName.Text = "";
                    break;

                //case "DD":
                //    ctlDDPanel.Visible = true;
                //    ctlCheckPanel.Visible = false;
                //    ctlCCPanel.Visible = false;
                //    ctlBillingInfoNameOnCard.Text = "";
                //    ctlBillingInfoCardNumber.Text = "";
                //    ctlBillingInfoCCVNumber.Text = "";
                //    break;
            }
        }

        protected void btnApplyCoupon_OnClick(object sender, EventArgs e)
        {
            lblCouponStatus.Text = "";
            var couponValue = tbCouponCode.Text;
            var couponCode = ShoppingCartAccess.GetCouponCode(couponValue);
            Session.Remove("CouponDiscount");
            Session.Remove("CouponCode");

            if (Session["DiscountAppliedValue"] == null)
            {
                if (couponCode.Rows.Count > 0)
                {
                    //Debug.WriteLine("Rows found!");

                    foreach (DataRow row in couponCode.Rows)
                    {
                        var couponEnabled = Convert.ToBoolean(row["CouponEnabled"].ToString());
                        var couponDiscount = Convert.ToInt32(row["CouponDiscount"].ToString());
                        if (couponEnabled)
                        {
                            Session["CouponDiscount"] = couponDiscount;
                            Session["CouponCode"] = couponValue;
                            lvCart.DataBind();
                        }
                        else
                        {
                            lblCouponStatus.Text = "Invalid or Expired Offer Code!";
                        }
                        //switch (couponEnabled)
                        //{
                        //    default:                                                                
                        //        var total = ctlTotalCost.Text;
                        //        var totalCost = decimal.Parse(total, NumberStyles.Currency);
                        //        var discountApplied = totalCost * couponDiscount / 100;
                        //        CouponCodeTotal = discountApplied - totalCost;
                        //        CouponCodeAmount = ShoppingCartTotal * couponDiscount / 100;

                        //        Session["CouponDiscount"] = couponDiscount;

                        //        var c1 = CouponCodeTotal.ToString("N");
                        //        var c1Format = c1.Replace("-", "");

                        //        ctlTotalCost.Text = c1Format;
                        //        Session["DiscountAppliedValue"] = CouponCodeTotal;
                        //        Session["DiscountAmount"] = CouponCodeAmount;
                        //        //Response.Redirect("payment.aspx");
                        //        //BindBasket();
                        //        break;
                        //    case false:
                        //        //lblCouponStatus.Text = "Invalid Offer Code!";                                
                        //        break;
                        //}
                    }
                }
                else
                {
                    //Debug.WriteLine("No Rows found!");    
                    lblCouponStatus.Text = "Invalid Offer Code!";
                }
            }
            else
            {                
                tbCouponCode.Enabled = false;
            }
        }

        protected void btnReset_OnClick(object sender, EventArgs e)
        {
            Session.Remove("CouponDiscount");
            Session.Remove("CouponCode");
            //Session["DiscountAppliedValue"] = null;
            lblCouponStatus.Text = "";
            tbCouponCode.Enabled = true;
            tbCouponCode.Text = "";
            //BindBasket();
            //Response.Redirect("payment.aspx");
            lvCart.DataBind();
        }

        //   protected void ctlBillingInfoCCYear_OnSelectedIndexChanged(object sender, EventArgs e)
        //   {
        //	//var message = ctlBillingInfoCCYear.SelectedItem.Text + " - " + ctlBillingInfoCCYear.SelectedItem.Value;
        // //   ScriptManager.RegisterStartupScript(sender as Control, GetType(), "alert", "alert('" + message + "');", true);
        //	//Session.Add("CreditCardYear", ctlBillingInfoCCYear.SelectedValue);
        //}
        protected void lvCart_DataBound(object sender, EventArgs e)
        {
            pnlCouponApplied.Visible = false;
            if (lvCart.Items.Count == 0)
            {
                Response.Redirect("~/cart/", true);
                return;
            }
            decimal total = 0;
            foreach (var row in lvCart.Items)
            {
                decimal linetotal = decimal.Parse((row.FindControl("linetotal") as Literal).Text);
                total += linetotal;
            }
            ctlTotalCostReg.Text = total.ToString("c");
            int couponDsc = 0;
            if (Session["CouponDiscount"] != null)
            {
                couponDsc = (int)Session["CouponDiscount"];
                ctlDiscountTotal.Text = (total * couponDsc / 100).ToString("c");
                pnlCouponApplied.Visible = true;
            }
            ctlTotalCost.Text = (total * (100 - couponDsc) / 100).ToString("c");
            ltrTotal.Text = (total * (100 - couponDsc) / 100).ToString(format: "f2");
            ltrSubTotal.Text = total.ToString(format: "f2");
        }
    }
    [DataContract]
    class PayErrors
    {
        [DataMember]
        public System.Collections.Generic.IList<Square.Connect.Model.Error> errors { get; set; }
    }
    class PayException : Exception
    {
        public PayErrors PayErrors { get; set; }
    }
}