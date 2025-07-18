using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Xml;

namespace ProductivityPointGlobal
{
    public class SitemapCityPages : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/xml";

            using (var writer = new XmlTextWriter(context.Response.OutputStream, Encoding.UTF8))
            {
                writer.WriteStartDocument();
                writer.WriteStartElement("urlset");
                writer.WriteAttributeString("xmlns", "http://www.sitemaps.org/schemas/sitemap/0.9");
                //writer.WriteStartElement("url");

                var connect = AppConfiguration.DbConnectionString;
                const string url = "http://www.productivitypoint.com/";
                //const string url = "http://www.dev1.epilyx.com/";
                //const string url = "http://localhost/";

                using (var conn = new SqlConnection(connect))
                {
                    using (var cmd = new SqlCommand("spCityPageSiteMap2", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        conn.Open();

                        using (var rdr = cmd.ExecuteReader())
                        {
                            while (rdr.Read())
                            {
                                writer.WriteStartElement("url");
                                writer.WriteElementString("loc", $"{url}Training/{HttpUtility.UrlPathEncode(rdr[0].ToString().Trim().Replace(" ", "-"))}/{rdr[1].ToString().Trim()}");
                                writer.WriteElementString("lastmod", $"{rdr[2]:yyyy-MM-dd}");
                                writer.WriteElementString("changefreq", "daily");
                                writer.WriteEndElement();
                            }

                            writer.WriteEndElement();
                            writer.WriteEndDocument();
                            writer.Flush();
                        }
                        context.Response.End();
                    }
                }
            }
        }

        public bool IsReusable => true;
    }
}