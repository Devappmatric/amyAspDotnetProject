using System;
using System.Data;
using System.Web.UI;

namespace ProductivityPointGlobal
{
    public partial class Partners : Page
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

            GetPartners();

            //ctlDeliveryMethods.PostBackUrl = "~/delivery-methods.aspx";
            //ctlCertifications.PostBackUrl = "~/certifications.aspx";
            //ctlCourseCatalog.PostBackUrl = "~/courses/";
            //ctlExplorePPG.PostBackUrl = "~/about-ppg.aspx";
            //ctlContacts.PostBackUrl = "~/contact.aspx";
            //ctlTrainingLocations.PostBackUrl = "~/locations.aspx";
        }
        private static void GetSeo()
        {
            var dataTable = CmsAdmin.RetrievePageById(7);
            if (dataTable == null)
                return;
            foreach (DataRow dataRow in (InternalDataCollectionBase)dataTable.Rows)
            {
                PageTitle = dataRow["pageTitle"].ToString();
                SeoDescription = dataRow["metaDescription"].ToString();
                SeoKeywords = dataRow["metaKeywords"].ToString();
            }
        }

        private void GetPartners()
        {            
            ctlPartners.DataSource = CmsAdmin.GetPartners();
            ctlPartners.DataBind();
        }

        public string CheckEmptyData(string dataField)
        {
            return string.IsNullOrEmpty(dataField) ? "..." : dataField.Replace("\n", "<br /> ");
        }   
    }
}