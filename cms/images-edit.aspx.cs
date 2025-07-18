using System;
using System.IO;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.cms
{
    public partial class ImagesEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            switch (Request.QueryString["mode"])
            {
                case "Edit":
                    ctlNewRecord.ChangeMode(FormViewMode.Edit);
                    break;
            }
        }

        protected void ctlUpdateRecord_Click(object sender, EventArgs e)
        {
            var file = (FileUpload)ctlNewRecord.FindControl("ctlImage");
            var fileName = file.FileName;

            if (!file.HasFile) return;
            var fileExt = Path.GetExtension(file.FileName);

            if (fileExt != ".jpeg" && fileExt != ".jpg" && fileExt != ".png") return;
            //Save files to disk
            file.SaveAs(Server.MapPath("~/courses/images/" + fileName));

            //Add Entry to Database with image
            CmsAdmin.UpdateCourseLogo(Request.QueryString["id"], fileName);
        }

        protected void ctlCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("images.aspx");
        }
    }
}