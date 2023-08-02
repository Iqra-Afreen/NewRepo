using EMS.App_Code.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS.EMS.User_Account
{
    public partial class User : System.Web.UI.Page
    {
        UserProfileDB Userdetails = new UserProfileDB();
        EncryptionAndDeccryption encryptionAndDeccryption = new EncryptionAndDeccryption();

        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = Userdetails.GetUserDetails();
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