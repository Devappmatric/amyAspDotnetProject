using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace ProductivityPointGlobal
{
    public class AppHelpers
    {
        public static void PageTitle(string title)
        {
            var page = (Page)HttpContext.Current.Handler;
            page.Title = title;
        }

        public static void MetaData(string metaName, string metaContent)
        {
            var page = (Page)HttpContext.Current.Handler;

            var head = page.Header;
            var metaTag = new HtmlMeta { Name = metaName, Content = metaContent };
            head.Controls.Add(metaTag);
        }
    }
    public static class AppExtensions
    {
        public static string ToProper(this string str)
        {
            return System.Text.RegularExpressions.Regex.Replace(str.ToLower(), "(\\b\\w)", m => m.Value.ToUpper());
        }
        public static string ToSeo(this string str)
        {
            return System.Text.RegularExpressions.Regex.Replace(str.ToLower(), "(\\s+)", "-");
        }
    }
}