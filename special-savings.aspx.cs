using System;
using System.Data;
using System.Web.UI;

namespace ProductivityPointGlobal
{
    public partial class SpecialSavings : Page
    {
        public string CompanyName { get; set; }
        public string CouponCode { get; set; }
        public string CouponCode2 { get; set; }
        public string TextField1 { get; set; }
        public string TextField2 { get; set; }
        public string TextField3 { get; set; }
        public string TextField4 { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            LoadPageContent();
        }

        public void LoadPageContent()
        {
            var qs = Request.QueryString["PageId"];
            var data = CmsAdmin.GetPageTemplatesByPageId(qs);

            foreach (DataRow dr in data.Rows)
            {
                CompanyName = dr["CompanyName"].ToString();
                CouponCode = dr["CouponCode"].ToString();
                CouponCode2 = dr["CouponCode2"].ToString();
                TextField1 = dr["TextField1"].ToString();
                TextField2 = dr["TextField2"].ToString();
                TextField3 = dr["TextField3"].ToString();
                TextField4 = dr["TextField4"].ToString();
            }

            //litCompanyName.Text = CompanyName;
            litCoupon1.Text = CouponCode;
            litCoupon2.Text = CouponCode2;

            litText0.Text = CompanyName;
            litText1.Text = TextField1;
            litText2.Text = TextField2;
            litText3.Text = TextField3;
            litText4.Text = TextField4;
            litText5.Text = CompanyName;
            litText6.Text = CompanyName;            
        }
    }
}