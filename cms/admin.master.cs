using System;
using System.Web.Security;
using System.Web.UI;

namespace ProductivityPointGlobal.CMS
{
    public partial class admin : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ctlAdmin.PostBackUrl = "admin.aspx";
            ctlData.PostBackUrl = "import.aspx";
            ctlCompanies.PostBackUrl = "companies.aspx";                  
            ctlPartners.PostBackUrl = "partners.aspx";
            ctlSEO.PostBackUrl = "pages.aspx";
            //ctlCourseImages.PostBackUrl = "images.aspx";
            ctlCatalogImages.PostBackUrl = "catalog-images.aspx";
            ctlSpecialSavings.PostBackUrl = "specialsavings.aspx";
            //ctlUsers.PostBackUrl = "users.aspx";
            //ctlHomeLinks.PostBackUrl = "home.aspx";
            // Course Links
            lbTechnicalCourses.PostBackUrl = "course-technical.aspx";
            lbDesktopApplications.PostBackUrl = "course-desktop.aspx";
            lbProfessionalDevelopment.PostBackUrl = "course-professional.aspx";
            ctlEditor.PostBackUrl = "Posts.aspx";
            ctlBrandImages.PostBackUrl = "brand-images.aspx";
            ctlSiteImages.PostBackUrl = "site-images.aspx";
        }

        protected void ctlLogOut_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/default.aspx");
        }
    }
}