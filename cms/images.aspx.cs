using System;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.cms
{
    public partial class Images : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetCourseImages();
            }
        }

        private void GetCourseImages()
        {
            ctlAdminCMS.DataSource = CmsAdmin.GetCourseImages();
            ctlAdminCMS.DataBind();
        }

        protected void ctlAdminCMS_OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            ctlAdminCMS.EditIndex = e.NewEditIndex;
            GetCourseImages();
        }

        protected void ctlAdminCMS_OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var dataKey = ctlAdminCMS.DataKeys[e.RowIndex];

            if (dataKey != null)
            {
                var file = (FileUpload)ctlAdminCMS.Rows[e.RowIndex].FindControl("ctlImage");
                var cat2 = (HiddenField)ctlAdminCMS.Rows[e.RowIndex].FindControl("ctlCat2");
                var fileName = file.FileName;
                var cat2Name = cat2.Value.Trim();

                if (file.HasFile)
                {
                    //var fileExt = Path.GetExtension(file.FileName);
                    //if (fileExt != ".jpeg" && fileExt != ".jpg" && fileExt != ".png") return;
                    //Save files to disk
                    file.SaveAs(Server.MapPath("~/uploads/courses/" + fileName));
                }
                //Add Entry to Database with image
                CmsAdmin.UpdateCourseLogo(cat2Name, fileName);
                ctlAdminCMS.EditIndex = -1;
                GetCourseImages();
            }
        }

        protected void ctlAdminCMS_OnRowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ctlAdminCMS.EditIndex = -1;
            GetCourseImages();
        }

        protected void ctlInsertRecord_OnClick(object sender, EventArgs e)
        {
            var cat2 = ctlCat2.Text;
            CmsAdmin.InsertCourseImageCategory(cat2);
            GetCourseImages();
        }

        protected void ctlAdminCMS_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var dataKey = ctlAdminCMS.DataKeys[e.RowIndex];

            if (dataKey != null)
            {
                var id = (int)dataKey.Value;
                CmsAdmin.DeleteCourseImageCategory(id);
            }
            GetCourseImages();
        }
    }
}