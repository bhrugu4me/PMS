using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using PMSService;
using System.Web.Http.Cors;

namespace PMSApi.Areas.Project.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ProjectController : ApiController
    {

        /// <summary>
        /// Gets the Project Type Information.
        /// http://localhost:53294/api/v1/Project/ProjectTypeList
        /// </summary>
        /// <returns>List of ProjectTypes </returns>
        [HttpGet]
        public HttpResponseMessage ProjectTypeList()
        {
            try
            {
                var objproject = new ClsProject();
                return Request.CreateResponse(HttpStatusCode.OK, objproject.ProjectTypeList());
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }

        }

        /// <summary>
        /// Gets the Project Information.
        /// http://localhost:53294/api/v1/Project/ProjectList
        /// </summary>
        /// <returns>List of Projects </returns>
        [HttpPost]
        public HttpResponseMessage ProjectList(PMSModels.GetProjectRequest getProjectRequest)
        {
            try
            {
                var objproject = new ClsProject();
                return Request.CreateResponse(HttpStatusCode.OK, objproject.ProjectList(getProjectRequest));
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }

        }

        /// <summary>
        /// Set the project (insert or update project)
        /// http://localhost:53294/api/v1/Project/SetProject
        /// </summary>
        /// <returns></returns>

        [HttpPost]
        public HttpResponseMessage SetProject(PMSModels.Project project)
        {
            try
            {
                var objproject = new ClsProject();
                return Request.CreateResponse(HttpStatusCode.OK, objproject.setProject(project));
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }

        }


        /// <summary>
        /// Delete the project
        /// http://localhost:53294/api/v1/Project/DeleteProject
        /// </summary>
        /// <returns></returns>

        [HttpPost]
        public HttpResponseMessage DeleteProject(string projectId)
        {
            try
            {
                var objproject = new ClsProject();
                return Request.CreateResponse(HttpStatusCode.OK, objproject.deleteProject(projectId));
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }

        }
    }
}
