using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.cms
{
    public partial class editor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Id"] != null)
                {
                    int postId;
                    if (int.TryParse(Request.QueryString["Id"], out postId))
                    {
                        LoadPost(postId);
                    }
                }
                else
                {
                    txtCreatedAt.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    txtUpdatedAt.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    chkPublished.Checked = true;
                }
            }
        }

        private void LoadPost(int postId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["SQLConnectionProd"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Posts WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Id", postId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtTitle.Text = reader["title"].ToString();
                    txtSlug.Text = reader["slug"].ToString();
                    txtSeoTitle.Text = reader["seo_title"].ToString();
                    txtDescription.Text = reader["description"].ToString();
                    txtContent.Text = reader["content"].ToString();

                    string coverImage = reader["cover_image_url"].ToString();
                    hfImagePath.Value = coverImage;
                    imgPreview.ImageUrl = "~/uploads/posts/" + coverImage;
                    imgPreview.Visible = true;

                    chkPublished.Checked = Convert.ToBoolean(reader["published"]);
                    txtCreatedAt.Text = Convert.ToDateTime(reader["created_at"]).ToString("yyyy-MM-dd HH:mm:ss");
                    txtUpdatedAt.Text = Convert.ToDateTime(reader["updated_at"]).ToString("yyyy-MM-dd HH:mm:ss");

                    ddlCategory.SelectedValue = reader["category"].ToString(); // Make sure values match dropdown
                }
                conn.Close();
            }
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            string imagePath = "";

            if (fuCoverImage.HasFile)
            {
                // Get original file extension
                string extension = Path.GetExtension(fuCoverImage.FileName);

                // Generate unique file name using GUID
                string uniqueFileName = Guid.NewGuid().ToString() + extension;

                // Define folder and full path
                string folderPath = Server.MapPath("~/uploads/posts/");
                if (!Directory.Exists(folderPath))
                    Directory.CreateDirectory(folderPath);

                string fullPath = Path.Combine(folderPath, uniqueFileName);
                fuCoverImage.SaveAs(fullPath);

                // Set image path for DB and preview
                imagePath = uniqueFileName;
                imgPreview.ImageUrl = imagePath;
                imgPreview.Visible = true;
                hfImagePath.Value = imagePath;
            }
            else
            {
                imagePath = hfImagePath.Value;
            }


            // Example: Save all values to DB
            string title = txtTitle.Text;
            string slug = txtSlug.Text;
            string seoTitle = txtSeoTitle.Text;
            string description = txtDescription.Text;
            string content = txtContent.Text;
            bool published = chkPublished.Checked;
            int category = Convert.ToInt32(ddlCategory.SelectedValue);
            string createdAt = txtCreatedAt.Text;
            string updatedAt = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");


            string connStr = ConfigurationManager.ConnectionStrings["SQLConnectionProd"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
                {
                    // Update mode
                    int postId = Convert.ToInt32(Request.QueryString["Id"]);
                    string updateQuery = @"
                        UPDATE Posts
                        SET 
                            title = @Title,
                            slug = @Slug,
                            seo_title = @SeoTitle,
                            description = @Description,
                            content = @Content,
                            cover_image_url = @ImagePath,
                            published = @Published,
                            updated_at = @UpdatedAt,
                            category = @Category
                        WHERE Id = @Id";

                    using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Id", postId);
                        cmd.Parameters.AddWithValue("@Title", title);
                        cmd.Parameters.AddWithValue("@Slug", slug);
                        cmd.Parameters.AddWithValue("@SeoTitle", seoTitle);
                        cmd.Parameters.AddWithValue("@Description", description);
                        cmd.Parameters.AddWithValue("@Content", content);
                        cmd.Parameters.AddWithValue("@ImagePath", imagePath);
                        cmd.Parameters.AddWithValue("@Published", published);
                        cmd.Parameters.AddWithValue("@UpdatedAt", updatedAt);
                        cmd.Parameters.AddWithValue("@Category", category);
                        cmd.ExecuteNonQuery();
                    }

                    Response.Redirect("/cms/editor.aspx?id="+ postId);
                }
                else
                {
                    // Insert mode
                    string insertQuery = @"
                        INSERT INTO Posts
                        (title, slug, seo_title, description, content, cover_image_url, published, created_at, updated_at, category)
                        VALUES
                        (@Title, @Slug, @SeoTitle, @Description, @Content, @ImagePath, @Published, @CreatedAt, @UpdatedAt, @Category)";

                    using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Title", title);
                        cmd.Parameters.AddWithValue("@Slug", slug);
                        cmd.Parameters.AddWithValue("@SeoTitle", seoTitle);
                        cmd.Parameters.AddWithValue("@Description", description);
                        cmd.Parameters.AddWithValue("@Content", content);
                        cmd.Parameters.AddWithValue("@ImagePath", imagePath);
                        cmd.Parameters.AddWithValue("@Published", published);
                        cmd.Parameters.AddWithValue("@CreatedAt", createdAt);
                        cmd.Parameters.AddWithValue("@UpdatedAt", updatedAt);
                        cmd.Parameters.AddWithValue("@Category", category);
                        cmd.ExecuteNonQuery();
                    }

                    Response.Redirect("/cms/Posts.aspx");
                }

                conn.Close();
            }

        }
    }
}