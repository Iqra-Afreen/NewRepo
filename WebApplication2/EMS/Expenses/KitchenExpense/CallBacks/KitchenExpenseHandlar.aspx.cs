using EMS.App_Code.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using EMS.App_Code.BO;

namespace EMS.EMS.Expenses.KitchenExpense.CallBacks
{
    public partial class KitchenExpenseHandlar : System.Web.UI.Page
    {
       
        int Pagenumber = 0;
        int Rows = 10;
        protected void Page_Load(object sender, EventArgs e)
        {
            string action = Request.Form["action"];
            if (action == "SearchkitchenExpense")
            {
                SearchkitchenExpense();

            } 
            if (action == "insertdata")
            {
                insertdata();

            }
            if (action == "Deleterecord")
            {
                Deleterecord();
            }  
            if (action == "updatekitchenExpense")
            {
                updatekitchenExpense();
            } 
            if (action == "FilterKitchenExpense")
            {
                FilterKitchenExpense();
            }
        }
        public void insertdata()
        {
            ExpensesDB expensesDB = new ExpensesDB();
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            UtilityExpenses objkitechenItem = serializer.Deserialize<UtilityExpenses>(Request.Form["listaddItem"]);
            expensesDB.addkitechenItems(objkitechenItem);
            FilterKitchenExpense();

        }
        public void SearchkitchenExpense()
        {
            ExpensesDB expensesDB = new ExpensesDB();
            string item = Request.Form["ItemName"];
            string PurchasedBy = Request.Form["PurchasedBy"];
            string Purchasedates = Request.Form["Purchasedates"];
            if (!string.IsNullOrEmpty(Request.Form["Pagenumber"]))
            {
                Pagenumber = int.Parse(Request.Form["Pagenumber"]);
            }
            if (!string.IsNullOrEmpty(Request.Form["Rows"]))
            {
                Rows = int.Parse(Request.Form["Rows"]);
            }

            DataSet ds = expensesDB.GetKitchenExpense(Rows, Pagenumber, item, PurchasedBy, Purchasedates);
            if (ds.Tables.Count > 0)
            {
                rptKitchenExpense.DataSource = ds.Tables[0];
                rptKitchenExpense.DataBind();
                hdnTotalRows.Value = ds.Tables[1].Rows[0]["TotalRows"].ToString();
            }

        }
        public void Deleterecord()
        {
            ExpensesDB expensesDB = new ExpensesDB();
            DataSet Ds = new DataSet();
            long kitchenExpenseids = long.Parse(Request.Form["kitchenExpenseids"]);
            Ds = expensesDB.deleteKitchenExpense(kitchenExpenseids);
            FilterKitchenExpense();


        }
        public void updatekitchenExpense()
        {
            ExpensesDB expensesDB = new ExpensesDB();
            DataSet Ds = new DataSet();
            long kitchenExpenseids = long.Parse(Request.Form["KitchenExpenseID"]);

            string Item = Request.Form["Item"];
            string PurchaseBy = Request.Form["PurchaseBy"];
            string PurchaseDate = Request.Form["PurchaseDate"];
            string Category = Request.Form["Category"];
            string Unitcost = Request.Form["Unitcost"];
            string Qty = Request.Form["Qty"];
            string TotalPrice = Request.Form["TotalPrice"];
            string Amount = Request.Form["Amount"];
            string Discount = Request.Form["Discount"];
            string PurchaseFrom = Request.Form["PurchaseFrom"];

            Ds = expensesDB.updatekitchenExpense(kitchenExpenseids, Item, PurchaseBy, PurchaseDate, Category, Unitcost, Qty, TotalPrice, Amount, Discount, PurchaseFrom);
            FilterKitchenExpense();


        }
        public void FilterKitchenExpense()
        {
            ExpensesDB expensesDB = new ExpensesDB();
            string Item = "";
            string PurchaseBy = "";
            string PurchaseDate = "";
            if (!string.IsNullOrEmpty(Request.Form["ItemName"]))
            {

                 Item = Request.Form["ItemName"];
            }
            if (!string.IsNullOrEmpty(Request.Form["PurchasedBys"]))
            {

                 PurchaseBy = Request.Form["PurchasedBys"];
            }
            if (!string.IsNullOrEmpty(Request.Form["Purchasedatess"]))
            {

                 PurchaseDate = Request.Form["Purchasedatess"];
            }
            if (!string.IsNullOrEmpty(Request.Form["Pagenumber"]))
            {
                 Pagenumber = int.Parse(Request.Form["Pagenumber"]);
            }
            if (!string.IsNullOrEmpty(Request.Form["Rows"]))
            {
                 Rows = int.Parse(Request.Form["Rows"]);
            }
            DataSet ds1 = expensesDB.GetKitchenExpense(Rows, Pagenumber, Item, PurchaseBy, PurchaseDate);
            if (ds1.Tables.Count > 0)
            {
                rptKitchenExpense.DataSource = ds1.Tables[0];
                rptKitchenExpense.DataBind();
                hdnTotalRows.Value = ds1.Tables[1].Rows[0]["TotalRows"].ToString();
            }
        }
    }
}