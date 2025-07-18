using System;
using System.Web.UI;

namespace ProductivityPointGlobal.courses
{
    public partial class Category : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AppHelpers.PageTitle("Productivity Point Learning Solutions - Search Results");
            AppHelpers.MetaData("description", "");
            AppHelpers.MetaData("keywords", "Search Results, Productivity Point Learning Solutions");

            SearchCourses();
        }

        private void SearchCourses()
        {
            var title = Request.QueryString["cat2"];
            ctlTitle.Text = title;

            var cat2 = Request.QueryString["cat2"];
            ctlCourses.DataSource = ContentCourses.SearchCourses(cat2);
            ctlCourses.DataBind();
        }
    }
}