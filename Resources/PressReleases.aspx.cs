using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.Resources
{
    public partial class PressReleases : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadBlogPosts();
        }

        private void LoadBlogPosts()
        {
            string connStr = ConfigurationManager.ConnectionStrings["SQLConnectionProd"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand("GetAllPressReleases", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptPosts.DataSource = dt;
                    rptPosts.DataBind();
                }
            }
        }

        public string GetCategoryName(object categoryValue)
        {
            int category = Convert.ToInt32(categoryValue);
            if (category == 1)
            {
                return "Posts";
            }
            else if (category == 2)
            {
                return "Press Release";
            }
            else if (category == 3)
            {
                return "Topics";
            }
            return "";
        }

    }
}