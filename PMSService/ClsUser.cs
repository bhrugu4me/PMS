using System;
using System.Collections.Generic;
using PMSModels;
using PMSCommon;
using System.Data.SqlClient;

namespace PMSService
{
    public class ClsUser
    {

        public List<UserTypes> UserTypeList()
        {
            try
            {
                return DBConnect.ExecuteStoredProcedure<UserTypes>(PMSModels.Constants.USPConstants.GetUserTypes);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public List<UserList> UserList()
        {
            try
            {
                return DBConnect.ExecuteStoredProcedure<UserList>(PMSModels.Constants.USPConstants.GetUsers);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public List<UserList> ProjectManagerList()
        {
            try
            {
                var objret= DBConnect.ExecuteStoredProcedure<UserList>(PMSModels.Constants.USPConstants.GetUsers);
                return objret.FindAll(x => x.UserType.ToLower() == "project manager");
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public UserList CheckUserLogin(PMSModels.CheckLogin checkLogin)
        {
            try
            {
                List<SqlParameter> objparams = new List<SqlParameter>();

                if (checkLogin != null)
                {
                    if (checkLogin.emailId != null)
                    {
                        objparams.Add(new SqlParameter("@emailId", checkLogin.emailId));
                    }
                    if (checkLogin.password != null)
                    {
                        objparams.Add(new SqlParameter("@password", checkLogin.password));
                    }
                }
                var objlist= DBConnect.ExecuteStoredProcedure<UserList>(PMSModels.Constants.USPConstants.CheckUserLogin,objparams);
                return objlist[0];
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
