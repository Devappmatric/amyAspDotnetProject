using System;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web.UI;

namespace ProductivityPointGlobal
{
    public partial class FindCourse : Page
    {
        public static string PageTitle { get; private set; }
        public static string SeoDescription { get; private set; }
        public static string SeoKeywords { get; private set; }
        public string ContactFormToEmail { get; set; }
        public string ContactFormSubject { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (!Page.IsPostBack)
                return;
            GetSeo();
            AppHelpers.PageTitle(PageTitle);
            AppHelpers.MetaData("description", SeoDescription);
            AppHelpers.MetaData("keywords", SeoKeywords);
        }

        protected void ctlSubmitForm_Click(object sender, EventArgs e)
        {
            var mailMessage = new StringBuilder();
            mailMessage.Append("<strong>My Name Is:</strong> " + ctlName.Text + "<br />");
            mailMessage.Append("<strong>My Email Address Is:</strong> " + ctlEmail.Text + "<br />");
            mailMessage.Append("<strong>My Phone Number Is:</strong> " + ctlPhone.Text + "<br />");
            mailMessage.Append("<strong>I Am Interested In A:</strong> " + ctlInterestedInRBL.SelectedValue + "<br />");
            mailMessage.Append("<strong>This Class Is For:</strong> " + ctlClassIsForRBL.SelectedValue + "<br />");
            mailMessage.Append("<strong>I Am Interested In The Following Course Types:</strong> " + ctlInterestedIn.Text + "<br />");
            mailMessage.Append("<strong>The Approximate Number Of Class Participants Will Be:</strong> " + ctlParticipantsRBL.SelectedValue + "<br />");
            mailMessage.Append("<strong>I Am Interested In A Special Pricing Plan, Due To A Potential Volume Purchase:</strong> " + ctlSpecialPricingRBL.SelectedValue);

            ContactFormToEmail = ConfigurationManager.AppSettings["InfoMailTo"];// "info@productivitypoint.com";
            ContactFormSubject = "Productivity Point Learning Solutions - Find The Right Course Request";

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
        private static void GetSeo()
        {
            var dataTable = CmsAdmin.RetrievePageById(16);
            if (dataTable == null)
                return;
            foreach (DataRow dataRow in (InternalDataCollectionBase)dataTable.Rows)
            {
                PageTitle = dataRow["pageTitle"].ToString();
                SeoDescription = dataRow["metaDescription"].ToString();
                SeoKeywords = dataRow["metaKeywords"].ToString();
            }
        }
    }
}