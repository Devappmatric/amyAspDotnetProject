using System;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web.UI;

namespace ProductivityPointGlobal
{
    public partial class InfoRequest : Page
    {
        public static string PageTitle { get; private set; }
        public static string SeoDescription { get; private set; }
        public static string SeoKeywords { get; private set; }
        public string ContactFormToEmail { get; set; }
        public string ContactFormSubject { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            GetSeo();
            AppHelpers.PageTitle(PageTitle);
            AppHelpers.MetaData("description", SeoDescription);
            AppHelpers.MetaData("keywords", SeoKeywords);
        }
        private static void GetSeo()
        {
            var dataTable = CmsAdmin.RetrievePageById(14);
            if (dataTable == null)
                return;
            foreach (DataRow dataRow in (InternalDataCollectionBase)dataTable.Rows)
            {
                PageTitle = dataRow["pageTitle"].ToString();
                SeoDescription = dataRow["metaDescription"].ToString();
                SeoKeywords = dataRow["metaKeywords"].ToString();
            }
        }

        protected void ctlSubmitForm_Click(object sender, EventArgs e)
        {
            var name = ctlUsernameNew.Text;
            var title = ctlTitle.Text;
            var company = ctlCompany.Text;
            var email = ctlEmail.Text;
            var phone = ctlPhone.Text;
            var comment = ctlComment.Text;

            var mailMessage = new StringBuilder();
            mailMessage.Append("<strong>Name:</strong> " + name + "<br />");
            mailMessage.Append("<strong>Title:</strong> " + title + "<br />");
            mailMessage.Append("<strong>Company:</strong> " + company + "<br />");
            mailMessage.Append("<strong>Email:</strong> " + email + "<br />");
            mailMessage.Append("<strong>Phone:</strong> " + phone + "<br />");
            mailMessage.Append("<strong>Questions/Comments:</strong> " + comment);

            ContactFormToEmail = ConfigurationManager.AppSettings["InfoMailTo"];// "info@productivitypoint.com";            
            ContactFormSubject = "Productivity Point Learning Solutions - Info Request";

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
                Response.Redirect("ThankYou.aspx");
            }
        }
    }
}