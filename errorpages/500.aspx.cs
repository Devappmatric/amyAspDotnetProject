using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.errorpages
{
    public partial class Custom500Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var dateTime = DateTime.Now;
            ctlDateTime.Text = dateTime.ToString("MM/dd/yyyy hh:mm:ss tt");

            AppHelpers.PageTitle("PPLS Error");
            AppHelpers.MetaData("description", "Error Page");
            AppHelpers.MetaData("keywords", "");
        }
    }
}