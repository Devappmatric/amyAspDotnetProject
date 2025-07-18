using System;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.courses
{
    public partial class ClassByLocation : System.Web.UI.Page
    {
        public static string VenueId { get; private set; }
        public static string SeoDescription { get; private set; }
        public static string SeoKeywords { get; private set; }
        public static string SeoTitle { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            VenueId = HttpUtility.HtmlDecode(Page.RouteData.Values["venueId"].ToString());

            if (!IsPostBack)
            {
                //GetCourseSeo();                
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

        private static void GetCourseSeo()
        {
            var dataTable = CmsAdmin.GetCourseSeo(VenueId);
            if (dataTable == null)
                return;
            foreach (DataRow dataRow in (InternalDataCollectionBase)dataTable.Rows)
            {
                SeoDescription = dataRow["metaDescription"].ToString();
                SeoKeywords = dataRow["metaKeywords"].ToString();
                SeoTitle = dataRow["metaTitle"].ToString();
            }
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