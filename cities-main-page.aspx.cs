using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal
{
    public partial class cities_main_page : System.Web.UI.Page
    {
        public string PageTitle { get; set; }
        public string SeoDescription { get; set; }
        public string SeoKeywords { get; set; }

        public string City { get; set; }
        public string State { get; set; }
        public string ClosestCity { get; set; }
        public string ClosestState { get; set; }
        public string StateFullName { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            //GetSeo();
            //AppHelpers.PageTitle(PageTitle);
            //AppHelpers.MetaData("description", SeoDescription);
            //AppHelpers.MetaData("keywords", SeoKeywords);
            var city=Page.RouteData.Values["city"].ToString().Replace("-"," ");
            var state= Page.RouteData.Values["state"].ToString().Replace("-", " ");
            City = city;
            State = state;
            var result = ContentCourses.CourseByCityAndState(city, state);

            if(City.ToLower() == "live")
            {
                throw new HttpException(404, "Not Found");
            }

            if (result.Rows.Count > 0)
            {
                AvailableCourses.DataSource = result;
                AvailableCourses.DataBind();
                foreach (DataRow row in result.Rows)
                {
                    //City = row["city"].ToString();
                    //State = row["state"].ToString();
                    StateFullName = row["stateName"].ToString();
                    ClosestCity= row["closestCity"].ToString();
                    ClosestState= row["closestState"].ToString();
                    PageTitle= row["metaTitleCityMain"].ToString();
                    SeoDescription= row["metaDescriptionCityMain"].ToString();
                    break;
                }
            }
            else
            {
                throw new HttpException(404, "Not Found");
            }
            AppHelpers.PageTitle(PageTitle);
            AppHelpers.MetaData("description", SeoDescription);
            AppHelpers.MetaData("keywords", PageTitle + ", Productivity Point Learning Solutions");

        }

        private void GetSeo()
        {
            var dataTable = CmsAdmin.RetrievePageById(26);
            if (dataTable == null)
                return;
            foreach (DataRow dataRow in (InternalDataCollectionBase)dataTable.Rows)
            {
                PageTitle = dataRow["pageTitle"].ToString();
                SeoDescription = dataRow["metaDescription"].ToString();
                SeoKeywords = dataRow["metaKeywords"].ToString();
            }
            if(City == "los-angeles" && State == "ca")
            {
                PageTitle = "IT Training Classes & Certifications in Los Angeles, CA";
                SeoDescription = "Boost your career with IT, business, and leadership " +
                    "training in Los Angeles. In-person, online, and onsite courses from Productivity " +
                    "Point experts.";
            }
        }
    }
}