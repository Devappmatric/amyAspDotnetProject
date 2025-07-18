using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal
{
    public partial class Locations : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AppHelpers.PageTitle("Productivity Point Learning Solutions - Locations");
            AppHelpers.MetaData("description", "");
            AppHelpers.MetaData("keywords", "Locations, Productivity Point Learning Solutions");

            GetStates();

            ctlLocation.Text = "All Locations";

            ctlDeliveryMethods.PostBackUrl = "~/delivery-methods.aspx";
            ctlCertifications.PostBackUrl = "~/certifications.aspx";
            ctlCourseCatalog.PostBackUrl = "~/courses/default.aspx";
            ctlExplorePPG.PostBackUrl = "~/about-ppg.aspx";
            ctlContacts.PostBackUrl = "~/contact.aspx";
        }

        protected void GetStates()
        {
            var dt = ContentLocations.GetLocationStates();

            if (dt.Rows.Count == 0)
            {
                //
            }
            else
            {
                masterRepeater.DataSource = dt;
                masterRepeater.DataBind();
            }
        }

        protected string GetVenuePhone()
        {
            var val = Eval("venuePhone").ToString();

            if (val == string.Empty)
            {
                return val;
            }
            var format = string.Format("{0}{1}", val, "<br />");
            return format;
        }

        protected string GetContactName()
        {
            var val = Eval("contactName").ToString();

            if (val == string.Empty)
            {
                return val;
            }
            var format = string.Format("{0}{1}", val, "<br />");
            return format;
        }

        protected string GetContactPhone()
        {
            var val = Eval("contactPhone").ToString();

            if (val == string.Empty)
            {
                return val;
            }
            var format = string.Format("{0}{1}", val, "<br />");
            return format;
        }

        protected string GetContactEmail()
        {
            var val = Eval("contactEmail").ToString();

            if (val == string.Empty)
            {
                return val;
            }
            var format = string.Format("{0}{1}", val, "<br />");
            return format;
        }

        protected void masterRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item &&
                e.Item.ItemType != ListItemType.AlternatingItem) return;
            var state = e.Item.FindControl("ctlState") as Label;
            if (state == null) return;
            var text = state.Text;
            var detailRepeater = e.Item.FindControl("detailRepeater") as Repeater;

            if (detailRepeater == null) return;
            detailRepeater.DataSource = ContentLocations.GetLocationByState(text);
            detailRepeater.DataBind();
        }
    }
}