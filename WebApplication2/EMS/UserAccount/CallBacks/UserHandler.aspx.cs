using EMS.App_Code.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace EMS.EMS.UserAccount.CallBacks
{
    public partial class UserHandler : System.Web.UI.Page
    {
        UserProfileDB UserDb = new UserProfileDB();
        EncryptionAndDeccryption encryptionAndDeccryption = new EncryptionAndDeccryption();

        int Pagenumber = 0;
        int Rows = 10;
        protected void Page_Load(object sender, EventArgs e)
        {
            string Action = Request.Form["Action"].ToString();
            if (Action == "AddUser")
            {
                AddUser(); return;
            }
            if (Action == "UpdateUser")
            {
                UpdateUser(); return;
            }
            if (Action == "DeleteUser")
            {
                DeleteUser(); return;
            }
            if (Action == "FilterUserDetails")
            {
                FilterUserDetails(); return;
            }
        }
        protected void AddUser()
        {
            string username = encryptionAndDeccryption.Encrypt(Request.Form["UserName"].ToString());
            string Pasword = encryptionAndDeccryption.Encrypt(Request.Form["Pasword"].ToString());
            string Email = Request.Form["Email"].ToString();

            long userid = UserDb.AddUser(0, username, Pasword, Email);
        }
        protected void UpdateUser()
        {
            long UserId = Int64.Parse(Request.Form["UserId"].ToString());
            string username = encryptionAndDeccryption.Encrypt(Request.Form["UserName"].ToString());
            string Pasword = encryptionAndDeccryption.Encrypt(Request.Form["Pasword"].ToString());
            string Email = Request.Form["Email"].ToString();
            var regex = new Regex("^[A-Za-z0-9@#$_]+$");
            Match matchP = regex.Match(Pasword);
            Match matchUName = regex.Match(username);
            if (matchP.Success && matchUName.Success)
            {
                long userid = UserDb.UpdateUser(UserId, username, Pasword, Email);
            }
        }
        protected void DeleteUser()
        {
            long UserId = Int64.Parse(Request.Form["UserId"].ToString());
            UserDb.Deleteuser(UserId);
        }
        private void FilterUserDetails()
        {
            if (!string.IsNullOrEmpty(Request.Form["Pagenumber"]))
                Pagenumber = Convert.ToInt32(Request.Form["Pagenumber"]);
            if (!string.IsNullOrEmpty(Request.Form["Rows"]))
                Rows = Convert.ToInt32(Request.Form["Rows"]);
            string MaxRemindEMPID = Request.Form["MaxRemindEMPID"];
            string EmployeeName = Request.Form["EmployeeName"];
            DataSet ds = UserDb.GetUserDetails(Rows, Pagenumber);
            rptUserDetails.DataSource = ds.Tables[0];
            rptUserDetails.DataBind();
            hdnUserRows.Value = ds.Tables[1].Rows[0]["TotalRows"].ToString();
        }
        protected void EncDec(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                string Password = drv["Password"].ToString().TrimEnd();
                Label LPassword = (Label)e.Item.FindControl("LPassword");
                string UserName = drv["UserName"].ToString().TrimEnd();
                Label lblUserName = (Label)e.Item.FindControl("txtUserName");
                lblUserName.Text = encryptionAndDeccryption.Decrypt(UserName.ToString()).ToString();
                LPassword.Text = encryptionAndDeccryption.Decrypt(Password.ToString()).ToString();

            }
        }
    }
}