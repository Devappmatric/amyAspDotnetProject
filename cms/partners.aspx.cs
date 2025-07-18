using System;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.CMS
{
    public partial class Partners : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            GetPartnerImages();
            ctlAdminCMS.DataBind();
        }

        private void GetPartnerImages()
        {
            ctlAdminCMS.DataSource = CmsAdmin.GetPartnerImages();
            ctlAdminCMS.DataBind();
        }

        protected void ctlPager_MenuItemClick(object sender, MenuEventArgs e)
        {
            ctlAdminCMS.PageIndex = int.Parse(e.Item.Value);
        }

        protected void ctlInsertRecord_Click(object sender, EventArgs e)
        {
            var txt1 = (TextBox)ctlNewRecord.FindControl("ctlName");
            var txt2 = (TextBox)ctlNewRecord.FindControl("ctlDescription");
            var file = (FileUpload)ctlNewRecord.FindControl("ctlLogo");

            var name = txt1.Text;
            var description = txt2.Text;
            var fileName = file.FileName;

            if (file.HasFile)
            {
                var fileExt = Path.GetExtension(file.FileName);

                if (fileExt == ".jpeg" || fileExt == ".jpg")
                {
                    //Save files to disk
                    file.SaveAs(Server.MapPath("~/uploads/partners/" + fileName));
                }
            }
            CmsAdmin.AddPartner(name, description, fileName);
            GetPartnerImages();
        }

        protected void ctlAdminCMS_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ctlAdminCMS.EditIndex = e.NewEditIndex;
            GetPartnerImages();
        }

        protected void ctlAdminCMS_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var dataKey = ctlAdminCMS.DataKeys[e.RowIndex];

            if (dataKey != null)
            {
                var id = int.Parse(dataKey.Value.ToString());

                var file = (FileUpload)ctlAdminCMS.Rows[e.RowIndex].FindControl("ctlImage");
                var fileName = file.FileName;

                var name = (TextBox)ctlAdminCMS.Rows[e.RowIndex].FindControl("ctlName");
                var nameValue = name.Text;

                var description = (TextBox)ctlAdminCMS.Rows[e.RowIndex].FindControl("ctlDescription");
                var descriptionValue = description.Text;

                if (file.HasFile)
                {
                    var fileExt = Path.GetExtension(file.FileName);

                    if (fileExt != ".jpeg" && fileExt != ".jpg" && fileExt != ".png") return;
                    //Save files to disk
                    file.SaveAs(Server.MapPath("~/uploads/partners/" + fileName));
                }

                //Add Entry to Database with image
                CmsAdmin.UpdatePartnerImage(id, fileName, nameValue, descriptionValue);
            }

            ctlAdminCMS.EditIndex = -1;
            GetPartnerImages();
        }

        protected void ctlAdminCMS_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ctlAdminCMS.EditIndex = -1;
            GetPartnerImages();
        }

        protected void ctlAdminCMS_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var key = ctlAdminCMS.DataKeys[e.RowIndex];
            if (key != null)
            {
                var dataKey = key.Value.ToString();
                CmsAdmin.RemovePartner(dataKey);
            }
            GetPartnerImages();
        }

        public string CheckEmptyData(string dataField)
        {
            return string.IsNullOrEmpty(dataField) ? "..." : dataField.Replace("\n", "<br /> ");
        }
    }
}