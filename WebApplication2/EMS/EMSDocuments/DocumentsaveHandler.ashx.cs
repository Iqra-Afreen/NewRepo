using EMS.EMS.UserAccount;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace EMS.EMS.EMSDocuments
{
    /// <summary>
    /// Summary description for DocumentsaveHandler
    /// </summary>
    public class DocumentsaveHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            var tempPath = "";
            context.Response.ContentType = "text/plain";
            try
            {
                HttpPostedFile postedFile = context.Request.Files[0];
                string newFileName = "";
                newFileName = Guid.NewGuid().ToString();

                tempPath = context.Server.MapPath("/EMSDocument" + "/");

                if (!Directory.Exists(tempPath))
                {
                    Directory.CreateDirectory(tempPath);
                }

                string filename = postedFile.FileName;
                //if(PracticeId == "EmailFiles")
                //{
                newFileName = filename.Split('.')[0];
                //}
                postedFile.SaveAs(tempPath + @"\" + newFileName + "." + filename.Split('.').Last());

                ResponseFile objResponse = new ResponseFile();
                objResponse.fileName = newFileName + "." + filename.Split('.').Last();
                objResponse.path = "EMSDocument" + "/" + newFileName + "." + filename.Split('.').Last();
                var jSon = new JavaScriptSerializer();
                var OutPut = jSon.Serialize(objResponse);
                context.Response.Write(OutPut);
            }
            catch (Exception ex)
            {
                context.Response.Write("Error: " + ex.Message);
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
}