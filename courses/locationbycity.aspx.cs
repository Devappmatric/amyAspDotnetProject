using System;
using System.Web.UI;

namespace ProductivityPointGlobal.courses
{
    public partial class LocationByCity : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var city = Page.RouteData.Values["city"].ToString();

            ctlLocation.Text = (string.Format(city + " Locations"));

            AppHelpers.PageTitle("Productivity Point Learning Solutions - " + city);
            AppHelpers.MetaData("description", city);
            AppHelpers.MetaData("keywords", city + ",Productivity Point Learning Solutions");

            ctlLocationsRpt.DataSource = ContentLocations.GetLocationByCity(city);
            ctlLocationsRpt.DataBind();

            ctlDeliveryMethods.PostBackUrl = "~/delivery-methods.aspx";
            ctlCertifications.PostBackUrl = "~/certifications.aspx";
            ctlCourseCatalog.PostBackUrl = "~/courses/default.aspx";
            ctlExplorePPG.PostBackUrl = "~/about-ppg.aspx";
            ctlContacts.PostBackUrl = "~/contact.aspx";
        }
    }
}