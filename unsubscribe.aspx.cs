using System;
using System.Configuration;
using System.Text;

namespace ProductivityPointGlobal
{
    public partial class Unsubscribe : System.Web.UI.Page   
    {        
        public string ContactFormToEmail { get; set; }
        public string ContactFormSubject { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            AppHelpers.PageTitle("Email Unsubscribe");
            AppHelpers.MetaData("description", "Email Unsubscribe");
            AppHelpers.MetaData("keywords", "Productivity Point Submission");
            SendEmail();
        }

        private void SendEmail()
        {
            var email = Request.QueryString["emailAddress"];

            var mailMessage = new StringBuilder();
            mailMessage.Append("<strong>The following user has requested to be unsubscribed from mailing lists:</strong><br/><br/>" + "<strong>Email:</strong> " + email);

            ContactFormToEmail = ConfigurationManager.AppSettings["ContactFormMailTo"];// "csa@productivitypoint.com";
            ContactFormSubject = "Productivity Point Learning Solutions - Email Unsubscribe Request";

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
                //Response.Redirect("ThankYou.aspx");
            }
        }
    }
}