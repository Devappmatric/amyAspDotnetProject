using System.Data;
using System.Data.SqlClient;
using ProductivityPointGlobal.courses;

namespace ProductivityPointGlobal
{
    public class ContentAdditional
    {
        public static DataTable GetPartners()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var conn = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spGetPartners", conn) { CommandType = CommandType.StoredProcedure };

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }
        public static DataTable GetHomePageLinksCol1()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spCMSHomePageLinksCol1", con) { CommandType = CommandType.StoredProcedure };

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }
        public static DataTable GetHomePageLinksCol2()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spCMSHomePageLinksCol2", con) { CommandType = CommandType.StoredProcedure };

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetHomePageLinksCol3()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spCMSHomePageLinksCol3", con) { CommandType = CommandType.StoredProcedure };

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetMainTechnicalCourses(string category)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spGetCoursesFromCategory", con) {CommandType = CommandType.StoredProcedure};

            cmd.Parameters.AddWithValue("@category", category); ;

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetMainTechnicalCoursesCatalogBrands(string category)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spGetCoursesTechnologyBrandFromCategory", con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@category", category); ;

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetMainTechnicalCoursesCatalogTopic(string category)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spGetCoursesTechnologyTopicFromCategory", con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@category", category); ;

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }
    }
}