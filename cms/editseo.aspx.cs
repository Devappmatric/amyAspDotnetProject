using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.cms
{
    public partial class Editseo : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FormDataBind();
            }
        }

        private void FormDataBind()
        {
            var qs = Convert.ToInt32(Request.QueryString["id"]);
            ctlEditForm.DataSource = CmsAdmin.RetrievePageById(qs);
            ctlEditForm.DataBind();
        }

        protected void ctlEditForm_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            var qs = Convert.ToInt32(Request.QueryString["id"]);
            var title = ((TextBox)ctlEditForm.FindControl("ctlTitle")).Text;
            var description = ((TextBox)ctlEditForm.FindControl("ctlDescription")).Text;
            var keywords = ((TextBox)ctlEditForm.FindControl("ctlKeywords")).Text;

            try
            {
                CmsAdmin.UpdateSeo(qs, title, description, keywords);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(typeof(Page), "test", "<script>alert('An Error Occured!');</script>");
                AppUtilities.LogError(ex);
            }
            finally
            {
                Response.Redirect("pages.aspx");
            }
        }

        protected void ctlUpdateRecord_OnClick(object sender, EventArgs e)
        {
            ctlEditForm.UpdateItem(true);
        }

        protected void ctlCancel_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("pages.aspx");
        }
    }
}