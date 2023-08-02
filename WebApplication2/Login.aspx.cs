using System;
using System.Data;
using WebApplication2.App_Code.DAL;

namespace WebApplication2
{
    public partial class Login : System.Web.UI.Page
    {
        UserProfileDB userProfile = new UserProfileDB();
        EncryptionAndDeccryption encryptionobj = new EncryptionAndDeccryption();



        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void btn_LoginEMS(object sender, EventArgs e)
        {

            string userName = encryptionobj.Encrypt(txtUserName.Text.ToString());
            string password = encryptionobj.Encrypt(txtPassword.Text.ToString());
            DataTable dt = userProfile.GetUserProfile(userName, password);
            if (dt.Rows.Count > 0)
            {
                Response.Redirect("MRemindEMS.aspx");
            }
            else
            {
                lblErrorMessage.Text = "Invalid username or password.";
            }

        }


    }
}