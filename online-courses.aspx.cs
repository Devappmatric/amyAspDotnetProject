using System;
using System.Data;
using System.Text;

namespace ProductivityPointGlobal
{
    public partial class OnlineCourses : System.Web.UI.Page
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
            var dataTable = CmsAdmin.RetrievePageById(27);
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