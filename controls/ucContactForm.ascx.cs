using System;
using System.Configuration;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.Controls
{
    public partial class UcContactForm : UserControl
    {
        public string ContactFormToEmail { get; set; }
        public string ContactFormSubject { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
            }
        }

        protected void btnSubmitHomeForm_OnClick(object sender, EventArgs e)
        {
            var currentUrl = HttpContext.Current.Request.Url.AbsoluteUri;

            var becomingCertified = cbBecomingCertified.Checked;
            var customizedTraining = cbCustomizedTraining.Checked;
            var specialGroupPricing = cbSpecialGroupPricing.Checked;
            var eventHostingServices = cbEventHostingServices.Checked;
            var groupSize = ddlGroupSize.SelectedValue;
            var name = tbName.Text;
            var email = tbEmail.Text;
            var phone = tbPhone.Text;

            var stringBuilder = new StringBuilder();
            stringBuilder.Append("<strong>Becoming Certified :</strong> " + becomingCertified + "<br />");
            stringBuilder.Append("<strong>Customized Training :</strong> " + customizedTraining + "<br />");
            stringBuilder.Append("<strong>Special Group Pricing :</strong> " + specialGroupPricing + "<br />");
            stringBuilder.Append("<strong>Event Hosting Services :</strong> " + eventHostingServices + "<br />");
            stringBuilder.Append("<strong>Group size:</strong> " + groupSize + "<br />");
            stringBuilder.Append("<strong>Name:</strong> " + name + "<br />");
            stringBuilder.Append("<strong>Email:</strong> " + email + "<br />");
            stringBuilder.Append("<strong>phone:</strong> " + phone + "<br />");
            stringBuilder.Append("<strong>Webpage:</strong> " + currentUrl);

            ContactFormToEmail = ConfigurationManager.AppSettings["ContactFormMailTo"]; //"info@productivitypointls.com";            
            ContactFormSubject = "Productivity Point Learning Solutions - Contact Us Form";

            // Send email
            try
            {//"postmaster@productivitypointls.com"
                App.SendEmail(ConfigurationManager.AppSettings["MailFrom"], ContactFormToEmail, ContactFormSubject, stringBuilder.ToString());
            }
            catch (Exception ex)
            {
                AppUtilities.LogError(ex);
            }
            finally
            {
                //ClearFields(Controls);
                Response.Redirect("~/ThankYou.aspx");
            }
        }
        public static void ClearFields(ControlCollection pageControls)
        {
            foreach (Control contl in pageControls)
            {
                var strCntName = (contl.GetType()).Name;

                switch (strCntName)
                {
                    case "TextBox":
                        var tbSource = (TextBox)contl;
                        tbSource.Text = "";
                        break;
                    case "RadioButtonList":
                        var rblSource = (RadioButtonList)contl;
                        rblSource.SelectedIndex = -1;
                        break;
                    case "DropDownList":
                        var ddlSource = (DropDownList)contl;
                        ddlSource.SelectedIndex = -1;
                        break;
                    case "ListBox":
                        var lbsource = (ListBox)contl;
                        lbsource.SelectedIndex = -1;
                        break;
                }
                ClearFields(contl.Controls);
            }
        }
    }
}