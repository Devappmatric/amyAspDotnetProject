using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.cart
{
    public partial class ConfirmationCheck : Page
    {
        public decimal ShoppingCartTotal { get; set; }
        public decimal CouponCodeTotal { get; set; }
        public static string EmailAddress { get; set; }
        public string Username { get; set; }
        public static string FromEmail { get; set; }
        public static string FromName { get; set; }
        public string ContactFormToEmail { get; set; }
        public string ContactFormSubject { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            AppHelpers.PageTitle("Productivity Point Learning Solutions - Payment Confirmation");
            AppHelpers.MetaData("description", "");
            AppHelpers.MetaData("keywords", "Payment Confirmation, Productivity Point Learning Solutions");

            var invoiceId = Request.QueryString["invoice"];
            var orderId = Request.QueryString["order"];
            var purchaseOrder = Request.QueryString["po"];
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
                BindBasket();
                UserInfo();
                BillingInfo();
                StudentInfo();

                ctlTodaysDate.Text = DateTime.Now.ToString("M/d/yyyy");

                ctlInvoiceNumber.Text = invoiceId;
                ctlOrderNumber.Text = orderId;
                ctlPO.Text = purchaseOrder;
                ctlPaymentMethod.Text = paymentMethod;

                // Send User & PPG Email
                EmailUser();

                // Reset Student List
                ResetStudentList();

                // Reset Shopping Cart Items
                ShoppingCartAccess.RemoveAllItems();
            }
        }

        private void BindBasket()
        {
            try
            {
                var dt = ShoppingCartAccess.GetItems();

                ctlCartInfo.DataSource = dt;
                ctlCartInfo.DataBind();

                ShoppingCartTotal = ShoppingCartAccess.GetTotalAmount();

                if (Session["DiscountAppliedValue"] != null)
                {
                    CouponCodeTotal = (decimal) Session["DiscountAppliedValue"];
                    ctlTotalCost.Text = "$" + Math.Abs(CouponCodeTotal);
                }
                else
                {
                    ctlTotalCost.Text = "$" + Math.Abs(ShoppingCartTotal);
                }                                    
            }
            catch (Exception ex)
            {
                AppUtilities.LogError(ex);
                throw;
            }
        }

        protected void StudentInfo()
        {
            ctlStudentList.DataSource = ShoppingCartAccess.GetStudentInfo(Username);
            ctlStudentList.DataBind();
        }

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

        private void ResetStudentList()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);
            con.Open();

            var param1 = new SqlParameter("@user_name", Username) { SqlDbType = SqlDbType.NVarChar };

            const string sp = "spStudentReset";
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };
            cmd.Parameters.Add(param1);

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                AppUtilities.LogError(ex);
                throw;
            }
            finally
            {
                con.Close();
            }
        }

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

            foreach (GridViewRow row3 in ctlCartInfo.Rows)
            {
                var oClass = (Label)row3.FindControl("ctlCourseName");
                var oPrice = (Label)row3.FindControl("ctlCoursePrice");
                var oSubtotal = (Label)row3.FindControl("ctlSubtotal");
                var oQty = (Label)row3.FindControl("ctlQuantity");
                var oFormat = (Label)row3.FindControl("ctlDeliveryFormat");
                var oStartDate = (Label)row3.FindControl("ctlStartDate");
                var oEndDate = (Label)row3.FindControl("ctlEndDate");
                var oStartTime = (Label)row3.FindControl("ctlStartTime");
                var oEndTime = (Label)row3.FindControl("ctlEndTime");
                var oDuration = (Label)row3.FindControl("ctlDuration");
                var oAddress1 = (Label)row3.FindControl("ctlAddress1");
                var oAddress2 = (Label)row3.FindControl("ctlAddress2");
                var oCity = (Label)row3.FindControl("ctlCity");
                var oState = (Label)row3.FindControl("ctlState");
                var oZip = (Label)row3.FindControl("ctlZip");

                mailMessage.Append("<strong>Class:</strong> " + oClass.Text.Trim() + "<br />");
                mailMessage.Append("<strong>Price: $</strong> " + oPrice.Text.Trim() + "<br />");
                mailMessage.Append("<strong>Subtotal:</strong> " + oSubtotal.Text.Trim() + "<br />");
                mailMessage.Append("<strong>Seats/Quantity:</strong> " + oQty.Text.Trim() + "<br />");
                mailMessage.Append("<strong>Delivery Format:</strong> " + oFormat.Text.Trim() + "<br />");
                mailMessage.Append("<strong>Date:</strong> " + oStartDate.Text.Trim() + " - " + oEndDate.Text.Trim() + "<br />");
                mailMessage.Append("<strong>Time:</strong> " + oStartTime.Text.Trim() + " - " + oEndTime.Text.Trim() + "<br />");
                mailMessage.Append("<strong>Duration:</strong> " + oDuration.Text.Trim() + "<br />");
                mailMessage.Append("<strong>Location:</strong> " + "<br />");
                mailMessage.Append(oAddress1.Text.Trim() + " " + oAddress2.Text.Trim() + "<br />");
                mailMessage.Append(oCity.Text.Trim() + " " + oState.Text.Trim() + " " + oZip.Text.Trim() + "<br /><br />");
            }

            mailMessage.Append("<div style='background-color: #ECF3F9; padding: 10px; font-size: 14px; border-bottom: 1px solid #E5E3E3; margin: 0px 0px 10px 0px;'><strong>Student Information</strong></div>");

            foreach (GridViewRow row4 in ctlStudentList.Rows)
            {
                var sStudent = ((Label)row4.FindControl("ctlStudentName")).Text;
                var sEmail = ((Label)row4.FindControl("ctlStudentEmail")).Text;
                var sCourse = ((Label)row4.FindControl("ctlStudentCourse")).Text;

                mailMessage.Append("<strong>Student Name:</strong> " + sStudent + "<br />");
                mailMessage.Append("<strong>E-Mail:</strong> " + sEmail + "<br />");
                mailMessage.Append("<strong>Course:</strong> " + sCourse + "<br /><br />");
            }

            mailMessage.Append("<div style='background-color: #ECF3F9; padding: 10px; font-size: 14px; border-bottom: 1px solid #E5E3E3; margin: 0px 0px 10px 0px;'><strong>Purchasing Information</strong></div>");
            mailMessage.Append("<strong>Invoice Number:</strong> " + ctlInvoiceNumber.Text + "<br />");
            mailMessage.Append("<strong>Order Number:</strong> " + ctlOrderNumber.Text + "<br /><br />");
            mailMessage.Append("<strong>Purchase Order Number:</strong> " + ctlPO.Text + "<br />");
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

            mailMessage.Append("<strong>Please allow us 24 hours to process your order.</strong><br />For more information, please contact us at <strong><a href='tel:1-844-238-8607'>844-238-8607</a> or <a href='mailto:info@productivitypointls.com'>info@productivitypointls.com</a>.</strong><br /><br />");
            mailMessage.Append("<strong>Please send your payment to:</strong><br />Productivity Point Learning Solutions<br />ATT: Accounts Receivable<br />1580 Sawgrass Corporate Parkway<br />Suite 205<br />Sunrise, FL 33323<br />");
            mailMessage.Append("</body>");

            ContactFormSubject = "Productivity Point Learning Solutions - Customer Receipt/Purchase Confirmation";
            ContactFormToEmail = ConfigurationManager.AppSettings["OrderMailTo"] + ";" + EmailAddress;//aspears@productivitypointls.com

            // Send email
            try
            {//"aspears@productivitypointls.com"
                App.SendEmail(ConfigurationManager.AppSettings["MailFrom"], ContactFormToEmail, ContactFormSubject, mailMessage.ToString());
            }
            catch (Exception ex)
            {
                AppUtilities.LogError(ex);
            }
        }
    }
}