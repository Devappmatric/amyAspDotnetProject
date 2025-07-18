using System;
using System.IO;
using System.Web;
using System.Web.UI;

namespace ProductivityPointGlobal.courses
{
    public partial class HomeResults : Page
    {
        public string Cat2 { get; set; }
        public string BannerPath{ get; set; }

		protected void Page_Load(object sender, EventArgs e)
        {
            //AppHelpers.PageTitle("Productivity Point Learning Solutions - Search Results");
            //AppHelpers.MetaData("description", "");
            //AppHelpers.MetaData("keywords", "Search Results, Productivity Point Learning Solutions");

            if (!Page.IsPostBack)
            {
                SearchCourses();
            }
        }

        private void SearchCourses()
        {
            Cat2 = HttpUtility.UrlDecode(Page.RouteData.Values["cat2"].ToString().Replace("-", " ").Trim());
            ltrTitle.Text = Cat2.ToProper();
            ltrCanonical.Text = string.Format("<link rel=\"canonical\" href=\"{0}://{1}/catalog/{2}\" />", Request.Url.Scheme, Request.Url.Host, Cat2.ToSeo());
            var dtCourses = ContentCourses.SearchCoursesHomeCat2(Cat2);
            ctlCourses.DataSource = dtCourses;
            ctlCourses.DataBind();
            if(dtCourses!=null && dtCourses.Rows.Count > 0)
            {
                ltrTitle.Text = dtCourses.Rows[0]["cat2"].ToString();
            }

            // Get Banner Image Path
            var dtBanner = CmsAdmin.GetCatalogImage("", dtCourses.Rows[0]["cat2"].ToString());
            
            if(dtBanner.Rows.Count > 0){
                if(File.Exists(Server.MapPath(dtBanner.Rows[0]["img_path"].ToString()))){
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

            AppHelpers.PageTitle(ltrTitle.Text + " - Productivity Point Learning Solutions");
            AppHelpers.MetaData("description", ltrTitle.Text + " courses");
            AppHelpers.MetaData("keywords", "Search Results, Productivity Point Learning Solutions");
        }
    }
}