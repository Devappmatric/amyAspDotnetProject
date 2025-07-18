using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ProductivityPointGlobal
{
    public class UserInfo
    {
        public static DataTable UserAuthenticate(string username, string password)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var conn = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spStudentAuthentication", conn) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password);

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable UserPassword(string username)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var conn = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spUserPass", conn) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@username", username);

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }
        public static DataTable AccountInfo(string username)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var conn = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spUserInfo", conn) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@username", username);

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }
        public static DataTable BillingInfo(string username)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var conn = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spUserBilling", conn) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@username", username);

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable CheckForExistingUser(string username)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var conn = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spUserCheckDuplicate", conn) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@username", username);

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable StudentInfo(string username)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var conn = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spStudentInfo", conn) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@user_name", username);

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static bool CreateUser(string username, string password, string firstName, string lastName, string phone, string company, string address, string city, string country, string state, string zipcode, string billingFirstname, string billingLastname, string billingPhone, string billingCompany, string billingAddress, string billingCity, string billingCountry, string billingState, string billingZipcode)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var conn = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spStudentAdd", conn) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("@firstname", firstName);
            cmd.Parameters.AddWithValue("@lastname", lastName);
            cmd.Parameters.AddWithValue("@phone", phone);
            cmd.Parameters.AddWithValue("@company", company);
            cmd.Parameters.AddWithValue("@address", address);
            cmd.Parameters.AddWithValue("@city", city);
            cmd.Parameters.AddWithValue("@country", country);
            cmd.Parameters.AddWithValue("@state", state);
            cmd.Parameters.AddWithValue("@zipcode", zipcode);
            cmd.Parameters.AddWithValue("@billing_firstname", billingFirstname);
            cmd.Parameters.AddWithValue("@billing_lastname", billingLastname);
            cmd.Parameters.AddWithValue("@billing_phone", billingPhone);
            cmd.Parameters.AddWithValue("@billing_company", billingCompany);
            cmd.Parameters.AddWithValue("@billing_address", billingAddress);
            cmd.Parameters.AddWithValue("@billing_city", billingCity);
            cmd.Parameters.AddWithValue("@billing_country", billingCountry);
            cmd.Parameters.AddWithValue("@billing_state", billingState);
            cmd.Parameters.AddWithValue("@billing_zipcode", billingZipcode);

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }
        public static void UpdateUserInfo(string username, string firstname, string lastname, string phone, string company, string address, string city, string country, string state, string zipcode)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var conn = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spUserInfoUpdate", conn) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@firstname", firstname);
            cmd.Parameters.AddWithValue("@lastname", lastname);
            cmd.Parameters.AddWithValue("@phone", phone);
            cmd.Parameters.AddWithValue("@company", company);
            cmd.Parameters.AddWithValue("@address", address);
            cmd.Parameters.AddWithValue("@city", city);
            cmd.Parameters.AddWithValue("@country", country);
            cmd.Parameters.AddWithValue("@state", state);
            cmd.Parameters.AddWithValue("@zipcode", zipcode);

            AppDal.ExecuteNonQuery(cmd);
        }
        public static void UpdateBillingInfo(string username, string billingfirstname, string billinglastname, string billingphone, string billingcompany, string billingaddress, string billingcity, string billingcountry, string billingstate, string billingzipcode)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var conn = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spUserBillingUpdate", conn) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@billing_firstname", billingfirstname);
            cmd.Parameters.AddWithValue("@billing_lastname", billinglastname);
            cmd.Parameters.AddWithValue("@billing_phone", billingphone);
            cmd.Parameters.AddWithValue("@billing_company", billingcompany);
            cmd.Parameters.AddWithValue("@billing_address", billingaddress);
            cmd.Parameters.AddWithValue("@billing_city", billingcity);
            cmd.Parameters.AddWithValue("@billing_country", billingcountry);
            cmd.Parameters.AddWithValue("@billing_state", billingstate);
            cmd.Parameters.AddWithValue("@billing_zipcode", billingzipcode);

            AppDal.ExecuteNonQuery(cmd);
        }

        public static bool AddStudent(string userName, string studentName, string studentEmail, string studentCourse)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var conn = new SqlConnection(strConnString);

            var cmd = new SqlCommand("ShoppingCartAddStudents", conn) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@user_name", userName);
            cmd.Parameters.AddWithValue("@student_name", studentName);
            cmd.Parameters.AddWithValue("@student_email", studentEmail);
            cmd.Parameters.AddWithValue("@student_course", studentCourse);

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }

        public static DataTable GetUserCart(string userName)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var conn = new SqlConnection(strConnString);

            var cmd = new SqlCommand("GetItemFromCartForUser", conn) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@userId", userName);

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static bool AddCourseToCart(string userName, string classId)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var conn = new SqlConnection(strConnString);

            var cmd = new SqlCommand("AddItemToUserCart", conn) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@userId", userName);
            cmd.Parameters.AddWithValue("@classId", classId);

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }

        public static bool RemoveCourseFromCart(string userName, string classId)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var conn = new SqlConnection(strConnString);

            var cmd = new SqlCommand("RemoveItemToUserCart", conn) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@userId", userName);
            cmd.Parameters.AddWithValue("@classId", classId);

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }

        internal static bool UpdateUserEmail(string authenticatedUser, string email)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var conn = new SqlConnection(strConnString);

            var cmd = new SqlCommand("UpdateUserEmail", conn) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@GuestUserGuid", authenticatedUser);
            cmd.Parameters.AddWithValue("@Email", email);

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }
    }
}