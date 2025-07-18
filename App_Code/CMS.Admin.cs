using System;
using System.Data;
using System.Data.SqlClient;

namespace ProductivityPointGlobal
{
    public class CmsAdmin
    {
        public static DataTable AdminAuthenticate(string username, string password)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("spAdminAuthentication");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password);

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable RetrievePages()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("spAdminPages");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable RetrievePageById(int id)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("AdminPageById");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@id", id);

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetCourseSeo(string courseId)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("AdminCourseSeo");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@seoCourseName", courseId);

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetBrandSeo(string brandName)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("AdminBrandSeo");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@brandName", brandName);

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetTopicSeo(string topicName)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("AdminTopicSeo");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@topicName", topicName);

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }
        //public static DataTable GetCourseSeoById(string courseId)
        //{
        //    var strConnString = AppConfiguration.DbConnectionString;
        //    var con = new SqlConnection(strConnString);

        //    const string sp = ("GetCourseSeoById");
        //    var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

        //    cmd.Parameters.AddWithValue("@courseId", courseId);

        //    var table = AppDal.ExecuteSelectCommand(cmd);
        //    return table;
        //}

        public static DataTable GetCourseSeoById(string courseId, string seoCity)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("GetCourseSeoById");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@courseId", courseId);
            cmd.Parameters.AddWithValue("@seoCity", seoCity);

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static bool UpdateSeo(int id, string pageTitle, string metaDescription, string metaKeywords)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("AdminUpdateSEO");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.Add("@id", SqlDbType.Int, -1).Value = id;
            cmd.Parameters.Add("@pageTitle", SqlDbType.NVarChar, -1).Value = pageTitle;
            cmd.Parameters.Add("@metaDescription", SqlDbType.NVarChar, -1).Value = metaDescription;
            cmd.Parameters.Add("@metaKeywords", SqlDbType.NVarChar, -1).Value = metaKeywords;

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }

        public static bool UpdatePartner(string id, string name, string description, string logo)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("AdminUpdatePartner");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.Add("@id", SqlDbType.Int, -1).Value = id;
            cmd.Parameters.Add("@name", SqlDbType.NVarChar, -1).Value = name;
            cmd.Parameters.Add("@description", SqlDbType.NVarChar, -1).Value = description;
            cmd.Parameters.Add("@logo", SqlDbType.NVarChar, -1).Value = logo;

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }

        public static bool UpdatePartnerNoLogo(string id, string name, string description, string logo)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("AdminUpdatePartner");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.Add("@id", SqlDbType.Int, -1).Value = id;
            cmd.Parameters.Add("@name", SqlDbType.NVarChar, -1).Value = name;
            cmd.Parameters.Add("@description", SqlDbType.NVarChar, -1).Value = description;
            cmd.Parameters.Add("@logo", SqlDbType.NVarChar, -1).Value = DBNull.Value;

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }

        public static bool UpdateCourseLogo(string id, string image)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("AdminUpdateCourseImage");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.Add("@id", SqlDbType.Int, -1).Value = id;
            cmd.Parameters.Add("@img_url", SqlDbType.NVarChar, -1).Value = image;

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }

        public static bool AddPartner(string name, string description, string logo)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("AdminAddPartner");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.Add("@name", SqlDbType.NVarChar, -1).Value = name;
            cmd.Parameters.Add("@description", SqlDbType.NVarChar, -1).Value = description;
            cmd.Parameters.Add("@logo", SqlDbType.NVarChar, -1).Value = logo;

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }

        public static bool AddCompany(string companyName, string couponCode, int couponDiscount, bool couponEnabled)
        {
            var conn = new SqlConnection(AppConfiguration.DbConnectionString);
            var cmd = new SqlCommand("AdminAddCompany", conn) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@CompanyName", companyName);
            cmd.Parameters.AddWithValue("@CouponCode", couponCode);
            cmd.Parameters.AddWithValue("@CouponDiscount", couponDiscount);
            cmd.Parameters.AddWithValue("@CouponEnabled", couponDiscount);

            try
            {
                return AppDal.ExecuteNonQuery(cmd) != -1;
            }
            catch
            {
                return false;
            }
        }

        public static bool AddPageTemplate(string pageId, string companyName, string couponCode, string couponCode2, string textField1, string textField2, string textField3, string textField4)
        {
            var conn = new SqlConnection(AppConfiguration.DbConnectionString);
            var cmd = new SqlCommand("AdminAddPageTemplate", conn) { CommandType = CommandType.StoredProcedure };
            
            cmd.Parameters.AddWithValue("@PageId", pageId);
            cmd.Parameters.AddWithValue("@CompanyName", companyName);
            cmd.Parameters.AddWithValue("@CouponCode", couponCode);
            cmd.Parameters.AddWithValue("@CouponCode2", couponCode2);
            cmd.Parameters.AddWithValue("@TextField1", textField1);
            cmd.Parameters.AddWithValue("@TextField2", textField2);
            cmd.Parameters.AddWithValue("@TextField3", textField3);
            cmd.Parameters.AddWithValue("@TextField4", textField4);

            try
            {
                return AppDal.ExecuteNonQuery(cmd) != -1;
            }
            catch
            {
                return false;
            }
        }

        public static bool UpdateCompany(string id, string companyName, string couponCode, int couponDiscount, bool couponEnabled)
        {
            var conn = new SqlConnection(AppConfiguration.DbConnectionString);
            var cmd = new SqlCommand("AdminUpdateCompany", conn) { CommandType = CommandType.StoredProcedure };
            
            cmd.Parameters.AddWithValue("@Id", id);
            cmd.Parameters.AddWithValue("@CompanyName", companyName);
            cmd.Parameters.AddWithValue("@CouponCode", couponCode);
            cmd.Parameters.AddWithValue("@CouponDiscount", couponDiscount);
            cmd.Parameters.AddWithValue("@CouponEnabled", couponEnabled);

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }

        public static bool UpdatePageTemplate(int id, string companyName, string couponCode, string couponCode2, string textField1, string textField2, string textField3, string textField4)
        {
            var conn = new SqlConnection(AppConfiguration.DbConnectionString);
            var cmd = new SqlCommand("AdminUpdatePageTemplate", conn) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@Id", id);
            cmd.Parameters.AddWithValue("@CompanyName", companyName);
            cmd.Parameters.AddWithValue("@CouponCode", couponCode);
            cmd.Parameters.AddWithValue("@CouponCode2", couponCode2);
            cmd.Parameters.AddWithValue("@TextField1", textField1);
            cmd.Parameters.AddWithValue("@TextField2", textField2);
            cmd.Parameters.AddWithValue("@TextField3", textField3);
            cmd.Parameters.AddWithValue("@TextField4", textField4);

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }

        public static bool DeleteCompany(string id)
        {
            var conn = new SqlConnection(AppConfiguration.DbConnectionString);
            var cmd = new SqlCommand("AdminDeleteCompany", conn) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@Id", id);

            try
            {
                return AppDal.ExecuteNonQuery(cmd) != -1;
            }
            catch
            {
                return false;
            }
        }

        public static bool DeletePageTemplate(string id)
        {
            var conn = new SqlConnection(AppConfiguration.DbConnectionString);
            var cmd = new SqlCommand("AdminDeletePageTemplate", conn) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@Id", id);

            try
            {
                return AppDal.ExecuteNonQuery(cmd) != -1;
            }
            catch
            {
                return false;
            }
        }

        public static DataTable GetCourseImages()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spCMSCourseImages", con) { CommandType = CommandType.StoredProcedure };

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetCatalogs()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("cms_catalog_select", con) { CommandType = CommandType.StoredProcedure };

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetBrands()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("cms_brand_select", con) { CommandType = CommandType.StoredProcedure };

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetPageNames()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("cms_pagename_select", con) { CommandType = CommandType.StoredProcedure };

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetCatalogImages()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("cms_catalog_images_select", con) { CommandType = CommandType.StoredProcedure };

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetBrandImages()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("cms_brand_images_select", con) { CommandType = CommandType.StoredProcedure };

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetPageImages()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("cms_page_images_select", con) { CommandType = CommandType.StoredProcedure };

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetCatalogImage(string id = "", string catalog_name = "")
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("cms_catalog_images_select", con) { CommandType = CommandType.StoredProcedure };

            if (id != "")
            {
                cmd.Parameters.AddWithValue("id", id);
            }
            
            if (catalog_name != "")
            {
                cmd.Parameters.AddWithValue("catalog_name", catalog_name);
            }
            
            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetBrandImage(string id = "", string brand_name = "")
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("cms_brand_images_select", con) { CommandType = CommandType.StoredProcedure };

            if (id != "")
            {
                cmd.Parameters.AddWithValue("id", id);
            }

            if (brand_name != "")
            {
                cmd.Parameters.AddWithValue("brand_name", brand_name);
            }

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetPageImage(string id = "", string page_name = "")
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("cms_page_images_select", con) { CommandType = CommandType.StoredProcedure };

            if (id != "")
            {
                cmd.Parameters.AddWithValue("id", id);
            }

            if (page_name != "")
            {
                cmd.Parameters.AddWithValue("page_name", page_name);
            }

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetBannarImage(string id = "", string page_name = "")
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("cms_page_images_select", con) { CommandType = CommandType.StoredProcedure };

            if (id != "")
            {
                cmd.Parameters.AddWithValue("id", id);
            }

            if (page_name != "")
            {
                cmd.Parameters.AddWithValue("page_name", page_name);
            }

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static void UpsertCatalogImage(string id, string catalog_name, bool course_sw, string img_path)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            if(id == "0"){
                var cmd = new SqlCommand("cms_catalog_images_insert", con) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.AddWithValue("catalog_name", catalog_name);
                cmd.Parameters.AddWithValue("course_sw", course_sw);
                cmd.Parameters.AddWithValue("img_path", img_path);

                AppDal.ExecuteNonQuery(cmd);
            }
            else
            {
                var cmd = new SqlCommand("cms_catalog_images_update", con) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.AddWithValue("id", id);
                cmd.Parameters.AddWithValue("catalog_name", catalog_name);
                cmd.Parameters.AddWithValue("course_sw", course_sw);
                cmd.Parameters.AddWithValue("img_path", img_path);

                AppDal.ExecuteNonQuery(cmd);
            }
            
        }

        public static void UpsertBrandImage(string id, string brand_name, bool course_sw, string img_path)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            if (id == "0")
            {
                var cmd = new SqlCommand("cms_brand_images_insert", con) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.AddWithValue("brand_name", brand_name);
                cmd.Parameters.AddWithValue("course_sw", course_sw);
                cmd.Parameters.AddWithValue("img_path", img_path);

                AppDal.ExecuteNonQuery(cmd);
            }
            else
            {
                var cmd = new SqlCommand("cms_brand_images_update", con) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.AddWithValue("id", id);
                cmd.Parameters.AddWithValue("brand_name", brand_name);
                cmd.Parameters.AddWithValue("course_sw", course_sw);
                cmd.Parameters.AddWithValue("img_path", img_path);

                AppDal.ExecuteNonQuery(cmd);
            }

        }

        public static void UpsertPageImage(string id, string page_name, string img_path)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            if (id == "0")
            {
                var cmd = new SqlCommand("cms_page_images_insert", con) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.AddWithValue("page_name", page_name);
                cmd.Parameters.AddWithValue("img_path", img_path);

                AppDal.ExecuteNonQuery(cmd);
            }
            else
            {
                var cmd = new SqlCommand("cms_page_images_update", con) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.AddWithValue("id", id);
                cmd.Parameters.AddWithValue("page_name", page_name);
                cmd.Parameters.AddWithValue("img_path", img_path);

                AppDal.ExecuteNonQuery(cmd);
            }

        }

        public static void DeleteCatalogImage(string id)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("cms_catalog_images_delete", con) { CommandType = CommandType.StoredProcedure };
            cmd.Parameters.AddWithValue("id", id);

            AppDal.ExecuteNonQuery(cmd);
        }

        public static void DeleteBrandImage(string id)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("cms_brand_images_delete", con) { CommandType = CommandType.StoredProcedure };
            cmd.Parameters.AddWithValue("id", id);

            AppDal.ExecuteNonQuery(cmd);
        }

        public static void DeletePageImage(string id)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("cms_page_images_delete", con) { CommandType = CommandType.StoredProcedure };
            cmd.Parameters.AddWithValue("id", id);

            AppDal.ExecuteNonQuery(cmd);
        }

        public static DataTable GetAllCityPageCourses()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("GetAllCityPageCourses");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetCityPageCoursesByState(string state, string city)
        {
            var sqlCommand = new SqlCommand("GetCityPageCoursesByState", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@state", state);
            sqlCommand1.Parameters.AddWithValue("@city", city);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static int AddCityPage(string seoPageName, string course, string state, string city, string description, string courseDescription, string image, string seoTitle, string seoDescription, string seoKeywords)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("AdminAddCityPage");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.Add("@seoPageName", SqlDbType.NVarChar, -1).Value = seoPageName;
            cmd.Parameters.Add("@course", SqlDbType.NVarChar, -1).Value = course;
            cmd.Parameters.Add("@state", SqlDbType.NVarChar, -1).Value = state;
            cmd.Parameters.Add("@city", SqlDbType.NVarChar, -1).Value = city;
            cmd.Parameters.Add("@description", SqlDbType.NVarChar, -1).Value = description;
            cmd.Parameters.Add("@courseDescription", SqlDbType.NVarChar, -1).Value = courseDescription;
            cmd.Parameters.Add("@image", SqlDbType.NVarChar, -1).Value = image;
            cmd.Parameters.Add("@seoTitle", SqlDbType.NVarChar, -1).Value = seoTitle;
            cmd.Parameters.Add("@seoDescription", SqlDbType.NVarChar, -1).Value = seoDescription;
            cmd.Parameters.Add("@seoKeywords", SqlDbType.NVarChar, -1).Value = seoKeywords;

            try
            {
                return (AppDal.ExecuteScalar(cmd));
            }
            catch
            {
                const int value = 0;
                return value;
            }
        }

        public static bool AddCityPageCourse(string cityPageId, string courseHtml)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("AdminAddCityPageCourse");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.Add("@courseId", SqlDbType.Int, -1).Value = cityPageId;
            cmd.Parameters.Add("@courseHtml", SqlDbType.NVarChar, -1).Value = courseHtml;

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }

        public static DataTable GetMainCourseLinks(string category)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spCMSHomePageLinks", con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@category", category);

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static bool AddHomePageLink(string cat2, string category)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("AdminAddHomePageLink");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.Add("@cat2", SqlDbType.NVarChar, -1).Value = cat2;
            cmd.Parameters.Add("@category", SqlDbType.NVarChar, -1).Value = category;

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }

        public static bool UpdateHomePageLinks(int id, string cat2)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("AdminUpdateHomePageLinks");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.Add("@id", SqlDbType.Int, -1).Value = id;
            cmd.Parameters.Add("@cat2", SqlDbType.NVarChar, -1).Value = cat2;                        

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }

        public static bool RemoveHomePageLink(string rowId)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("AdminRemoveHomePageLink");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.Add("@id", SqlDbType.NVarChar, -1).Value = rowId;

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }

        public static bool InsertCourseImageCategory(string cat2)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("AdminInsertCourseImageCategory");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@cat2", cat2);

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }

        public static bool DeleteCourseImageCategory(int id)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("AdminDeleteCourseImageCategory");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@id", id);

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }

        public static DataTable GetPartnerImages()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spCMSPartnerImages", con) { CommandType = CommandType.StoredProcedure };

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetCompanies()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spGetCompanies", con) { CommandType = CommandType.StoredProcedure };

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetPageTemplates()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spGetPageTemplates", con) { CommandType = CommandType.StoredProcedure };

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        //public static DataTable GetPageTemplatesById(int id)
        //{
        //    var strConnString = AppConfiguration.DbConnectionString;
        //    var con = new SqlConnection(strConnString);

        //    var cmd = new SqlCommand("spGetPageTemplatesById", con) { CommandType = CommandType.StoredProcedure };

        //    cmd.Parameters.AddWithValue("@id", id);

        //    var table = AppDal.ExecuteSelectCommand(cmd);
        //    return table;
        //}

        public static DataTable GetPageTemplatesByPageId(string pageId)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spGetPageTemplatesByPageId", con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@PageId", pageId);

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static bool UpdatePartnerImage(int id, string image, string name, string description)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("AdminUpdatePartnerImage");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.Add("@id", SqlDbType.Int, -1).Value = id;
            cmd.Parameters.Add("@logo", SqlDbType.NVarChar, -1).Value = image;
            cmd.Parameters.Add("@name", SqlDbType.NVarChar, -1).Value = name;
            cmd.Parameters.Add("@description", SqlDbType.NVarChar, -1).Value = description;

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }

        public static bool RemovePartner(string rowId)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("AdminRemovePartner");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.Add("@id", SqlDbType.NVarChar, -1).Value = rowId;

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }
        public static DataTable GetPartners()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var conn = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spGetPartners", conn) { CommandType = CommandType.StoredProcedure };

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }
        public static DataTable GetLocationStatesByClass()
        {
            var sqlCommand = new SqlCommand("GetLocationStatesByClass", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            return AppDal.ExecuteSelectCommand(sqlCommand);
        }
        public static DataTable GetLocationByState2(string state)
        {
            var sqlCommand = new SqlCommand("GetLocationsByState2", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@stateName", state);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }
        public static DataTable GetLocationStatesByEvent()
        {
            var sqlCommand = new SqlCommand("GetLocationStatesByEvent", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            return AppDal.ExecuteSelectCommand(sqlCommand);
        }

        public static string GetPageRedirectionUrls(string requestUrl)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spGetUrlRedirections", con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@requestUrl", requestUrl);

            var table = AppDal.ExecuteSelectCommand(cmd);
            DataRow[] dr = table.Select();

            string newUrl = "";
            string previousUrl = "";

            foreach (DataRow row in dr)
            {
                previousUrl = row.Field<string>("previousUrl");
                newUrl = row.Field<string>("newUrl");
            }
            return newUrl;
        }
    }
}