using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.courses
{
    public partial class coursetopicmainpage : System.Web.UI.Page
    {
        public string SeoTitle { get; set; }
        public string SeoDescription { get; set; }
        public string SeoKeywords { get; set; }

        public string TopicName { get; set; } = "";

        public string City { get; set; }
        public string State { get; set; }
        public string ClosestCity { get; set; }
        public string ClosestState { get; set; }
        public string CourseCatalog { get; set; }
        public string CourseTopicDescription { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Zip { get; set; }
        public string CatalogImageUrl { get; set; }
        public string MapLink { get; set; }
        public string MapEmbed { get; set; }
        public int DeliveryFormatCount { get; set; }

        public string CourseType { get; set; } = "";

        public DataTable CourseAddresss { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var courseTopic = Page.RouteData.Values["courseTopic"].ToString().Replace("-", " ");
                var courseType = Page.RouteData.Values["coursetype"].ToString().Replace("-", " ");

                CourseType = courseType.Trim().ToLower();

                if(courseType == "technical-courses" 
                    || (courseType == "" && courseTopic =="")
                    )
                {
                    Response.Redirect("/courses");
                }

                var result = ContentCourses.GetCourseByTopicName(courseTopic, courseType);

                if (result.Rows.Count > 0)
                {
                    AvailableCourses.DataSource = result;
                    AvailableCourses.DataBind();
                    foreach (DataRow row in result.Rows)
                    {
                        TopicName = row["catalogTopic"].ToString();
                        CourseCatalog = row["cat4CityPage"].ToString();
                        CourseTopicDescription = row["topicDescription"].ToString();
                        CatalogImageUrl = row["image"].ToString();
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
                GetTopicSeo();
            }
            AppHelpers.PageTitle(SeoTitle);
            AppHelpers.MetaData("description", SeoDescription);
            AppHelpers.MetaData("keywords", SeoKeywords);
        }
        public static string FirstCharToUpper(string input)
        {
            if (String.IsNullOrEmpty(input))
                throw new ArgumentException("ARGH!");
            return input.First().ToString().ToUpper() + String.Join("", input.Skip(1));
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

        private void GetTopicSeo()
        {
            var dataTable = CmsAdmin.GetTopicSeo(TopicName);
            if (dataTable == null)
                return;
            foreach (DataRow dataRow in (InternalDataCollectionBase)dataTable.Rows)
            {
                SeoDescription = dataRow["metaDescriptionTopic"].ToString();
                SeoTitle = dataRow["metaTitleTopic"].ToString();
            }
        }

        public string CheckEmptyData(string dataField)
        {
            return string.IsNullOrEmpty(dataField) ? "..." : dataField.Replace("\n", "<br /> ");
        }
    }
}