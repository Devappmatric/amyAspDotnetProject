using System;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Int32;

namespace ProductivityPointGlobal.cms
{
    public partial class Users : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CMS.ConnectionString = AppConfiguration.DbConnectionString;
        }
        protected void ctlPager_MenuItemClick(object sender, MenuEventArgs e)
        {
            ctlAdminCMS.PageIndex = Parse(e.Item.Value);
        }

        protected void ctlAdminCMS_DataBound(object sender, EventArgs e)
        {
            ctlAdminCMS.PageSize = 50;

            var menuPager = (Menu)ctlAdminCMS.BottomPagerRow.FindControl("ctlPager");
            for (var i = 0; i < ctlAdminCMS.PageCount; i++)
            {
                var item = new MenuItem { Text = $"[ {i + 1} ]", Value = i.ToString(CultureInfo.InvariantCulture) };

                if (ctlAdminCMS.PageIndex == i)
                {
                    item.Selected = true;
                }
                menuPager.Items.Add(item);
            }
        }
    }
}