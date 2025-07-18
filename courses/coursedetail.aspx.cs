using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.courses
{
    public partial class CourseDetail : Page
    {
        public static string SeoCourseName { get; private set; }
        public static string SeoDescription { get; private set; }
        public static string SeoKeywords { get; private set; }
        public static string SeoTitle { get; private set; }
        public static string BannerPath { get; set; }
        public string SeoCity { get; set; }

        public string CourseDescription { get; set; }
        public string CourseObjectives { get; set; }
        public string CoursePrerequisites { get; set; }
        public string CourseDetails { get; set; }
        public string RelatedCertifications { get; set; }
        public string RelatedCourses { get; set; }
        public string NextLevel { get; set; }
        public string Cat1 { get; set; }

        public string CatalogBrand { get; set; }
        public string CatalogTopic { get; set; }

        public string CourseLongDescription { get; set; }
        public string CourseName { get; set; }
        public string CourseSubtitle { get; set; }
        public int OutlineNumber { get; set; }
        public string ContactFormToEmail { get; set; }
        public string ContactFormSubject { get; set; }
        public string CourseObjective { get; set; }
        public string CourseCategory { get; set; }

        public DataTable Locations { get; set; }

        public DataView LocationDataView { get; set; }

        public string CourseId { get; set; }

        public IEnumerable<IGrouping<string, DataRow>> CourseFormats { get; set; }
        public string ScheduleNotes { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {

            
            SeoCourseName = Page.RouteData.Values["seoCourseName"] != null ? Server.HtmlDecode(Page.RouteData.Values["seoCourseName"].ToString().Trim().Replace("-", " ")) : "";

            string[] redirectUrls = {
                "check-point-security-engineering-r80.20-gaia",
                "check-point-security-administration-r80.20-gaia",
                "mpls-implementing-cisco-mpls-v3.0",
                "uccxd-deploying-cisco-unified-contact-center-express-v6.0",
                "architecting-with-google-cloud-platform-design-and-process",
                "Check-Point-Security-Engineering-R80.20-GAiA",
                "Check-Point-Security-Administration-R80.20-GAiA",
                "check-point-security-engineering-r80.20-gaia",
                "check-point-security-administration-r80.20-gaia",
                "mpls-implementing-cisco-mpls-v3.0",
                "uccxd-deploying-cisco-unified-contact-center-express-v6.0"
                };

            ltrCanonical.Text = string.Format("<link rel=\"canonical\" href=\"{0}://{1}/course/{2}\" />", Request.Url.Scheme, Request.Url.Host, SeoCourseName.Replace(" ", "-").ToLower());
            GetCourseSeo();
            try
            {
                GetCourseDetails();
            }
            catch (Exception ex)
            {
                var requestUrl = Request.Url.AbsoluteUri;
                var newUrl = CmsAdmin.GetPageRedirectionUrls(requestUrl);
                if (newUrl != "")
                {
                    var newUrlBuilder = new UriBuilder(newUrl);
                    Response.StatusCode = 301;
                    Response.AddHeader("Location", newUrlBuilder.ToString());
                    Response.End();
                }
                Response.StatusCode = 404;
                Response.StatusDescription = "Not Found";
                Response.End(); // Ends the response immediately
                return;
            }
            GetCourseDescription();
            GetCourseImage();

            if (!IsPostBack)
            {
                GetClassSchedule();

            }

            AppHelpers.PageTitle(SeoTitle);
            AppHelpers.MetaData("description", SeoDescription);
            AppHelpers.MetaData("keywords", SeoKeywords);
        }

        private void GetClassSchedule()
        {


            var dtDetails = ContentCourses.CourseClassScheduleNew(CourseId);

            IEnumerable<IGrouping<string, DataRow>> data = dtDetails.AsEnumerable().GroupBy(row => row.Field<string>("deliveryFormat")).OrderByDescending(d => d.Key);
            CourseFormats = data;

            bool isClassroomVirtual = false;
            bool isClassroomLive = false;
            bool isLiveOnline = false;
            foreach (var item in data)
            {
                DataTable tempTable = new DataTable();
                tempTable = item.ToList().CopyToDataTable();
                if (item.Key == "Classroom Virtual")
                {
                    DataView view = new DataView(tempTable);
                    LocationDataView = view;
                    DataTable distinctValues = view.ToTable(true, "startDate", "endDate", "startTime", "endTime");

                    DataTable locations = view.ToTable(true, "id", "CityState");
                    Locations = locations;

                    ctlClassroomVirtualClassSchedule.DataSource = distinctValues;
                    ctlClassroomVirtualClassSchedule.DataBind();


                    isClassroomVirtual = true;
                }
                if (item.Key == "Classroom Live")
                {
                    ctlClassroomLiveClassSchedule.DataSource = tempTable;
                    ctlClassroomLiveClassSchedule.DataBind();
                    isClassroomLive = true;
                }
                if (item.Key == "Live Online")
                {
                    ctlLiveOnlineClassSchedule.DataSource = tempTable;
                    ctlLiveOnlineClassSchedule.DataBind();
                    isLiveOnline = true;
                }
            }
            if (!isClassroomVirtual)
                ClassroomVirtual.Visible = false;
            if (!isClassroomLive)
                ClassroomLive.Visible = false;
            if (!isLiveOnline)
                Liveonline.Visible = false;


        }

        private static void GetCourseSeo()
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

        private void GetCourseDetails()
        {
            SeoCourseName = Page.RouteData.Values["seoCourseName"] != null ? Server.HtmlDecode(Page.RouteData.Values["seoCourseName"].ToString().Trim().Replace("-", " ")) : "";
            var dtDetails = ContentCourses.CourseDetails(SeoCourseName);

            if (dtDetails.Rows.Count > 0)
            {
                foreach (DataRow row in dtDetails.Rows)
                {
                    CourseName= row["courseName"].ToString();
                    CourseLongDescription = row["courseLongDescription"].ToString();
                    CourseSubtitle = row["courseSubtitle"].ToString();
                    CourseDescription = row["courseDescription"].ToString();
                    CourseObjective = row["courseObjectives"].ToString();
                    CourseName = row["courseName"].ToString();
                    CourseCategory = row["cat2"].ToString();
                    CourseId = row["courseId"].ToString();
                    Cat1 = row["cat1"].ToString();
                    CatalogBrand = row["catalogBrand"].ToString();
                    CatalogTopic = row["catalogTopic"].ToString();
                    ScheduleNotes = row["scheduleNotes"].ToString();
                    break;
                }
            }
            ctlCourseDetails.DataSource = dtDetails;
            ctlCourseDetails.DataBind();
            //ltrH1.Text = ctlCourseDetails.FindControl("ltrName") != null ? (ctlCourseDetails.FindControl("ltrName") as Literal).Text : "";

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
            SeoCourseName = Page.RouteData.Values["seoCourseName"] != null ? Server.HtmlDecode(Page.RouteData.Values["seoCourseName"].ToString().Trim().Replace("-", " ")) : "";

            //if (ctlCourseDetails.CurrentMode == FormViewMode.ReadOnly)
            //{
            //    var imageFv = ctlCourseDetails.FindControl("ctlCourseImage") as FormView;

            //    if (imageFv != null)
            //    {
            //        imageFv.DataSource = ContentCourses.CourseImage(SeoCourseName);
            //        imageFv.DataBind();
            //    }
            //}
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
                    CourseObjectives = row["courseObjectives"].ToString();
                    CourseDetails = row["courseDetail"].ToString();
                    CoursePrerequisites= row["coursePrerequisites"].ToString();
                    RelatedCertifications = row["relatedCertifications"].ToString();
                    RelatedCourses= row["relatedCourses"].ToString();
                    NextLevel= row["nextLevel"].ToString();
                    Cat1= row["cat1"].ToString();
                    CatalogBrand= row["catalogBrand"].ToString();
                    CatalogTopic= row["catalogTopic"].ToString();
                    break;
                }
                CountOutlineNumbers();
            }
        }

        protected void ctlViewSchedule_Click(object sender, EventArgs e)
        {
            Response.Redirect(String.Format("~/Schedule/{0}/", Server.HtmlEncode(SeoCourseName).Trim().Replace(" ", "-")));
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
            return string.IsNullOrEmpty(dataField) ? "..." : dataField.Replace("\n", "<br />");
        }

        public void CountOutlineNumbers()
        {
            string[] stringSeparators = new string[] { "<br /><br />" };
            var temp1 = CheckEmptyData(CourseDetails);
            var temp = temp1.Split(stringSeparators, StringSplitOptions.None);
            OutlineNumber = temp.Length;
        }

        public string GetOutlineFirstPart()
        {
            string[] stringSeparators = new string[] { "<br /><br />" };
            var temp1 = CheckEmptyData(CourseDetails);
            var temp = temp1.Split(stringSeparators, StringSplitOptions.None);
            decimal half = OutlineNumber / 2;
            int upperCount =(int) Math.Ceiling(half);
            
            string returnText = "";
            for(int i = 0; i <= upperCount; i++)
            {
                returnText += temp[i] + "<br/><br />"; ;
            }

            if (temp.Length == 2)
            {
                returnText = temp[0];
            }
            
            return returnText;
        }

        public string GetOutlineSecondPart()
        {
            string[] stringSeparators = new string[] { "<br /><br />" };
            var temp1 = CheckEmptyData(CourseDetails);
            var temp = temp1.Split(stringSeparators, StringSplitOptions.None);
            decimal half = OutlineNumber / 2;
            int upperCount = (int)Math.Ceiling(half);
            
            string returnText = "";
            for (int i = upperCount+1; i < temp.Length; i++)
            {
                returnText += temp[i]+ "<br/><br />";
            }

            if (temp.Length == 2)
            {
                returnText = temp[1];
            }

            return returnText;
        }

        protected void btnSubmitHomeForm_OnClick(object sender, EventArgs e)
        {
            var currentUrl = HttpContext.Current.Request.Url.AbsoluteUri;


            var groupSize = ddlGroupSize.SelectedValue;
            var name = tbName.Text;
            var email = tbEmail.Text;
            var phone = tbPhone.Text;
            var company = tbCompany.Text;
            var comment=tbComment.Text;

            var stringBuilder = new StringBuilder();

            stringBuilder.Append("<strong>Name:</strong> " + name + "<br />");
            stringBuilder.Append("<strong>Email:</strong> " + email + "<br />");
            stringBuilder.Append("<strong>Company:</strong> " + company + "<br />");
            stringBuilder.Append("<strong>phone:</strong> " + phone + "<br />");
            stringBuilder.Append("<strong>Webpage:</strong> " + currentUrl + "<br />");
            stringBuilder.Append("<strong>Group size:</strong> " + groupSize + "<br />");
            stringBuilder.Append("<strong>Comment:</strong> " + comment + "<br />");


            ContactFormToEmail = ConfigurationManager.AppSettings["ContactFormMailTo"]; //"info@productivitypointls.com";            
            ContactFormSubject = "Productivity Point Learning Solutions - Contact Us Form";

            // Send email
            try
            {//"postmaster@productivitypointls.com"
                App.SendEmail(ConfigurationManager.AppSettings["MailFrom"], ContactFormToEmail, ContactFormSubject, stringBuilder.ToString());
            }
            catch (Exception ex)
            {
                AppUtilities.LogError(ex);
            }
            finally
            {
                //ClearFields(Controls);
                Response.Redirect("~/ThankYou.aspx");
            }
        }

        public object FormatDate(DateTime input)
        {
            return String.Format("{0:MM/dd/yy}", input);
        }

        protected void ctlClassroomVirtualRegister_Click(object sender, EventArgs e)
        {
            var usernameCookie = Request.Cookies["UserSettings"];
            var username = "";
            if (usernameCookie != null)
            {
                username = usernameCookie.Value;
            }
            foreach (var cid in from RepeaterItem item in ctlClassroomVirtualClassSchedule.Items select ((DropDownList)((LinkButton)sender).NamingContainer.FindControl("drpLocationDropDown")).SelectedValue)
            {
                ShoppingCartAccess.AddItem(cid, username);
                Response.Redirect("~/cart/cart2.aspx");
            }
        }

        protected void ctlLiveOnlineRegister_Click(object sender, EventArgs e)
        {
            var usernameCookie = Request.Cookies["UserSettings"];
            var username = "";
            if (usernameCookie != null)
            {
                username = usernameCookie.Value;
            }
            foreach (var cid in from RepeaterItem item in ctlLiveOnlineClassSchedule.Items select ((HiddenField)((LinkButton)sender).NamingContainer.FindControl("ctlClassID")).Value)
            {
                ShoppingCartAccess.AddItem(cid, username);
                Response.Redirect("~/cart/cart2.aspx");
            }
        }

        protected void ctlClassroomLiveRegister_Click(object sender, EventArgs e)
        {
            var usernameCookie = Request.Cookies["UserSettings"];
            var username = "";
            if (usernameCookie != null)
            {
                username = usernameCookie.Value;
            }
            foreach (var cid in from RepeaterItem item in ctlClassroomLiveClassSchedule.Items select ((HiddenField)((LinkButton)sender).NamingContainer.FindControl("ctlClassID")).Value)
            {
                ShoppingCartAccess.AddItem(cid, username);
                Response.Redirect("~/cart/cart2.aspx");
            }
        }

        protected void ctlRegisterLiveOnline_Click(object sender, EventArgs e)
        {
            var usernameCookie = Request.Cookies["UserSettings"];
            var username = "";
            if (usernameCookie != null)
            {
                username = usernameCookie.Value;
            }
            foreach (var cid in from RepeaterItem item in ctlLiveOnlineClassSchedule.Items select ((HiddenField)((LinkButton)sender).NamingContainer.FindControl("ctlClassID")).Value)
            {
                ShoppingCartAccess.AddItem(cid, username);
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

        protected void ctlClassroomVirtualSchedule_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
                 e.Item.ItemType == ListItemType.AlternatingItem)
            {

                ((DropDownList)e.Item.FindControl("drpLocationDropDown")).DataSource = Locations;//Or any other datasource.
                ((DropDownList)e.Item.FindControl("drpLocationDropDown")).DataBind();

            }
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var drp = ((DropDownList)e.Item.FindControl("drpLocationDropDown"));

                var startDate = ((Label)e.Item.FindControl("ctlStartDate"));
                var endDate = ((Label)e.Item.FindControl("ctlEndDate"));
                var startTime = ((Label)e.Item.FindControl("ctlStartTime"));
                var endTime = ((Label)e.Item.FindControl("ctlEndTime"));

                DataTable dtLocation = new DataTable();
                dtLocation.Columns.Add("id");
                dtLocation.Columns.Add("CityState");

                foreach (DataRow item in LocationDataView.Table.Rows)
                {
                    var sD = DateTime.Parse(item["startDate"].ToString()).ToString("MM/dd/yyyy");
                    var eD = DateTime.Parse(item["endDate"].ToString()).ToString("MM/dd/yyyy");
                    var sT = DateTime.Parse(item["startTime"].ToString()).ToString("h:mm tt");
                    var eT = DateTime.Parse(item["endTime"].ToString()).ToString("h:mm tt");
                    if (sD == startDate.Text && eD == endDate.Text && sT == startTime.Text && eT == endTime.Text)
                    {
                        DataRow row = dtLocation.NewRow();

                        row["id"] = item["id"].ToString();
                        row["CityState"] = item["CityState"].ToString();
                        dtLocation.Rows.Add(row);
                    }

                }
                DataView view = new DataView(dtLocation);
                view.Sort = "CityState ASC";
                DataTable locations = view.ToTable(true, "id", "CityState");

                drp.DataSource = locations;//Or any other datasource.
                drp.DataBind();
                drp.Items.Insert(0, "Select A Location");
                drp.SelectedIndex = 0;
            }

        }

        protected void ctlLiveOnlineClassSchedule_OnItemDataBound(object sender, RepeaterItemEventArgs e)
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
        protected void drpLocationDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList drop = (DropDownList)sender;

            RepeaterItem rpItem = drop.NamingContainer as RepeaterItem;
            if (rpItem != null)
            {
                Image hiddenField = ((Image)rpItem.FindControl("ctlGTRIcon"));
                var dropId = drop.SelectedValue;

                var dtDetails = ContentCourses.CourseClassScheduleNewById(dropId);
                var isGtr = false;
                foreach (DataRow item in dtDetails.Rows)
                {
                    var gtr = item["Gtr"].ToString();
                    if (Convert.ToBoolean(gtr))
                    {
                        isGtr = true;
                    }
                }
                hiddenField.Visible = isGtr;
            }
        }
    }
}