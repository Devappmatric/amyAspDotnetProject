using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.cms
{
    public partial class Posts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAllPosts();
            }
            rptPosts.ItemCommand += rptPosts_ItemCommand;
        }

        protected void rptPosts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeletePost")
            {
                int postId = Convert.ToInt32(e.CommandArgument);
                DeletePost(postId);
                LoadAllPosts(); // reload updated list
            }
        }

        private void DeletePost(int postId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["SQLConnectionProd"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM posts WHERE id = @id", conn))
                {
                    cmd.Parameters.AddWithValue("@id", postId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void LoadAllPosts()
        {
            string connStr = ConfigurationManager.ConnectionStrings["SQLConnectionProd"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand("GetAllPosts", conn))
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