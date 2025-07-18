using System;
using System.Configuration;
using System.Net;
using System.Net.Mail;

namespace ProductivityPointGlobal
{
    public class App
    {
        //public static bool SendEmail(string from, string to, string subject, string body)
        //{
        //    const string username = "AKIAIJFV4TD4YKZ7EJZQ"; // Replace with your SMTP username.
        //    const string password = "Ak4uPGemmccNvhgdbnb5iHWpCzmD1EwpKVdFnVZA86WG"; // Replace with your SMTP password.
        //    const string host = "email-smtp.us-east-1.amazonaws.com";
        //    const int port = 587;

        //    using (var client = new SmtpClient(host, port))
        //    {
        //        client.Credentials = new System.Net.NetworkCredential(username, password);
        //        client.EnableSsl = true;

        //        var mail = new MailMessage(from, to, subject, body) { IsBodyHtml = true };

        //        client.Send(mail);
        //    }

        //    return true;
        //}

        public static bool SendEmail(string from, string to, string subject, string body)
        {
            //const string username = "AKIAIJFV4TD4YKZ7EJZQ"; // Replace with your SMTP username.
            //const string password = "Ak4uPGemmccNvhgdbnb5iHWpCzmD1EwpKVdFnVZA86WG"; // Replace with your SMTP password.
            //const string host = "email-smtp.us-east-1.amazonaws.com";
            //const int port = 587;

            using (var client = new SmtpClient())// host, port))
            {
                //client.Credentials = new System.Net.NetworkCredential(username, password);
                //client.EnableSsl = true;

                foreach (var address in to.Split(new[] { ";" }, StringSplitOptions.RemoveEmptyEntries))
                {
                    using (MailMessage message = new MailMessage(
                        new MailAddress(from, "Productivity Point Learning Solutions"),
                        new MailAddress(address)
                    ))
                    {
                        message.Subject = subject;
                        message.Body = body;
                        message.IsBodyHtml = true;
                        client.Send(message);
                    }
                    //var mail = new MailMessage(from, address, subject, body) { IsBodyHtml = true };
                    //client.Send(mail);
                }
            }

            return true;
        }
        public static bool SendEmail(MailMessage msg)
        {
            using (var client = new SmtpClient("smtp.office365.com", 587))
            {
                client.EnableSsl = true;
                client.UseDefaultCredentials = true;
                var appCredential = ConfigurationManager.AppSettings["EmailSendCredential"];

                client.Credentials = new NetworkCredential("registrar@productivitypointls.com", appCredential);
                try
                {
                    client.Send(msg);
                    return true;
                }
                catch(Exception e)
                {
                    throw e;
                }
            }

        }

        public static bool SendEmailForRegistrar(string from, string to, string subject, string body)
        {
            //const string username = "AKIAIJFV4TD4YKZ7EJZQ"; // Replace with your SMTP username.
            //const string password = "Ak4uPGemmccNvhgdbnb5iHWpCzmD1EwpKVdFnVZA86WG"; // Replace with your SMTP password.
            //const string host = "email-smtp.us-east-1.amazonaws.com";
            //const int port = 587;

            SmtpClient client = new SmtpClient("smtp.office365.com", 587);
            client.EnableSsl = true;
            client.UseDefaultCredentials = true;

            //Get the credential value from the web.config file
            var appCredential= ConfigurationManager.AppSettings["EmailSendCredential"];

            client.Credentials = new NetworkCredential("registrar@productivitypointls.com", appCredential);

            MailMessage message = new MailMessage("registrar@productivitypointls.com", to);
            message.Subject =subject;
            message.Body = body;
            message.IsBodyHtml = true;

            try
            {
                client.Send(message);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }


            return true;
        }

    }
}