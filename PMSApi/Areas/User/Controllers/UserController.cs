using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using PMSService;

namespace PMSApi.Areas.User.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class UserController : ApiController
    {
        /// <summary>
        /// Gets the User Type Information.
        /// http://localhost:53294/api/v1/User/UserTypeList
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public HttpResponseMessage UserTypeList()
        {
            try
            {
                var objuser = new ClsUser();
                return Request.CreateResponse(HttpStatusCode.OK, objuser.UserTypeList());
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }

        }

        /// <summary>
        /// Gets the User Type Information.
        /// http://localhost:53294/api/v1/User/UserList
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public HttpResponseMessage UserList()
        {
            try
            {
                var objuser = new ClsUser();
                return Request.CreateResponse(HttpStatusCode.OK, objuser.UserList());
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }

        }

        /// <summary>
        /// Gets the User Type Information.
        /// http://localhost:53294/api/v1/User/ProjectManagerList
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public HttpResponseMessage ProjectManagerList()
        {
            try
            {
                var objuser = new ClsUser();
                return Request.CreateResponse(HttpStatusCode.OK, objuser.ProjectManagerList());
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }

        }

        /// <summary>
        /// Gets the User Type Information.
        /// http://localhost:53294/api/v1/User/CheckUserLogin
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public HttpResponseMessage CheckUserLogin(PMSModels.CheckLogin checkLogin)
        {
            try
            {
                var objuser = new ClsUser();
                return Request.CreateResponse(HttpStatusCode.OK, objuser.CheckUserLogin(checkLogin));
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }

        }

    }
}
