using System;
using System.Web.UI;

namespace ProductivityPointGlobal.cms
{
    public partial class Cities : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CMS.ConnectionString = AppConfiguration.DbConnectionString;
        }
    }
}