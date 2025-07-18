using System;
using System.Configuration;
using System.Data;
using System.Text;
using System.Threading;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal
{
    public partial class EvaluationUSPS : Page
    {
        public static string PageTitle { get; private set; }
        public static string SeoDescription { get; private set; }
        public static string SeoKeywords { get; private set; }
        public string ContactFormToEmail { get; set; }
        public string ContactFormSubject { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ctlThankYouPanel.Visible = false;

            if (IsPostBack)
                return;
            GetSeo();
            AppHelpers.PageTitle(PageTitle);
            AppHelpers.MetaData("description", SeoDescription);
            AppHelpers.MetaData("keywords", SeoKeywords);
        }
        private static void GetSeo()
        {
            var dataTable = CmsAdmin.RetrievePageById(14);
            if (dataTable == null)
                return;
            foreach (DataRow dataRow in (InternalDataCollectionBase)dataTable.Rows)
            {
                PageTitle = dataRow["pageTitle"].ToString();
                SeoDescription = dataRow["metaDescription"].ToString();
                SeoKeywords = dataRow["metaKeywords"].ToString();
            }
        }

        protected void ctlSubmit_OnClick(object sender, EventArgs e)
        {
            var mailMessage = new StringBuilder();
            mailMessage.Append("<strong>Your Name:</strong> " + ctlName.Text + "<br /><br />");
            mailMessage.Append("<strong>Course Name:</strong> " + ctlCourseName.Text + "<br /><br />");
            mailMessage.Append("<strong>Instructor:</strong> " + ctlInstructor.Text + "<br /><br />");
            mailMessage.Append("<strong>Location:</strong> " + ctlLocation.Text + "<br /><br />");
            mailMessage.Append("<strong>Dates:</strong> " + ctlDates.Text + "<br /><br />");
            mailMessage.Append("<strong>1. The instructor was prepared:</strong> " + ddlQ1.SelectedValue + "<br /><br />");
            mailMessage.Append("<strong>2. The instructor was knowledgeable about the course content:</strong> " + ddlQ2.SelectedValue + "<br /><br />");
            mailMessage.Append("<strong>3. The instructor encouraged questions from the class:</strong> " + ddlQ3.SelectedValue + "<br /><br />");
            mailMessage.Append("<strong>4. Overall, the instructor's teaching skills were excellent:</strong> " + ddlQ4.SelectedValue + "<br /><br />");
            mailMessage.Append("<strong>5. The material I learned in class will improve my work/school/home performance:</strong> " + ddlQ5.SelectedValue + "<br /><br />");
            mailMessage.Append("<strong>6. The course materials met or exceeded my expectations:</strong> " + ddlQ6.SelectedValue + "<br /><br />");
            mailMessage.Append("<strong>7. Prior to this training, my knowledge (or level of confidence) on this topic was </strong> " + ddlQ14.SelectedValue + "<br /><br />");
            mailMessage.Append("<strong>8. Following this training, my knowledge (or level of confidence) on this topic is </strong> " + ddlQ15.SelectedValue + "<br /><br />");
            mailMessage.Append(tbQ7Comment.Text + "<br /><br />");
            mailMessage.Append("<strong>10. The best thing about this course was:</strong><br />");
            mailMessage.Append(tbQ9.Text + "<br /><br />");
            mailMessage.Append("<strong>11. If I could change one thing about this course, I would:</strong><br />");
            mailMessage.Append(tbQ10.Text + "<br /><br />");
            mailMessage.Append("<strong>Please make any additional comments:</strong><br />");
            mailMessage.Append(tbAdditionalComments.Text);

            ContactFormToEmail = ConfigurationManager.AppSettings["ContactFormMailTo"];// "csa@productivitypoint.com";            
            ContactFormSubject = "Productivity Point Learning Solutions - Evaluation Form";

            try
            {
                var sendRegistrarEmailTo = ConfigurationManager.AppSettings["SendRegistrarEmailTo"];
                //sendRegistrarEmailTo = "gautamyogesh.yg@gmail.com";
                //ThreadStart threadStart = delegate () { App.SendEmailForRegistrar("registrar@productivitypointls.com", sendRegistrarEmailTo, ContactFormSubject, mailMessage.ToString()); };
                //Thread thread = new Thread(threadStart);
                //thread.Start();
                App.SendEmailForRegistrar("registrar@productivitypointls.com", sendRegistrarEmailTo, ContactFormSubject, mailMessage.ToString());
                ////App.SendEmail(ConfigurationManager.AppSettings["MailFrom"], ContactFormToEmail, ContactFormSubject, mailMessage.ToString());
                //App.SendEmailForRegistrar("registrar@productivitypointls.com", sendRegistrarEmailTo, ContactFormSubject, mailMessage.ToString());
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                AppUtilities.LogError(ex);
            }
            finally
            {
                ClearFields(Form.Controls);
                Response.Redirect("ThankYou.aspx");
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