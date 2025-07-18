using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using ProductivityPointGlobal.AppExtentions;

namespace ProductivityPointGlobal.courses
{
    public partial class SearchResults : Page
    {
        protected string SeoCourseName { get; private set; }
        public int SearchCount { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            SeoCourseName = HttpUtility.UrlDecode(Page.RouteData.Values["seoCourseName"].ToString());
            SeoCourseName = Page.RouteData.Values["seoCourseName"].ToString();
            ltrSeoCN.Text = SeoCourseName.Replace("-", " ").ToProper();
            ltrUserIP.Text = Request.UserHostAddress;
            AppHelpers.PageTitle("Productivity Point Learning Solutions - Search Results");
            AppHelpers.MetaData("description", "");
            AppHelpers.MetaData("keywords", "Search Results, Productivity Point Learning Solutions");
            SearchCourses();
        }

        private void SearchCourses()
        {
            var dt = ContentCourses.SearchResults(SeoCourseName.Replace("-", " "));
            lvCourses.DataSource = dt;
            lvCourses.DataBind();
            SearchCount = dt.Rows.Count;
            if (dt.Rows.Count == 0)
            {
                
                //ctlError.Text = "No Results";
            }
            else
            {
                //ctlCourses.DataSource = dt;
                //ctlCourses.DataBind();
            }
        }
    }
}