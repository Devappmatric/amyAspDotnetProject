using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal
{
    public partial class professional_development : System.Web.UI.Page
    {
        public static string PageTitle { get; private set; }
        public static string SeoDescription { get; private set; }
        public static string SeoKeywords { get; private set; }
        public static string Cat2 { get; private set; }

        public static string ImagePath { get; set; }

        public static DataTable Topics { get; private set; }

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
            var dt = CmsAdmin.GetPageImage("", "Professional Courses");
            foreach (DataRow row in dt.Rows)
            {
                ImagePath = row["img_path"].ToString();
            }
        }

        private static void GetSeo()
        {
            var dataTable = CmsAdmin.RetrievePageById(23);
            if (dataTable == null)
                return;
            foreach (DataRow dataRow in (InternalDataCollectionBase)dataTable.Rows)
            {
                PageTitle = dataRow["pageTitle"].ToString();
                SeoDescription = dataRow["metaDescription"].ToString();
                SeoKeywords = dataRow["metaKeywords"].ToString();
            }
            PageTitle = "Leadership & Professional Development Training Courses";
            SeoDescription = "Build leadership, communication, and soft skills with expert-led professional development training from Productivity Point—online, in-person, or onsite.";
        }
        private void GetCourseLinks()
        {
            //var brands = ContentAdditional.GetMainTechnicalCoursesCatalogBrands("Professional Development Skills");

            //CatalogBrandRepeater.DataSource = brands;
            //CatalogBrandRepeater.DataBind();

            var topics = ContentAdditional.GetMainTechnicalCoursesCatalogTopic("Professional Development Skills");
            Topics = topics;
            //CategoryTopicRepeater.DataSource = topics;
            //CategoryTopicRepeater.DataBind();
        }
    }
}