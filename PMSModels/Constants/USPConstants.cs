using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMSModels.Constants
{
    public class USPConstants
    {
        public const string SetProject = "[dbo].[usp_SetProject]";
        public const string GetProjects = "[dbo].[usp_GetProjects]";
        public const string GetProjectTypes = "[dbo].[usp_GetProjectTypes]";
        public const string GetUsers = "[dbo].[usp_GetUsers]";
        public const string GetUserTypes = "[dbo].[usp_GetUserTypes]";
        public const string CheckUserLogin = "[dbo].[usp_CheckUserLogin]";
        public const string DeleteProject = "[dbo].[usp_DeleteProject]";
    }
}
