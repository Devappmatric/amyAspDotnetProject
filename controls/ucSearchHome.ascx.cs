using System;
using System.Text.RegularExpressions;

namespace ProductivityPointGlobal.controls
{
    public partial class UcSearchHome : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ctlSearchMobile_OnClick(object sender, EventArgs e)
        {
            var regex = new Regex(@"[^a-z0-9]", RegexOptions.IgnoreCase);
            string srch = regex.Replace(ctlSearchInputMobile.Text.ToLower(), "-");
            Response.Redirect("~/search/" + srch, true);

            //var regex = new Regex(@"[()[!\];',.\/@#$%^&*\-\\\\={}:""<>?_~`]");
            //var matches = regex.Matches(ctlSearchInputMobile.Text);

            //if (matches.Count > 0)
            //{
            //    ctlSearchInputMobile.Text = "Illegal Character Detected!";
            //}
            //else
            //{
            //    Response.Redirect("~/Search/" + ctlSearchInputMobile.Text);
            //}
        }
    }
}