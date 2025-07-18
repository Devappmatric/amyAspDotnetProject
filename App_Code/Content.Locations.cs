using System.Data;
using System.Data.SqlClient;

namespace ProductivityPointGlobal
{
    public class ContentLocations
    {
        public static DataTable GetLocationByCity(string city)
        {
            var sqlCommand = new SqlCommand("GetLocationsByCity", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@city", city);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable GetLocationByCityAndCourseName(string city, string courseName)
        {
            var sqlCommand = new SqlCommand("GetLocationsByCityAndCourseName", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@city", city);
            sqlCommand1.Parameters.AddWithValue("@courseName", courseName);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable GetLocationByState(string state)
        {
            var sqlCommand = new SqlCommand("GetLocationsByState", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@stateName", state);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
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

        public static DataTable GetCatalogByState(string state)
        {
            var sqlCommand = new SqlCommand("catalogByState", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@stateName", state);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable GetCityByState(string state)
        {
            var sqlCommand = new SqlCommand("cityByState", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@stateName", state);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable GetLocationByStateAndClassLocation(string id)
        {
            var sqlCommand = new SqlCommand("GetLocationsByStateAndClassLocation", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@stateName", id);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable GetLocationByStateId(string id)
        {
            var sqlCommand = new SqlCommand("GetLocationsByStateById", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@stateName", id);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable GetLocationByEventType(string id)
        {
            var sqlCommand = new SqlCommand("GetLocationsByEventType", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@stateName", id);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable GetLocationStates()
        {
            var sqlCommand = new SqlCommand("GetLocationStates", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            return AppDal.ExecuteSelectCommand(sqlCommand);
        }

        public static DataTable GetALLLocationsCityAndState()
        {
            var sqlCommand = new SqlCommand("GetALLLocationsCityAndState", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            return AppDal.ExecuteSelectCommand(sqlCommand);
        }

        public static DataTable GetLocationStatesByClass()
        {
            var sqlCommand = new SqlCommand("GetLocationStatesByClass", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            return AppDal.ExecuteSelectCommand(sqlCommand);
        }

        public static DataTable GetLocationStatesByState()
        {
            var sqlCommand = new SqlCommand("GetLocationStatesByState", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            return AppDal.ExecuteSelectCommand(sqlCommand);
        }

        public static DataTable GetLocationStatesByEvent()
        {
            var sqlCommand = new SqlCommand("GetLocationStatesByEvent", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            return AppDal.ExecuteSelectCommand(sqlCommand);
        }
    }
}