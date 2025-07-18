using System;
using System.Data;
using System.Web.UI;

namespace ProductivityPointGlobal.courses
{
    public partial class Default : Page
    {
        public static string PageTitle { get; private set; }
        public static string SeoDescription { get; private set; }
        public static string SeoKeywords { get; private set; }

        public static string ImagePath { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            GetSeo();
            AppHelpers.PageTitle(PageTitle);
            AppHelpers.MetaData("description", SeoDescription);
            AppHelpers.MetaData("keywords", SeoKeywords);
            GetImage();
        }

        private static void GetImage()
        {
            var dt = CmsAdmin.GetPageImage("", "Courses Page");
            foreach (DataRow row in dt.Rows)
            {
                ImagePath = row["img_path"].ToString();
            }
        }

        private static void GetSeo()
        {
            var dataTable = CmsAdmin.RetrievePageById(25);
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