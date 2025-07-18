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
    public partial class Payment2 : Page
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
            //GetUserInfo();
            //BillingInfo();
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
                    var amount = ShoppingCartAccess.GetTotalAmount();
                    long intAmt = (long)decimal.Round(amount, 2) * 100;
                    //square
                    Square.Connect.Client.Configuration.Default.AccessToken = ConfigurationManager.AppSettings["Square.AccessToken"];
                    var idempotencyKey = Guid.NewGuid().ToString();

                    Square.Connect.Model.ChargeRequest rq = new Square.Connect.Model.ChargeRequest(IdempotencyKey: idempotencyKey,
                        AmountMoney: new Square.Connect.Model.Money(intAmt, "USD"),
                        CardNonce: nonce.Value,
                        ReferenceId: orderId.ToString());
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
                    Response.Redirect("~/cart/confirmation-cc-2.aspx", true);
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
                catch (PayException e)
                {
                    if (cmd.Transaction != null)
                        cmd.Transaction.Rollback();
                    phCCError.Visible = true;
                    ltrErr.Text = string.Join("", e.PayErrors.errors.Select(er => "<li>" + er.Detail + "</li>").ToArray());
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "payment", "togglePayment();setTimeout(function(){ window.scrollTo(0,$('.payment').offset().top);},200);", true);
                    return;
                }
                catch (Exception e)
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

        }


        public void ctlSubmitOrder_Click(object sender, EventArgs e)
        {
            Trace.Write("payment", "ctlSubmitOrder_Click");

            if (ctlBillingInfoPaymentMethod.SelectedValue == "Check")
            {
                // Get Invoice #     
                using (var cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLConnectionProd"].ConnectionString))
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
                        var amount = 0;
                        decimal subtotal = ShoppingCartAccess.GetTotalAmount();
                        decimal discount = subtotal - amount;
                        SaveAsOrder(cmd, "Check", "Pending", (string)Session["CouponCode"], subtotal, discount, amount, orderNumber, ctlPO.Text);
                        cmd.Transaction.Commit();
                        Response.Redirect($"~/cart/confirmation-cc-2.aspx?order={orderNumber}&method=Check&ordernumber={ctlPO.Text}", true);
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
            }
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
                    ctlRoutingNumber.Text = "";
                    ctlAccountNumber.Text = "";
                    ctlAccountType.SelectedIndex = 0;
                    ctlBankName.Text = "";
                    ctlBankAccountName.Text = "";
                    break;

            }
        }

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
}