using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace WebApplication2.App_Code.DAL
{
    public class UserProfileDB
    {
        public DBManager objDBManager = new DBManager();
        public DataTable GetUserProfile(string userName, string password)
        {
            try
            {
                objDBManager.AddParameter("UserName", userName);
                objDBManager.AddParameter("Password", password);
                return objDBManager.ExecuteDataTable("GetUserProfile");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public DataSet GetUserDetails(int Rows = 10, int PageNumber = 0)
        {
            try
            {
                objDBManager.AddParameter("@PAGENUMBER", PageNumber);
                objDBManager.AddParameter("@ROWS", Rows);
                return objDBManager.ExecuteDataSet("GetUser");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public long AddUser(long UserId, string username, string password, string email)
        {
            try
            {
                objDBManager.AddParameter("@UserID", UserId, SqlDbType.BigInt, 8, ParameterDirection.Output);
                objDBManager.AddParameter("@UserName", username);
                objDBManager.AddParameter("@Password", password);
                objDBManager.AddParameter("@UserEmail", email);
                objDBManager.AddParameter("@CreatedBy", 100);
                objDBManager.AddParameter("@CreatedDate", DateTime.Now.ToString("MM/dd/yyyy"));
                objDBManager.ExecuteDataTable("Users_Add");
                return UserId = long.Parse(objDBManager.Parameters[0].Value.ToString());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public long UpdateUser(long UserId, string username, string password, string email)
        {
            try
            {
                objDBManager.AddParameter("@UserID", UserId);
                objDBManager.AddParameter("@username", username);
                objDBManager.AddParameter("@Password", password);
                objDBManager.AddParameter("@UserEmail", email);
                objDBManager.ExecuteDataTable("Users_Update");
                return UserId = long.Parse(objDBManager.Parameters[0].Value.ToString());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void Deleteuser(long UserId)
        {
            try
            {
                objDBManager.AddParameter("@UserID", UserId);
                objDBManager.AddParameter("@ModifiedBy", 100);
                objDBManager.AddParameter("@ModifiedDate", DateTime.Now);
                objDBManager.ExecuteDataTable("Users_Delete");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}