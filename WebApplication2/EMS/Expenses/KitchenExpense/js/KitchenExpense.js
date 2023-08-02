var kitchenExpenseids = "";
var HandlarPath = "/EMS/Expenses/KitchenExpense/CallBacks/KitchenExpenseHandlar.aspx";
var FilePath = "/EMS/Expenses/KitchenExpense/KitchenExpense.aspx";

//$(document).ready(function () {
 



//});
function myFunction() {
    debugger
    var x = document.getElementById("#fa-plus");
    if (x.style.display == "none") {
        x.style.display = "none";
    } else {
        x.style.display = "block";
    }

}

function closeDialog() {
    const dialog = document.getElementById("Edit_Item");
    debugger
    dialog.style.display = 'none';
}
$(document).ready(function () {
    debugger
    GeneratePaging($("[id$='hdnTotalRows']").val(), $("#ddlKitchenExpense").val(), "divKitchenExpense", "FilterKitchenExpense");
    if ($("[id$='hdnTotalRows']").val() > 0) {

        $("#divKitchenExpense .spanInfo").html("Showing " + $("#KitchenExpenses tr:first").children().eq(0).html() + " to "
            + $("#KitchenExpenses tr:last").children().eq(0).html() + " of " + $("[id$='hdnTotalRows']").val() + " entries");
    }
    debugger


    $("#myDIV").click(function () {
        debugger
        if ($("#Tablebody tr").length > 1) {
            $(".clone").remove("#Tablebody");
            $(this).find('#Tablebody tr').remove();
        }

    });
})
if ($('.datetimepicker').length > 0) {
    $('.datetimepicker').datetimepicker({
        format: 'DD/MM/YYYY',
        icons: {
            up: "fa fa-angle-up",
            down: "fa fa-angle-down",
            next: 'fa fa-angle-right',
            previous: 'fa fa-angle-left'
        }
    });
}
$("#fa-plus").click(function () {
    debugger
    $.post(HandlarPath, function (data) {
        debugger	
        var start = data.indexOf("###startAppendRow###") + 20;
        var end = data.indexOf("###EndAppendRow###")
        var returnhtml = $.trim(data.substring(start, end));
        $("#Tablebody").append(returnhtml)
         if ($("#Tablebody tr").length > 1) {
        $(".myDIV").show()
    }
    });
});
function addandremoveRow(action,elem) {
    debugger
    if (action == "Delete") {
        $(elem).closest("tr").remove();


    }
}
function calculateAmount(elem,action) {
    debugger
    if (action == "Edit") {
        var Unitcost = $(elem).closest("tr").find("#txtUnitCost").val();
        var Qty = $(elem).closest("tr").find("#txtQty").val()
        var Discount = $(elem).closest("tr").find("#txtDiscount").val();
        var txtTotalPrice = $(elem).closest("tr").find("#txtTotalPrice").val();
        if (txtTotalPrice != "") {
            if (Unitcost == "" && Qty == "" && Discount == "") {
                debugger
                $(elem).closest("tr").find("#txtAmount").val(txtTotalPrice)
            }
            if (Discount != "" && Unitcost != "") {
                var DiscountedUnitCost = Unitcost - (Unitcost * (Discount / 100));
                $(elem).closest("tr").find("#txtAmount").val(DiscountedUnitCost)
            }
            if (Unitcost != "" && Qty != "" && Discount != "") {
                var DiscountedUnitCost = Unitcost - (Unitcost * (Discount / 100));
                var TotalCostAfterDiscount = DiscountedUnitCost * Qty;
                $(elem).closest("tr").find("#txtAmount").val(TotalCostAfterDiscount)
            }
        }
    }
    else {
    var Unitcost = $(elem).closest("tr").find("#AddUnitCost").val();
    var Qty = $(elem).closest("tr").find("#AddQty").val()
    var Discount = $(elem).closest("tr").find("#AddDiscount").val();
    var AddTotalPrice = $(elem).closest("tr").find("#AddTotalPrice").val();
    if (AddTotalPrice != "") {
        if (Unitcost == "" && Qty == "" && Discount == "") {
            debugger
            $(elem).closest("tr").find("#AddAmount").val(AddTotalPrice)
        }
        if (Discount != "" && Unitcost!="") {
            var DiscountedUnitCost = Unitcost - (Unitcost * (Discount / 100));
            $(elem).closest("tr").find("#AddAmount").val(DiscountedUnitCost)
        }
        if (Unitcost != "" && Qty != "" && Discount != "") {
            var DiscountedUnitCost = Unitcost - (Unitcost * (Discount / 100));
            var TotalCostAfterDiscount = DiscountedUnitCost * Qty;
            $(elem).closest("tr").find("#AddAmount").val(TotalCostAfterDiscount)
        }
        }
    }
}

function AddkitchecnExp(elem) {
    debugger
    var listaddItem = new Array();
    var fileextention = "";
    $("#Tablebody tr").each(function () {
        debugger;
        var objaddItem = new Object();
        objaddItem.BillNo = $(elem).parentsUntil().find("#AddBillNo").val();
        objaddItem.PurchaseBy = $(elem).parentsUntil().find("#AddPurchaseBy").val();
        objaddItem.PurchaseDate = $(elem).parentsUntil().find("#AddPurchaseDate").val();
        var Date1 = objaddItem.PurchaseDate;
        var Date = Date1.split("/")
        var month = Date[1];
        var day = Date[0];
        var year = Date[2];
        objaddItem.PurchaseDate = (year + '/' + month+'/'+day)
        objaddItem.PurchaseFrom = $(elem).parentsUntil().find("#AddPurchaseFrom").val();
        objaddItem.Item = $(this).closest('tr').find("td").find(".AddItem").val();
        objaddItem.Unitcost = $(this).closest('tr').find("td").find("#AddUnitCost").val();
        objaddItem.Qty = $(this).closest('tr').find("td").find("#AddQty").val()
        objaddItem.Discount = $(this).closest('tr').find("td").find("#AddDiscount").val();
        objaddItem.TotalPrice = $(this).closest('tr').find("td").find("#AddTotalPrice").val();
        objaddItem.Category = $(this).closest('tr').find("td").find("#AddCategory").val();
        objaddItem.Amount = $(this).closest('tr').find("td").find("#AddAmount").val();
        listaddItem.push(objaddItem);
  

        $.post(HandlarPath, { listaddItem: JSON.stringify(objaddItem), Action: "insertdata" }, function (data) {
            debugger
            debugger

            var start = data.indexOf("###StartKitchenExpense###") + 25;
            var end = data.indexOf("###EndKitchenExpense###")
            var returnhtml = $.trim(data.substring(start, end));
            $(".KitchenExpense").html(returnhtml)
            debugger
            GeneratePaging($("[id$='hdnTotalRows']").val(), $("#ddlKitchenExpense").val(), "divKitchenExpense", "FilterKitchenExpense");
            if ($("[id$='hdnTotalRows']").val() > 0) {

                $("#divKitchenExpense .spanInfo").html("Showing " + $("#KitchenExpenses tr:first").children().eq(0).html() + " to "
                    + $("#KitchenExpenses tr:last").children().eq(0).html() + " of " + $("[id$='hdnTotalRows']").val() + " entries");
            }
    });
    });
}
function SearchKitchenExpense(PageNumber, Paging) {
    debugger
    var ItemName = $("#ItemName").val();
    var PurchasedBy = $("#PurchasedBy").val();
    var Purchasedates = $("#Purchasedates").val();
    var parms = {
        ItemName: ItemName,
        PurchasedBy: PurchasedBy,
        Purchasedates: Purchasedates,
        action:"SearchkitchenExpense"
    }


    $.post(HandlarPath, parms, function (data) {
        debugger
     
        var start = data.indexOf("###StartKitchenExpense###") + 25;
        var end = data.indexOf("###EndKitchenExpense###")
        var returnhtml = $.trim(data.substring(start, end));
        $(".KitchenExpense").html(returnhtml)
        debugger
        GeneratePaging($("[id$='hdnTotalRows']").val(), $("#ddlKitchenExpense").val(), "divKitchenExpense", "FilterKitchenExpense");
        if ($("[id$='hdnTotalRows']").val() > 0) {

            $("#divKitchenExpense .spanInfo").html("Showing " + $("#KitchenExpenses tr:first").children().eq(0).html() + " to "
                + $("#KitchenExpenses tr:last").children().eq(0).html() + " of " + $("[id$='hdnTotalRows']").val() + " entries");
        }

    });
}
function DeleteRecord(elem,actions) {
    debugger
    if (actions == "getid") {
        var kitchenExpenseID = $.trim($(elem).closest("tr").find("#KitchenExpenseID").text());
        kitchenExpenseids = kitchenExpenseID;
    }
    if (actions == "Yesdelete") {
        var parms = {
            kitchenExpenseids: kitchenExpenseids,
            action: "Deleterecord"
        }
        $.post(HandlarPath, parms, function (data) {
            debugger

            var start = data.indexOf("###StartKitchenExpense###") + 25;
            var end = data.indexOf("###EndKitchenExpense###")
            var returnhtml = $.trim(data.substring(start, end));
            $(".KitchenExpense").html(returnhtml)
        });
    }
}
function GetDataForUpdate(elem) {
    debugger
    var BillNo= $.trim($(elem).closest("tr").find("#BillNo").text())
    var ROWNUMBER = $.trim($(elem).closest("tr").find("#ROWNUMBER").text())
    var Item = $.trim($(elem).closest("tr").find("#Item").text())
    var PurchaseBy = $.trim($(elem).closest("tr").find("#PurchaseBy").text())
    var PurchaseFrom = $.trim($(elem).closest("tr").find("#PurchaseFrom").text())
    var PurchaseDate = $.trim($(elem).closest("tr").find("#PurchaseDate").text())
    var Category = $.trim($(elem).closest("tr").find("#Category").text())
    var Unitcost = $.trim($(elem).closest("tr").find("#Unitcost").text())
    var Qty = $.trim($(elem).closest("tr").find("#Qty").text())
    var TotalPrice = $.trim($(elem).closest("tr").find("#TotalPrice").text())
    var Amount = $.trim($(elem).closest("tr").find("#Amount").text())
    var Discount = $.trim($(elem).closest("tr").find("#Discount").text())
    var KitchenExpenseID = $.trim($(elem).closest("tr").find("#KitchenExpenseID").text())

    $.post(HandlarPath, function (data) {
        debugger

        var start = data.indexOf("###StartEditkitchenExpense###") + 29;
        var end = data.indexOf("###EndEditkitchenExpense###")
        var returnhtml = $.trim(data.substring(start, end));
        $(".Edit_Item").html(returnhtml)
        $("#txtBillNo").val(BillNo);
        $("#txtPurchaseBy").val(PurchaseBy);
        $("#txtPurchaseDate").val(PurchaseDate);
        $("#txtCategory").val(Category);
        $("#txtUnitCost").val(Unitcost);
        $("#txtQty").val(Qty);
        $("#txtTotalPrice").val(TotalPrice);
        $("#txtAmount").val(Amount);
        $("#txtItem").val(Item);
        $("#txtDiscount").val(Discount);
        $("#txtPurchaseFrom").val(PurchaseFrom);
        $("#txtRownumber").html(ROWNUMBER);
        $("#txtKitchenExpenseID").html(KitchenExpenseID);
        debugger
        GeneratePaging($("[id$='hdnTotalRows']").val(), $("#ddlKitchenExpense").val(), "divKitchenExpense", "FilterKitchenExpense");
        if ($("[id$='hdnTotalRows']").val() > 0) {

            $("#divKitchenExpense .spanInfo").html("Showing " + $("#KitchenExpenses tr:first").children().eq(0).html() + " to "
                + $("#KitchenExpenses tr:last").children().eq(0).html() + " of " + $("[id$='hdnTotalRows']").val() + " entries");
        }
    });
}
function updatekitchecnExp(elem) {
    debugger
    var PurchaseBy=$("#txtPurchaseBy").val();
    var PurchaseDate = $("#txtPurchaseDate").val();
    var Category = $("#txtCategory").val();
    var Unitcost = $("#txtUnitCost").val();
    var Qty = $("#txtQty").val();
    var TotalPrice = $("#txtTotalPrice").val();
    var Amount = $("#txtAmount").val();
    var Item = $("#txtItem").val();
    var Discount = $("#txtDiscount").val();
    var PurchaseFrom= $("#txtPurchaseFrom").val();
    
    var KitchenExpenseID = $("#txtKitchenExpenseID").text();
    var parmas = {
        PurchaseBy: PurchaseBy,
        PurchaseDate: PurchaseDate,
        Category: Category,
        Unitcost: Unitcost,
        Qty: Qty,
        TotalPrice: TotalPrice,
        Amount: Amount,
        Item: Item,
        Discount: Discount,
        PurchaseFrom: PurchaseFrom,
        KitchenExpenseID: KitchenExpenseID,
        action:"updatekitchenExpense"
    }
    $.post(HandlarPath, parmas, function (data) {
        var start = data.indexOf("###StartKitchenExpense###") + 25;
        var end = data.indexOf("###EndKitchenExpense###")
        var returnhtml = $.trim(data.substring(start, end));
        $(".KitchenExpense").html(returnhtml)
        debugger
        GeneratePaging($("[id$='hdnTotalRows']").val(), $("#ddlKitchenExpense").val(), "divKitchenExpense", "FilterKitchenExpense");
        if ($("[id$='hdnTotalRows']").val() > 0) {

            $("#divKitchenExpense .spanInfo").html("Showing " + $("#KitchenExpenses tr:first").children().eq(0).html() + " to "
                + $("#KitchenExpenses tr:last").children().eq(0).html() + " of " + $("[id$='hdnTotalRows']").val() + " entries");
        }
        closeDialog();

    });
        
        
}
function ClearFields() {
    debugger
      $("#txtPurchaseBy").val("");
     $("#txtPurchaseDate").val("");
    $("#txtCategory").val("");
      $("#txtUnitCost").val("");
    $("#txtQty").val();
     $("#txtTotalPrice").val("");
     $("#txtAmount").val("");
      $("#txtItem").val("");
      $("#txtDiscount").val("");
    $("#txtPurchaseFrom").val("");

    $("#AddPurchaseBy").val("");
     $("#AddPurchaseDate").val("");
    $("#AddCategory").val("");
      $("#AddUnitCost").val("");
    $("#AddQty").val();
    $("#AddTotalPrice").val("");
    $("#AddAmount").val("");
    $("#AddItem").val("");
    $("#AddDiscount").val("");
    $("#AddPurchaseFrom").val("");
    $("#AddBillNo").val("");
}
function FilterKitchenExpense(Pagenumber, Paging) {
    debugger
    var Rows = $("#ddlKitchenExpense option:selected").val();
    var ItemName = $("#ItemName").val();
    var PurchasedBy = $("#PurchasedBy").val();
    var Purchasedates = $("#Purchasedates").val();
    var parmas = {
        Rows: Rows,
        Pagenumber: Pagenumber,
        ItemName: ItemName,
        PurchasedBys: PurchasedBy,
        Purchasedatess: Purchasedates,
        action:"FilterKitchenExpense"
    }
    $.post(HandlarPath, parmas, function (data) {
        var start = data.indexOf("###StartKitchenExpense###") + 25;
        var end = data.indexOf("###EndKitchenExpense###")
        var returnhtml = $.trim(data.substring(start, end));
        $(".KitchenExpense").html(returnhtml)
        debugger
        GeneratePaging($("[id$='hdnTotalRows']").val(), $("#ddlKitchenExpense").val(), "divKitchenExpense", "FilterKitchenExpense");
        if ($("[id$='hdnTotalRows']").val() > 0) {

            $("#divKitchenExpense .spanInfo").html("Showing " + $("#KitchenExpenses tr:first").children().eq(0).html() + " to "
                + $("#KitchenExpenses tr:last").children().eq(0).html() + " of " + $("[id$='hdnTotalRows']").val() + " entries");
        }
    })
}