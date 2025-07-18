using System;
using System.Data;
using System.Data.Common;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace ProductivityPointGlobal.CMS
{
    public partial class Import : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void ctlImportData_Click(object sender, EventArgs e)
        {
            if (!ctlFileToUpload.HasFile)
                return;

            var fileName = ctlFileToUpload.FileName;

            var fileExtension = fileName.Substring(fileName.LastIndexOf('.') + 1).ToLower();
            if (fileExtension == "xlsx")
            {
                var pathName = Server.MapPath("~/cms/uploads/");
                const string localPath = "~/cms/uploads/";

                try
                {
                    if (File.Exists(localPath + ctlFileToUpload.FileName))
                        File.Delete(localPath + ctlFileToUpload.FileName);

                    var str = pathName + ctlFileToUpload.FileName;
                    ctlFileToUpload.SaveAs(str);

                    ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('File Uploaded Successfully.');", true);
                }
                catch (Exception ex)
                {
                    AppUtilities.LogError(ex);
                    ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('" + ex + "');", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Please upload an Excel Workbook with the extension XLSX');", true);
            }
        }

        public void ImportClasses()
        {
            var filePath = Server.MapPath("~/cms/uploads/Classes.xlsx");

            /* Remove Existing Data */
            var connectionString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(connectionString);
            con.Open();

            const string strQuery = "DELETE FROM tblClass_Import";
            var cmd = new SqlCommand(strQuery, con);
            cmd.ExecuteNonQuery();

            /* Retreive Excel Data */
            //var excelConnString = string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source={0};Excel 8.0;HDR=YES;", filePath);

            using (var connection = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filePath + ";" + "Extended Properties='Excel 12.0 Xml;HDR=YES; IMEX=1;'"))
            {
                var command = new OleDbCommand("SELECT * FROM [Sheet1$]", connection);
                connection.Open();

                using (DbDataReader dr = command.ExecuteReader())
                {
                    var sqlConnString = AppConfiguration.DbConnectionString;
                    using (var bulkCopy = new SqlBulkCopy(sqlConnString))
                    {
                        bulkCopy.DestinationTableName = "tblClass_Import";
                        //bulkCopy.BulkCopyTimeout = 9000000;
                        bulkCopy.BulkCopyTimeout = 0;

                        var m1 = new SqlBulkCopyColumnMapping("courseId", "courseId");
                        var m2 = new SqlBulkCopyColumnMapping("venueId", "venueId");
                        var m3 = new SqlBulkCopyColumnMapping("location", "location");
                        var m4 = new SqlBulkCopyColumnMapping("deliveryFormat", "deliveryFormat");
                        var m5 = new SqlBulkCopyColumnMapping("startDate", "startDate");
                        var m6 = new SqlBulkCopyColumnMapping("endDate", "endDate");
                        var m7 = new SqlBulkCopyColumnMapping("duration", "duration");
                        var m8 = new SqlBulkCopyColumnMapping("startTime", "startTime");
                        var m9 = new SqlBulkCopyColumnMapping("endTime", "endTime");
                        var m10 = new SqlBulkCopyColumnMapping("timeZone", "timeZone");
                        var m11 = new SqlBulkCopyColumnMapping("Gtr", "Gtr");
                        var m12 = new SqlBulkCopyColumnMapping("metaTitleCityMain", "metaTitleCityMain");
                        var m13 = new SqlBulkCopyColumnMapping("metaDescriptionCityMain", "metaDescriptionCityMain");
                        var m14 = new SqlBulkCopyColumnMapping("metaTitleCityCatalog", "metaTitleCityCatalog");
                        var m15 = new SqlBulkCopyColumnMapping("metaDescriptionCityCatalog", "metaDescriptionCityCatalog");
                        var m16 = new SqlBulkCopyColumnMapping("classId", "classId");
                        var m17 = new SqlBulkCopyColumnMapping("TopicDescriptionByCity", "TopicDescriptionByCity");


                        bulkCopy.ColumnMappings.Add(m1);
                        bulkCopy.ColumnMappings.Add(m2);
                        bulkCopy.ColumnMappings.Add(m3);
                        bulkCopy.ColumnMappings.Add(m4);
                        bulkCopy.ColumnMappings.Add(m5);
                        bulkCopy.ColumnMappings.Add(m6);
                        bulkCopy.ColumnMappings.Add(m7);
                        bulkCopy.ColumnMappings.Add(m8);
                        bulkCopy.ColumnMappings.Add(m9);
                        bulkCopy.ColumnMappings.Add(m10);
                        bulkCopy.ColumnMappings.Add(m11);
                        bulkCopy.ColumnMappings.Add(m12);
                        bulkCopy.ColumnMappings.Add(m13);
                        bulkCopy.ColumnMappings.Add(m14);
                        bulkCopy.ColumnMappings.Add(m15);
                        bulkCopy.ColumnMappings.Add(m16);
                        bulkCopy.ColumnMappings.Add(m17);

                        try
                        {
                            if (dr != null)
                                bulkCopy.WriteToServer(dr);

                            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Classes Imported Successfully.');", true);
                        }
                        catch (Exception ex)
                        {
                            AppUtilities.LogError(ex);
                            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('" + ex + "');", true);
                        }
                    }
                }
            }
        }

        public void ImportCourses()
        {
            var filePath = Server.MapPath("~/cms/uploads/Courses.xlsx");

            /* Remove Existing Data */
            var connectionString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(connectionString);
            con.Open();

            const string strQuery = "DELETE FROM tblCourse_Import";
            var cmd = new SqlCommand(strQuery, con);
            cmd.ExecuteNonQuery();

            /* Retreive Excel Data */
            //var excelConnString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={filePath};Extended Properties=Excel 8.0";

            using (var connection = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filePath + ";" + "Extended Properties='Excel 12.0 Xml;HDR=YES; IMEX=1;'"))
            {
                var command = new OleDbCommand("SELECT * FROM [Sheet1$]", connection);
                connection.Open();

                using (DbDataReader dr = command.ExecuteReader())
                {
                    var sqlConnString = AppConfiguration.DbConnectionString;
                    using (var bulkCopy = new SqlBulkCopy(sqlConnString))
                    {
                        bulkCopy.DestinationTableName = "tblCourse_Import";
                        bulkCopy.BulkCopyTimeout = 9000000;

                        var m1 = new SqlBulkCopyColumnMapping("courseId", "courseId");
                        var m2 = new SqlBulkCopyColumnMapping("courseName", "courseName");
                        var m3 = new SqlBulkCopyColumnMapping("seoCourseName", "seoCourseName");
                        var m4 = new SqlBulkCopyColumnMapping("duration", "duration");
                        var m5 = new SqlBulkCopyColumnMapping("cat4CityPage", "cat4CityPage");
                        var m6 = new SqlBulkCopyColumnMapping("cat1", "cat1");
                        var m7 = new SqlBulkCopyColumnMapping("cat2", "cat2");
                        var m8 = new SqlBulkCopyColumnMapping("cat3", "cat3");
                        var m9 = new SqlBulkCopyColumnMapping("courseShortDescription", "courseShortDescription");
                        var m10 = new SqlBulkCopyColumnMapping("catalogLongDescription", "courseLongDescription");
                        var m11 = new SqlBulkCopyColumnMapping("courseDescription", "courseDescription");
                        var m12 = new SqlBulkCopyColumnMapping("courseObjectives", "courseObjectives");
                        var m13 = new SqlBulkCopyColumnMapping("coursePrerequisites", "coursePrerequisites");
                        var m14 = new SqlBulkCopyColumnMapping("courseOutline", "courseOutline");
                        var m15 = new SqlBulkCopyColumnMapping("courseDetail", "courseDetail");
                        var m16 = new SqlBulkCopyColumnMapping("courseSoftwareYear", "courseSoftwareYear");
                        var m17 = new SqlBulkCopyColumnMapping("courseSoftwareOrder", "courseSoftwareOrder");
                        var m18 = new SqlBulkCopyColumnMapping("price", "price");
                        var m19 = new SqlBulkCopyColumnMapping("metaKeywords", "metaKeywords");
                        var m20 = new SqlBulkCopyColumnMapping("metaDescription", "metaDescription");
                        var m21 = new SqlBulkCopyColumnMapping("metaTitle", "metaTitle");
                        var m22 = new SqlBulkCopyColumnMapping("metaLocation", "metaLocation");
                        var m23 = new SqlBulkCopyColumnMapping("level1", "level1");
                        var m24 = new SqlBulkCopyColumnMapping("catalogShortDescription", "catalogShortDescription");
                        var m25 = new SqlBulkCopyColumnMapping("catalogBrand", "catalogBrand");
                        var m26 = new SqlBulkCopyColumnMapping("catalogTopic", "catalogTopic");
                        var m27 = new SqlBulkCopyColumnMapping("catalogBrandLink", "catalogBrandLink");
                        var m28 = new SqlBulkCopyColumnMapping("brandDescription", "brandDescription");
                        var m29 = new SqlBulkCopyColumnMapping("TopicDescription", "topicDescription");
                        var m30 = new SqlBulkCopyColumnMapping("courseSubtitle", "courseSubtitle");
                        var m31 = new SqlBulkCopyColumnMapping("relatedCertifications", "relatedCertifications");
                        var m32 = new SqlBulkCopyColumnMapping("relatedCourses", "relatedCourses");
                        var m33 = new SqlBulkCopyColumnMapping("nextLevel", "nextLevel");
                        var m34 = new SqlBulkCopyColumnMapping("metaDescriptionTopic", "metaDescriptionTopic");
                        var m35 = new SqlBulkCopyColumnMapping("metaDescriptionBrand", "metaDescriptionBrand");
                        var m36 = new SqlBulkCopyColumnMapping("metaTitleTopic", "metaTitleTopic");
                        var m37 = new SqlBulkCopyColumnMapping("metaTitleBrand", "metaTitleBrand");
                        var m38 = new SqlBulkCopyColumnMapping("scheduleNotes", "scheduleNotes");

                        bulkCopy.ColumnMappings.Add(m1);
                        bulkCopy.ColumnMappings.Add(m2);
                        bulkCopy.ColumnMappings.Add(m3);
                        bulkCopy.ColumnMappings.Add(m4);
                        bulkCopy.ColumnMappings.Add(m5);
                        bulkCopy.ColumnMappings.Add(m6);
                        bulkCopy.ColumnMappings.Add(m7);
                        bulkCopy.ColumnMappings.Add(m8);
                        bulkCopy.ColumnMappings.Add(m9);
                        bulkCopy.ColumnMappings.Add(m10);
                        bulkCopy.ColumnMappings.Add(m11);
                        bulkCopy.ColumnMappings.Add(m12);
                        bulkCopy.ColumnMappings.Add(m13);
                        bulkCopy.ColumnMappings.Add(m14);
                        bulkCopy.ColumnMappings.Add(m15);
                        bulkCopy.ColumnMappings.Add(m16);
                        bulkCopy.ColumnMappings.Add(m17);
                        bulkCopy.ColumnMappings.Add(m18);
                        bulkCopy.ColumnMappings.Add(m19);
                        bulkCopy.ColumnMappings.Add(m20);
                        bulkCopy.ColumnMappings.Add(m21);
                        bulkCopy.ColumnMappings.Add(m22);
                        bulkCopy.ColumnMappings.Add(m23);
                        bulkCopy.ColumnMappings.Add(m24);
                        bulkCopy.ColumnMappings.Add(m25);
                        bulkCopy.ColumnMappings.Add(m26);
                        bulkCopy.ColumnMappings.Add(m27);
                        bulkCopy.ColumnMappings.Add(m28);
                        bulkCopy.ColumnMappings.Add(m29);
                        bulkCopy.ColumnMappings.Add(m30);
                        bulkCopy.ColumnMappings.Add(m31);
                        bulkCopy.ColumnMappings.Add(m32);
                        bulkCopy.ColumnMappings.Add(m33);
                        bulkCopy.ColumnMappings.Add(m34);
                        bulkCopy.ColumnMappings.Add(m35);
                        bulkCopy.ColumnMappings.Add(m36);
                        bulkCopy.ColumnMappings.Add(m37);
                        bulkCopy.ColumnMappings.Add(m38);

                        try
                        {
                            if (dr != null)
                                bulkCopy.WriteToServer(dr);

                            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Courses Imported Successfully.');", true);
                        }
                        catch (Exception ex)
                        {
                            AppUtilities.LogError(ex);
                            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('" + ex + "');", true);
                        }

                    }
                }
            }
        }

        private void ImportLocations()
        {
            var filePath = Server.MapPath("~/cms/uploads/Locations.xlsx");

            /* Remove Existing Data */
            var connectionString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(connectionString);
            con.Open();

            const string strQuery = "DELETE FROM tblLocation_Import";
            var cmd = new SqlCommand(strQuery, con);
            cmd.ExecuteNonQuery();

            /* Retreive Excel Data */
            //var excelConnString = string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source={0};Excel 8.0;HDR=YES;", filePath);

            using (var connection = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filePath + ";" + "Extended Properties='Excel 12.0 Xml;HDR=YES; IMEX=1;'"))
            //using (var connection = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filePath + ";" + "Extended Properties='Excel 8.0;HDR=YES; IMEX=1;'"))
            {
                var command = new OleDbCommand("SELECT * FROM [Sheet1$]", connection);
                connection.Open();

                using (DbDataReader dr = command.ExecuteReader())
                {
                    var sqlConnString = AppConfiguration.DbConnectionString;
                    using (var bulkCopy = new SqlBulkCopy(sqlConnString))
                    {
                        bulkCopy.DestinationTableName = "tblLocation_Import";
                        //bulkCopy.BulkCopyTimeout = 9000000;
                        bulkCopy.BulkCopyTimeout = 0;
                        var m1 = new SqlBulkCopyColumnMapping("venueId", "venueId");
                        var m2 = new SqlBulkCopyColumnMapping("venueName", "venueName");
                        var m3 = new SqlBulkCopyColumnMapping("address1", "address1");
                        var m18 = new SqlBulkCopyColumnMapping("mapLink", "mapLink");
                        var m19 = new SqlBulkCopyColumnMapping("mapEmbed", "mapEmbed");
                        var m4 = new SqlBulkCopyColumnMapping("address2", "address2");
                        var m5 = new SqlBulkCopyColumnMapping("city", "city");
                        var m6 = new SqlBulkCopyColumnMapping("seoCity", "seoCity");
                        var m7 = new SqlBulkCopyColumnMapping("state", "state");
                        var m8 = new SqlBulkCopyColumnMapping("stateName", "stateName");
                        var m9 = new SqlBulkCopyColumnMapping("zip", "zip");
                        var m10 = new SqlBulkCopyColumnMapping("venuePhone", "venuePhone");
                        var m11 = new SqlBulkCopyColumnMapping("contactName", "contactName");
                        var m12 = new SqlBulkCopyColumnMapping("contactPhone", "contactPhone");
                        var m13 = new SqlBulkCopyColumnMapping("eventLocation", "eventLocation");
                        var m14 = new SqlBulkCopyColumnMapping("classLocation", "classLocation");
                        var m15 = new SqlBulkCopyColumnMapping("closestCity", "closestCity");
                        var m16 = new SqlBulkCopyColumnMapping("closestState", "closestState");
                        var m17 = new SqlBulkCopyColumnMapping("contactEmail", "contactEmail");
                        

                        bulkCopy.ColumnMappings.Add(m1);
                        bulkCopy.ColumnMappings.Add(m2);
                        bulkCopy.ColumnMappings.Add(m3);
                        bulkCopy.ColumnMappings.Add(m18);
                        bulkCopy.ColumnMappings.Add(m19);
                        bulkCopy.ColumnMappings.Add(m4);
                        bulkCopy.ColumnMappings.Add(m5);
                        bulkCopy.ColumnMappings.Add(m6);
                        bulkCopy.ColumnMappings.Add(m7);
                        bulkCopy.ColumnMappings.Add(m8);
                        bulkCopy.ColumnMappings.Add(m9);
                        bulkCopy.ColumnMappings.Add(m10);
                        bulkCopy.ColumnMappings.Add(m11);
                        bulkCopy.ColumnMappings.Add(m12);
                        bulkCopy.ColumnMappings.Add(m13);
                        bulkCopy.ColumnMappings.Add(m14);
                        bulkCopy.ColumnMappings.Add(m15);
                        bulkCopy.ColumnMappings.Add(m16);
                        bulkCopy.ColumnMappings.Add(m17);
                        

                        try
                        {
                            if (dr != null)
                                bulkCopy.WriteToServer(dr);

                            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Locations Imported Successfully.');", true);
                        }
                        catch (Exception ex)
                        {
                            AppUtilities.LogError(ex);
                            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('" + ex + "');", true);
                        }
                    }
                }
            }
        }

        private void ImportCityPages()
        {
            var filePath = Server.MapPath("~/cms/uploads/CityPages.xlsx");

            /* Remove Existing Data */
            var connectionString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(connectionString);
            con.Open();

            const string strQuery = "DELETE FROM tblCityPage_Import";
            var cmd = new SqlCommand(strQuery, con);
            cmd.ExecuteNonQuery();

            /* Retreive Excel Data */
            //var excelConnString = string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source={0};Excel 8.0;HDR=YES;", filePath);

            using (var connection = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filePath + ";" + "Extended Properties='Excel 12.0 Xml;HDR=YES; IMEX=1;'"))
            {
                var command = new OleDbCommand("SELECT distinct * FROM [Sheet1$]", connection);
                connection.Open();

                using (DbDataReader dr = command.ExecuteReader())
                {
                    var sqlConnString = AppConfiguration.DbConnectionString;
                    using (var bulkCopy = new SqlBulkCopy(sqlConnString))
                    {
                        bulkCopy.DestinationTableName = "tblCityPage_Import";
                        //bulkCopy.BulkCopyTimeout = 9000000;
                        bulkCopy.BulkCopyTimeout = 0;

                        var m1 = new SqlBulkCopyColumnMapping("courseName", "courseName");
                        var m2 = new SqlBulkCopyColumnMapping("courseSeoPageName", "courseSeoPageName");
                        var m3 = new SqlBulkCopyColumnMapping("courseCategory", "courseCategory");
                        var m4 = new SqlBulkCopyColumnMapping("courseState", "courseState");
                        var m5 = new SqlBulkCopyColumnMapping("courseCity", "courseCity");
                        var m6 = new SqlBulkCopyColumnMapping("courseSeoCity", "courseSeoCity");
                        var m7 = new SqlBulkCopyColumnMapping("courseShortDescription", "courseShortDescription");
                        var m8 = new SqlBulkCopyColumnMapping("courseLongDescription", "courseLongDescription");
                        var m9 = new SqlBulkCopyColumnMapping("courseImage", "courseImage");
                        var m10 = new SqlBulkCopyColumnMapping("coursesAvailable", "coursesAvailable");
                        var m11 = new SqlBulkCopyColumnMapping("courseOrder", "courseOrder");
                        var m12 = new SqlBulkCopyColumnMapping("seoTitle", "seoTitle");
                        var m13 = new SqlBulkCopyColumnMapping("seoDescription", "seoDescription");
                        var m14 = new SqlBulkCopyColumnMapping("seoKeywords", "seoKeywords");
                        var m15 = new SqlBulkCopyColumnMapping("seoCourseName", "seoCourseName");

                        bulkCopy.ColumnMappings.Add(m1);
                        bulkCopy.ColumnMappings.Add(m15);
                        bulkCopy.ColumnMappings.Add(m2);
                        bulkCopy.ColumnMappings.Add(m3);
                        bulkCopy.ColumnMappings.Add(m4);
                        bulkCopy.ColumnMappings.Add(m5);
                        bulkCopy.ColumnMappings.Add(m6);
                        bulkCopy.ColumnMappings.Add(m7);
                        bulkCopy.ColumnMappings.Add(m8);
                        bulkCopy.ColumnMappings.Add(m9);
                        bulkCopy.ColumnMappings.Add(m10);
                        bulkCopy.ColumnMappings.Add(m11);
                        bulkCopy.ColumnMappings.Add(m12);
                        bulkCopy.ColumnMappings.Add(m13);
                        bulkCopy.ColumnMappings.Add(m14);

                        try
                        {
                            if (dr != null)
                                bulkCopy.WriteToServer(dr);

                            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('City Pages Imported Successfully.');", true);
                        }
                        catch (Exception ex)
                        {
                            AppUtilities.LogError(ex);
                            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('" + ex.Message + "');", true);
                        }
                    }
                }
            }
        }

        private void ImportImageCategories()
        {
            var filePath = Server.MapPath("~/cms/uploads/ImageCategories.xlsx");

            /* Remove Existing Data */
            var connectionString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(connectionString);
            con.Open();

            const string strQuery = "DELETE FROM tblCourse_ImagesStaging";
            var cmd = new SqlCommand(strQuery, con);
            cmd.ExecuteNonQuery();

            /* Retreive Excel Data */
            //var excelConnString = string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source={0};Excel 8.0;HDR=YES;", filePath);

            using (var connection = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filePath + ";" + "Extended Properties='Excel 12.0 Xml;HDR=YES; IMEX=1;'"))
            {
                var command = new OleDbCommand("SELECT * FROM [Sheet1$]", connection);
                connection.Open();

                using (DbDataReader dr = command.ExecuteReader())
                {
                    var sqlConnString = AppConfiguration.DbConnectionString;
                    using (var bulkCopy = new SqlBulkCopy(sqlConnString))
                    {
                        bulkCopy.DestinationTableName = "tblCourse_ImagesStaging";
                        //bulkCopy.BulkCopyTimeout = 9000000;
                        bulkCopy.BulkCopyTimeout = 0;

                        var m1 = new SqlBulkCopyColumnMapping("cat2", "cat2");

                        bulkCopy.ColumnMappings.Add(m1);

                        try
                        {
                            if (dr != null)
                                bulkCopy.WriteToServer(dr);

                            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('City Pages Imported Successfully.');", true);
                        }
                        catch (Exception ex)
                        {
                            AppUtilities.LogError(ex);
                            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('" + ex + "');", true);
                        }
                    }
                }
            }
        }

        private void ImportRedirectUrls()
        {
            var filePath = Server.MapPath("~/cms/uploads/RedirectUrls.xlsx");

            /* Remove Existing Data */
            var connectionString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(connectionString);
            con.Open();

            const string strQuery = "DELETE FROM tblUrlRedirection";
            var cmd = new SqlCommand(strQuery, con);
            cmd.ExecuteNonQuery();

            /* Retreive Excel Data */
            //var excelConnString = string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source={0};Excel 8.0;HDR=YES;", filePath);

            using (var connection = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filePath + ";" + "Extended Properties='Excel 12.0 Xml;HDR=YES; IMEX=1'"))
            {
                var command = new OleDbCommand("SELECT * FROM [Sheet1$]", connection);
                connection.Open();

                using (DbDataReader dr = command.ExecuteReader())
                {
                    var sqlConnString = AppConfiguration.DbConnectionString;
                    using (var bulkCopy = new SqlBulkCopy(sqlConnString))
                    {
                        bulkCopy.DestinationTableName = "tblUrlRedirection";
                        //bulkCopy.BulkCopyTimeout = 9000000;
                        bulkCopy.BulkCopyTimeout = 0;

                        var m1 = new SqlBulkCopyColumnMapping("previousUrl", "previousUrl");
                        var m2 = new SqlBulkCopyColumnMapping("newUrl", "newUrl");


                        bulkCopy.ColumnMappings.Add(m1);
                        bulkCopy.ColumnMappings.Add(m2);

                        try
                        {
                            if (dr != null)
                                bulkCopy.WriteToServer(dr);

                            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Redirect Urls Imported Successfully.');", true);
                        }
                        catch (Exception ex)
                        {
                            AppUtilities.LogError(ex);
                            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('" + ex + "');", true);
                        }
                    }
                }
            }
        }

        protected void ctlImportClasses_OnClick(object sender, EventArgs e)
        {
            ImportClasses();
        }

        protected void ctlPrepareCityCourses_OnClick(object sender,EventArgs e)
        {
            ContentCourses.DeleteCityCoursesData();
            var result = ContentCourses.GetAllCities();
            foreach (DataRow row in result.Rows)
            {
                var city = row["city"].ToString();
                ContentCourses.InsertCityCoursesData(city);
            }
            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('City Courses Updated Successfully.');", true);
        }

        protected void ctlBrand_OnClick(object sender,EventArgs e)
        {
            ContentCourses.DeleteFromTempBrand();
            var brands = ContentAdditional.GetMainTechnicalCoursesCatalogBrands("Technical Courses");
            foreach (DataRow item in brands.Rows)
            {
                var catalogBrand = item["catalogBrand"].ToString();
                ContentCourses.InsertIntoTempBrand(catalogBrand, "technical courses");
            }
            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Brand Pages Updated Successfully.');", true);
        }

        protected void ctlTopic_OnClick(object sender, EventArgs e)
        {
            ContentCourses.DeleteFromTempTopic();
            var topics = ContentAdditional.GetMainTechnicalCoursesCatalogTopic("Professional Development Skills");
            foreach (DataRow topic in topics.Rows)
            {
                var catalogTopic = topic["catalogTopic"].ToString();
                ContentCourses.InsertIntoTempTopic(catalogTopic, "Professional Development Skills");
            }

            var topics2 = ContentAdditional.GetMainTechnicalCoursesCatalogTopic("Desktop Applications");
            foreach (DataRow topic in topics2.Rows)
            {
                var catalogTopic = topic["catalogTopic"].ToString();
                ContentCourses.InsertIntoTempTopic(catalogTopic, "Desktop Applications");
            }

            var topics3 = ContentAdditional.GetMainTechnicalCoursesCatalogTopic("Technical Courses");
            foreach (DataRow topic in topics3.Rows)
            {
                var catalogTopic = topic["catalogTopic"].ToString();
                ContentCourses.InsertIntoTempTopic(catalogTopic, "Technical Courses");
            }
            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Topic Pages Updated Successfully.');", true);
        }

        protected void ctlNationalLocations_OnClick(object sender,EventArgs e)
        {
            ContentCourses.DeleteNationalLocationData();
            var result = ContentLocations.GetLocationStatesByState();
            foreach (DataRow row in result.Rows)
            {
                var state = row["stateName"].ToString();
                ContentCourses.InsertNationalLocationData(state);
            }
            ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('National Locations Updated Successfully.');", true);
        }

        protected void ctlImportCourses_OnClick(object sender, EventArgs e)
        {
            ImportCourses();
        }

        protected void ctlImportLocations_OnClick(object sender, EventArgs e)
        {
            ImportLocations();
        }

        protected void ctlImportCityPages_Click(object sender, EventArgs e)
        {
            ImportCityPages();
        }

        protected void ctlImportImageCategories_OnClick(object sender, EventArgs e)
        {
            ImportImageCategories();
        }

        protected void ctlImportUrls_OnClick(object sender, EventArgs e)
        {
            ImportRedirectUrls();
        }

    }
}
