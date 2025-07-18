using System;
using System.Web.UI;

namespace ProductivityPointGlobal.CMS
{
    public partial class Admin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CMS.ConnectionString = AppConfiguration.DbConnectionString;
        }

        protected void ctlInsertRecord_OnClick(object sender, EventArgs e)
        {

        }
    }
}