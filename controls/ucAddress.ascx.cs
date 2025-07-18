using System;

namespace ProductivityPointGlobal.Controls
{
    public partial class UcAddress : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            if (Request.AppRelativeCurrentExecutionFilePath == null) return;

            var current = Request.AppRelativeCurrentExecutionFilePath;

            //if (current == "~/contact.aspx")
            //{
            //    ctlText1.Text = "Headquarters";
            //}
            //else
            //{
            //    ctlText1.Text = string.Empty;
            //}

            switch (current)
            {
                case "~/contact.aspx":
                    ctlText1.Text = "";
                    break;
                case "~/consumers.aspx":
                    ctlText1.Text = "";
                    break;
                case "~/small-business.aspx":
                    ctlText1.Text = "";
                    break;
                case "~/large-companies.aspx":
                    ctlText1.Text = "";
                    break;
                case "~/government.aspx":
                    ctlText1.Text = "";
                    break;
            }            
        }
    }
}