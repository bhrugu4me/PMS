using System;
using System.Collections.Generic;
using PMSModels;
using PMSCommon;
using System.Data.SqlClient;
using System.Reflection;

namespace PMSService
{
    public class ClsProject
    {
        public List<ProjectTypes> ProjectTypeList()
        {
            try
            {
                return DBConnect.ExecuteStoredProcedure<ProjectTypes>(PMSModels.Constants.USPConstants.GetProjectTypes);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public List<ProjectList> ProjectList(GetProjectRequest objreq)
        {
            try
            {
                List<SqlParameter> objparams = new List<SqlParameter>();

                if(objreq!=null)
                {
                    if(objreq.ProjectId!=null)
                    {
                        objparams.Add(new SqlParameter("@projectId", objreq.ProjectId));
                    }
                    if (objreq.ProjectManagerId != null)
                    {
                        objparams.Add(new SqlParameter("@projectManagerId", objreq.ProjectManagerId));
                    }
                }
                return DBConnect.ExecuteStoredProcedure<ProjectList>(PMSModels.Constants.USPConstants.GetProjects,(objparams.Count>0?objparams:null));
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public int deleteProject(string projectId)
        {
            try
            {
                List<SqlParameter> objparams = new List<SqlParameter>();
                objparams.Add(new SqlParameter("@projectId", projectId));
                return DBConnect.Execute(PMSModels.Constants.USPConstants.DeleteProject, objparams);
            }
            catch (Exception ex)
            {
                return -1;
            }
        }
        public Project setProject(Project project)
        {
            try
            {
                List<SqlParameter> objparams = new List<SqlParameter>();
                objparams.Add(new SqlParameter("@projectId", project.ProjectId));
                objparams.Add(new SqlParameter("@projectname", project.ProjectName));
                objparams.Add(new SqlParameter("@projecttypeid", project.ProjectTypeId));
                objparams.Add(new SqlParameter("@clientname", project.ClientName));
                objparams.Add(new SqlParameter("@clientemail", project.ClientEmail));
                objparams.Add(new SqlParameter("@clientcontact", project.ClientContact));
                objparams.Add(new SqlParameter("@projectdescription", project.ProjectDescription));
                objparams.Add(new SqlParameter("@technology", project.Technology));
                objparams.Add(new SqlParameter("@projectmanagerid", project.ProjectManagerId));
                objparams.Add(new SqlParameter("@requestorid", project.RequestorId));
                
                var temp =DBConnect.ExecuteStoredProcedure<Project>(PMSModels.Constants.USPConstants.SetProject,objparams);
                return temp[0];
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        
    }
}
