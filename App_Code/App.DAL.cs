using System;
using System.Data;
using System.Data.Common;

namespace ProductivityPointGlobal
{
    public class AppDal
    {
        public static int ExecuteScalar(DbCommand cmd)
        {
            int value;
            try
            {
                cmd.Connection.Open();
                value = (int)cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                AppUtilities.LogError(ex);
                throw;
            }
            finally
            {
                cmd.Connection.Close();
            }
            return value;
        }

        public static int ExecuteNonQuery(DbCommand cmd)
        {
            int value;
            try
            {
                cmd.Connection.Open();
                value = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                AppUtilities.LogError(ex);
                throw;
            }
            finally
            {
                cmd.Connection.Close();
            }
            return value;
        }

        public static DataTable ExecuteSelectCommand(DbCommand cmd)
        {
            DataTable table;
            try
            {
                cmd.Connection.Open();
                var reader = cmd.ExecuteReader();
                table = new DataTable();
                table.Load(reader);
                reader.Close();
            }
            catch (Exception ex)
            {
                AppUtilities.LogError(ex);
                throw;
            }
            finally
            {
                cmd.Connection.Close();
            }
            return table;
        }
    }
}