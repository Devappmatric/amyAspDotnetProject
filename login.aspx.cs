using System;
using System.Drawing;
using System.Web;
using System.Web.Security;

namespace ProductivityPointGlobal
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AppHelpers.PageTitle("Productivity Point - Admin Login");
            AppHelpers.MetaData("description", "");
            AppHelpers.MetaData("keywords", "");
        }

        protected void ctlAdminLogin_OnClick(object sender, EventArgs e)
        {
            var username = ctlUsernameNew.Text;
            var password = ctlPassword.Text;

            if (string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(password))
            {
                ctlError.ForeColor = Color.Red;
                ctlError.Text = "Username and Password required!";
            }
            else
            {
                var admin = CmsAdmin.AdminAuthenticate(username, password);

                if (admin != null)
                {
                    if (admin.Rows.Count > 0)
                    {
                        // Valid password
                        FormsAuthentication.SetAuthCookie(username, false);

                        var ticket = new FormsAuthenticationTicket
                        (
                           1, // version
                           username, // name
                           DateTime.Now, // issueDate
                           DateTime.Now.AddMinutes(30), // expiration
                           false, // isPersistent   
                           "CMS Admin",
                           FormsAuthentication.FormsCookiePath // cookiePath
                         );

                        // Encrypt the ticket.
                        var encTicket = FormsAuthentication.Encrypt(ticket);

                        // Create the cookie.
                        Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, encTicket));

                        Response.Redirect("~/cms/");
                    }
                    else
                    {
                        ctlError.ForeColor = Color.Red;
                        ctlError.Text = "Your Username or Password is incorrect";
                    }
                }
            }
        }
    }
}