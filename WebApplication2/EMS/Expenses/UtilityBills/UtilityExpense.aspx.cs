﻿using EMS.App_Code.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS.EMS.Expenses.UtilityBills
{
    public partial class UtilityExpense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ExpensesDB objExpensesDB = new ExpensesDB();
           
            DataSet ds = objExpensesDB.GetUtilityExpenses(0, 10, 0, "", "", "");
            if (ds.Tables[0].Rows.Count > 0)
            {
                rptUExpenses.DataSource = ds.Tables[0];
                rptUExpenses.DataBind();
               
            }
            hdnUExpenseRows.Value = ds.Tables[1].Rows[0]["TotalRows"].ToString();

        }
    }
}