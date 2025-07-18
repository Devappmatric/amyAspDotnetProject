using System;
using System.Configuration;
using System.Text;
using System.Web;
using System.Web.UI;

namespace ProductivityPointGlobal.cart
{
    public partial class Account : Page
    {
        public string ContactFormToEmail { get; set; }
        public string ContactFormSubject { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            AppHelpers.PageTitle("Productivity Point Learning Solutions - Account Information");
            AppHelpers.MetaData("description", "");
            AppHelpers.MetaData("keywords", "Account Information, Productivity Point Learning Solutions");            
        }

        protected void ctlLogInUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/cart/login.aspx");
        }

        protected void ctlCreateAccount_Click(object sender, EventArgs e)
        {
            var username = ctlUsernameNew.Text.Trim();
            var password = ctlPassword.Text.Trim();
            var firstName = ctlFirstName.Text.Trim();
            var lastName = ctlLastName.Text.Trim();
            var phone = ctlPhone.Text.Trim();
            var company = ctlCompany.Text.Trim();
            var address = ctlAddress.Text.Trim();
            var city = ctlCity.Text.Trim();
            var country = ctlCountry.SelectedValue;
            var state = ctlState.Text.Trim();
            var zipcode = ctlZipCode.Text.Trim();
            var billingFirstname = ctlBillingFirstName.Text.Trim();
            var billingLastname = ctlBillingLastName.Text.Trim();
            var billingPhone = ctlBillingPhone.Text.Trim();
            var billingCompany = ctlBillingCompany.Text.Trim();
            var billingAddress = ctlBillingAddress.Text.Trim();
            var billingCity = ctlBillingCity.Text.Trim();
            var billingCountry = ctlBillingCountry.SelectedValue;
            var billingState = ctlBillingState.Text.Trim();
            var billingZipcode = ctlBillingZipCode.Text.Trim();

            //Check if user already exists
            var checkUsernameDuplicate = UserInfo.CheckForExistingUser(username);

            if (checkUsernameDuplicate.Rows.Count > 0)
            {
                ctlAccountStatus.Text = "Username already exists.";
                phCCError.Visible = true;
            }
            else
            {
                ctlAccountStatus.Text = "";
                phCCError.Visible = false;
                // Create User            
                UserInfo.CreateUser(username, password, firstName, lastName, phone, company, address, city, country, state, zipcode, billingFirstname, billingLastname, billingPhone, billingCompany, billingAddress, billingCity, billingCountry, billingState, billingZipcode);

                var userNameCookie = Request.Cookies.Get("UserSettings");

                if (userNameCookie == null)
                {
                    userNameCookie = new HttpCookie("UserSettings")
                    {
                        ["Username"] = username,
                        Value = username,
                        Expires = DateTime.Now.AddDays(1)
                    };
                    Response.Cookies.Add(userNameCookie);
                }

                var mailMessage = new StringBuilder();
                mailMessage.Append("Dear " + firstName + "," + "<br /><br />");
                mailMessage.Append("Thank you for registering with Productivity Point Learning Solutions. Please use the following Username and Password listed below to Login to our website." + "<br /><br />");
                mailMessage.Append("<strong>Username:</strong> " + username + "<br />");
                mailMessage.Append("<strong>Password:</strong> " + password + "<br /><br />");
                mailMessage.Append("Remember to safeguard your login information." + "<br /><br />");
                mailMessage.Append("Regards," + "<br /><br />");
                mailMessage.Append("Client Services Associate" + "<br />" + "Productivity Point Learning Solutions" + "<br />" + "Phone: 844-238-8607");

                var userEmail = ctlUsernameNew.Text.Trim();
                ContactFormSubject = "Productivity Point Learning Solutions - New User Registration";
                ContactFormToEmail = ConfigurationManager.AppSettings["RegistrationMailTo"] + ";" + userEmail;//registration@productivitypoint.com

                try
                {                    
                    App.SendEmail(ConfigurationManager.AppSettings["MailFrom"], ContactFormToEmail, ContactFormSubject, mailMessage.ToString());                    
                }
                catch (Exception ex)
                {
                    AppUtilities.LogError(ex);
                }
                finally
                {
                    Response.Redirect("~/cart/account-edit.aspx/#linkStudInfo");
                }
            }
        }

        protected void ctlCancel_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void ctlBillingInfoSame_OnCheckedChanged(object sender, EventArgs e)
        {
            if (ctlBillingInfoSame.Checked)
            {
                ctlBillingFirstName.Text = ctlFirstName.Text;
                ctlBillingLastName.Text = ctlLastName.Text;
                ctlBillingPhone.Text = ctlPhone.Text;
                ctlBillingCompany.Text = ctlCompany.Text;
                ctlBillingAddress.Text = ctlAddress.Text;
                ctlBillingCity.Text = ctlCity.Text;
                ctlBillingZipCode.Text = ctlZipCode.Text;
                ctlBillingCountry.Text = ctlCountry.Text;
                ctlBillingState.Text = ctlState.Text;
            }
            else
            {
                ctlBillingFirstName.Text = "";
                ctlBillingLastName.Text = "";
                ctlBillingPhone.Text = "";
                ctlBillingCompany.Text = "";
                ctlBillingAddress.Text = "";
                ctlBillingCity.Text = "";
                ctlBillingZipCode.Text = "";
                ctlBillingCountry.ClearSelection();
                ctlBillingState.Text = "";
            }
        }
    }
}