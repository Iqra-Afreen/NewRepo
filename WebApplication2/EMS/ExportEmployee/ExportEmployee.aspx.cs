using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using EMS.App_Code.DAL;
using System.Text;
using EMS.EMS.User_Account;
using System.Web.Services.Description;
using static System.Collections.Specialized.BitVector32;

namespace EMS.EMS.ExportEmployee
{
    public partial class ExportEmployee : System.Web.UI.Page
    {
        EncryptionAndDeccryption encryptionAndDeccryption = new EncryptionAndDeccryption();
        CustomizeEmployee customizeEmployee = new CustomizeEmployee();
        StringBuilder html = new StringBuilder();
        string DecryptedValue = "";
        string EmployeeCNIC = "";
        string DXCodesComplete = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string Action = Request.Form["Action"];
            if (Action == "LoadReport")
            {
                LoadColumnList();
                return;
            }
            DataSet Ds = new DataSet();

            Ds = customizeEmployee.GetActualListColumn();
            DataTable dt = Ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Select1.Items.Add(dt.Rows[i][0].ToString());
            }
            LoadEmployeeNames();
            LoadDesignation();
        }
        public void LoadColumnList()
        {


            int? Rows = 10;
            string RequiredColumn = Request.Form["RequiredColumns"];
            string MaxEmployeeID = Request.Form["MaxEmployeeID"];
            string MaxEmployeeName = Request.Form["EmployeeName"];
            string FirstName = "";
            string LastName = "";
            string Gender = Request.Form["Gender"];
            string Shift = Request.Form["Shift"];
            string Designation = Request.Form["Designation"];
            string Department = Request.Form["Department"];
            string Location = Request.Form["Location"];
            bool ActiveStatus = bool.Parse(Request.Form["ActiveStatus"]);
            if (!string.IsNullOrEmpty(Request.Form["Rows"]))
            {
                Rows = int.Parse(Request.Form["Rows"].ToString());
            }
            else
            {
                Rows = null;
            }
            if (!string.IsNullOrEmpty(MaxEmployeeName))
            {
                FirstName = MaxEmployeeName.Split(' ')[0];
                LastName = MaxEmployeeName.Split(' ')[1];
            }
            DataSet Ds = new DataSet();
            Ds = customizeEmployee.getDynamicEmployeeCustomize(RequiredColumn, Rows, MaxEmployeeID, Gender, Shift, Designation, Department, Location, ActiveStatus, FirstName, LastName);
            DataTable dt = Ds.Tables[1];
            html.Append("<table class='table' id='ExportEmployee'>");
            html.Append("<tr class='InfoHeader'>");
            html.Append("<p>"
                + "To View all records Click on Save / Print Button");
            html.Append("</p>");
            html.Append("</tr>");
            //Building the Header row.
            html.Append("<tr>");
            foreach (DataColumn column in dt.Columns)
            {
                html.Append("<th style='width: 15px: padding: 5px 5px'>");
                html.Append(column.ColumnName);
                html.Append("</th>");
            }
            html.Append("</tr>");
            foreach (DataRow row in dt.Rows)
            {
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    if (row[column.ColumnName].GetType() == typeof(Int64) || row[column.ColumnName].GetType() == typeof(decimal))
                    {

                        if (row[column.ColumnName].GetType() == typeof(decimal))
                        {
                            html.Append("<td style='position:relative;text-align:center !important; height: 0px;width:2%; display:tabel-cell;'>");
                            html.Append(Math.Round((decimal)(row[column.ColumnName]), 2));
                            html.Append("</td>");
                        }
                        else
                        {
                            html.Append("<td style='position:relative;text-align:center !important; height: 0px;width:2%; display:tabel-cell;'>");
                            html.Append(row[column.ColumnName]);
                            html.Append("</td>");
                        }
                    }
                    else if (column.ColumnName == "ContactNumber" || column.ColumnName == "EmployeeCNIC" ||
                             column.ColumnName == "TotalAllowance" || column.ColumnName == "IBANNumber" ||
                             column.ColumnName == "GivenAllowance" || column.ColumnName == "PreviousSalary" ||
                             column.ColumnName == "AccountNumber" || column.ColumnName == "MedicalAllowance" ||
                             column.ColumnName == "IncrementAmount" || column.ColumnName == "CurrentSalary" ||
                             column.ColumnName == "DearnessAllowance" || column.ColumnName == "AccountTitle" ||
                             column.ColumnName == "TravellingAllowance" || column.ColumnName == "OtherAllowance" ||
                             column.ColumnName == "ProvidentFund" || column.ColumnName == "Tax"
                             )

                    {
                        DecryptedValue = (column.ColumnName == "ContactNumber") ? row["ContactNumber"].ToString() :
                                         (column.ColumnName == "EmployeeCNIC") ? row["EmployeeCNIC"].ToString() :
                                         (column.ColumnName == "TotalAllowance") ? row["TotalAllowance"].ToString() :
                                         (column.ColumnName == "IBANNumber") ? row["IBANNumber"].ToString() :
                                         (column.ColumnName == "ProvidentFund") ? row["ProvidentFund"].ToString() :
                                         (column.ColumnName == "GivenAllowance") ? row["GivenAllowance"].ToString() :
                                         (column.ColumnName == "PreviousSalary") ? row["PreviousSalary"].ToString() :
                                         (column.ColumnName == "AccountNumber") ? row["AccountNumber"].ToString() :
                                         (column.ColumnName == "MedicalAllowance") ? row["MedicalAllowance"].ToString() :
                                         (column.ColumnName == "IncrementAmount") ? row["IncrementAmount"].ToString() :
                                         (column.ColumnName == "CurrentSalary") ? row["CurrentSalary"].ToString() :
                                         (column.ColumnName == "DearnessAllowance") ? row["DearnessAllowance"].ToString() :
                                         (column.ColumnName == "AccountTitle") ? row["AccountTitle"].ToString() :
                                         (column.ColumnName == "TravellingAllowance") ? row["TravellingAllowance"].ToString() :
                                         (column.ColumnName == "Tax") ? row["Tax"].ToString() :
                                         row["OtherAllowance"].ToString();

                        DecryptedValue = encryptionAndDeccryption.Decrypt(DecryptedValue).ToString();
                        if (DecryptedValue.All(char.IsDigit))
                        {
                            html.Append("<td style='height: 0px;width:1%;text-align:right !important'>" + DecryptedValue);
                            html.Append("</td>");
                        }
                        else
                        {
                            html.Append("<td style='height: 0px;width:1%;text-align:left !important'>" + DecryptedValue);
                            html.Append("</td>");
                        }
                    }
                    else
                    {
                        html.Append("<td style='height: 0px;text-align:left;width:2%; display:tabel-cell'>");
                        html.Append(row[column.ColumnName]);
                        html.Append("</td>");
                    }
                }
                html.Append("</tr>");
            }
            //Table end.
            html.Append("</table>");

            //Append the HTML string to Placeholder.
            ViewEmployeeReport.Controls.Add(new Literal { Text = html.ToString() });
        }
        public void LoadEmployeeNames()
        {
            EmployeeDB employeeDB = new EmployeeDB();


            DataSet ds = new DataSet();
            ds = employeeDB.GetAllEmployees(900000);
            DDFilterEmpName.DataSource = ds.Tables[0];
            DDFilterEmpName.DataTextField = "EmployeeName";
            DDFilterEmpName.DataValueField = "EmployeeName";
            DDFilterEmpName.DataBind();
            DDFilterEmpName.Items.Insert(0, new ListItem("Select Employee", ""));


        }
        public void LoadDesignation()
        {

            EmployeeDB employeeDB = new EmployeeDB();
            DataTable Designation = new DataTable();
            Designation = employeeDB.GetEmployeeDesignation();
            DDFilterDesignation.DataSource = Designation;
            DDFilterDesignation.DataValueField = "DesignationId";
            DDFilterDesignation.DataTextField = "DesignationName";
            DDFilterDesignation.DataBind();
            DDFilterDesignation.Items.Insert(0, new ListItem("Select Designation", ""));
        }
    }
}