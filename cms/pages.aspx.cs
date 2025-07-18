using System;

namespace ProductivityPointGlobal.cms
{
    public partial class Pages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CMS.ConnectionString = AppConfiguration.DbConnectionString;
        }
    }
}