using System;
using System.Data;
using System.Text;

namespace ProductivityPointGlobal
{
    public partial class DesktopApplications : System.Web.UI.Page
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
            var dt = CmsAdmin.GetPageImage("","Desktop Applications");
            foreach (DataRow row in dt.Rows)
            {
                ImagePath = row["img_path"].ToString();
            }
        }

        private static void GetSeo()
        {
            var dataTable = CmsAdmin.RetrievePageById(21);
            if (dataTable == null)
                return;
            foreach (DataRow dataRow in (InternalDataCollectionBase)dataTable.Rows)
            {
                PageTitle = dataRow["pageTitle"].ToString();
                SeoDescription = dataRow["metaDescription"].ToString();
                SeoKeywords = dataRow["metaKeywords"].ToString();
            }
            PageTitle = "Buisness Application Training Courses: Microsoft, Adobe, And More";
            SeoDescription = "Choose from a robust catalog of Desktop App training. Microsoft Excel, PowerPoint, Adobe & more offered at basic to advanced levels.";
        }

        private void GetCourseLinks()
        {
            var data = ContentAdditional.GetMainTechnicalCourses("DesktopApplications");
            var brands = ContentAdditional.GetMainTechnicalCoursesCatalogBrands("Desktop Applications");
            var sb = new StringBuilder();

            //foreach (DataRow row in data.Rows)
            //{
            //    var dataValue = row["cat2"].ToString();

            //    sb.Append("<li class=\'bold\'><a href=\'/catalog/" + dataValue.ToSeo() + "\'>" + dataValue + "</a></li>");         
            //}

            //litLinks.Text = sb.ToString();

            //CatalogBrandRepeater.DataSource = brands;
            //CatalogBrandRepeater.DataBind();

            var topics = ContentAdditional.GetMainTechnicalCoursesCatalogTopic("Desktop Applications");
            Topics = topics;
            //CategoryTopicRepeater.DataSource = topics;
            //CategoryTopicRepeater.DataBind();
        }
    }
}