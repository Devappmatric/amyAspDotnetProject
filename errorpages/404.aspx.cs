using System;
using System.Web.UI;

namespace ProductivityPointGlobal.errorpages
{
    public partial class Custom404Error : Page
    {   
        protected void Page_Load(object sender, EventArgs e)
        {
            var dateTime = DateTime.Now;
            ctlDateTime.Text = dateTime.ToString("MM/dd/yyyy hh:mm:ss tt");

            AppHelpers.PageTitle("404: Page Not Found");
            AppHelpers.MetaData("description", "Error Page");
            AppHelpers.MetaData("keywords", "");
        }
    }
}