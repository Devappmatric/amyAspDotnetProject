using System;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.courses
{
    public partial class Schedule : Page
    {
        public  string SeoCourseName { get;  set; }
        public  string SeoDescription { get;  set; }
        public  string SeoKeywords { get;  set; }
        public  string SeoTitle { get;  set; }
        public string SeoCity { get; set; }
        public  string CourseId { get; set; }
        public string BannerPath { get; set; }

        public string CourseDescription { get; set; }
        public string CourseObjective { get; set; }
        public string CourseName { get; set; }

        public string CoursePrerequisites { get; set; }

        public string City { get; set; }
        public string State { get; set; }
        public string ClosestCity { get; set; }
        public string ClosestState { get; set; }
        public string CourseLongDescription { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Zip { get; set; }
        public string MapLink { get; set; }
        public string MapEmbed { get; set; }
        public string CourseCategory { get; set; }

        public string RelatedCertifications { get; set; }
        public string RelatedCourses { get; set; }
        public string NextLevel { get; set; }
        public string ScheduleNotes { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var temp = Request.Url;
            SeoCourseName = HttpUtility.HtmlDecode(Page.RouteData.Values["seoCourseName"].ToString().Trim().Replace("-", " "));

            SeoCourseName = SeoCourseName.Replace(" ", "-").ToLower();
            Response.Redirect("/course/" + SeoCourseName);
            return;

            if (Page.RouteData.Values["seoCity"] != null)
                SeoCity = HttpUtility.HtmlDecode(Page.RouteData.Values["seoCity"].ToString().Replace(" ", "-").Trim(' ', '/'));
           
            if (!IsPostBack)
            {
                GetCourseSeo();
                GetCourseDetails();
                try
                {
                    GetClassSchedule();
                }
                catch (Exception ex)
                {
                    Server.ClearError();
                    Response.StatusCode = 404;
                    Response.StatusDescription = "Not Found";
                    Response.End(); // Ends the response immediately
                }
                GetCourseImage();
                GetCourseDescription();
                if (SeoCity!=null)
                    GetAddressInfo();
                ltrCanonical.Text = string.Format("<link rel=\"canonical\" href=\"{0}://{1}/course/{2}/classes/{3}\" />",
                    Request.Url.Scheme, Request.Url.Host, SeoCourseName.Replace(" ", "-").ToLower(),
                    string.IsNullOrEmpty(SeoCity) ? "" : SeoCity);
            }

            AppHelpers.PageTitle(SeoTitle);
            AppHelpers.MetaData("description", SeoDescription);
            AppHelpers.MetaData("keywords", SeoKeywords);

        }

        public static IHtmlString HTMLRaw(string source)
        {
            return new HtmlString(source);
        }

        private void GetAddressInfo()
        {
            var locationResult = ContentCourses.GetLocationInfoFromSEOCity(SeoCity,SeoCourseName);
            if (locationResult.Rows.Count > 0)
            {
                foreach (DataRow row in locationResult.Rows)
                {
                    City = row["city"].ToString();
                    State = row["state"].ToString();
                    Address1 = row["address1"].ToString();
                    Address2 = row["address2"].ToString();
                    Zip = row["zip"].ToString();
                    MapLink = row["mapLink"].ToString();
                    MapEmbed = row["mapEmbed"].ToString();
                    ClosestCity = row["closestCity"].ToString();
                    ClosestState = row["closestState"].ToString();
                    break;
                }
            }
        }

        private  void GetCourseSeo()
        {
            var dataTable = CmsAdmin.GetCourseSeo(SeoCourseName);
            if (dataTable == null)
                return;
            foreach (DataRow dataRow in (InternalDataCollectionBase)dataTable.Rows)
            {
                SeoDescription = dataRow["metaDescription"].ToString();
                SeoKeywords = dataRow["metaKeywords"].ToString();
                SeoTitle = dataRow["metaTitle"].ToString();
            }
        }

        private void GetCourseDescription()
        {
            SeoCourseName = Page.RouteData.Values["seoCourseName"] != null ? Server.HtmlDecode(Page.RouteData.Values["seoCourseName"].ToString().Trim().Replace("-", " ")) : "";
            var data = ContentCourses.CourseDescription(SeoCourseName);
            if (data.Rows.Count > 0)
            {
                foreach (DataRow row in data.Rows)
                {

                    CourseDescription = row["courseDescription"].ToString();
                    RelatedCertifications = row["relatedCertifications"].ToString();
                    RelatedCourses = row["relatedCourses"].ToString();
                    NextLevel = row["nextLevel"].ToString();
                    break;
                }
                //CountOutlineNumbers();
            }
        }

        private void GetCourseDetails()
        {
            SeoCourseName = HttpUtility.HtmlDecode(Page.RouteData.Values["seoCourseName"].ToString().Trim().Replace("-", " "));
            var dtDetails = ContentCourses.CourseDetails(SeoCourseName);
            ctlCourseDetails.DataSource = dtDetails;
            ctlCourseDetails.DataBind();

            if(dtDetails.Rows.Count == 0)
            {
                Server.ClearError();
                Response.StatusCode = 404;
                Response.StatusDescription = "Not Found";
                Response.End(); // Ends the response immediately
            }

            foreach (DataRow row in dtDetails.Rows)
            {
                CourseDescription = row["courseDescription"].ToString();
                CourseObjective = row["courseObjectives"].ToString();
                CourseName = row["courseName"].ToString();
                CourseCategory = row["cat2"].ToString();
                CoursePrerequisites = row["coursePrerequisites"].ToString();
                ScheduleNotes = row["scheduleNotes"].ToString();
				break;
            }

            ltrH1.Text = ctlCourseDetails.FindControl("ltrName") != null ? (ctlCourseDetails.FindControl("ltrName") as Literal).Text : String.Empty;
            CourseId = ctlCourseDetails.FindControl("ltrCourseId") != null ? (ctlCourseDetails.FindControl("ltrCourseId") as Literal).Text : String.Empty;

            // Get Banner Image Path
            var dtBanner = CmsAdmin.GetCatalogImage("", dtDetails.Rows[0]["cat2"].ToString());

            if (dtBanner.Rows.Count > 0 && (bool)dtBanner.Rows[0]["course_sw"] == true)
            {
                if (File.Exists(Server.MapPath(dtBanner.Rows[0]["img_path"].ToString())))
                {
                    BannerPath = dtBanner.Rows[0]["img_path"].ToString();
                }
                else
                {
                    BannerPath = "/images/catalog/guy_with_tie.png";
                }
            }
            else
            {
                BannerPath = "/images/catalog/guy_with_tie.png";
            }
        }

        private void GetCourseImage()
        {
            SeoCourseName = HttpUtility.HtmlDecode(Page.RouteData.Values["seoCourseName"].ToString().Trim().Replace("-", " "));

            if (ctlCourseDetails.CurrentMode == FormViewMode.ReadOnly)
            {
                var imageFv = ctlCourseDetails.FindControl("ctlCourseImage") as FormView;

                if (imageFv != null)
                {
                    imageFv.DataSource = ContentCourses.CourseImage(SeoCourseName);
                    imageFv.DataBind();
                }
            }
        }

        private void GetClassSchedule()
        {
            //SeoCourseName = HttpUtility.HtmlDecode(Page.RouteData.Values["seoCourseName"].ToString().Trim().Replace("-", " "));
            if (!string.IsNullOrEmpty(SeoCity))
                ctlClassSchedule.DataSource = ContentCourses.CourseClassScheduleByCity(SeoCity, CourseId);
            else
                ctlClassSchedule.DataSource = ContentCourses.CourseClassSchedule(SeoCourseName);
            ctlClassSchedule.DataBind();
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
            foreach (var cid in from RepeaterItem item in ctlClassSchedule.Items select ((HiddenField)((LinkButton)sender).NamingContainer.FindControl("ctlClassID")).Value)
            {
                ShoppingCartAccess.AddItem(cid,username);
                Response.Redirect("~/cart/cart2.aspx");
            }
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

                var gtrImage = (Image)e.Item.FindControl("ctlGTRIcon");

                if (Convert.ToBoolean(gtrLabel.ToolTip))
                {
                    gtrLabel.Visible = true;
                    gtrImage.Visible = true;
                }
                else
                {
                    gtrLabel.Visible = false;
                    gtrImage.Visible = false;
                }
            }
        }

        public string GetSEOCourseFromCourse(string dataField)
        {
            var data = ContentCourses.GetSEOCourseNameFromCourseName(dataField);
            var temp = "";
            if (data.Rows.Count > 0)
            {
                foreach (DataRow row in data.Rows)
                {
                    temp = row["seoCourseName"].ToString();
                    break;
                }
            }
            return temp;
        }

        public string[] GetCourseLinks(string dataField)
        {
            return dataField.Split('\n');
        }

        public string CheckEmptyData(string dataField)
        {
            return string.IsNullOrEmpty(dataField) ? "..." : dataField.Replace("\n", "<br /> ");
        }
    }
}