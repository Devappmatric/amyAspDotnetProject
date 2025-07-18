using System;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.courses
{
    public partial class Schedulebyid : Page
    {
        public static string CourseId { get; set; }
        public static string Location { get; set; }
        public static string SeoDescription { get; set; }
        public static string SeoKeywords { get; set; }
        public static string SeoTitle { get; set; }
        public static string SeoCity { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            CourseId = HttpUtility.HtmlDecode(Page.RouteData.Values["courseId"].ToString().Trim());
            SeoCity = HttpUtility.HtmlDecode(Page.RouteData.Values["seoCity"].ToString().Trim());

            if (!IsPostBack)
            {
                GetCourseSeo();
                GetCourseDetails();
                GetClassSchedule();                
            }

            AppHelpers.PageTitle(SeoTitle);
            AppHelpers.MetaData("description", SeoDescription);
            AppHelpers.MetaData("keywords", SeoKeywords);


            //if (ctlCourseImage.CurrentMode == FormViewMode.ReadOnly)
            //{
            //    var courseImage = (Image)ctlCourseImage.FindControl("ctlCourseLogo");
            //    if (courseImage != null) courseImage.AlternateText = SeoTitle;
            //}
        }

        private static void GetCourseSeo()
        {
            var dataTable = CmsAdmin.GetCourseSeoById(CourseId, SeoCity);
            if (dataTable == null)
                return;
            foreach (DataRow dataRow in (InternalDataCollectionBase)dataTable.Rows)
            {
                SeoDescription = dataRow["metaDescription"].ToString().Trim();
                SeoKeywords = dataRow["courseName"].ToString().Trim() + ", Course, Class, " + dataRow["city"].ToString().Trim() + ", " + dataRow["state"].ToString().Trim();
                SeoTitle = dataRow["courseName"].ToString().Trim() + " - " + dataRow["city"].ToString().Trim() + ", " + dataRow["state"].ToString().Trim();
            }
        }

        private void GetCourseDetails()
        {
            CourseId = HttpUtility.HtmlDecode(Page.RouteData.Values["courseId"].ToString().Trim().Replace("-", " "));

            ctlCourseDetails.DataSource = ContentCourses.CourseDetails2(CourseId);
            ctlCourseDetails.DataBind();
            ltrH1.Text = (ctlCourseDetails.FindControl("ltrName") as Literal).Text;
        }

        private void GetClassSchedule()
        {
            ctlClassSchedule.DataSource = ContentCourses.CourseClassScheduleByCity(SeoCity, CourseId);
            ctlClassSchedule.DataBind();
        }

        public object FormatDate(DateTime input)
        {
            return $"{input:MM/dd/yy}";
        }

        protected void ctlRegister_Click(object sender, EventArgs e)
        {
            //foreach (var cid in from RepeaterItem item in ctlClassSchedule.Items select ((HiddenField)((LinkButton)sender).NamingContainer.FindControl("ctlClassID")).Value)
            //{
            //    ShoppingCartAccess.AddItem(cid);
            //    Response.Redirect("~/cart/");
            //}
            var usernameCookie = Request.Cookies["UserSettings"];
            var username = "";
            if (usernameCookie != null)
            {
                username = usernameCookie.Value;
            }

            var cid = ((HiddenField)((LinkButton)sender).NamingContainer.FindControl("ctlClassID")).Value;
            ShoppingCartAccess.AddItem(cid,username);
            Response.Redirect("~/cart/cart2.aspx",true);
        }

        public string ProcessMyDataItem(object myValue)
        {
            return myValue == DBNull.Value ? "..." : myValue.ToString();
        }

        protected void ctlClassSchedule_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var gtrLabel = (Label)e.Item.FindControl("lblGTR");

                if (Convert.ToBoolean(gtrLabel.ToolTip))
                {
                    gtrLabel.Visible = true;
                }
                else
                {
                    gtrLabel.Visible = false;
                }
            }
        }
    }
}