using System;
using System.Web.UI;

namespace ProductivityPointGlobal
{
    public partial class Locationbystate : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Page.RouteData.Values["Id"].ToString();
            ctlLocation.Text = (string.Format(id + " Locations"));

            AppHelpers.PageTitle("Productivity Point Learning Solutions - " + id);
            AppHelpers.MetaData("description", id);
            AppHelpers.MetaData("keywords", id + ",Productivity Point Learning Solutions");

            ctlLocationsRpt.DataSource = ContentLocations.GetLocationByEventType(id);
            ctlLocationsRpt.DataBind();

            ctlDeliveryMethods.PostBackUrl = "~/delivery-methods.aspx";
            ctlCertifications.PostBackUrl = "~/certifications.aspx";
            ctlCourseCatalog.PostBackUrl = "~/courses/default.aspx";
            ctlExplorePPG.PostBackUrl = "~/about-ppg.aspx";
            ctlContacts.PostBackUrl = "~/contact.aspx";
        }
    }
}