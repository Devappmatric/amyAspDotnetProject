using System;
using System.Web.UI;

namespace ProductivityPointGlobal
{
    public partial class ThankYou : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;            
            AppHelpers.PageTitle("Thank You");
            AppHelpers.MetaData("description", "Thank You");
            AppHelpers.MetaData("keywords", "Productivity Point Submission");
        }
    }
}