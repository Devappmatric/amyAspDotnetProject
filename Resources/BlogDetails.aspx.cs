using ProductivityPointGlobal.cms;
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
    
    public partial class BlogDetails : System.Web.UI.Page
    {
        public string MetaImage { get; set; }
        public string MetaDescription { get; set; }
        public string CanonicalURL { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            string slug = Page.RouteData.Values["blogSlug"] as string;
            if (!string.IsNullOrEmpty(slug))
            {
                LoadPostDetailsBySlug(slug);
            }
            CanonicalURL = string.Format("{0}://{1}/blog/{2}", Request.Url.Scheme, Request.Url.Host, slug);
        }


        private void LoadPostDetailsBySlug(string slug)
        {
            string connStr = ConfigurationManager.ConnectionStrings["SQLConnectionProd"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Posts WHERE slug = @slug AND published = 1";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@slug", slug);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    ltTitle.Text = reader["title"].ToString();
                    Page.Title = reader["title"].ToString() ?? "Blog Post";
                    
                    ltContent.Text = reader["content"].ToString(); // CKEditor content
                    imgCover.ImageUrl = "~/uploads/posts/"+ reader["cover_image_url"].ToString();
                    
                    MetaImage = string.Format("{0}://{1}/uploads/posts/{2}", Request.Url.Scheme, Request.Url.Host, reader["cover_image_url"].ToString());

                    MetaDescription = reader["description"].ToString();

                    bool published = Convert.ToBoolean(reader["published"]);
                    lblDraft.Visible = !published;

                    DateTime createdAt = Convert.ToDateTime(reader["created_at"]);
                    ltDate.Text = createdAt.ToString("MMMM dd, yyyy");

                    int category = Convert.ToInt32(reader["category"]);
                    ltCategory.Text = GetCategoryName(category);
                }
                else
                {
                    // Optionally handle 404
                    ltTitle.Text = "Blog Not Found";
                }
                conn.Close();
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