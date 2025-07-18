using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.Cart
{
    public partial class Confirmation : Page
    {
        public decimal ShoppingCartTotal { get; set; }
        public decimal CouponCodeTotal { get; set; }
        public static string EmailAddress { get; set; }
        public string Username { get; set; }
        public string ContactFormToEmail { get; set; }
        public string ContactFormSubject { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            AppHelpers.PageTitle("Productivity Point Learning Solutions - Payment Confirmation");
            AppHelpers.MetaData("description", "");
            AppHelpers.MetaData("keywords", "Payment Confirmation, Productivity Point Learning Solutions");

            var orderId = Request.QueryString["order"];
            var paymentMethod = Request.QueryString["method"];

            if (Request.Cookies["UserSettings"] != null)
            {
                Username = Request.Cookies["UserSettings"].Value;
            }
            else
            {
                Response.Redirect("~/cart/login.aspx", true);
            }

            if (!IsPostBack)
            {
                //BindBasket();
                UserInfo();
                BillingInfo();
                //StudentInfo();

                ctlTodaysDate.Text = DateTime.Now.ToString("M/d/yyyy");

                //ctlInvoiceNumber.Text = invoiceId;
                ctlOrderNumber.Text = orderId;
                ctlPaymentMethod.Text = paymentMethod;

                // Send User & PPG Email
                EmailUser();

                // Reset Student List
                //ResetStudentList();

                // Reset Shopping Cart Items
                //ShoppingCartAccess.RemoveAllItems();
            }
        }

        //private void BindBasket()
        //{
        //    try
        //    {
        //        var dt = ShoppingCartAccess.GetItems();

        //        ctlCartInfo.DataSource = dt;
        //        ctlCartInfo.DataBind();

        //        ShoppingCartTotal = ShoppingCartAccess.GetTotalAmount();

        //        if (Session["DiscountAppliedValue"] != null)
        //        {
        //            CouponCodeTotal = (decimal)Session["DiscountAppliedValue"];
        //            ctlTotalCost.Text = "$" + Math.Abs(CouponCodeTotal);
        //        }
        //        else
        //        {
        //            ctlTotalCost.Text = "$" + Math.Abs(ShoppingCartTotal);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        AppUtilities.LogError(ex);
        //        throw;
        //    }
        //}

        //protected void StudentInfo()
        //{
        //    ctlStudentList.DataSource = ShoppingCartAccess.GetStudentInfo(Username);
        //    ctlStudentList.DataBind();
        //}

        protected void UserInfo()
        {
            ctlUserInfo.DataSource = ShoppingCartAccess.GetUserInfo(Username);
            ctlUserInfo.DataBind();
        }

        protected void BillingInfo()
        {
            ctlBillingInfoGrid.DataSource = ShoppingCartAccess.GetBillingInfo(Username);
            ctlBillingInfoGrid.DataBind();
        }

        //private void ResetStudentList()
        //{
        //    var strConnString = AppConfiguration.DbConnectionString;
        //    var con = new SqlConnection(strConnString);
        //    con.Open();

        //    var param1 = new SqlParameter("@user_name", Username) {SqlDbType = SqlDbType.NVarChar};

        //    const string sp = "spStudentReset";
        //    var cmd = new SqlCommand(sp, con) {CommandType = CommandType.StoredProcedure};
        //    cmd.Parameters.Add(param1);

        //    try
        //    {
        //        cmd.ExecuteNonQuery();
        //    }
        //    catch (Exception ex)
        //    {
        //        AppUtilities.LogError(ex);
        //        throw;
        //    }
        //    finally
        //    {
        //        con.Close();
        //    }
        //}

        public override void VerifyRenderingInServerForm(Control control)
        {
            //
        }

        private void EmailUser()
        {
            var mailMessage = new StringBuilder();

            mailMessage.Append("<body style='font-family: Arial; font-size: 12px;'>");
            mailMessage.Append("<strong>Thank you for registering with Productivity Point Learning Solutions. We appreciate your Business!</strong>" + "<br /><br />");
            mailMessage.Append("<div style='background-color: #ECF3F9; padding: 10px; font-size: 14px; border-bottom: 1px solid #E5E3E3; margin: 0px 0px 10px 0px;'><strong>Order Summary</strong></div>");
            lvCart.DataBind();

            foreach (var row3 in lvCart.Items)
            {
                var oClass = ((Literal)row3.FindControl("ltrCourse")).Text;
                var oPrice = ((Literal)row3.FindControl("ltrPrice")).Text;
                var oSubtotal = ((Literal)row3.FindControl("ltrLnTot")).Text;
                var oQty = ((Literal)row3.FindControl("ltrSeats")).Text;
                var oFormat = ((Literal)row3.FindControl("ltrDelivery")).Text;
                var oStartDate = ((Literal)row3.FindControl("ltrStartDate")).Text;
                var oEndDate = ((Literal)row3.FindControl("ltrEndDate")).Text;
                var oStartTime = ((Literal)row3.FindControl("ltrStartTime")).Text;
                var oEndTime = ((Literal)row3.FindControl("ltrEndTime")).Text;
                var oDuration = ((Literal)row3.FindControl("ltrDuration")).Text;
                var oAddress1 = ((Literal)row3.FindControl("ltrLocation")).Text;
                var oAddress2 = ((Literal)row3.FindControl("ltrLocation1")).Text;
                //var oCity = ((Literal)row3.FindControl("ctlCity")).Text;
                //var oState = ((Literal)row3.FindControl("ctlState")).Text;
                //var oZip = ((Literal)row3.FindControl("ctlZip")).Text;

                mailMessage.Append("<strong>Class:</strong> " + oClass + "<br />");
                mailMessage.Append("<strong>Price: $</strong> " + oPrice + "<br />");
                mailMessage.Append("<strong>Subtotal:</strong> " + oSubtotal + "<br />");
                mailMessage.Append("<strong>Seats/Quantity:</strong> " + oQty + "<br />");
                mailMessage.Append("<strong>Delivery Format:</strong> " + oFormat + "<br />");
                mailMessage.Append("<strong>Date:</strong> " + oStartDate + " - " + oEndDate + "<br />");
                mailMessage.Append("<strong>Time:</strong> " + oStartTime + " - " + oEndTime + "<br />");
                mailMessage.Append("<strong>Duration:</strong> " + oDuration + "<br />");
                mailMessage.Append("<strong>Location:</strong> " + "<br />");
                mailMessage.Append(oAddress1 + "<br />");
                mailMessage.Append(oAddress2 + "<br /><br />");

                var stud = row3.FindControl("lvStud") as ListView;
                if (stud != null)
                {
                    mailMessage.Append("<p style=\"font-weight:bold\">Registered Students</p><ul>");
                    foreach(var r in stud.Items)
                    {
                        mailMessage.AppendFormat("<li>{0} {1}</li>", ((Literal)r.FindControl("ltrName")).Text, ((Literal)r.FindControl("ltrEmail")).Text);
                    }
                    mailMessage.Append("</ul>");
                }
            }

            mailMessage.Append("<div style='background-color: #ECF3F9; padding: 10px; font-size: 14px; border-bottom: 1px solid #E5E3E3; margin: 0px 0px 10px 0px;'><strong>Student Information</strong></div>");

            //foreach (GridViewRow row4 in ctlStudentList.Rows)
            //{
            //    var sStudent = ((Label)row4.FindControl("ctlStudentName")).Text;
            //    var sEmail = ((Label)row4.FindControl("ctlStudentEmail")).Text;
            //    var sCourse = ((Label)row4.FindControl("ctlStudentCourse")).Text;

            //    mailMessage.Append("<strong>Student Name:</strong> " + sStudent + "<br />");
            //    mailMessage.Append("<strong>E-Mail:</strong> " + sEmail + "<br />");
            //    mailMessage.Append("<strong>Course:</strong> " + sCourse + "<br /><br />");
            //}

            mailMessage.Append("<div style='background-color: #ECF3F9; padding: 10px; font-size: 14px; border-bottom: 1px solid #E5E3E3; margin: 0px 0px 10px 0px;'><strong>Purchasing Information</strong></div>");
            //sb.Append("<strong>Invoice Number:</strong> " + ctlInvoiceNumber.Text + "<br />");
            mailMessage.Append("<strong>Order Number:</strong> " + ctlOrderNumber.Text + "<br />");
            mailMessage.Append("<strong>Order Date:</strong> " + ctlTodaysDate.Text + "<br />");
            mailMessage.Append("<strong>Payment Method:</strong> " + ctlPaymentMethod.Text + "<br />");
            mailMessage.Append("<strong>Total Cost:</strong> " + ctlTotalCost.Text + "<br /><br />");

            mailMessage.Append("<div style='background-color: #ECF3F9; padding: 10px; font-size: 14px; border-bottom: 1px solid #E5E3E3; margin: 0px 0px 10px 0px;'><strong>Billing Information</strong></div>");

            foreach (GridViewRow row in ctlBillingInfoGrid.Rows)
            {
                var bFirstName = ((Label)row.FindControl("ctlFirstName")).Text;
                var bLastName = ((Label)row.FindControl("ctlLastName")).Text;
                var bPhone = ((Label)row.FindControl("ctlPhone")).Text;
                var bCompany = ((Label)row.FindControl("ctlCompany")).Text;
                var bAddress = ((Label)row.FindControl("ctlAddress")).Text;
                var bCity = ((Label)row.FindControl("ctlCity")).Text;
                var bCountry = ((Label)row.FindControl("ctlCountry")).Text;
                var bState = ((Label)row.FindControl("ctlState")).Text;
                var bZipcode = ((Label)row.FindControl("ctlZipCode")).Text;

                mailMessage.Append(bFirstName + " " + bLastName);
                mailMessage.Append("<br />");
                mailMessage.Append(bCompany);
                mailMessage.Append("<br />");
                mailMessage.Append(bAddress);
                mailMessage.Append("<br />");
                mailMessage.Append(bCity + ", " + bState + " " + bZipcode + " " + bCountry);
                mailMessage.Append("<br />");
                mailMessage.Append(bPhone + "<br /><br />");
            }

            mailMessage.Append("<div style='background-color: #ECF3F9; padding: 10px; font-size: 14px; border-bottom: 1px solid #E5E3E3; margin: 0px 0px 10px 0px;'><strong>Contact Information</strong></div>");

            foreach (GridViewRow row2 in ctlUserInfo.Rows)
            {
                EmailAddress = ((HiddenField)row2.FindControl("ctlUserEmail")).Value;
                var uFirstName = ((Label)row2.FindControl("ctlFirstName")).Text;
                var uLastName = ((Label)row2.FindControl("ctlLastName")).Text;
                var uPhone = ((Label)row2.FindControl("ctlPhone")).Text;
                var uCompany = ((Label)row2.FindControl("ctlCompany")).Text;
                var uAddress = ((Label)row2.FindControl("ctlAddress")).Text;
                var uCity = ((Label)row2.FindControl("ctlCity")).Text;
                var uCountry = ((Label)row2.FindControl("ctlCountry")).Text;
                var uState = ((Label)row2.FindControl("ctlState")).Text;
                var uZipcode = ((Label)row2.FindControl("ctlZipCode")).Text;

                mailMessage.Append(uFirstName + " " + uLastName);
                mailMessage.Append("<br />");
                mailMessage.Append(uCompany);
                mailMessage.Append("<br />");
                mailMessage.Append(uAddress);
                mailMessage.Append("<br />");
                mailMessage.Append(uCity + ", " + uState + " " + uZipcode + " " + uCountry);
                mailMessage.Append("<br />");
                mailMessage.Append(uPhone + "<br /><br />");
            }

            mailMessage.Append("<strong>Please allow us 24 hours to process your payment.</strong><br />For more information, please contact us at <strong><a href='tel:1-844-238-8607'>844-238-8607</a><strong> or <a href='mailto:info@productivitypointls.com'>info@productivitypointls.com</a>.<br /><br />");
            mailMessage.Append("</body>");

            ContactFormSubject = "Productivity Point Learning Solutions - Customer Receipt/Purchase Confirmation";
            ContactFormToEmail = ConfigurationManager.AppSettings["OrderMailTo"] + ";" + EmailAddress;

            var msg = mailMessage.ToString();
            //try
            //{
            //App.SendEmail(ConfigurationManager.AppSettings["MailFrom"], ContactFormToEmail, ContactFormSubject, mailMessage.ToString());
            //}
            //catch (Exception ex)
            //{
            //    AppUtilities.LogError(ex);
            //    phErr.Visible = true;
            //    lblErr.Text = ex.Message;
            //}
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
            lblCartTotal.Text = (total * (100 - couponDsc) / 100).ToString("c");
            ltrTotal.Text = (total * (100 - couponDsc) / 100).ToString(format: "f2");
        }
    }
}