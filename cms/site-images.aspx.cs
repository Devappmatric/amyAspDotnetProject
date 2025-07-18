using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.cms
{
    public partial class site_images : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetPageImages();

                GetPageNames();
            }
        }

        private void GetPageImages()
        {
            ctlCMSBrandImages.DataSource = CmsAdmin.GetPageImages();
            ctlCMSBrandImages.DataBind();
        }

        private void GetPageNames()
        {
            if (ddName.Items.Count == 0)
            {
                ddName.DataSource = CmsAdmin.GetPageNames();
                ddName.DataBind();

                ddName.Items.Insert(0, new ListItem("Select...", ""));
            }
        }



        protected void ctlCMSBrandImages_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ImgEdit")
            {
                var dt = CmsAdmin.GetPageImage((string)e.CommandArgument);
                hdnModalId.Value = dt.Rows[0]["id"].ToString();
                // tbName.Text = dt.Rows[0]["catalog_name"].ToString();
                ddName.SelectedValue = dt.Rows[0]["page_name"].ToString();
                //cbCourseSw.Checked = (bool)dt.Rows[0]["course_sw"];

                if (dt.Rows[0]["img_path"].ToString() != "")
                {
                    imgModal.Visible = true;
                    imgModal.ImageUrl = dt.Rows[0]["img_path"].ToString();
                    btnImgEdit.Visible = true;

                    fuImage.Visible = false;
                }
                else
                {
                    imgModal.Visible = false;
                    btnImgEdit.Visible = false;

                    fuImage.Visible = true;
                }

                pnlModalOverlay.Visible = true;
            }
            else if (e.CommandName == "ImgDelete")
            {
                CmsAdmin.DeletePageImage((string)e.CommandArgument);
                GetPageImages();
            }
        }

        protected void btnModalCancel_Click(Object sender, EventArgs e)
        {
            pnlModalOverlay.Visible = false;
        }

        protected void btnModalSave_Click(Object sender, EventArgs e)
        {
            if (ddName.SelectedValue != "")
            {
                if (fuImage.Visible == false || (fuImage.Visible == true && fuImage.HasFile))
                {
                    var guid = Guid.NewGuid().ToString();
                    string filename =guid+ Path.GetFileName(fuImage.FileName);
                    fuImage.SaveAs(Server.MapPath("~/images/site/") + filename);
                   
                    CmsAdmin.UpsertPageImage(hdnModalId.Value, ddName.SelectedValue, (fuImage.Visible == true ? "/images/site/" + filename : imgModal.ImageUrl));

                    pnlModalOverlay.Visible = false;
                    GetPageImages();
                }
                else
                {
                    lblModalError.Text = "Please select an image";
                }
            }
            else
            {
                lblModalError.Text = "Please select a brand name";
            }
        }

        protected void btnImgEdit_Click(Object sender, EventArgs e)
        {
            imgModal.Visible = false;
            btnImgEdit.Visible = false;

            fuImage.Visible = true;
        }

        protected void btnNew_Click(Object sender, EventArgs e)
        {
            hdnModalId.Value = "0";
            ddName.SelectedValue = "";
            fuImage.Dispose();
            fuImage.Visible = true;
            imgModal.Visible = false;
            btnImgEdit.Visible = false;

            pnlModalOverlay.Visible = true;
        }
    }
}