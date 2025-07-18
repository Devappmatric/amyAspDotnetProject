using System;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal
{
    public partial class Locationbycity : Page
    {
        public static string SeoCity { get; set; }
        public static string CourseId { get; set; }
        public static string DbSeoCourseName { get; set; }
        public static string DbMetaDescription { get; set; }
        public static string DbCity { get; set; }
        public static string DbState { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Path == "/City/Austin-TX/12966" || Request.Path == "/City/Austin-TX/12593") Response.Redirect("/national-locations.aspx");

            CourseId = HttpUtility.HtmlDecode(Page.RouteData.Values["courseId"].ToString().Trim());
            SeoCity = HttpUtility.HtmlDecode(Page.RouteData.Values["seoCity"].ToString().Trim());

            if (!IsPostBack)
            {
                GetCourseDetails();
                GetClassSchedule();                
            }
            AppHelpers.PageTitle(string.Concat("Productivity Point Learning Solutions - ", DbSeoCourseName + " - " + DbCity + ", " + DbState));
            AppHelpers.MetaData("description", DbMetaDescription);
            AppHelpers.MetaData("keywords", string.Concat(DbSeoCourseName, ", Course, Class, Miami, " + DbCity + ", " + DbState));

            ctlLocation.Text = string.Format(string.Concat(DbCity + ", " + DbState, " Locations"));
        }

        protected void ctlRegister_Click(object sender, EventArgs e)
        {
            var usernameCookie = Request.Cookies["UserSettings"];
            var username = "";
            if (usernameCookie != null)
            {
                username = usernameCookie.Value;
            }
            foreach (var value in from object item in ctlClassSchedule.Items select ((HiddenField)((LinkButton)sender).NamingContainer.FindControl("ctlClassID")).Value)
            {
                ShoppingCartAccess.AddItem(value,username);
                Response.Redirect("~/cart/cart2.aspx");
            }
        }

        public object FormatDate(DateTime input)
        {
            return $"{input:MM/dd/yy}";
        }

        private void GetClassSchedule()
        {
            ctlClassSchedule.DataSource = ContentCourses.CourseClassScheduleByCity(SeoCity, CourseId);
            ctlClassSchedule.DataBind();

            var locationInfo = ContentCourses.CourseClassScheduleByCity(SeoCity, CourseId);
            foreach (DataRow row in locationInfo.Rows)
            {
                DbCity = row["city"].ToString().Trim();
                DbState = row["state"].ToString().Trim();
                DbSeoCourseName = row["seoCourseName"].ToString().Trim();
                DbMetaDescription = row["metaDescription"].ToString().Trim();
            }
        }

        private void GetCourseDetails()
        {
            ctlCourseDetails.DataSource = ContentCourses.SeoPageCourseDetails(CourseId);
            ctlCourseDetails.DataBind();
        }

        public string ProcessMyDataItem(object myValue)
        {
            return myValue == DBNull.Value ? "..." : myValue.ToString();
        }

        public string CheckEmptyData(string dataField)
        {
            return string.IsNullOrEmpty(dataField) ? "..." : dataField.Replace("\n", "<br /> ");
        }
        public string AddComa(string dataField)
        {
            if (dataField == "Live Virtual Training")
            {
                return "Live Virtual Training Format";
            }
            return dataField + ", ";
        }
    }
}