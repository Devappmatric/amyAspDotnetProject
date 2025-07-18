using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.cms
{
	public partial class catalog_images : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				GetCatalogImages();

				GetCatalogs();
			}
		}

		private void GetCatalogImages()
		{
			ctlCMSCatalogImages.DataSource = CmsAdmin.GetCatalogImages();
			ctlCMSCatalogImages.DataBind();
		}

		private void GetCatalogs()
		{
			if (ddName.Items.Count == 0)
			{
				ddName.DataSource = CmsAdmin.GetCatalogs();
				ddName.DataBind();

				ddName.Items.Insert(0, new ListItem("Select...", ""));
			}
		}



		protected void ctlCMSCatalogImages_RowCommand(Object sender, GridViewCommandEventArgs e)
		{
			if (e.CommandName == "ImgEdit")
			{
				var dt = CmsAdmin.GetCatalogImage((string)e.CommandArgument);
				hdnModalId.Value = dt.Rows[0]["id"].ToString();
				// tbName.Text = dt.Rows[0]["catalog_name"].ToString();
				ddName.SelectedValue = dt.Rows[0]["catalog_name"].ToString();
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
				CmsAdmin.DeleteCatalogImage((string)e.CommandArgument);
				GetCatalogImages();
			}
		}

		protected void btnModalCancel_Click(Object sender, EventArgs e)
		{
			pnlModalOverlay.Visible = false;
		}

		protected void btnModalSave_Click(Object sender, EventArgs e)
		{
			if(ddName.SelectedValue != "")
			{
				if(fuImage.Visible == false || (fuImage.Visible == true && fuImage.HasFile))
				{
					string filename = Path.GetFileName(fuImage.FileName);
					fuImage.SaveAs(Server.MapPath("~/images/catalog/") + filename);

					CmsAdmin.UpsertCatalogImage(hdnModalId.Value, ddName.SelectedValue, cbCourseSw.Checked, (fuImage.Visible == true ? "/images/catalog/" + filename : imgModal.ImageUrl));

					pnlModalOverlay.Visible = false;
					GetCatalogImages();
				}
				else{
					lblModalError.Text = "Please select an image";
				}
			}
			else
			{
				lblModalError.Text = "Please select a catalog name";
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