using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.cms
{
    public partial class brand_images : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetBrandImages();

                GetBrands();
            }
        }

        private void GetBrandImages()
        {
            ctlCMSBrandImages.DataSource = CmsAdmin.GetBrandImages();
            ctlCMSBrandImages.DataBind();
        }

        private void GetBrands()
        {
            if (ddName.Items.Count == 0)
            {
                ddName.DataSource = CmsAdmin.GetBrands();
                ddName.DataBind();

                ddName.Items.Insert(0, new ListItem("Select...", ""));
            }
        }



        protected void ctlCMSBrandImages_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ImgEdit")
            {
                var dt = CmsAdmin.GetBrandImage((string)e.CommandArgument);
                hdnModalId.Value = dt.Rows[0]["id"].ToString();
                // tbName.Text = dt.Rows[0]["catalog_name"].ToString();
                ddName.SelectedValue = dt.Rows[0]["brand_name"].ToString();
                cbCourseSw.Checked = (bool)dt.Rows[0]["course_sw"];

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
                CmsAdmin.DeleteBrandImage((string)e.CommandArgument);
                GetBrandImages();
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
                    string filename = Path.GetFileName(fuImage.FileName);
                    fuImage.SaveAs(Server.MapPath("~/images/brand/") + filename);

                    CmsAdmin.UpsertBrandImage(hdnModalId.Value, ddName.SelectedValue, cbCourseSw.Checked, (fuImage.Visible == true ? "/images/brand/" + filename : imgModal.ImageUrl));

                    pnlModalOverlay.Visible = false;
                    GetBrandImages();
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
            cbCourseSw.Checked = false;
            fuImage.Dispose();
            fuImage.Visible = true;
            imgModal.Visible = false;
            btnImgEdit.Visible = false;

            pnlModalOverlay.Visible = true;
        }
    }
}