using System.Configuration;

namespace ProductivityPointGlobal
{
    public class AppConfiguration
    {
        static AppConfiguration()   
        {
            var developerMode = ConfigurationManager.AppSettings["DeveloperMode"];

            switch (developerMode)
            {
                default:
                    DbConnectionString = ConfigurationManager.ConnectionStrings["SQLConnectionLocal"].ConnectionString;
                    DbProviderName = ConfigurationManager.ConnectionStrings["SQLConnectionLocal"].ProviderName;
                    break;
                case "true":
                    DbConnectionString = ConfigurationManager.ConnectionStrings["SQLConnectionTest"].ConnectionString;
                    DbProviderName = ConfigurationManager.ConnectionStrings["SQLConnectionTest"].ProviderName;
                    break;
                case "false":
                    DbConnectionString = ConfigurationManager.ConnectionStrings["SQLConnectionProd"].ConnectionString;
                    DbProviderName = ConfigurationManager.ConnectionStrings["SQLConnectionProd"].ProviderName;
                    break;
            }
        }

        public static string DbConnectionString { get; set; }

        public static string DbProviderName { get; set; }

        public static int SessionTimeout
        {
            get { return int.Parse(ConfigurationManager.AppSettings["SessionTimeOut"]); }
        }

        public static string MailFrom
        {
            get { return ConfigurationManager.AppSettings["MailFrom"]; }
        }

        public static bool EnableErrorLogEmail
        {
            get { return bool.Parse(ConfigurationManager.AppSettings["EnableErrorLogEmail"]); }
        }

        public static string ErrorLogEmail
        {
            get { return ConfigurationManager.AppSettings["ErrorLogEmail"]; }
        }
    }
}