using System;
using System.Runtime.InteropServices;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.cms
{
    public partial class Companies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                GetCompanies();         
        }

        private void GetCompanies()
        {
            rptCompanies.DataSource = CmsAdmin.GetCompanies();
            rptCompanies.DataBind();
        }   

        protected void btnInsertCompany_OnClick(object sender, EventArgs e)
        {
            var companyName = (TextBox)ctlNewRecord.FindControl("tbCompanyName");
            var couponCode = (TextBox)ctlNewRecord.FindControl("tbCouponCode");
            var couponDiscount = (TextBox)ctlNewRecord.FindControl("tbCouponDiscount");
            var couponEnabled = (CheckBox)ctlNewRecord.FindControl("cbCouponEnabled");

            var companyNameText = companyName.Text;
            var couponCodeText = couponCode.Text;
            var couponDiscountText = couponDiscount.Text;
            var couponEnabledChecked = couponEnabled.Checked;

            CmsAdmin.AddCompany(companyNameText, couponCodeText, Convert.ToInt32(couponDiscountText), couponEnabledChecked);

            GetCompanies();
        }

        protected void rptCompanies_OnItemCommand(object source, RepeaterCommandEventArgs e)
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
                    var couponDiscount = e.Item.FindControl("tbCouponDiscount") as TextBox;
                    var couponEnabled = e.Item.FindControl("cbCouponEnabled") as CheckBox;
                    var companyNameValue = companyName.Text;
                    var couponCodeValue = couponCode.Text;
                    var couponDiscountValue = couponDiscount.Text;
                    var couponEnabledValue = couponEnabled.Checked;

                    CmsAdmin.UpdateCompany(id, companyNameValue, couponCodeValue, Convert.ToInt32(couponDiscountValue), couponEnabledValue);                    
                    break;
            }

            GetCompanies();
        }

        private static void DeleteRecord(string id)
        {
            CmsAdmin.DeleteCompany(id);
        }

        private static void UpdateRecord(string id, string companyName, string couponCode, string couponDiscount, bool couponEnabled)
        {            
            
        }
    }
}