using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.cms
{
    public partial class Allcitypages : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (IsPostBack)
            //    return;
            GetCourses();
        }

        protected void GetCourses()
        {
            masterRepeater.DataSource = CmsAdmin.GetAllCityPageCourses();
            masterRepeater.DataBind();
        }

        protected void masterRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem)
            {
                return;
            }

            var state = e.Item.FindControl("ctlState") as Label;
            var city = e.Item.FindControl("ctlCity") as Label;

            if (state == null) return;
            var stateValue = state.Text;

            if (city == null) return;
            var cityValue = city.Text;

            var masterDetail = e.Item.FindControl("detailRepeater") as Repeater;

            if (masterDetail == null) return;
            masterDetail.DataSource = CmsAdmin.GetCityPageCoursesByState(stateValue, cityValue);
            masterDetail.DataBind();
        }
    }
}