using System;
using System.Net;
using System.Web;
using System.Web.Routing;

namespace ProductivityPointGlobal
{
    public class Global : HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);            
        }
        protected void Session_Start(object sender, EventArgs e)
        {

        }
        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            //here we will check if redirection is needed or not
            var requestUrl = Request.Url.AbsoluteUri;

            //call database here
            var newUrl = CmsAdmin.GetPageRedirectionUrls(requestUrl);
            if (newUrl != "")
            {

                var newUrlBuilder = new UriBuilder(newUrl);
                Response.StatusCode = 301;
                Response.AddHeader("Location", newUrlBuilder.ToString());
                Response.End();
            }

            if (requestUrl.Contains("professional-development-skills.aspx"))
            {
                Response.Redirect("/professional-development.aspx");
            }
            if (requestUrl.Contains("FederalGovernmentAndMilitaryTuitionSavings.aspx"))
            {
                Response.Redirect("/GovernmentSolutions.aspx");
            }
            if (Request.Url.AbsolutePath == "/brand/" 
                || Request.Url.AbsolutePath == "/topic/"
                || Request.Url.AbsolutePath == "/topic/technical-courses"
                || Request.Url.AbsolutePath == "/training/live-online"
                || Request.Url.AbsolutePath == "/course/check-point-security-engineering-r80.20-gaia"
                || Request.Url.AbsolutePath == "/city/live/state/online/adobe"
                || Request.Url.AbsolutePath == "/city/live/state/online/palo-alto"
                || Request.Url.AbsolutePath == "/training/comptia/austin-tx"
                || Request.Url.AbsolutePath == "/training/business-analysis/new-york-ny"
                || Request.Url.AbsolutePath == "/training/adobe/philadelphia-pa"
                || Request.Url.AbsolutePath == "/training/communication-skills/los-angeles-ca"
                || Request.Url.AbsolutePath == "/city/san-francisco/state/ca/agile-and-scrum"
                )
            {
                Response.Redirect("/courses");
            }


            if (Request.Url.Host.StartsWith("www") || Request.Url.IsLoopback) return;
            var builder = new UriBuilder(Request.Url) { Host = "www." + Request.Url.Host };
            Response.StatusCode = 301;
            Response.AddHeader("Location", builder.ToString());
            Response.End();
        }
        public static void RegisterRoutes(RouteCollection routeCollection)
        {
            // 2020-06-09 Redirects
            //routeCollection.MapPageRoute("RouteForMsVs", "Home/{cat2}", "~/courses/home-results.aspx", false);

            routeCollection.MapPageRoute("RouteForLocationsByState", "State/{Id}/", "~/locationbystate.aspx", false);
            routeCollection.MapPageRoute("RouteForLocationsByClass", "Location/Classes/{Id}/", "~/locationbyclass.aspx", false);
            routeCollection.MapPageRoute("RouteForLocationsByCity", "City/{seoCity}/{courseId}", "~/locationbycity.aspx", false);
            routeCollection.MapPageRoute("RouteForClassesByVenue", "Venue/{venueId}/", "~/courses/classbyvenue.aspx", false);
            routeCollection.MapPageRoute("RouteForCourses", "course/{seoCourseName}", "~/courses/coursedetail.aspx", false);
            routeCollection.MapPageRoute("RouteForCoursesSunrise", "Course/Ft-Lauderdale/{seoCourseName}/", "~/courses/coursedetail.aspx", false);
            routeCollection.MapPageRoute("RouteForCoursesMiami", "Course/Miami/{seoCourseName}/", "~/courses/coursedetail.aspx", false);
            routeCollection.MapPageRoute("RouteForScheduleFromSearch", "course/{seoCourseName}/class", "~/courses/ScheduleFromSearch.aspx", false);
            routeCollection.MapPageRoute("RouteForSchedule", "course/{seoCourseName}/classes/{*seoCity}", "~/courses/schedule.aspx", false);

            //routeCollection.MapPageRoute("RouteForSchedule", "Schedule/{seoCourseName}/{*seoCity}", "~/courses/schedule.aspx", false);
            routeCollection.MapPageRoute("RouteForScheduleById", "ScheduleById/{courseId}/{seoCity}/", "~/courses/schedulebyid.aspx", false);
            routeCollection.MapPageRoute("RouteForSearch", "Search/{seoCourseName}/", "~/courses/search-results.aspx", false);
            //remove training urls
            routeCollection.MapPageRoute("RouteForSitemap", "Training/{cat3}/{seoCity}", "~/courses/training.aspx", false);
            
            routeCollection.MapPageRoute("RouteForHomeLinks", "catalog/{cat2}", "~/courses/home-results.aspx", false);
            routeCollection.MapPageRoute("RouteForCityStateMainPage", "city/{city}/state/{state}", "~/cities-main-page.aspx", false);
            routeCollection.MapPageRoute("RouteForCityStateCatalogPage", "city/{city}/state/{state}/{courseCategory}", "~/city-catalog-page.aspx", false);
            routeCollection.MapPageRoute("RouteForStateCatalogPage", "state/{state}/catalog/{courseCategory}", "~/StateCatalogPage.aspx", false);

            routeCollection.MapPageRoute("RouteForBrand", "brand/{courseBrand}/{coursetype}", "~/courses/coursebrandmainpage.aspx", false);
            routeCollection.MapPageRoute("RouteForTopic", "topic/{courseTopic}/{coursetype}", "~/courses/coursetopicmainpage.aspx", false);
            routeCollection.MapPageRoute("RouteForBlogPost", "blog/{blogSlug}", "~/Resources/BlogDetails.aspx", false);
        }
        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }
        protected void Application_Error(object sender, EventArgs e)
        {
            var ex = Server.GetLastError();
            

            if (ex is HttpException httpEx && httpEx.GetHttpCode() == 404)
            {
                var requestUrl = Request.Url.AbsoluteUri;

                var newUrl = CmsAdmin.GetPageRedirectionUrls(requestUrl);
                if (newUrl != "")
                {
                    var newUrlBuilder = new UriBuilder(newUrl);
                    Response.StatusCode = 301;
                    Response.AddHeader("Location", newUrlBuilder.ToString());
                    Response.End();
                }
                else
                {
                    Server.ClearError();
                    Response.StatusCode = 404;
                    Response.StatusDescription = "Not Found";
                    Response.End(); // Ends the response immediately
                    //Response.Redirect("~/404.aspx");
                }

            }
        }
        protected void Session_End(object sender, EventArgs e)
        {

        }
        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}