using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal
{
    public partial class city_catalog_page : System.Web.UI.Page
    {
        public string PageTitle { get; set; }
        public string SeoDescription { get; set; }
        public string SeoKeywords { get; set; }

        public string City { get; set; }
        public string State { get; set; }
        public string ClosestCity { get; set; }
        public string ClosestState { get; set; }
        public string CourseCatalog { get; set; }
        public string CourseLongDescription { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Zip { get; set; }
        public string CatalogImageUrl { get; set; }
        public string MapLink { get; set; }
        public string MapEmbed { get; set; }
        public int DeliveryFormatCount { get; set; }

        public DataTable CourseAddresss { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            City = "Boston";
            State = "MA";
            if (IsPostBack) return;
            //GetSeo();
            //AppHelpers.PageTitle(PageTitle);
            //AppHelpers.MetaData("description", SeoDescription);
            //AppHelpers.MetaData("keywords", SeoKeywords);
            var closestCity = Page.RouteData.Values["city"].ToString().Replace("-"," ");
            var closestState = Page.RouteData.Values["state"].ToString().Replace("-", " ");
            var courseCategory= Page.RouteData.Values["courseCategory"].ToString().Replace("-", " ");

            if (closestCity.ToLower() == "live")
            {
                throw new HttpException(404, "Not Found");
            }

            var result = ContentCourses.GetCityCatalogPageCourses(closestCity, closestState, courseCategory);
            
            
            if (result.Rows.Count > 0)
            {
                string courseId = "0";
                DataView view = new DataView(result);
                DataTable distinctValues = view.ToTable(true, "address1", "address2", "mapLink", "city", "state", "zip").AsEnumerable().GroupBy(row => row.Field<string>("address1")).Select(group => group.First()).CopyToDataTable();
                CourseAddresss = distinctValues;

                AvailableCourses.DataSource = result;
                AvailableCourses.DataBind();
                foreach (DataRow row in result.Rows)
                {
                    courseId =row["courseId"].ToString();
                    City = row["city"].ToString();
                    State = row["state"].ToString();
                    CourseCatalog = row["cat4CityPage"].ToString();
                    CourseLongDescription = row["TopicDescriptionByCity"].ToString();
                    Address1 = row["address1"].ToString();
                    Address2 = row["address2"].ToString();
                    Zip = row["zip"].ToString();
                    CatalogImageUrl = row["image"].ToString();
                    MapLink = row["mapLink"].ToString();
                    MapEmbed = row["mapEmbed"].ToString();
                    ClosestCity = row["closestCity"].ToString();
                    ClosestState = row["closestState"].ToString();
                    PageTitle = row["metaTitleCityCatalog"].ToString();
                    SeoDescription = row["metaDescriptionCityCatalog"].ToString();
                    //GetDeliveryFormat(courseId);
                    break;
                }
                if (CatalogImageUrl != null && CatalogImageUrl != "")
                {
                    HeadingDiv.Style.Add("background-image", "url('"+CatalogImageUrl+"')");
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
                Response.StatusCode = 404;
                Response.StatusDescription = "Not Found";
                Response.End(); // Ends the response immediately
                return;
                throw new HttpException(404, "Not Found");
            }

            AppHelpers.PageTitle(PageTitle);
            AppHelpers.MetaData("description", SeoDescription);
            AppHelpers.MetaData("keywords", PageTitle+", Productivity Point Learning Solutions");
        }


        private void GetDeliveryFormat(int courseId)
        {
            var result = ContentCourses.GetDeliveryFormatByCourses(courseId);
            if (result.Rows.Count == 2)
            {
                DeliveryFormatCount = 2;
                return;
            }   
            if (result.Rows.Count > 0)
            {
                foreach (DataRow row in result.Rows)
                {
                    var temp = row["deliveryFormat"].ToString();
                    if (temp == "Live Online")
                        DeliveryFormatCount = 0;
                    else
                        DeliveryFormatCount = 1;
                }
               
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

        public string CheckEmptyData(string dataField)
        {
            return string.IsNullOrEmpty(dataField) ? "..." : dataField.Replace("\n", "<br /> ");
        }
    }
}