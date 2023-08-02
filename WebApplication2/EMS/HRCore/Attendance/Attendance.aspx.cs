using EMS.App_Code.DAL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using static EMS.EMS.HRCore.Attendance.Attendance;

namespace EMS.EMS.HRCore.Attendance
{
    public partial class Attendance : System.Web.UI.Page
    {
        string EmpId = "";
        DateTime today = DateTime.Today;
        StringBuilder html = new StringBuilder();
        string Action = "";
        public class AttendanceDetails
        {
            public string AttendanceID { get; set; }
            public string EmployeeID { get; set; }
            public string EmployeeName { get; set; }
            public string Attendance { get; set; }
            public string AttendanceDay { get; set; }
            public DateTime AttendanceDate { get; set; }
            public string Description { get; set; }
        }
        List<AttendanceDetails> attendanceList = new List<AttendanceDetails>();
        List<string> employeeeIDs = new List<string>();
        Dictionary<string, string> EmployeeNames = new Dictionary<string, string>();
        EmployeeDB employeeDB = new EmployeeDB();
        EncryptionAndDeccryption encryptionAndDeccryption = new EncryptionAndDeccryption();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            Action = Request.Form["Action"];
            if (Action == "AddAttendance")
            {
                AddAttendance();
            }
            else if (Action == "UpdateAttendance")
            {
                UpdateAttendance();
            }
            LoadEmployeeNames();
            GetEmployeeAttendance();
        }
        public void LoadEmployeeNames()
        {
            EmployeeDB employeeDB = new EmployeeDB();
            string Location = "";
            string Shift = "";
            if (!string.IsNullOrEmpty(Request.Form["Location"]))
                Location = (Request.Form["Location"] == "All") ? "" : Request.Form["Location"];
            if (!string.IsNullOrEmpty(Request.Form["Shift"]))
                Shift = (Request.Form["Shift"] == "All") ? "" : Request.Form["Shift"];
            ds = employeeDB.GetAllEmployees(900000, 0, "", "", true, Location, Shift);

            DDSearchEmpName.DataSource = ds.Tables[0];
            DDSearchEmpName.DataTextField = "EmployeeNameID";
            DDSearchEmpName.DataValueField = "EmployeeID";
            DDSearchEmpName.DataBind();
            DDSearchEmpName.Items.Insert(0, new ListItem("All", ""));

            DDEmpName.DataSource = ds.Tables[0];
            DDEmpName.DataTextField = "EmployeeNameID";
            DDEmpName.DataValueField = "EmployeeID";
            DDEmpName.DataBind();
            DDEmpName.Items.Insert(0, new ListItem(" ", "0"));
            for (var i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                EmployeeNames.Add(ds.Tables[0].Rows[i]["EmployeeID"].ToString(), ds.Tables[0].Rows[i]["EmployeeNameID"].ToString());
            }
        }
        public void AddAttendance()
        {
            today = DateTime.Now;
            long id = 0;
            long EmployeeID = long.Parse(Request.Form["EmployeeID"]);
            string EmployeName = (Request.Form["Name"]=="All")?"": Request.Form["Name"];

            string AttendanceDate = Request.Form["AttendanceDate"];
            string Attendance = (Request.Form["Attendance"] == "Present") ? "P" : (Request.Form["Attendance"] == "Absent") ? "A" :
                (Request.Form["Attendance"] == "Short Leave") ? "SL" : Request.Form["Attendance"];
            string AttendanceTime = Request.Form["AttendanceTime"];
            string Description = Request.Form["Description"];
            id = employeeDB.AddAttendance(EmployeeID, EmployeName, AttendanceDate, Attendance, AttendanceTime, Description, today.ToString());

        }
        public void UpdateAttendance()
        {
            today = DateTime.Now;

            long id = 0;
            long AttendanceID = long.Parse(Request.Form["AttendanceID"]);
            string Attendance = (Request.Form["Attendance"] == "Present") ? "P" : (Request.Form["Attendance"] == "Absent") ? "A" :
                (Request.Form["Attendance"] == "Short Leave") ? "SL" : Request.Form["Attendance"];
            string Description = Request.Form["Description"];
            id = employeeDB.UpdateEmployeeAttendance(AttendanceID, Attendance, Description, today.ToString());
        }
        public void GetEmployeeAttendance()
        {
            string AttendanceMonth = today.ToString("MM");
            string AttendanceYear = today.ToString("yyyy");
            string EmployeeName = (Request.Form["EmployeeName"]=="All")?"": Request.Form["EmployeeName"];
            string Empid = Request.Form["EmpId"];
            string month = Request.Form["AttendanceMonth"];
            string year = Request.Form["AttendanceYear"];
            string Location = "";
            string Shift = "";
            if (!string.IsNullOrEmpty(Request.Form["Location"]))
                Location = (Request.Form["Location"] == "All") ? "" : Request.Form["Location"];
            if (!string.IsNullOrEmpty(Request.Form["Shift"]))
                Shift = (Request.Form["Shift"] == "All") ? "" : Request.Form["Shift"];
            EmployeeDB employeedb = new EmployeeDB();
            var d = DateTime.Now;
            var currentMonth = d.Month;
            var currentYear = d.Year;
            if (!string.IsNullOrEmpty(month))
            {
                AttendanceMonth = month.Trim();
                currentMonth = int.Parse(month.Trim());
            }
            if (!string.IsNullOrEmpty(year))
            {
                AttendanceYear = year.Trim();
                currentYear = int.Parse(year.Trim());
            }

            int days = DateTime.DaysInMonth(currentYear, currentMonth);

            ds = employeedb.GetEmployeesAttendance(EmployeeName, AttendanceMonth, AttendanceYear, Location, Shift);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                attendanceList = (from DataRow dr in dt.Rows
                                  select new AttendanceDetails()
                                  {
                                      AttendanceID = dr["AttendanceID"].ToString(),
                                      EmployeeID = dr["EmployeeID"].ToString(),
                                      EmployeeName = dr["EmployeeName"].ToString(),
                                      Attendance = dr["Attendance"].ToString(),
                                      AttendanceDay = dr["AttendanceDay"].ToString(),
                                      AttendanceDate = (DateTime)dr["AttendanceDate"],
                                      Description = dr["Description"].ToString(),

                                  }).ToList();
            }
            html.Append("<table class='table table-striped custom-table table-nowrap mb-0 divForPrint' id='EmployeeAttendance'>");
            html.Append("<thead>");
            html.Append("<tr class='TableHead'><th rowspan='3' class='AttendTableEmployee'>Employee</th>");
            html.Append("<th colspan='" + days + "' style='text-align:center'> Days</th>");
            html.Append("</tr>");
            html.Append("<tr>");
            for (int i = 1; i <= days; i++)
            {
                DateTime dateValue = new DateTime(int.Parse(AttendanceYear), int.Parse(AttendanceMonth), i);
                string dayName = dateValue.ToString("ddd");
                html.Append("<th style='text-align:center'><span class='DaysNames'>" + dayName + "</span></br>" + i + "</th>");
            }
            html.Append("</tr>");
            html.Append("</thead>");
            html.Append("<tbody class='EmpDetails'>");


            foreach (DataRow dr in dt.Rows)
            {
                string description = "";
                string date = "";
                int day = 1;
                string EmployeeID = dr["EmployeeID"].ToString();
                string EmpName = dr["EmployeeName"].ToString();

                if (EmpId != EmployeeID)
                {
                    EmployeeNames.Remove(EmployeeID);
                    if (!employeeeIDs.Contains(EmployeeID))
                    {

                        html.Append("<tr>");

                        var attendanceDetail = from Attendance in attendanceList
                                               where Attendance.EmployeeID == EmployeeID
                                               select Attendance;

                        if (attendanceDetail.Count() > 0)
                        {
                            html.Append("<td class='EmployeeName' title='" + EmpName + "'><span class='EmpName'>" + EmpName + "</span>");
                            html.Append("</td>");
                            foreach (var AttendanceList in attendanceDetail)
                            {
                                var count = int.Parse(AttendanceList.AttendanceDay);

                                for (; day <= count;)
                                {
                                    description = AttendanceList.Description.ToString();
                                    date = AttendanceList.AttendanceDate.ToString("MM/dd/yyyy");
                                    if (day == int.Parse(AttendanceList.AttendanceDay))
                                    {
                                        html.Append("<td class='Attendance text-center' title='Update Attendance' style='cursor:pointer' onclick=UpdateAttendance('" + date + "','" + description + "','" + AttendanceList.Attendance + "','" + AttendanceList.AttendanceID + "',this)  style='text-align:center'>" + AttendanceList.Attendance);
                                        html.Append("</td>");
                                    }
                                    else
                                    {
                                        html.Append("<td class='Attendance text-center' title='Add Attendance' style='cursor:pointer' onclick=OpenAttendanceModal('" + string.Concat(AttendanceMonth, '/', day, '/', AttendanceYear) + "','" + EmployeeID + "',this)>");
                                        html.Append("</td>");
                                    }
                                    day++;
                                }
                            }
                            for (; day <= days; day++)
                            {
                                html.Append("<td class='Attendance text-center' title='Add Attendance' style='cursor:pointer' onclick=OpenAttendanceModal('" + string.Concat(AttendanceMonth, '/', day, '/', AttendanceYear) + "','" + EmployeeID + "',this)>");
                                html.Append("</td>");
                            }
                        }
                    }
                    employeeeIDs.Add(EmployeeID);
                }
                EmpId = EmployeeID;
                html.Append("</tr>");
            }
            //Filtering
            if (string.IsNullOrEmpty(EmployeeName))
            {
                foreach (KeyValuePair<string, string> empName in EmployeeNames)
                {
                    int day = 1;
                    html.Append("<tr class='EmployeeName' title='" + empName.Value + "'><td><span class='EmpName'>" + empName.Value + "</td></span>");
                    for (; day <= days;)
                    {
                        html.Append("<td class='Attendance text-center' title='Add Attendance' style='cursor:pointer' onclick=OpenAttendanceModal('" + string.Concat(AttendanceMonth, '/', day, '/', AttendanceYear) + "','" + empName.Key + "',this)>");
                        html.Append("</td>");
                        day++;
                    }
                    html.Append("</tr>");
                }
            }
            //For Empty Record
            if (!string.IsNullOrEmpty(EmployeeName) && dt.Rows.Count == 0)
            {
                int day = 1;
                html.Append("<tr class='EmployeeName' title='" + EmployeeName + "'><td><span class='EmpName'>" + EmployeeName + "</td></span>");
                for (; day <= days;)
                {
                    html.Append("<td class='Attendance text-center' title='Add Attendance' style='cursor:pointer' onclick=OpenAttendanceModal('" + string.Concat(AttendanceMonth, '/', day, '/', AttendanceYear) + "','" + Empid + "',this)>");
                    html.Append("</td>");
                    day++;
                }
                html.Append("</tr>");
            }
            html.Append("</tbody>");
            html.Append("</table>");

            ViewEmployeeAttendance.Controls.Add(new Literal { Text = html.ToString() });
            hdnEmpID.Value = html.ToString();

        }
    }
}