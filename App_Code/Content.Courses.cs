using System.Data;
using System.Data.SqlClient;

namespace ProductivityPointGlobal
{
    public class ContentCourses
    {
        public static DataTable AllCourses()
        {
            SqlCommand sqlCommand = new SqlCommand("spCoursesAll", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            return AppDal.ExecuteSelectCommand(sqlCommand);
        }

        public static DataTable CourseClassSchedule(string id)
        {
            SqlCommand sqlCommand = new SqlCommand("spCourseClassSchedule", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlCommand sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@seoCourseName", id);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable CourseClassSchedule2(string id, string location)
        {
            SqlCommand sqlCommand = new SqlCommand("spCourseClassScheduleById", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlCommand sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@courseId", id);
            sqlCommand1.Parameters.AddWithValue("@location", location);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }
        public static DataTable CourseClassScheduleNew(string id)
        {
            SqlCommand sqlCommand = new SqlCommand("spCourseClassScheduleNew", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlCommand sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@courseId", id);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable CourseClassScheduleNewById(string id)
        {
            SqlCommand sqlCommand = new SqlCommand("spCourseClassScheduleNewById", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlCommand sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@classId", id);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }



        public static DataTable CourseClassScheduleByCity(string seoCity, string courseId)
        {
            var sqlCommand = new SqlCommand("spCourseClassScheduleByCity", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@seoCity", seoCity);
            sqlCommand1.Parameters.AddWithValue("@courseId", courseId);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable CourseClassScheduleByLocation(string venueId)
        {
            SqlCommand sqlCommand = new SqlCommand("spCourseClassScheduleByLocation", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlCommand sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@venueId", venueId);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable CourseClassScheduleByVenue(string venueId, string seoCourseName)
        {
            SqlCommand sqlCommand = new SqlCommand("spCourseClassScheduleByVenue", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlCommand sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@venueId", venueId);
            sqlCommand1.Parameters.AddWithValue("@seoCourseName", seoCourseName);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable CourseClassScheduleUnique(string id)
        {
            SqlCommand sqlCommand = new SqlCommand("[spCourseClassScheduleUnique]", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlCommand sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@seoCourseName", id);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable CourseDescription(string id)
        {
            SqlCommand sqlCommand = new SqlCommand("spCourseDescription", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlCommand sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@seoCourseName", id);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable GetSEOCourseNameFromCourseName(string courseName)
        {
            SqlCommand sqlCommand = new SqlCommand("spGetSEOCourseNameFromCourseName", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlCommand sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@courseName", courseName);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable CourseDetails(string id)
        {
            SqlCommand sqlCommand = new SqlCommand("spCourseDetails", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlCommand sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@seoCourseName", id);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable CourseDetails2(string id)
        {
            var sqlCommand = new SqlCommand("spCourseDetailsById", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@courseId", id);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable CourseImage(string id)
        {
            SqlCommand sqlCommand = new SqlCommand("spCourseImage", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlCommand sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@seoCourseName", id);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable CourseImage2(string id)
        {
            SqlCommand sqlCommand = new SqlCommand("spCourseImageById", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlCommand sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@courseId", id);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable DesktopApplications()
        {
            SqlCommand sqlCommand = new SqlCommand("spCoursesDesktopApplications", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            return AppDal.ExecuteSelectCommand(sqlCommand);
        }

        public static DataTable FilterBy(string cat2)
        {
            SqlCommand sqlCommand = new SqlCommand("spCoursesFilterBy", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlCommand sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@cat2", cat2);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable FilterByMainCat(string cat1)
        {
            SqlCommand sqlCommand = new SqlCommand("spCoursesFilterByCategory", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlCommand sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@cat1", cat1);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable MainCourse()
        {
            SqlCommand sqlCommand = new SqlCommand("spCoursesAllDropdown", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            return AppDal.ExecuteSelectCommand(sqlCommand);
        }

        public static DataTable ProfessionalSkills()
        {
            SqlCommand sqlCommand = new SqlCommand("spCoursesProfessionalDevelopmentSkills", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            return AppDal.ExecuteSelectCommand(sqlCommand);
        }

        public static DataTable SearchCourses(string cat2)
        {
            SqlCommand sqlCommand = new SqlCommand("spSearchCourses", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlCommand sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@cat2", cat2);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable SearchCoursesHomeCat2(string cat2)
        {
            SqlCommand sqlCommand = new SqlCommand("spSearchCoursesHomeCat2", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlCommand sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@cat2", cat2);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable SearchCoursesHomeCat3(string cat3)
        {
            SqlCommand sqlCommand = new SqlCommand("spSearchCoursesHomeCat3", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlCommand sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@cat3", cat3);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable SearchResults(string keyword)
        {
            SqlCommand sqlCommand = new SqlCommand("sitesearch_s", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlCommand sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@keyword", keyword);
            sqlCommand1.Parameters.AddWithValue("@userIP", "");
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable ShowFilteredCourses(string cat3)
        {
            SqlCommand sqlCommand = new SqlCommand("spCoursesFiltered", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlCommand sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@cat3", cat3);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable ShowMainFilteredCourses(string cat1, string cat2)
        {
            var sqlCommand = new SqlCommand("spCoursesMainFiltered", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@cat1", cat1);
            sqlCommand1.Parameters.AddWithValue("@cat2", cat2);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable TechnicalCourses()
        {
            SqlCommand sqlCommand = new SqlCommand("spCoursesTechnicalCourses", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            return AppDal.ExecuteSelectCommand(sqlCommand);
        }

        public static DataTable CourseDetailsForCityPage(string cat3, string seoCity)
        {
            var sqlCommand = new SqlCommand("spCityPageDetails", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@cat4CityPage", cat3);
            sqlCommand1.Parameters.AddWithValue("@seoCity", seoCity);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }
        public static DataTable CoursesForCityPage(string cat3, string seoCity)
        {
            var sqlCommand = new SqlCommand("spCoursesForCityPage", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@cat4CityPage", cat3);
            sqlCommand1.Parameters.AddWithValue("@seoCity", seoCity);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }
        public static DataTable CourseImageForCityPage(string cat2)
        {
            var sqlCommand = new SqlCommand("spCourseImageForCityPage", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@cat2", cat2);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable SeoPageCourseDetails(string courseId)
        {
            var sqlCommand = new SqlCommand("spSeoCourseDetails", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@courseId", courseId);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable CourseByCityAndState(string city, string state)
        {
            var sqlCommand = new SqlCommand("coursesByCityAndState", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@city", city);
            sqlCommand1.Parameters.AddWithValue("@state", state);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable GetLocationInfoFromSEOCity(string seoCity,string seoCourseName)
        {
            var sqlCommand = new SqlCommand("GetLocationInfoFromSEOCity", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@seoCity", seoCity);
            sqlCommand1.Parameters.AddWithValue("@seoCourseName", seoCourseName);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable GetCityCatalogPageCourses(string city, string state,string courseCategory)
        {
            var sqlCommand = new SqlCommand("coursesByCityCatalog", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@city", city);
            sqlCommand1.Parameters.AddWithValue("@state", state);
            sqlCommand1.Parameters.AddWithValue("@courseCategory", courseCategory);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable GetCourseByBrandName(string courseBrand,string courseType)
        {
            var sqlCommand = new SqlCommand("coursesByCourseBrand", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@catalogBrand", courseBrand);
            sqlCommand1.Parameters.AddWithValue("@courseType", courseType);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable GetCourseDescriptionByBrandName(string courseBrand, string courseType)
        {
            var sqlCommand = new SqlCommand("coursesDescriptionByCourseBrand", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@catalogBrand", courseBrand);
            sqlCommand1.Parameters.AddWithValue("@courseType", courseType);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable GetCourseByTopicName(string courseTopic, string courseType)
        {
            var sqlCommand = new SqlCommand("coursesByCourseTopic", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@catalogTopic", courseTopic);
            sqlCommand1.Parameters.AddWithValue("@courseType", courseType);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable GetStateCatalogPageCourses(string state, string courseCategory)
        {
            var sqlCommand = new SqlCommand("coursesByStateCatalog", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@state", state);
            sqlCommand1.Parameters.AddWithValue("@courseCategory", courseCategory);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable GetDeliveryFormatByCourses(int courseId)
        {
            var sqlCommand = new SqlCommand("getDeliveryFormatByCourses", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@courseId", courseId);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable GetAllCities()
        {
            var sqlCommand = new SqlCommand("dbo.cities_with_classes_s", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable GetCatalogByCity(string city)
        {
            
            var sqlCommand = new SqlCommand("dbo.catalogByCity", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@city", city);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable DeleteCityCoursesData()
        {
            var sqlCommand = new SqlCommand("dbo.deleteCityCoursesFromTemp", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable InsertCityCoursesData(string city)
        {
            var sqlCommand = new SqlCommand("dbo.InsertIntoCityCourses", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@city", city);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable GetAllCityCourses()
        {
            var sqlCommand = new SqlCommand("dbo.GetAllCityCourses", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable DeleteNationalLocationData()
        {
            var sqlCommand = new SqlCommand("dbo.deleteNationalLocationFromTemp", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable InsertNationalLocationData(string state)
        {
            var sqlCommand = new SqlCommand("dbo.InsertIntoNationalLocation", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@state", state);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable GetAllNationalLocations()
        {
            var sqlCommand = new SqlCommand("dbo.GetAllNationalLocations", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        #region INSERT INTO Temp Data
        public static DataTable InsertIntoTempBrand(string catalogBrand,string courseType)
        {
            var sqlCommand = new SqlCommand("dbo.InsertIntoTempBrand", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@catalogBrand", catalogBrand);
            sqlCommand1.Parameters.AddWithValue("@courseType", courseType);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable DeleteFromTempBrand()
        {
            var sqlCommand = new SqlCommand("dbo.DeleteFromTempBrand", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable GetTempBrandFromCatalogAndCourse(string catalogBrand, string courseType)
        {
            var sqlCommand = new SqlCommand("dbo.GetTempBrandFromCatalogAndCourse", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@catalogBrand", catalogBrand);
            sqlCommand1.Parameters.AddWithValue("@courseType", courseType);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable InsertIntoTempTopic(string catalogTopic, string courseType)
        {
            var sqlCommand = new SqlCommand("dbo.InsertIntoTempTopic", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@catalogTopic", catalogTopic);
            sqlCommand1.Parameters.AddWithValue("@courseType", courseType);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable DeleteFromTempTopic()
        {
            var sqlCommand = new SqlCommand("dbo.DeleteFromTempTopic", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }

        public static DataTable GetTempTopicFromCatalogAndCourse(string catalogTopic, string courseType)
        {
            var sqlCommand = new SqlCommand("dbo.GetTempTopicFromCatalogAndCourse", new SqlConnection(AppConfiguration.DbConnectionString))
            {
                CommandType = CommandType.StoredProcedure
            };
            var sqlCommand1 = sqlCommand;
            sqlCommand1.Parameters.AddWithValue("@catalogTopic", catalogTopic);
            sqlCommand1.Parameters.AddWithValue("@courseType", courseType);
            return AppDal.ExecuteSelectCommand(sqlCommand1);
        }
        #endregion
    }
}