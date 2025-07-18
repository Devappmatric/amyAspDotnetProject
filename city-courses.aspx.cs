using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal
{
    public class CityCourseModel
    {
        public string courseId { get; set; }
        public string cat4CityPage { get; set; }
        public string closestCity { get; set; }
        public string closestState { get; set; }
        public string combinedName { get; set; }
    }
    public partial class CityCourses : Page
    {
        public string PageTitle { get; set; }
        public string SeoDescription { get; set; }
        public string SeoKeywords { get; set; }

        public IEnumerable<IGrouping<string, CityCourseModel>> CityCoursesData { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            GetSeo();
            AppHelpers.PageTitle(PageTitle);
            AppHelpers.MetaData("description", SeoDescription);
            AppHelpers.MetaData("keywords", SeoKeywords);
            GetCityCourses();
            //GetStates();
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
        }

        private void GetCityCourses()
        {
            var cityCourses = ContentCourses.GetAllCityCourses();
            var temp = GetCityCoursesModels(cityCourses);

            var temp2 = temp.GroupBy(d => d.combinedName);

            //IEnumerable<IGrouping<string, DataRow>> data = cityCourses.AsEnumerable()
           //     .GroupBy(row => row.Field<string>("closestCity"));
            
            CityCoursesData = temp2;
        }

        public IEnumerable<CityCourseModel> GetCityCoursesModels(DataTable dt)
        {
            List<CityCourseModel> cityCourses = new List<CityCourseModel>();
            foreach (DataRow item in dt.Rows)
            {
                CityCourseModel cs = new CityCourseModel() 
                {
                    cat4CityPage= item["cat4CityPage"].ToString(),
                    closestCity= item["closestCity"].ToString(),
                    closestState= item["closestState"].ToString(),
                    courseId= item["courseId"].ToString(),
                    combinedName = item["closestCity"].ToString()+", "+ item["closestState"].ToString()
                };
                cityCourses.Add(cs);
            }
            return cityCourses;
        }
        

        //protected void GetStates()
        //{
        //    var locationStatesByClass = ContentLocations.GetLocationStatesByClass();
        //    if (locationStatesByClass.Rows.Count == 0)
        //    {
        //        return;
        //    }
        //    rptNationalClasses.DataSource = locationStatesByClass;
        //    rptNationalClasses.DataBind();
        //}

        //protected void rptNationalClasses_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem)
        //    {
        //        return;
        //    }

        //    var label = e.Item.FindControl("ctlState") as Label;

        //    if (label == null)
        //    {
        //        return;
        //    }

        //    var text = label.Text;
        //    var locationByState2 = e.Item.FindControl("detailRepeater") as Repeater;

        //    if (locationByState2 == null)
        //    {
        //        return;
        //    }

        //    locationByState2.DataSource = ContentLocations.GetLocationByState2(text);
        //    locationByState2.DataBind();
        //}
    }
}