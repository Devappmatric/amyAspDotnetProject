using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal
{
    public partial class Locationsfiltered : Page
    {
        public static string PageTitle { get; set; }
        public static string SeoDescription { get; set; }
        public static string SeoKeywords { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            GetSeo();
            AppHelpers.PageTitle("Productivity Point Learning Solutions - Classroom Training Locations By State");
            AppHelpers.MetaData("description", SeoDescription);
            AppHelpers.MetaData("keywords", SeoKeywords);

            GetStates();
            ctlLocation.Text = "All Locations";
            ctlDeliveryMethods.PostBackUrl = "~/delivery-methods.aspx";
            ctlCertifications.PostBackUrl = "~/certifications.aspx";
            ctlCourseCatalog.PostBackUrl = "~/courses/";
            ctlExplorePPG.PostBackUrl = "~/about-ppg.aspx";
            ctlContacts.PostBackUrl = "~/contact.aspx";
        }

        protected void GetStates()
        {
            var locationStatesByClass = CmsAdmin.GetLocationStatesByClass();
            if (locationStatesByClass.Rows.Count == 0)
            {
                return;
            }
            masterRepeater.DataSource = locationStatesByClass;
            masterRepeater.DataBind();
        }

        protected void masterRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem)
            {
                return;
            }

            var label = e.Item.FindControl("ctlState") as Label;

            if (label == null)
            {
                return;
            }

            var text = label.Text;
            var locationByState2 = e.Item.FindControl("detailRepeater") as Repeater;

            if (locationByState2 == null)
            {
                return;
            }

            locationByState2.DataSource = CmsAdmin.GetLocationByState2(text);
            locationByState2.DataBind();
        }

        private static void GetSeo()
        {
            var dataTable = CmsAdmin.RetrievePageById(21);
            if (dataTable == null)
                return;
            foreach (DataRow dataRow in (InternalDataCollectionBase)dataTable.Rows)
            {
                PageTitle = dataRow["pageTitle"].ToString();
                SeoDescription = dataRow["metaDescription"].ToString();
                SeoKeywords = dataRow["metaKeywords"].ToString();
            }
        }
    }
}