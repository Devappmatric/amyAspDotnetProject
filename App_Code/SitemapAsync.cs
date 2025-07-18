using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace ProductivityPointGlobal.Handlers
{
    public class SitemapAsync : HttpTaskAsyncHandler
    {
        public override async Task ProcessRequestAsync(HttpContext context)
        {
            context.Response.Clear();
            context.Response.ContentType = "text/xml";
            var root = (context.Request.IsSecureConnection ? "https://" : "http://") + context.Request.Url.Host + "/";
            var lastmodif = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss");
            var xset = new System.Xml.XmlWriterSettings()
            {
                OmitXmlDeclaration = true,
                Encoding = System.Text.ASCIIEncoding.UTF8,
                Async = true
            };
            var xw = System.Xml.XmlWriter.Create(context.Response.OutputStream, xset);
            await xw.WriteStartDocumentAsync();
            await xw.WriteStartElementAsync(null, "urlset", "http://www.sitemaps.org/schemas/sitemap/0.9");
            await xw.WriteAttributeStringAsync("xmlns", "xsi", null, "http://www.w3.org/2001/XMLSchema-instance");
            await xw.WriteAttributeStringAsync("xsi", "schemaLocation", null, "http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd");
            //await xw.WriteStartElementAsync(null, "url", null);
            //await xw.WriteElementStringAsync(null, "loc", null, root);
            //await xw.WriteElementStringAsync(null, "changefreq", null, "weekly");
            //await xw.WriteElementStringAsync(null, "priority", null, "1.0");
            //await xw.WriteElementStringAsync(null, "lastmod", null, lastmodif);
            using(var cnn=new SqlConnection(ConfigurationManager.ConnectionStrings["SQLConnectionProd"].ConnectionString))
            {
                var cmd = new SqlCommand("dbo.spSiteMap", cnn) { CommandType = System.Data.CommandType.StoredProcedure };
                await cnn.OpenAsync();
                using(var r=await cmd.ExecuteReaderAsync())
                {
                    while(await r.ReadAsync())
                    {
                        await xw.WriteStartElementAsync(null, "url", null);
                        await xw.WriteElementStringAsync(null, "loc", null, root + "course/" + r[0].ToString().Trim().Replace(" ", "-").ToLower());
                        await xw.WriteElementStringAsync(null, "changefreq", null, "weekly");
                        await xw.WriteElementStringAsync(null, "priority", null, "0.9");
                        await xw.WriteElementStringAsync(null, "lastmod", null, ((DateTime)r[1]).ToString("yyyy-MM-dd"));
                        await xw.WriteEndElementAsync();//url

                    }
                    r.Close();
                }
                cmd.CommandText = "dbo.spCityPageSiteMap2";
                using(var r=await cmd.ExecuteReaderAsync())
                {
                    while(await r.ReadAsync())
                    {
                        await xw.WriteStartElementAsync(null, "url", null);//
                        await xw.WriteElementStringAsync(null, "loc", null, string.Format("{0}training/{1}/{2}", root, r[0].ToString().Trim().Replace(" ", "-").ToLower(), r[1].ToString().Trim().ToLower()));
                        //await xw.WriteElementStringAsync(null, "loc", null, string.Format("{0}training/{1}/{2}", root, HttpUtility.UrlEncode(r[0].ToString().Trim().Replace(" ", "-").ToLower()), r[1].ToString().Trim().ToLower()));
                        //await xw.WriteElementStringAsync(null, "loc", null, $"{root}training/{HttpUtility.UrlPathEncode(rdr[0].ToString().Trim().Replace(" ", "-")).ToLower()}/{rdr[1].ToString().Trim().ToLower()}");
                        await xw.WriteElementStringAsync(null, "changefreq", null, "weekly");
                        await xw.WriteElementStringAsync(null, "priority", null, "0.5");
                        await xw.WriteElementStringAsync(null, "lastmod", null, ((DateTime)r[2]).ToString("yyyy-MM-dd"));
                        await xw.WriteEndElementAsync();//url

                    }
                    r.Close();
                }
                cnn.Close();
                cmd.Dispose();
            }
            await xw.WriteEndElementAsync();//urlset
            await xw.WriteEndDocumentAsync();
            await xw.FlushAsync();
            xw.Close();
            context.Response.End();
            //context.Response.Write("<test>test</test>");
            //throw new NotImplementedException();
        }
    }
}