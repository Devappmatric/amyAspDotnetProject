using System;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.courses
{
    public partial class Training : Page
    {
        public static string Id { get; set; }
        public static string CourseName { get; set; }
        public static string CourseState { get; set; }
        public static string CourseSeoCity { get; set; }
        public static string SeoDescription { get; set; }
        public static string SeoKeywords { get; set; }
        public static string SeoTitle { get; set; }
        public static string Cat3 { get; set; }
        public static string Cat4CityPage { get; set; }
        public static string Cat3TextReplaced { get; set; }
        public static string CourseDescriptionShort { get; set; }
        public static string SeoCity { get; set; }
        public static string SeoCityTextReplaced { get; set; }
        public static string DbSeoCourseName { get; set; }
        public static string DbCity { get; set; }
        public static string DbState { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("/courses");
            return;
            Response.StatusCode = 404;
            Response.StatusDescription = "Not Found";
            Response.Redirect("/courses");
            Response.End(); // Ends the response immediately

            if (Request.Path == "/training/microsoft-powerpoint/chicago-il") Response.Redirect("/catalog/powerpoint");
            if (Request.Path == "/training/microsoft-sharepoint/san-diego-ca") Response.Redirect("/training/sharepoint/san-diego-ca");
            if (Request.Path == "/training/microsoft-sharepoint/atlanta-georgia") Response.Redirect("/training/sharepoint/atlanta-georgia");

            if (Request.Path == "/training/microsoft-system-center/live-online"
                || Request.Path == "/training/linux-and-unix/live-online")
            {
                Response.StatusCode = 404;
                Response.StatusDescription = "Not Found";
                Response.End(); // Ends the response immediately
            }
            try
            {
                Cat3 = HttpUtility.UrlDecode(Page.RouteData.Values["cat3"].ToString().Trim());
                SeoCity = HttpUtility.UrlDecode(Page.RouteData.Values["seoCity"].ToString().Trim());

                Cat3TextReplaced = HttpUtility.UrlDecode(Page.RouteData.Values["cat3"].ToString().Trim().Replace("-", " "));
                SeoCityTextReplaced = HttpUtility.UrlDecode(Page.RouteData.Values["seoCity"].ToString().Trim().Replace("-", " "));

                if (!IsPostBack)
                {
                    GetCourseDetails();
                    GetCourseDescription();
                    GetCourses();
                    GetCourseSeo();
                    GetCourseImage();
                }
            }
            catch(Exception ex)
            {
                Response.StatusCode = 404;
                Response.StatusDescription = "Not Found";
                Response.End(); // Ends the response immediately
            }

           

            AppHelpers.PageTitle(string.Format("{0} Classes, {0} Training | {1}", Cat4CityPage, DbCity + ", " + DbState));
            AppHelpers.MetaData("description", CourseDescriptionShort);
            AppHelpers.MetaData("keywords", $"{Cat4CityPage} training, Course, Class, {DbCity}, {DbState}");
        }

        private void GetCourseDetails()
        {
			var dt = ContentCourses.CourseDetailsForCityPage(Cat3TextReplaced, SeoCity);
			ctlCourseDetails.DataSource = dt;
            ctlCourseDetails.DataBind();
        }

        private void GetCourseDescription()
        {
            ctlCourseDescription.DataSource = ContentCourses.CourseDetailsForCityPage(Cat3TextReplaced, SeoCity);
            ctlCourseDescription.DataBind();

            var courseSeoDescription = ContentCourses.CourseDetailsForCityPage(Cat3TextReplaced, SeoCity);
            foreach (DataRow row in courseSeoDescription.Rows)
            {
                CourseDescriptionShort = row["courseShortDescription"].ToString();
            }
        }

        private void GetCourses()
        {
            var coursesDt = ContentCourses.CoursesForCityPage(Cat3TextReplaced, SeoCity);
            ctlCoursesGrid.DataSource = coursesDt;
            ctlCoursesGrid.DataBind();
        }

        private void GetCourseImage()
        {
            //var cat2 = ((HiddenField)ctlCourseDetails.FindControl("ctlCat2")).Value;
            //ctlCourseImage.DataSource = ContentCourses.CourseImageForCityPage(cat2);
            //ctlCourseImage.DataBind();
        }
        private void GetCourseSeo()
        {
			if(ctlCourseDetails.Row != null){ 
				var courseId = ((HiddenField)ctlCourseDetails.FindControl("ctlCourseId")).Value;
				var locationInfo = ContentCourses.CourseClassScheduleByCity(SeoCity, courseId);

				foreach (DataRow row in locationInfo.Rows)
				{
					Cat4CityPage = row["cat4CityPage"].ToString();
					DbCity = row["city"].ToString();
					DbState = row["state"].ToString();
					DbSeoCourseName = row["seoCourseName"].ToString();
				}
			}
		}

        public string CheckEmptyData(string dataField)
        {
            return string.IsNullOrEmpty(dataField) ? "..." : dataField.Replace("\n", "<br /> ");
        }

        public string CheckCityField(string dataField)
        {
            if (dataField == "Live Virtual Training")
            {
                return "Live Virtual Training Format";
            }
            return dataField;
        }

        public string CheckStateField(string dataField)
        {
            if (dataField == string.Empty)
            {
                return "";
            }
            return ", " + dataField;
        }

        protected void ctlRegister_OnClick(object sender, EventArgs e)
        {
            var usernameCookie = Request.Cookies["UserSettings"];
            var username = "";
            if (usernameCookie != null)
            {
                username = usernameCookie.Value;
            }
            foreach (var cid in from RepeaterItem item in ctlCoursesGrid.Items select ((HiddenField)((Button)sender).NamingContainer.FindControl("ctlClassID")).Value)
            {
                ShoppingCartAccess.AddItem(cid,username);
                Response.Redirect("~/cart/");
            }
        }
    }
}