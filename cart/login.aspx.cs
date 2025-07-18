using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.cart
{    
    public partial class Login : Page
    {
        private string Pass { get; set; }
        public string ContactFormToEmail { get; set; }
        public string ContactFormSubject { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            AppHelpers.PageTitle("Productivity Point Learning Solutions - User Login");
            AppHelpers.MetaData("description", "");
            AppHelpers.MetaData("keywords", "User Login, Productivity Point Learning Solutions");

            var isForgetPassword = Request.QueryString["forgotpassword"];
            if (isForgetPassword=="true")
            {
                ctlShowPasswordReset.Visible = true;
                ctlShowLoginControls.Visible = false;
                lblHeadingPage.Text = "Recover My Password";
                lblHeadingRegister.Visible = false;
                brnNewRegister.Visible = false;
            }
            else
            {
                if (ctlShowLoginControls.Visible)
                {
                    ctlShowPasswordReset.Visible = false;
                }
                else if (ctlShowPasswordReset.Visible)
                {
                    ctlShowLoginControls.Visible = false;
                }
            }
                    
        }

        protected void ctlGuestLogin_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/cart/account.aspx");
        }

        protected void ctlUserLogin_Click(object sender, EventArgs e)
        {
            var username = ctlUsername.Text;
            var password = ctlPassword.Text;

            var admin = UserInfo.UserAuthenticate(username, password);

            if (admin?.Rows.Count > 0)
            {
                ResetStudentList();
                PopulateCart();
            }

            //Add in Cookie
            HttpCookie myCookieUsername = new HttpCookie("RememberMeUserName");
            HttpCookie myCookiePassword = new HttpCookie("RememberMePassword");
            myCookieUsername.Value = "";
            myCookiePassword.Value = "";
            DateTime now = DateTime.Now;


           
            // Set the cookie expiration date.
            myCookieUsername.Expires = now.AddYears(1);
            myCookiePassword.Expires = now.AddYears(1);


            // Add the cookie.
            Response.Cookies.Add(myCookieUsername);
            Response.Cookies.Add(myCookiePassword);




            if (admin?.Rows.Count > 0)
            {
                var userName = ctlUsername.Text;

                var userNameCookie = Request.Cookies.Get("UserSettings");

                if (userNameCookie == null)
                {
                    userNameCookie = new HttpCookie("UserSettings")
                    {
                        ["Username"] = userName,
                        Value = userName,
                        Expires = DateTime.Now.AddYears(1)
                    };


                    Response.Cookies.Add(userNameCookie);
                }

                // Reset Student List
                
            }
            Response.Redirect("~/cart/cart2.aspx");//account-edit.aspx
        }

        private void PopulateCart()
        {
            var usernameCookie = Request.Cookies["UserSettings"];
            var username = "";
            if (usernameCookie != null)
            {
                username = usernameCookie.Value;
            }
            if (username == "")
                return;
            var carts = UserInfo.GetUserCart(username);
            if (carts.Rows.Count > 0)
            {
                foreach (DataRow row in carts.Rows)
                {
                    var classId = row["courseId"].ToString();
                    ShoppingCartAccess.AddItem(classId, "");
                }
            }
        }

        private void ResetStudentList()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);
            con.Open();

            var param1 = new SqlParameter("@user_name", ctlUsername.Text) { SqlDbType = SqlDbType.NVarChar };

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

        protected void ctlLogOutUser_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/cart/");
        }

        protected void ctlLogInUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/cart/login.aspx");
        }

        protected void ctlPasswordReset_Click(object sender, EventArgs e)
        {
            ctlShowPasswordReset.Visible = true;
            ctlShowLoginControls.Visible = false;
            lblHeadingPage.Text = "Recover My Password";
            lblHeadingRegister.Visible = false;
            brnNewRegister.Visible = false;
        }
        protected void brnNewRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Cart/Account.aspx");
        }
        
        protected void ctlCancelPasswordReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");                        
        }

        protected void ctlPasswordRecovery_SendingMail(object sender, MailMessageEventArgs e)
        {
            e.Message.Subject = "PPLS - User Password Reset";
            e.Message.IsBodyHtml = true;
        }

        protected void ctlPasswordRecovery_UserLookupError(object sender, EventArgs e)
        {            
            ctlLoginErrorNotification.Text = "You Entered An Invalid Email Address";
        }

        protected void ctlPasswordResetSubmit_Click(object sender, EventArgs e)
        {
            var email = ctlUsernameEmail.Text;
            var pwd = UserInfo.UserPassword(email);

            foreach (var row in from DataRow row in pwd.Rows from DataColumn dt in pwd.Columns select row)
            {
                Pass = row["password"].ToString();
            }

            var mailMessage = new StringBuilder();
            mailMessage.Append("Your password is listed below:");
            mailMessage.Append("<br /><br />");
            mailMessage.Append("<strong>Password: </strong>" + Pass);
            mailMessage.Append("<br /><br />");
            mailMessage.Append("If you have any questions or trouble logging in please contact us at info@productivitypoint.com");
            mailMessage.Append("<br /><br />");
            mailMessage.Append("Thank you!<br />");
            mailMessage.Append("Productivity Point Learning Solutions");

            var userEmail = ctlUsernameEmail.Text.Trim();
            ContactFormSubject = "Productivity Point Learning Solution - Password Reset";
            ContactFormToEmail = userEmail;

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
                ctlShowPasswordReset.Visible = false;
                ctlShowLoginControls.Visible = true;
            }       
        }
    }
}