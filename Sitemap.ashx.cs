using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Xml;

namespace ProductivityPointGlobal
{
    /// <summary>
    /// Summary description for Sitemap
    /// </summary>
    public class Sitemap : IHttpHandler
    {
        //public void ProcessRequest(HttpContext context)
        //{
        //    context.Response.ContentType = "text/xml";

        //    using (var writer = new XmlTextWriter(context.Response.OutputStream, Encoding.UTF8))
        //    {
        //        writer.WriteStartDocument();
        //        writer.WriteStartElement("urlset");
        //        writer.WriteAttributeString("xmlns", "http://www.sitemaps.org/schemas/sitemap/0.9");
        //        //writer.WriteStartElement("url");

        //        var connect = AppConfiguration.DbConnectionString;
        //        const string url = "http://www.productivitypoint.com/";
        //        //const string url = "http://localhost/";                

        //        using (var conn = new SqlConnection(connect))
        //        {
        //            using (var cmd = new SqlCommand("spSiteMap", conn))
        //            {
        //                cmd.CommandType = CommandType.StoredProcedure;
        //                conn.Open();

        //                using (var rdr = cmd.ExecuteReader())
        //                {
        //                    while (rdr.Read())
        //                    {
        //                        writer.WriteStartElement("url");
        //                        writer.WriteElementString("loc", $"{url}Course/{rdr[0].ToString().Trim().Replace(" ", "-")}/");
        //                        writer.WriteElementString("lastmod", $"{rdr[1]:yyyy-MM-dd}");
        //                        writer.WriteElementString("changefreq", "daily");
        //                        writer.WriteEndElement();
        //                    }

        //                    writer.WriteEndElement();
        //                    writer.WriteEndDocument();
        //                    writer.Flush();
        //                }
        //                context.Response.End();
        //            }
        //        }
        //    }
        //}

        public bool IsReusable => true;

        public void ProcessRequest(HttpContext context)
        {
            context.Response.Clear();
            context.Response.ContentType = "text/xml";
            var root = (context.Request.IsSecureConnection ? "https://" : "http://") + context.Request.Url.Host + "/";
            var lastmodif = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss");
            var xset = new System.Xml.XmlWriterSettings()
            {
                OmitXmlDeclaration = true,
                Encoding = System.Text.ASCIIEncoding.UTF8
            };
            var xw = System.Xml.XmlWriter.Create(context.Response.OutputStream, xset);
             xw.WriteStartDocument();
             xw.WriteStartElement(null, "urlset", "http://www.sitemaps.org/schemas/sitemap/0.9");
             xw.WriteAttributeString("xmlns", "xsi", null, "http://www.w3.org/2001/XMLSchema-instance");
             xw.WriteAttributeString("xsi", "schemaLocation", null, "http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd");
            // xw.WriteStartElement(null, "url", null);
            // xw.WriteElementString(null, "loc", null, root);
            // xw.WriteElementString(null, "changefreq", null, "weekly");
            // xw.WriteElementString(null, "priority", null, "1.0");
            // xw.WriteElementString(null, "lastmod", null, lastmodif);
            //Now let us create sitemap for each of the dynamic contents:


            //Adding Static Sitemap
            string[] staticpages = new string[]
            {
                "https://www.productivitypointls.com/professional-services.aspx",
                "https://www.productivitypointls.com/event-hosting.aspx",
                "https://www.productivitypointls.com/about-ppls.aspx",
                "https://www.productivitypointls.com/delivery-methods.aspx",
                "https://www.productivitypointls.com/partners.aspx",
                "https://www.productivitypointls.com/contact.aspx",
                "https://www.productivitypointls.com/GovernmentSolutions.aspx",
                "https://www.productivitypointls.com/GovernmentSolutions/FederalGovernmentAndMilitaryTuitionSavings.aspx",
                "https://www.productivitypointls.com/GovernmentSolutions/DOD8570Certification.aspx"
            };

            foreach (var item in staticpages)
            {
                xw.WriteStartElement(null, "url", null);//
                xw.WriteElementString(null, "loc", null, item);
                xw.WriteElementString(null, "changefreq", null, "weekly");
                xw.WriteElementString(null, "priority", null, "0.5");
                xw.WriteElementString(null, "lastmod", null, ((DateTime)DateTime.Now).ToString("yyyy-MM-dd"));
                xw.WriteEndElement();//url
            }

            xw.WriteEndElement();//urlset
            xw.WriteEndDocument();
            xw.Flush();
            xw.Close();
            context.Response.End();
            return;

            //first get technical courses
            var technicalBrands = ContentAdditional.GetMainTechnicalCoursesCatalogBrands("Technical Courses");
            var technicalTopics = ContentAdditional.GetMainTechnicalCoursesCatalogTopic("Technical Courses");
            var professionalTopics = ContentAdditional.GetMainTechnicalCoursesCatalogTopic("Professional Development Skills");
            var desktopTopics = ContentAdditional.GetMainTechnicalCoursesCatalogTopic("Desktop Applications");

            foreach (DataRow technicalBrand in technicalBrands.Rows)
            {
                var brand = technicalBrand["catalogBrand"].ToString().Replace(" ", "-").ToLower();
                xw.WriteStartElement(null, "url", null);//
                xw.WriteElementString(null, "loc", null, string.Format("{0}brand/{1}/technical-courses", root, brand));
                xw.WriteElementString(null, "changefreq", null, "weekly");
                xw.WriteElementString(null, "priority", null, "0.5");
                xw.WriteElementString(null, "lastmod", null, ((DateTime)DateTime.Now).ToString("yyyy-MM-dd"));
                xw.WriteEndElement();//url

                var result = ContentCourses.GetTempBrandFromCatalogAndCourse(brand, "technical courses");
                foreach (DataRow dataRow in result.Rows)
                {
                    var course = dataRow["seoCourseName"].ToString().Replace(" ", "-").ToLower();
                    xw.WriteStartElement(null, "url", null);//
                    xw.WriteElementString(null, "loc", null, string.Format("{0}course/{1}/", root, course));
                    xw.WriteElementString(null, "changefreq", null, "weekly");
                    xw.WriteElementString(null, "priority", null, "0.5");
                    xw.WriteElementString(null, "lastmod", null, ((DateTime)DateTime.Now).ToString("yyyy-MM-dd"));
                    xw.WriteEndElement();//url
                }

            }

            foreach (DataRow technicalTopic in technicalTopics.Rows)
            {
                var topic = technicalTopic["catalogTopic"].ToString().Replace(" ", "-").ToLower();
                xw.WriteStartElement(null, "url", null);//
                xw.WriteElementString(null, "loc", null, string.Format("{0}topic/{1}/technical-courses", root, topic));
                xw.WriteElementString(null, "changefreq", null, "weekly");
                xw.WriteElementString(null, "priority", null, "0.5");
                xw.WriteElementString(null, "lastmod", null, ((DateTime)DateTime.Now).ToString("yyyy-MM-dd"));
                xw.WriteEndElement();//url

                var result = ContentCourses.GetCourseByTopicName(topic, "technical courses");
                foreach (DataRow dataRow in result.Rows)
                {
                    var course = dataRow["seoCourseName"].ToString().Replace(" ", "-").ToLower();
                    xw.WriteStartElement(null, "url", null);//
                    xw.WriteElementString(null, "loc", null, string.Format("{0}course/{1}/", root, course));
                    xw.WriteElementString(null, "changefreq", null, "weekly");
                    xw.WriteElementString(null, "priority", null, "0.5");
                    xw.WriteElementString(null, "lastmod", null, ((DateTime)DateTime.Now).ToString("yyyy-MM-dd"));
                    xw.WriteEndElement();//url

                    xw.WriteStartElement(null, "url", null);//
                    xw.WriteElementString(null, "loc", null, string.Format("{0}course/{1}/class", root, course));
                    xw.WriteElementString(null, "changefreq", null, "weekly");
                    xw.WriteElementString(null, "priority", null, "0.5");
                    xw.WriteElementString(null, "lastmod", null, ((DateTime)DateTime.Now).ToString("yyyy-MM-dd"));
                    xw.WriteEndElement();//url
                }
            }

            foreach (DataRow desktopTopic in desktopTopics.Rows)
            {
                var topic = desktopTopic["catalogTopic"].ToString().Replace(" ", "-").ToLower();
                xw.WriteStartElement(null, "url", null);//
                xw.WriteElementString(null, "loc", null, string.Format("{0}topic/{1}/desktop-applications", root, topic));
                xw.WriteElementString(null, "changefreq", null, "weekly");
                xw.WriteElementString(null, "priority", null, "0.5");
                xw.WriteElementString(null, "lastmod", null, ((DateTime)DateTime.Now).ToString("yyyy-MM-dd"));
                xw.WriteEndElement();//url

                var result = ContentCourses.GetCourseByTopicName(topic, "desktop applications");
                foreach (DataRow dataRow in result.Rows)
                {
                    var course = dataRow["seoCourseName"].ToString().Replace(" ", "-").ToLower();
                    xw.WriteStartElement(null, "url", null);//
                    xw.WriteElementString(null, "loc", null, string.Format("{0}course/{1}/", root, course));
                    xw.WriteElementString(null, "changefreq", null, "weekly");
                    xw.WriteElementString(null, "priority", null, "0.5");
                    xw.WriteElementString(null, "lastmod", null, ((DateTime)DateTime.Now).ToString("yyyy-MM-dd"));
                    xw.WriteEndElement();//url

                    xw.WriteStartElement(null, "url", null);//
                    xw.WriteElementString(null, "loc", null, string.Format("{0}course/{1}/class", root, course));
                    xw.WriteElementString(null, "changefreq", null, "weekly");
                    xw.WriteElementString(null, "priority", null, "0.5");
                    xw.WriteElementString(null, "lastmod", null, ((DateTime)DateTime.Now).ToString("yyyy-MM-dd"));
                    xw.WriteEndElement();//url
                }

            }

            foreach (DataRow professionalTopic in professionalTopics.Rows)
            {
                var topic = professionalTopic["catalogTopic"].ToString().Replace(" ", "-").ToLower();
                xw.WriteStartElement(null, "url", null);//
                xw.WriteElementString(null, "loc", null, string.Format("{0}topic/{1}/professional-development-skills", root, topic));
                xw.WriteElementString(null, "changefreq", null, "weekly");
                xw.WriteElementString(null, "priority", null, "0.5");
                xw.WriteElementString(null, "lastmod", null, ((DateTime)DateTime.Now).ToString("yyyy-MM-dd"));
                xw.WriteEndElement();//url

                var result = ContentCourses.GetCourseByTopicName(topic, "professional development skills");
                foreach (DataRow dataRow in result.Rows)
                {
                    var course = dataRow["seoCourseName"].ToString().Replace(" ", "-").ToLower();
                    xw.WriteStartElement(null, "url", null);//
                    xw.WriteElementString(null, "loc", null, string.Format("{0}course/{1}/", root, course));
                    xw.WriteElementString(null, "changefreq", null, "weekly");
                    xw.WriteElementString(null, "priority", null, "0.5");
                    xw.WriteElementString(null, "lastmod", null, ((DateTime)DateTime.Now).ToString("yyyy-MM-dd"));
                    xw.WriteEndElement();//url

                    xw.WriteStartElement(null, "url", null);//
                    xw.WriteElementString(null, "loc", null, string.Format("{0}course/{1}/class", root, course));
                    xw.WriteElementString(null, "changefreq", null, "weekly");
                    xw.WriteElementString(null, "priority", null, "0.5");
                    xw.WriteElementString(null, "lastmod", null, ((DateTime)DateTime.Now).ToString("yyyy-MM-dd"));
                    xw.WriteEndElement();//url
                }
            }

            //Course Hierarchy Part 2

            var cities = ContentCourses.GetAllCities();
            foreach (DataRow dataRow in cities.Rows)
            {
                var city= dataRow["closestCity"].ToString().Replace(" ", "-").ToLower();
                var state = dataRow["closestState"].ToString().ToLower();

                xw.WriteStartElement(null, "url", null);//
                xw.WriteElementString(null, "loc", null, string.Format("{0}city/{1}/state/{2}", root, city,state));
                xw.WriteElementString(null, "changefreq", null, "weekly");
                xw.WriteElementString(null, "priority", null, "0.5");
                xw.WriteElementString(null, "lastmod", null, ((DateTime)DateTime.Now).ToString("yyyy-MM-dd"));
                xw.WriteEndElement();//url

                var catalogByCity = ContentCourses.GetCatalogByCity(city);
                foreach (DataRow item in catalogByCity.Rows)
                {
                    var catalog= item["cat4CityPage"].ToString().ToLower().Replace(" ","-");

                    xw.WriteStartElement(null, "url", null);//
                    xw.WriteElementString(null, "loc", null, string.Format("{0}city/{1}/state/{2}", root, city.Replace("-",""), state));
                    xw.WriteElementString(null, "changefreq", null, "weekly");
                    xw.WriteElementString(null, "priority", null, "0.5");
                    xw.WriteElementString(null, "lastmod", null, ((DateTime)DateTime.Now).ToString("yyyy-MM-dd"));
                    xw.WriteEndElement();//url

                    var courses = ContentCourses.GetCityCatalogPageCourses(city, state, catalog);

                    foreach (DataRow courseRow in courses.Rows)
                    {
                        var course = courseRow["seoCourseName"].ToString().Replace(" ", "-").ToLower();

                        xw.WriteStartElement(null, "url", null);//
                        xw.WriteElementString(null, "loc", null, string.Format("{0}course/{1}/classes/{2}-{3}", root, course,city.Replace(" ", "-"), state.Replace(" ", "-").ToLower()));
                        xw.WriteElementString(null, "changefreq", null, "weekly");
                        xw.WriteElementString(null, "priority", null, "0.5");
                        xw.WriteElementString(null, "lastmod", null, ((DateTime)DateTime.Now).ToString("yyyy-MM-dd"));
                        xw.WriteEndElement();//url
                    }
                }
            }

            xw.WriteEndElement();//urlset
             xw.WriteEndDocument();
             xw.Flush();
            xw.Close();
            context.Response.End();
        }
    }
}