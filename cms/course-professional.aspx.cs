using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Int32;

namespace ProductivityPointGlobal.cms
{
    public partial class CourseProfessional : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            GetLinks();
        }

        private void ResetInputFields()
        {
            foreach (Control x in Page.Controls)
            {
                if (x is TextBox box)
                {
                    box.Text = string.Empty;
                }
            }
        }

        private void GetLinks()
        {
            ctlAdminCMS.DataSource = CmsAdmin.GetMainCourseLinks("ProfessionalDevelopment");
            ctlAdminCMS.DataBind();
        }

        protected void ctlInsertRecord_Click(object sender, EventArgs e)
        {
            var cat2 = (TextBox)ctlNewRecord.FindControl("ctlCat2");
            var cat2Value = cat2.Text.Trim();

            CmsAdmin.AddHomePageLink(cat2Value, "ProfessionalDevelopment");
            cat2.Text = "";

            GetLinks();
        }

        protected void ctlAdminCMS_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ctlAdminCMS.EditIndex = e.NewEditIndex;
            GetLinks();
        }

        protected void ctlAdminCMS_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var dataKey = ctlAdminCMS.DataKeys[e.RowIndex];

            if (dataKey != null)
            {
                var id = Parse(dataKey.Value.ToString());

                var cat2 = (TextBox)ctlAdminCMS.Rows[e.RowIndex].FindControl("ctlCat2");
                var cat2Value = cat2.Text;

                CmsAdmin.UpdateHomePageLinks(id, cat2Value);
            }

            ctlAdminCMS.EditIndex = -1;
            GetLinks();
        }

        protected void ctlAdminCMS_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ctlAdminCMS.EditIndex = -1;
            GetLinks();
        }

        protected void ctlAdminCMS_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var key = ctlAdminCMS.DataKeys[e.RowIndex];
            if (key != null)
            {
                var dataKey = key.Value.ToString();
                CmsAdmin.RemoveHomePageLink(dataKey);
            }
            GetLinks();
        }
    }
}