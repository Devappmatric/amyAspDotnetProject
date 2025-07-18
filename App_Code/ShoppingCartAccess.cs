using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace ProductivityPointGlobal
{
    public class ShoppingCartAccess
    {
        private static string ShoppingCartId
        {
            get
            {
                var context = HttpContext.Current;
                var cartId = "";
                if (cartId != "")
                    return cartId;
                if (context.Request.Cookies["CartID"] != null)
                {
                    cartId = context.Request.Cookies["CartID"].Value;
                    return cartId;
                }
                cartId = Guid.NewGuid().ToString();
                var cookie = new HttpCookie("CartID", cartId);
                const int howManyDays = 1;
                var currentDate = DateTime.Now;
                var timeSpan = new TimeSpan(howManyDays, 0, 0, 0);
                var expirationDate = currentDate.Add(timeSpan);
                cookie.Expires = expirationDate;
                context.Response.Cookies.Add(cookie);
                return cartId;
            }
        }

        public static bool AddItem(string classId,string userId)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("ShoppingCartAddItem");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.Add("@CartID", SqlDbType.Char, 36).Value = ShoppingCartId;
            cmd.Parameters.Add("@ClassID", SqlDbType.NVarChar, -1).Value = classId;
            bool temp = false;
            try
            {
                temp= (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
            if (userId != null || userId != "")
            {
                try
                {
                    UserInfo.AddCourseToCart(userId, classId);
                }
                catch (Exception ex)
                {

                }
            }

            return temp;
        }

        public static bool UpdateItem(string classId, int quantity)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("ShoppingCartUpdateItem");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.Add("@CartID", SqlDbType.Char, 36).Value = ShoppingCartId;
            cmd.Parameters.Add("@ClassID", SqlDbType.NVarChar, -1).Value = classId;
            cmd.Parameters.Add("@Quantity", SqlDbType.Int).Value = quantity;

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }

        public static bool RemoveItem(string classId)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("ShoppingCartRemoveItem");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.Add("@CartID", SqlDbType.Char, 36).Value = ShoppingCartId;
            cmd.Parameters.Add("@ClassID", SqlDbType.NVarChar, -1).Value = classId;

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }

        public static bool RemoveAllItems()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("ShoppingCartDeleteAllItems");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.Add("@CartID", SqlDbType.Char, 36).Value = ShoppingCartId;

            try
            {
                return (AppDal.ExecuteNonQuery(cmd) != -1);
            }
            catch
            {
                return false;
            }
        }

        public static bool RemoveStudent(string rowId)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("spStudentRemove");
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

        public static DataTable GetItems()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("ShoppingCartGetItems");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.Add("@CartID", SqlDbType.Char, 36).Value = ShoppingCartId;
            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetSelectedCourses()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("ShoppingCartGetCourses");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.Add("@CartID", SqlDbType.Char, 36).Value = ShoppingCartId;
            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static decimal GetTotalAmount()
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("ShoppingCartGetTotalAmount");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.Add("@CartID", SqlDbType.Char, 36).Value = ShoppingCartId;

            return AppDal.ExecuteScalar(cmd);
        }

        public static int GetInvoiceNumber(string userName)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            const string sp = ("ShoppingCartInvoice");
            var cmd = new SqlCommand(sp, con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@userName", SqlDbType.NVarChar).Value = userName;

            return AppDal.ExecuteScalar(cmd);
        }

        public static DataTable GetStudentInfo(string username)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spStudentInfo", con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@user_name", username);

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetUserInfo(string username)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spUserInfo", con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@username", username);

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetBillingInfo(string username)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var con = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spUserBilling", con) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@username", username);

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }

        public static DataTable GetCouponCode(string couponCode)
        {
            var strConnString = AppConfiguration.DbConnectionString;
            var conn = new SqlConnection(strConnString);

            var cmd = new SqlCommand("spCheckCouponCode", conn) { CommandType = CommandType.StoredProcedure };

            cmd.Parameters.AddWithValue("@CouponCode", couponCode);            

            var table = AppDal.ExecuteSelectCommand(cmd);
            return table;
        }
    }
}