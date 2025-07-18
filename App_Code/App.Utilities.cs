using System;
using System.IO;
using System.Net.Mail;
using System.Text;
using System.Web;

namespace ProductivityPointGlobal
{
    public class AppUtilities
    {
        public static void LogError(Exception ex)
        {
            var dateTime = DateTime.Now.ToLongDateString() + ", at " + DateTime.Now.ToShortTimeString();
            var context = HttpContext.Current;

            if (!AppConfiguration.EnableErrorLogEmail) return;
            var errorMessage = new StringBuilder();
            errorMessage.Append("<strong>Exception generated on:</strong> " + dateTime + "<br /><br />");
            errorMessage.Append("<strong>Page Location:</strong> " + context.Request.RawUrl + "<br /><br />");
            errorMessage.Append("<strong>Message:</strong> " + ex.Message + "<br /><br />");
            errorMessage.Append("<strong>Source:</strong> " + ex.Source + "<br /><br />");
            errorMessage.Append("<strong>Method:</strong> " + ex.TargetSite + "<br /><br />");
            errorMessage.Append("<strong>Inner Exception:</strong> " + ex.InnerException);

            var from = AppConfiguration.MailFrom;
            var to = AppConfiguration.ErrorLogEmail;
            const string subject = "Productivity Point Error Report";
            var body = errorMessage.ToString();

            var message = new MailMessage { Priority = MailPriority.Normal, From = new MailAddress(@from) };
            message.To.Add(new MailAddress(to));
            message.Subject = subject;
            message.IsBodyHtml = true;
            message.BodyEncoding = Encoding.UTF8;
            message.Body = body;

            var client = new SmtpClient();

            try
            {
                client.Send(message);
            }
            catch (SmtpException mailEx)
            {
                var path = HttpContext.Current.Server.MapPath("~/errors/smtp_errors.txt");
                if (!File.Exists(path))
                {
                    // Create a file to write to. 
                    using (var sw = File.CreateText(path))
                    {
                        sw.WriteLine(dateTime);
                        sw.WriteLine(mailEx);
                        sw.WriteLine(Environment.NewLine);
                    }
                }
            }
            finally
            {
                message.Dispose();
                client.Dispose();
            }
        }
    }
}