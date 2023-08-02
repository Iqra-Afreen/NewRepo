using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EMS.App_Code.DAL;


namespace EMS.EMS.Employee
{
    public partial class EmployeeDetails : System.Web.UI.Page
    {
        EmployeeDB employeeDB = new EmployeeDB();
        EncryptionAndDeccryption encryptionAndDeccryption = new EncryptionAndDeccryption();
       
        protected void Page_Load(object sender, EventArgs e)
        {

           
            DataSet ds = employeeDB.GetAllEmployees();
            if (ds.Tables.Count > 0)
            {
                rptEmpDetails.DataSource = ds.Tables[0];
                rptEmpDetails.DataBind();
            }
            hdnEmpRows.Value = ds.Tables[1].Rows[0]["TotalRows"].ToString();
        }
        protected void EncDec(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                string ContactNumber = drv["ContactNumber"].ToString().TrimEnd();
                string CNIC = drv["CNIC"].ToString().TrimEnd();

                Label lblContactNumber = (Label)e.Item.FindControl("txtContact");
                Label lblCNIC = (Label)e.Item.FindControl("txtCNIC");
                lblContactNumber.Text = encryptionAndDeccryption.Decrypt(ContactNumber.ToString()).ToString();
                lblCNIC.Text = encryptionAndDeccryption.Decrypt(CNIC.ToString()).ToString();
                
            }
        }
    }
}