using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Formatting;
using System.Net.Http.Headers;
using System.Web.Http;
using System.Web.Http.Cors;

namespace apiPMS
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            EnableCorsAttribute cors = new EnableCorsAttribute("*", "*", "GET,POST");

            config.EnableCors(cors);
         
            config.Routes.MapHttpRoute(
                name: "API Default",
                routeTemplate: "api/v1/{controller}/{action}/{id}",
                defaults: new { id = RouteParameter.Optional });


            // Adding formatter for JSON   

            config.Formatters.JsonFormatter.MediaTypeMappings.Add(
              new RequestHeaderMapping("type", "json", StringComparison.InvariantCultureIgnoreCase, true, new MediaTypeHeaderValue("application/json")));

            // Adding formatter for XML   
            config.Formatters.XmlFormatter.MediaTypeMappings.Add(
                new RequestHeaderMapping("type", "xml", StringComparison.InvariantCultureIgnoreCase, true, new MediaTypeHeaderValue("application/xml")));

        }
    }
}
