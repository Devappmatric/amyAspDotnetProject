using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.cms
{
    public partial class Specialsavings : Page
    {
        protected string RelatvePath { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                GetPageTemplates();

            RelatvePath = Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/";
        }

        private void GetPageTemplates()
        {
            rptPageTemplates.DataSource = CmsAdmin.GetPageTemplates();
            rptPageTemplates.DataBind();            
        }

        protected void btnInsertPage_OnClick(object sender, EventArgs e)
        {
            var guid = Guid.NewGuid().ToString();

            var companyName = (TextBox)ctlNewRecord.FindControl("tbCompanyName");
            var companyNameText = companyName.Text;

            var couponCode = (TextBox)ctlNewRecord.FindControl("tbCouponCode");
            var couponCodeText = couponCode.Text;

            var couponCode2 = (TextBox)ctlNewRecord.FindControl("tbCouponCode2");
            var couponCode2Text = couponCode2.Text;

            var textField1 = (TextBox)ctlNewRecord.FindControl("tbTextField1");
            var textField1Value = textField1.Text;

            var textField2 = (TextBox)ctlNewRecord.FindControl("tbTextField2");
            var textField2Value = textField2.Text;

            var textField3 = (TextBox)ctlNewRecord.FindControl("tbTextField3");
            var textField3Value = textField3.Text;

            var textField4 = (TextBox)ctlNewRecord.FindControl("tbTextField4");
            var textField4Value = textField4.Text;

            CmsAdmin.AddPageTemplate(guid, companyNameText, couponCodeText, couponCode2Text, textField1Value, textField2Value, textField3Value, textField4Value);

            GetPageTemplates();
        }

        protected void rptPageTemplates_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {
            var id = e.CommandArgument.ToString();

            switch (e.CommandName)
            {
                default:
                    break;
                case "Delete":
                    DeleteRecord(id);
                    break;
                case "Update":
                    var companyName = e.Item.FindControl("tbCompanyName") as TextBox;
                    var couponCode = e.Item.FindControl("tbCouponCode") as TextBox;
                    var couponCode2 = e.Item.FindControl("tbCouponCode2") as TextBox;
                    var textField1 = e.Item.FindControl("tbTextField1") as TextBox;
                    var textField2 = e.Item.FindControl("tbTextField2") as TextBox;
                    var textField3 = e.Item.FindControl("tbTextField3") as TextBox;
                    var textField4 = e.Item.FindControl("tbTextField4") as TextBox;

                    var companyNameValue = companyName.Text;
                    var couponCodeValue = couponCode.Text;
                    var couponCode2Value = couponCode2.Text;
                    var textField1Value = textField1.Text;
                    var textField2Value = textField2.Text;
                    var textField3Value = textField3.Text;
                    var textField4Value = textField4.Text;

                    CmsAdmin.UpdatePageTemplate(Convert.ToInt32(id), companyNameValue, couponCodeValue, couponCode2Value, textField1Value, textField2Value, textField3Value, textField4Value);
                    break;
            }

            GetPageTemplates();
        }

        private static void DeleteRecord(string id)
        {
            CmsAdmin.DeletePageTemplate(id);
        }

        protected void rptPageTemplates_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
    }
}