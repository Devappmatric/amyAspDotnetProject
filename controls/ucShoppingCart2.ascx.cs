using System;
using System.Diagnostics;
using System.Drawing;
using System.Web;

namespace ProductivityPointGlobal.Controls
{
    public partial class UcShopping2 : System.Web.UI.UserControl
    {
        public string Username { get; set; }
        public int Selection { get; set; }
        protected override void OnLoad(EventArgs e)
        {
            if (Request.Cookies["UserSettings"] != null)
            {
                Username = Request.Cookies["UserSettings"].Value;
            }

            var path = HttpContext.Current.Request.Url.AbsolutePath;

            if (path == "/cart/login.aspx")
            {
                ctlShowCartNav.Visible = false;
            }
            else if (path == "/cart/account.aspx")
            {
                ctlShowCartNav.Visible = false;
            }
            else
            {
                ctlShowCartNav.Visible = Username != null;
            }

            //Debug.WriteLine(path);
            
            ctlLogInUser.Visible = false;


            var currentUrl = Context.Request.AppRelativeCurrentExecutionFilePath;
            ColorTranslator.FromHtml("#F67A06");

            if (currentUrl != null && currentUrl.Equals("~/cart/default.aspx"))
            {
                //ctlMyCart.BackColor = ColorTranslator.FromHtml("#286090");
                //ctlMyCart.ForeColor = ColorTranslator.FromHtml("#FFF");
                //hCart.CssClass = "btn btn-success orange-color";
            }
            if (currentUrl != null && currentUrl.Equals("~/cart/account-edit2.aspx"))
            {
                //ctlAccount.BackColor = ColorTranslator.FromHtml("#286090");
                //ctlAccount.ForeColor = ColorTranslator.FromHtml("#FFF");
                hAccount.CssClass = "btn btn-success orange-color";
            }
			if (currentUrl != null && currentUrl.Equals("~/cart/StudentInfo.aspx"))
			{
				//ctlAccount.BackColor = ColorTranslator.FromHtml("#286090");
				//ctlAccount.ForeColor = ColorTranslator.FromHtml("#FFF");
				hStudentInfo.CssClass = "btn btn-success orange-color";
			}
			if (currentUrl != null && currentUrl.Equals("~/cart/payment2.aspx"))
            {
				//ctlPayment.BackColor = ColorTranslator.FromHtml("#286090");
				//ctlPayment.ForeColor = ColorTranslator.FromHtml("#FFF");
				hPaymentInfo.CssClass = "btn btn-success orange-color";
			}

            if (currentUrl != null && currentUrl.Contains("confirmation"))
            {
                //ctlPayment.BackColor = ColorTranslator.FromHtml("#286090");
                //ctlPayment.ForeColor = ColorTranslator.FromHtml("#FFF");
                hOrderConfirmation.CssClass = "btn btn-success orange-color";
            }

            //ctlMyCart.PostBackUrl = "~/cart/";
            //ctlAccount.PostBackUrl = "~/cart/account-edit.aspx";
            //ctlPayment.PostBackUrl = "~/cart/payment.aspx";
        }

        protected void ctlLogInUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/cart/login.aspx");
        }

        protected void ctlLogOutUser_Click(object sender, EventArgs e)
        {
            var coo = new HttpCookie("UserSettings", "") { Expires = DateTime.Now.AddDays(-30) };
            Response.Cookies.Add(coo);
            coo = new HttpCookie("CartID", "") { Expires = DateTime.Now.AddDays(-30) };
            Response.Cookies.Add(coo);
            //var httpCookie = Response.Cookies["UserSettings"];
            //if (httpCookie != null)
            //    httpCookie.Expires = DateTime.Now.AddDays(-1);
            Session.Abandon();
            Response.Redirect("~/");
        }
    }
}