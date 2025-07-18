using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal
{
    public partial class NationalLocations : Page
    {
        public string PageTitle { get; set; }
        public string SeoDescription { get; set; }
        public string SeoKeywords { get; set; }

        public IEnumerable<IGrouping<string, DataRow>> NationalLocationData { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            GetSeo();
            AppHelpers.PageTitle(PageTitle);// "Productivity Point Learning Solutions - Classroom Training Locations By State");
            AppHelpers.MetaData("description", SeoDescription);
            AppHelpers.MetaData("keywords", SeoKeywords);

            GetStates();
        }

        private void GetSeo()
        {
            var dataTable = CmsAdmin.RetrievePageById(5);
            if (dataTable == null)
                return;
            foreach (DataRow dataRow in (InternalDataCollectionBase)dataTable.Rows)
            {
                PageTitle = dataRow["pageTitle"].ToString();
                SeoDescription = dataRow["metaDescription"].ToString();
                SeoKeywords = dataRow["metaKeywords"].ToString();
            }
        }

        protected void GetStates()
        {
            //var locationStatesByClass = ContentLocations.GetLocationStatesByState();
            //if (locationStatesByClass.Rows.Count == 0)
            //{
            //    return;
            //}
            //rptNationalClasses.DataSource = locationStatesByClass;
            //rptNationalClasses.DataBind();

            var nationalLocations = ContentCourses.GetAllNationalLocations();
            IEnumerable<IGrouping<string, DataRow>> data = nationalLocations.AsEnumerable().GroupBy(row => row.Field<string>("stateName"));

            NationalLocationData = data;
        }
    }
}