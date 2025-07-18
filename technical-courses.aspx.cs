using System;
using System.Data;
using System.Text;
using System.Web.UI;

namespace ProductivityPointGlobal
{
    public partial class TechnicalCourses : Page
    {
        public static string PageTitle { get; private set; }
        public static string SeoDescription { get; private set; }
        public static string SeoKeywords { get; private set; }
        public static string Cat2 { get; private set; }

        public static DataTable Brands { get; private set; }
        public static DataTable Topics { get; private set; }

        public static string ImagePath { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            GetSeo();
            AppHelpers.PageTitle(PageTitle);
            AppHelpers.MetaData("description", SeoDescription);
            AppHelpers.MetaData("keywords", SeoKeywords);

            GetCourseLinks();
            GetImage();
        }

        private static void GetImage()
        {
            var dt = CmsAdmin.GetPageImage("", "Technical Courses");
            foreach (DataRow row in dt.Rows)
            {
                ImagePath = row["img_path"].ToString();
            }
        }

        private void GetCourseLinks()
        {
            //var data = ContentAdditional.GetMainTechnicalCourses("TechnicalCourses");
           

            var brands = ContentAdditional.GetMainTechnicalCoursesCatalogBrands("Technical Courses");
            Brands = brands;
            //CatalogBrandRepeater.DataSource = brands;
            //CatalogBrandRepeater.DataBind();

            var topics= ContentAdditional.GetMainTechnicalCoursesCatalogTopic("Technical Courses");
            Topics = topics;
            //CategoryTopicRepeater.DataSource = topics;
            //CategoryTopicRepeater.DataBind();
        }

        private static void GetSeo()
        {
            var dataTable = CmsAdmin.RetrievePageById(24);
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