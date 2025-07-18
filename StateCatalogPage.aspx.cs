using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal
{
    public partial class StateCatalogPage : System.Web.UI.Page
    {
        public string PageTitle { get; set; }
        public string SeoDescription { get; set; }
        public string SeoKeywords { get; set; }

        public string City { get; set; }
        public string State { get; set; }
        public string CourseCatalog { get; set; }
        public string CourseLongDescription { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Zip { get; set; }
        public string CatalogImageUrl { get; set; }
        public string MapLink { get; set; }
        public string MapEmbed { get; set; }
        public int DeliveryFormatCount { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            City = "Boston";
            State = "MA";
            if (IsPostBack) return;
            //GetSeo();
            //AppHelpers.PageTitle(PageTitle);
            //AppHelpers.MetaData("description", SeoDescription);
            //AppHelpers.MetaData("keywords", SeoKeywords);
            //var city = Page.RouteData.Values["city"].ToString();
            var state = Page.RouteData.Values["state"].ToString();

            var courseCategory = Page.RouteData.Values["courseCategory"].ToString();

            var result = ContentCourses.GetStateCatalogPageCourses( state, courseCategory.Replace("-", " "));
            string courseId = "0";
            if (result.Rows.Count > 0)
            {
                AvailableCourses.DataSource = result;
                AvailableCourses.DataBind();
                foreach (DataRow row in result.Rows)
                {
                    courseId = row["courseId"].ToString();
                    City = row["city"].ToString();
                    State = row["state"].ToString();
                    CourseCatalog = row["cat4CityPage"].ToString();
                    CourseLongDescription = row["courseLongDescription"].ToString();
                    Address1 = row["address1"].ToString();
                    Address2 = row["address2"].ToString();
                    Zip = row["zip"].ToString();
                    CatalogImageUrl = row["image"].ToString();
                    MapLink = row["mapLink"].ToString();
                    MapEmbed = row["mapEmbed"].ToString();
                    //GetDeliveryFormat(courseId);
                    break;
                }
                if (CatalogImageUrl != null && CatalogImageUrl != "")
                {
                    HeadingDiv.Style.Add("background-image", "url('" + CatalogImageUrl + "')");
                    CatalogImageUrl = CatalogImageUrl;
                }
                else
                {
                    HeadingDiv.Style.Add("background-image", "url('/images/City_State_Training_Catalog.jpg') #033654 no-repeat center center fixed;");
                    CatalogImageUrl = "/images/City_State_Training_Catalog.jpg";
                }
            }
            else
            {
                throw new HttpException(404, "Not Found");
            }
        }

        private void GetSeo()
        {
            var dataTable = CmsAdmin.RetrievePageById(26);
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