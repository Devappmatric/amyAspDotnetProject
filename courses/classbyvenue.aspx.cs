using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.courses
{
    public partial class ClassByVenue : Page
    {
        public static string VenueId { get; set; }
        public static string SeoCourseName { get; set; }
        public static string SeoDescription { get; set; }
        public static string SeoKeywords { get; set; }
        public static string SeoTitle { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            VenueId = HttpUtility.HtmlDecode(Page.RouteData.Values["venueId"].ToString());

            if (!IsPostBack)
            {
                GetClassSchedule();
            }

            AppHelpers.PageTitle(SeoTitle);
            AppHelpers.MetaData("description", SeoDescription);
            AppHelpers.MetaData("keywords", SeoKeywords);

            ctlTrainingLocations.PostBackUrl = "~/locationsfilteredByClass.aspx";
            ctlDeliveryMethods.PostBackUrl = "~/delivery-methods.aspx";
            ctlCertifications.PostBackUrl = "~/certifications.aspx";
            ctlCourseCatalog.PostBackUrl = "~/courses/default.aspx";
            ctlTrainingLocations.PostBackUrl = "~/locationsfilteredByClass.aspx";
            ctlExplorePPG.PostBackUrl = "~/about-ppg.aspx";
            ctlContacts.PostBackUrl = "~/contact.aspx";
        }

        private void GetClassSchedule()
        {
            VenueId = HttpUtility.HtmlDecode(Page.RouteData.Values["venueId"].ToString());

            ctlClassSchedule.DataSource = ContentCourses.CourseClassScheduleByLocation(VenueId);
            ctlClassSchedule.DataBind();

            ctlCourseDetails.DataSource = ContentCourses.CourseClassScheduleByLocation(VenueId);
            ctlCourseDetails.DataBind();
        }

        public object FormatDate(DateTime input)
        {
            return String.Format("{0:MM/dd/yy}", input);
        }

        protected void ctlRegister_Click(object sender, EventArgs e)
        {
            var usernameCookie = Request.Cookies["UserSettings"];
            var username = "";
            if (usernameCookie != null)
            {
                username = usernameCookie.Value;
            }
            foreach (var cid in from RepeaterItem item in ctlClassSchedule.Items select ((HiddenField)((Button)sender).NamingContainer.FindControl("ctlClassID")).Value)
            {
                ShoppingCartAccess.AddItem(cid,username);
                Response.Redirect("~/cart/cart2.aspx");
            }
        }

        public string ProcessMyDataItem(object myValue)
        {
            return myValue == DBNull.Value ? "..." : myValue.ToString();
        }
    }
}