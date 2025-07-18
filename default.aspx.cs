using System;
using System.Configuration;
using System.Data;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;

namespace ProductivityPointGlobal
{
    public partial class DefaultPage : Page
    {
        public static string PageTitle { get; private set; }
        public static string SeoDescription { get; private set; }
        public static string SeoKeywords { get; private set; }
        public  string ContactFormToEmail { get; set; }
        public string ContactFormSubject { get; set; }

        public static string HomeBannerOneImage { get; set; }
        public static string HomeBannerTwoImage { get; set; }
        public static string HomeBannerThreeImage { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Form.Action = "Default.aspx";

            if (!IsPostBack)
            {
                GetSeo();
                GetBannerImages();
                AppHelpers.PageTitle(PageTitle);
                AppHelpers.MetaData("description", SeoDescription);
                AppHelpers.MetaData("keywords", SeoKeywords);                
            }
        }

        private static void GetBannerImages()
        {
            var dataTable = CmsAdmin.GetPageImages();
            if (dataTable == null)
                return;
            foreach (DataRow dr in dataTable.Rows)
            {
                var pageName = dr["page_name"].ToString();
                if(pageName== "Home Banner 1")
                {
                    HomeBannerOneImage= dr["img_path"].ToString();
                }
                if (pageName == "Home Banner 2")
                {
                    HomeBannerTwoImage = dr["img_path"].ToString();
                }
                if (pageName == "Home Banner 3")
                {
                    HomeBannerThreeImage = dr["img_path"].ToString();
                }
            }
        }

        private static void GetSeo()
        {
            var dataTable = CmsAdmin.RetrievePageById(1);
            if (dataTable == null)
                return;
            foreach (DataRow dr in dataTable.Rows)
            {
                PageTitle = dr["pageTitle"].ToString();
                SeoDescription = dr["metaDescription"].ToString();
                SeoKeywords = dr["metaKeywords"].ToString();
            }

            //Temporary override
            SeoDescription = "Certified IT, business, and leadership training—online, " +
                "on-site, or on-demand. Boost skills with expert-led courses at Productivity Point. " +
                "or Productivity Point offers certified IT and professional development training—online, " +
                "in-class, on-demand, or at your location.";
        }

        protected void btnSubmitHomeForm_OnClick(object sender, EventArgs e)
        {
            var currentUrl = HttpContext.Current.Request.Url.AbsoluteUri;

            //var technicalCourses = cbTechnicalCourses.Checked;
            //var desktopApplications = cbDesktopApplications.Checked;
            //var professionalDevelopment = cbProfessionalDevelopment.Checked;
            //var groupTraining = cbGroupTraining.Checked;
            //var eventHostingPlanning = cbEventHostingPlanning.Checked;
            //var name = tbName.Text;
            //var email = tbEmail.Text;
            //var phone = tbPhone.Text;

            var stringBuilder = new StringBuilder();
            //stringBuilder.Append("<strong>Technical Courses :</strong> " + technicalCourses + "<br />");
            //stringBuilder.Append("<strong>Desktop Applications :</strong> " + desktopApplications + "<br />");
            //stringBuilder.Append("<strong>Professional Development :</strong> " + professionalDevelopment + "<br />");
            //stringBuilder.Append("<strong>Group Training :</strong> " + groupTraining + "<br />");
            //stringBuilder.Append("<strong>Event Hosting &amp; Planning:</strong> " + eventHostingPlanning + "<br />");
            //stringBuilder.Append("<strong>Name:</strong> " + name + "<br />");
            //stringBuilder.Append("<strong>Email:</strong> " + email + "<br />");
            //stringBuilder.Append("<strong>phone:</strong> " + phone + "<br />");
            stringBuilder.Append("<strong>Webpage:</strong> " + currentUrl);

            ContactFormToEmail = ConfigurationManager.AppSettings["ContactFormMailTo"];//"info@productivitypoint.com";            
            ContactFormSubject = "Productivity Point Learning Solutions - Contact Us Form";

            // Send email
            try
            {//"postmaster@productivitypointls.com"
                App.SendEmail(ConfigurationManager.AppSettings["MailFrom"], ContactFormToEmail, ContactFormSubject, stringBuilder.ToString());
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

        protected void ctlSearchMobile_OnClick(object sender, EventArgs e)
        {

        }
    }
}