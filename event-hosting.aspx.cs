using System;
using System.Data;
using System.Web.UI;

namespace ProductivityPointGlobal
{
    public partial class EventHosting : Page
    {
        public static string PageTitle { get; private set; }
        public static string SeoDescription { get; private set; }
        public static string SeoKeywords { get; private set; }
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
            var dataTable = CmsAdmin.RetrievePageById(8);
            if (dataTable == null)
                return;
            foreach (DataRow dataRow in (InternalDataCollectionBase)dataTable.Rows)
            {
                PageTitle = dataRow["pageTitle"].ToString();
                SeoDescription = dataRow["metaDescription"].ToString();
                SeoKeywords = dataRow["metaKeywords"].ToString();
            }
            PageTitle = "Corporate Venue Rentals for Training, Events, & Conferences";
            SeoDescription = "Host your next training, seminar, or meeting at Productivity Point. Flexible event spaces with tech support, catering options, and a professional setting.";

        }
    }
}