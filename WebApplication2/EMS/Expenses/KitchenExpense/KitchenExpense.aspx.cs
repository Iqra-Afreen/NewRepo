using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using EMS.App_Code.DAL;
using System.Data;

namespace EMS.EMS.Expenses.KitchenExpense
{
    public partial class KitchenExpense : System.Web.UI.Page
    {
        ExpensesDB expensesDB = new ExpensesDB();
        protected void Page_Load(object sender, EventArgs e)
        {
           
                GetKitchenExpense();
           
        }
        public void GetKitchenExpense()
        {

            DataSet ds =  expensesDB.GetKitchenExpense(10, 0); 
            if (ds.Tables.Count > 0)
            {
                rptKitchenExpense.DataSource = ds.Tables[0];
                rptKitchenExpense.DataBind();
                hdnTotalRows.Value = ds.Tables[1].Rows[0]["TotalRows"].ToString();
            }

        } 
     
    }
}