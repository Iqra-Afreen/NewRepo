using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using EMS.App_Code.DAL;
using System.Data;
using System.Xml;
using System.Web.UI.WebControls;
using EMS.App_Code.BO;
using EMS.EMS.Expenses.OtherExpense;

namespace EMS.EMS.Expenses.UtilityBills.Callbacks
{
    public partial class UtilityExpenseHandler : System.Web.UI.Page
    {
        string Action = "";
        ExpensesDB objExpensesDB = new ExpensesDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.Form["Action"])) {
                Action = Request.Form["Action"];
            }
            if (Action == "AddUpdateUtilities")
            {
                AddUtilitesExpense();
                FilterUtilities();
                
            }
           
           else if (Action == "FilterUtilityExpenses")
            {
                FilterUtilities();
              
            }
           else if (Action == "DeleteUtility")
            {
                DeleteUtilityExpenses();
                FilterUtilities();
               
            }
            //For Employee Expense
           else if (Action == "AddUpdateEmpExpenses")
            {
                AddEditEmployeeExpense();
                FilterEmployeeExpenses();
               
            }

          else if (Action == "FilterEmpExpenses")
            {
                FilterEmployeeExpenses();
               
            }
          else if (Action == "DeleteEmpExpense")
            {
                DeleteEmployeeExpenses();
                FilterEmployeeExpenses();
               
            }
            //End
            //For Other Expense
            else if (Action == "AddUpdateOthExpenses")
            {
                AddEditOtherExpense();
                FilterOtherExpenses();

            }

            else if (Action == "FilterOthExpenses")
            {
                FilterOtherExpenses();

            }
            else if (Action == "DeleteOthExpense")
            {
                DeleteOtherExpenses();
                FilterOtherExpenses();

            }
            //End
        }
        //For Utility Expenses
        public void AddUtilitesExpense()
        {
            string Callfrom = "";
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            ExpensesDB objExpensesDB = new ExpensesDB();
            UtilityExpenseBO objUtilityExpenses = serializer.Deserialize<UtilityExpenseBO>(Request.Form["objUtilityEx"]);
            objUtilityExpenses.CreatedById = 0;
            if (!String.IsNullOrEmpty(Request.Form["CallFrom"]))
            {
                Callfrom = Request.Form["CallFrom"].ToString();
            } 
            if (Callfrom == "Update")
            {
                objExpensesDB.UpdateUtilityExpense(objUtilityExpenses);
            }
            else
            {
                objExpensesDB.AddUtilityExpense(objUtilityExpenses);
            }
        }
       
        public void FilterUtilities()
        {
           
            long UtilityExpenseID = 0;
            string BillType = "";
            string PaymentMethod = "";
            string PaymentDate = "";
            int PageNumber = 0;
            int Rows = 10;
            if (!String.IsNullOrEmpty(Request.Form["BillType"]))
            {
                BillType = Request.Form["BillType"].ToString();
            }
            if (!String.IsNullOrEmpty(Request.Form["PaymentMethod"]))
            {
                PaymentMethod = Request.Form["PaymentMethod"].ToString();
            }
            if (!String.IsNullOrEmpty(Request.Form["PaymentDate"]))
            {
                PaymentDate = Request.Form["PaymentDate"].ToString();
            }
            if (!String.IsNullOrEmpty(Request.Form["Pagenumber"]))
            {
                PageNumber = Convert.ToInt32(Request.Form["Pagenumber"]);
            }
            if (!String.IsNullOrEmpty(Request.Form["Rows"]))
            {
                Rows = Convert.ToInt32(Request.Form["Rows"]);
            }

            DataSet ds = objExpensesDB.GetUtilityExpenses(PageNumber, Rows, UtilityExpenseID, BillType, PaymentMethod, PaymentDate);
             rptUExpenses.DataSource = ds.Tables[0];
                rptUExpenses.DataBind();
                hdnUExpenseRows.Value = ds.Tables[1].Rows[0]["TotalRows"].ToString();
        }
        public void DeleteUtilityExpenses()
        {
            long UtilityExpenseID = 0;
            ExpensesDB objExpensesDB = new ExpensesDB();

            if (!String.IsNullOrEmpty(Request.Form["UtilityExpenseID"]))
            {
                UtilityExpenseID = Convert.ToInt32(Request.Form["UtilityExpenseID"]);
            }

          long UtilityId = objExpensesDB.DeleteUtilityExpense(UtilityExpenseID);
            
        }
        //End

        //For Employee Expenses
        public void AddEditEmployeeExpense()
        {
            string Callfrom = "";
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            ExpensesDB objExpensesDB = new ExpensesDB();
            UtilityExpenseBO objEmpExpenses = serializer.Deserialize<UtilityExpenseBO>(Request.Form["objEmployeeEx"]);
            objEmpExpenses.CreatedById = 0;
            if (!String.IsNullOrEmpty(Request.Form["CallFrom"]))
            {
                Callfrom = Request.Form["CallFrom"].ToString();
            }
            if (Callfrom == "Update")
            {
                objExpensesDB.UpdateEmployeeExpense(objEmpExpenses);
            }
            else
            {
                objExpensesDB.AddEmployeeExpense(objEmpExpenses);
            }
        }

        public void FilterEmployeeExpenses()
        {

            long EmployeeExpenseID = 0;
            string ExpenseType = "";
            string Status = "";
            string PaymentDate = "";
            int PageNumber = 0;
            int Rows = 10;
            if (!String.IsNullOrEmpty(Request.Form["ExpenseType"]))
            {
                ExpenseType = Request.Form["ExpenseType"].ToString();
            }
            if (!String.IsNullOrEmpty(Request.Form["EmpExStatus"]))
            {
                Status = Request.Form["EmpExStatus"].ToString();
            }
            if (!String.IsNullOrEmpty(Request.Form["PaymentDate"]))
            {
                PaymentDate = Request.Form["PaymentDate"].ToString();
            }
            if (!String.IsNullOrEmpty(Request.Form["Pagenumber"]))
            {
                PageNumber = Convert.ToInt32(Request.Form["Pagenumber"]);
            }
            if (!String.IsNullOrEmpty(Request.Form["Rows"]))
            {
                Rows = Convert.ToInt32(Request.Form["Rows"]);
            }

            DataSet ds = objExpensesDB.GetEmployeeExpenses(PageNumber, Rows, EmployeeExpenseID, ExpenseType, Status, PaymentDate);
            if (ds.Tables[0].Rows.Count > 0)
            {
                rptEmpExpenses.DataSource = ds.Tables[0];
                rptEmpExpenses.DataBind();
               
            }
            hdnEmpExpenseRows.Value = ds.Tables[1].Rows[0]["TotalRows"].ToString();
        }
        public void DeleteEmployeeExpenses()
        {
            long EmployeeExpenseID = 0;
            ExpensesDB objExpensesDB = new ExpensesDB();

            if (!String.IsNullOrEmpty(Request.Form["EmployeeExpenseID"]))
            {
                EmployeeExpenseID = Convert.ToInt32(Request.Form["EmployeeExpenseID"]);
            }

            long EmpExpenseId = objExpensesDB.DeleteEmployeeExpense(EmployeeExpenseID);

        }
        //End

        //For Other Expenses
        public void AddEditOtherExpense()
        {
            string Callfrom = "";
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            ExpensesDB objExpensesDB = new ExpensesDB();
            UtilityExpenseBO objOthExpenses = serializer.Deserialize<UtilityExpenseBO>(Request.Form["objOtherExpenses"]);
            objOthExpenses.CreatedById = 0;
            if (!String.IsNullOrEmpty(Request.Form["CallFrom"]))
            {
                Callfrom = Request.Form["CallFrom"].ToString();
            }
            if (Callfrom == "Update")
            {
                objExpensesDB.UpdateOtherExpense(objOthExpenses);
            }
            else
            {
                objExpensesDB.AddOtherExpense(objOthExpenses);
            }
        }

        public void FilterOtherExpenses()
        {

            long OtherExpenseID = 0;
            string ExpenseType = "";
            string Status = "";
            string PaymentDate = "";
            int PageNumber = 0;
            int Rows = 10;
            if (!String.IsNullOrEmpty(Request.Form["ExpenseType"]))
            {
                ExpenseType = Request.Form["ExpenseType"].ToString();
            }
            if (!String.IsNullOrEmpty(Request.Form["EmpExStatus"]))
            {
                Status = Request.Form["EmpExStatus"].ToString();
            }
            if (!String.IsNullOrEmpty(Request.Form["PaymentDate"]))
            {
                PaymentDate = Request.Form["PaymentDate"].ToString();
            }
            if (!String.IsNullOrEmpty(Request.Form["Pagenumber"]))
            {
                PageNumber = Convert.ToInt32(Request.Form["Pagenumber"]);
            }
            if (!String.IsNullOrEmpty(Request.Form["Rows"]))
            {
                Rows = Convert.ToInt32(Request.Form["Rows"]);
            }

            DataSet ds = objExpensesDB.GetOtherExpenses(PageNumber, Rows, OtherExpenseID, ExpenseType, Status, PaymentDate);
            if (ds.Tables[0].Rows.Count > 0)
            {
                rptOthExpenses.DataSource = ds.Tables[0];
                rptOthExpenses.DataBind();
               
            }
            hdnOthExpenseRows.Value = ds.Tables[1].Rows[0]["TotalRows"].ToString();
        }
        public void DeleteOtherExpenses()
        {
            long OtherExpenseID = 0;
            ExpensesDB objExpensesDB = new ExpensesDB();

            if (!String.IsNullOrEmpty(Request.Form["OtherExpenseID"]))
            {
                OtherExpenseID = Convert.ToInt32(Request.Form["OtherExpenseID"]);
            }

            long EmpExpenseId = objExpensesDB.DeleteOtherExpense(OtherExpenseID);

        }
        //End

    }
}