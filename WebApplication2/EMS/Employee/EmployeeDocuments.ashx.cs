using EMS.App_Code.DAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace EMS.EMS.UserAccount
{
    /// <summary>
    /// Summary description for EmployeeDocuments
    /// </summary>
    public class EmployeeDocuments : IHttpHandler
    {
        EmployeeDB employeedb = new EmployeeDB();
        ResponseFile objResponse = new ResponseFile();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            HttpFileCollection UploadedFilesCollection = context.Request.Files;
            for (int i = 0; i < UploadedFilesCollection.Count; i++)
            {

                HttpPostedFile postedFile = UploadedFilesCollection[i];
                string tempPath = ConfigurationManager.AppSettings["EmployeeDocuments"].ToString();
                string savepath = context.Server.MapPath(tempPath);

                if (!Directory.Exists(savepath))
                {
                    Directory.CreateDirectory(savepath);
                }

                string filename = postedFile.FileName.Split('.')[0];
                postedFile.SaveAs(savepath + @"\" + postedFile.FileName);
                objResponse.fileName = filename.Trim();
                objResponse.path = postedFile.FileName.Trim();

                var jSon = new JavaScriptSerializer();
                var OutPut = jSon.Serialize(objResponse);

                context.Response.Write(OutPut);
            }

            
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
    public class ResponseFile
    {
        public string fileName { get; set; }
        public string path { get; set; }
    }
}