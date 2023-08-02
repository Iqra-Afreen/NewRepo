/*Created By Faiza bilal 7-24-2023 */
//if ($("#UAttachment").click(function () {
//    UploadFileFormReadyCommon();
//}));
var _UtilityExpenseID = 0;
var _EmployeeExpenseID = 0;
var _OtherExpenseID = 0;
function UploadFileFormReadyCommon() {
    debugger;

    new AjaxUpload('#UAttachment', {

       
        action: 'EMS/EMSDocuments/DocumentsaveHandler.ashx',
        dataType: 'json',
        contentType: "application/json; charset=uft-8",
        data: {
            
        },
        onSubmit: function (file, ext, fileSize) {
            if ((ext && /^(exe|dll|bat)$/.test(ext))) {
                callDialog("Sorry! the file is invalid.", "Invalid File");
                return false;
            }

        },
        onComplete: function (file, response) {
            debugger;
            var responseHTML = $.parseJSON($(response).html());
            var fileString = "";
            $("[id$='fileLabel']").val("");
            if (file.length > 15) {
                StartfileString = file.substr(0, 7);
                EndfileString = file.slice(file.length - 7);
                fileString = StartfileString + "..." + EndfileString;
            }
            else {
                fileString = file;
            }

            $("[id$='fileLabel']").val(fileString);
            $("[id$='fileLabel']").attr("title", file);
            $("[id$='UAttachment']").append(
                ""
            );
            $("[id$='UAttachment']").append(
                '<input type="hidden" value="' + responseHTML.path +
                '"class="hdnPath" id="hdnFilePath"/><input type="hidden" value="' + responseHTML.fileName +
                '" class="hdnfile" id="hdnFileName" />'
            );

        }
    });
}
function ClearFields() {
    debugger;
    $('input[type="text"]').val("");
    $('input[type="date"]').val("");
    $('textarea').val("");
    $('#fileLabel').val("");
    $('#fileLabel').val("No File Choosen");
    $("option:selected").prop("selected", false);

}

//For Utility Expense
function AddUpdateUtilityExpense(_CallFrom) {
    debugger;
    var count = 0;
    var UtilityExpense = new Object();
    UtilityExpense.UtilityExpenseID = _UtilityExpenseID;
    UtilityExpense.CheckNo = $("[id$='UCheckNumber']").val() || "";
    UtilityExpense.CompanyName = $("[id$='UCompanyName']").val() || "";
    UtilityExpense.BillType = $("[id$='UBillType']").val() || "";
    UtilityExpense.BillAmount = $("[id$='UBillAmount']").val() || "";
    UtilityExpense.BillDate = $("[id$='UBillDate']").val() || "";
    UtilityExpense.PaidAmount = $("[id$='UPaidAmount']").val() || "";
    UtilityExpense.BalanceDue = $("[id$='UBalanceDue']").val() || "";
    UtilityExpense.PaymentMethod = $("[id$='UPaymentMethod']").val() || "";
    UtilityExpense.PaymentDate = $("[id$='UPaymentDate']").val() || "";
    UtilityExpense.PayeeName = $("[id$='UPayeeName']").val() || "";
    UtilityExpense.Attachement = $("[id$='hdnFileName']").val() || "";
    UtilityExpense.AttachementPath = $("[id$='hdnFilePath']").val() || "";
    UtilityExpense.Comments = $("[id$='UComments']").val() || "";
    
    $(".required").each(function () {
        if ($(this).val() == "") {
            $(this).css("border-color", "red");
            count++
        }
        else {
            $(this).css("border-color", "");
            $("#btnUtilityExpenses").attr("data-dismiss", "modal")
        }
    })
    if (count != 0) {
        $("#btnUtilityExpenses").removeAttr("data-dismiss")
        showErrorMessage("Please review the form carefully for the errors")
        return;
    }
    $("#Loader").show();
    $.post("/EMS/Expenses/UtilityBills/CallBacks/UtilityExpenseHandler.aspx", { objUtilityEx: JSON.stringify(UtilityExpense), Action: "AddUpdateUtilities", CallFrom: _CallFrom }, function (data) {
        var start = data.indexOf("###StartUtilityExpenses###") + 26;
        var end = data.indexOf("###EndUtilityExpenses###");
        var returnHtml = $.trim(data.substring(start, end));
        $(".UExpenseDetails").html(returnHtml);
     
            GeneratePaging($("[id$='hdnUExpenseRows']").val(), $("#ddlUExpenseDetails").val(), "divEmpDetails", "FilterUExpnesesDetails");
       
        if ($("[id$='hdnUExpenseRows']").val() > 0) {
           $("#divEmpDetails .spanInfo").html("Showing " + $("#UExpenseDetails tr:first").children().eq(0).html() + " to "
                + $("#UExpenseDetails tr:last").children().eq(0).html() + " of " + $("[id$='hdnUExpenseRows']").val() + " entries");
        }
        if (_CallFrom == "Add") {
            showSuccessMessage("Utility Expense is Added Successfully!");
        }
        else {
            showSuccessMessage("Utility Expense is Updated Successfully!");
        }
        ClearFields();
        $("#Loader").hide();
    })
   
   
}
function FilterUExpnesesDetails(PageNumber, Paging) {
    debugger;
   
    var param = {
        BillType: $("[id$='ddlBilltype']").val(),
        PaymentMethod: $("[id$='ddlPayMethod']").val(),
        PaymentDate: $("[id$='PayDate']").val(),
        Pagenumber: PageNumber,
        Paging: Paging,
        Rows: $("[id$='ddlUExpenseDetails']").val(),
        Action: "FilterUtilityExpenses"
    }
    $.post("EMS/Expenses/UtilityBills/CallBacks/UtilityExpenseHandler.aspx", param, function(data){
        var start = data.indexOf("###StartUtilityExpenses###") + 26;
        var end = data.indexOf("###EndUtilityExpenses###");
        var returnHtml = $.trim(data.substring(start, end));
        $(".UExpenseDetails").html(returnHtml);
        if (Paging == true) {
            GeneratePaging($("[id$='hdnUExpenseRows']").val(), $("#ddlUExpenseDetails").val(), "divUDetails", "FilterUExpnesesDetails");
        }

        if ($("[id$='hdnUExpenseRows']").val() > 0) {

            $("#divUDetails .spanInfo").html("Showing " + $("#UExpenseDetails tr:first").children().eq(0).html() + " to "
                + $("#UExpenseDetails tr:last").children().eq(0).html() + " of " + $("[id$='hdnUExpenseRows']").val() + " entries");
        }
        
    });
}
function DeleteUtility(elem) {
    debugger;
   
    
    $("#Loader").show()
    $.post("/EMS/Expenses/UtilityBills/CallBacks/UtilityExpenseHandler.aspx", { UtilityExpenseID: _UtilityExpenseID, Action: "DeleteUtility" }, function (data) {
        var start = data.indexOf("###StartUtilityExpenses###") + 26;
        var end = data.indexOf("###EndUtilityExpenses###");
        var returnHtml = $.trim(data.substring(start, end));
        $(".UExpenseDetails").html(returnHtml);
      
            GeneratePaging($("[id$='hdnUExpenseRows']").val(), $("#ddlUExpenseDetails").val(), "divEmpDetails", "FilterUExpnesesDetails");

        if ($("[id$='hdnUExpenseRows']").val() > 0) {

            $("#divEmpDetails .spanInfo").html("Showing " + $("#UExpenseDetails tr:first").children().eq(0).html() + " to "
                + $("#UExpenseDetails tr:last").children().eq(0).html() + " of " + $("[id$='hdnUExpenseRows']").val() + " entries");
        }
        showSuccessMessage("Utility Expense is Deleted Successfully!");
        
        $("#Loader").hide();
    })

}
function UpdateFieldsForm(elem, type) {
    $(".required").each(function () {
         $(this).css("border-color", "");
       })
    debugger;
    if (type == "Add") {
        ClearFields()
        $("[id$='TitleModal']").text("");
        $("[id$='TitleModal']").text("Add Utility Expense");
        $("[id$='btnUtilityExpenses']").val("");
        $("[id$='btnUtilityExpenses']").val("Add Expenses");
        $("[id$='btnUtilityExpenses']").attr("onclick", "AddUpdateUtilityExpense('Add')");
    }
    else if (type == "Update") {
        UploadFileFormReadyCommon();
        _UtilityExpenseID = $.trim($(elem).closest('tr').find(".hdnUtilityId").val());
        var hdnCheckNo = $.trim($(elem).closest('tr').find(".hdnCheckNo").val());
        var hdnCompanyName = $.trim($(elem).closest('tr').find(".hdnCompanyName").val());
        var hdnBillType = $.trim($(elem).closest('tr').find(".hdnBillType").val());
        var hdnBillAmount = $.trim($(elem).closest('tr').find(".hdnBillAmount").val());
        var hdnPaidAmount = $.trim($(elem).closest('tr').find(".hdnPaidAmount").val());
        var hdnPaymentDate = $.trim($(elem).closest('tr').find(".hdnPaymentDate").val());
        var hdnBillDate = $.trim($(elem).closest('tr').find(".hdnBillDate").val());
        var hdnBalanceDue = $.trim($(elem).closest('tr').find(".hdnBalanceDue").val());
        var hdnPaymentMethod = $.trim($(elem).closest('tr').find(".hdnPaymentMethod").val());
        var hdnPayeeName = $.trim($(elem).closest('tr').find(".hdnPayeeName").val());
        var hdnAttachment = $.trim($(elem).closest('tr').find(".hdnAttachment").val());
        var hdnFilePath = $.trim($(elem).closest('tr').find(".hdnFilePath").val());
        var hdnComments = $.trim($(elem).closest('tr').find(".hdnComments").val());
        $("[id$='TitleModal']").text("");
        $("[id$='TitleModal']").text("Update Utility Expense");
        $("[id$='btnUtilityExpenses']").val("");
        $("[id$='btnUtilityExpenses']").val("Update Expenses");
        $("[id$='btnUtilityExpenses']").attr("onclick", "AddUpdateUtilityExpense('Update')");

        $("[id$='UCheckNumber']").val(hdnCheckNo);
        $("[id$='UCompanyName']").val(hdnCompanyName);
        $("[id$='UBillType']").val(hdnBillType);
        $("[id$='UBillAmount']").val(hdnBillAmount);
        $("[id$='UBillDate']").val(hdnBillDate);
        $("[id$='UPaidAmount']").val(hdnPaidAmount);
        $("[id$='UBalanceDue']").val(hdnBalanceDue);
        $("[id$='UPaymentMethod']").val(hdnPaymentMethod);
        $("[id$='UPaymentDate']").val(hdnPaymentDate);
        $("[id$='UPayeeName']").val(hdnPayeeName);
        $("[id$='hdnFileName']").val(hdnAttachment);
        $("[id$='UComments']").val(hdnComments);
        $("[id$='hdnFilePath']").val(hdnFilePath);
        var fileString = "";
        $("[id$='fileLabel']").val("");
        if (hdnAttachment.length > 15) {
            var StartfileString = hdnAttachment.substring(0, 7);
            var EndfileString = hdnAttachment.slice(hdnAttachment.length - 7);
            fileString = StartfileString + "..." + EndfileString;
        }
        else {
            fileString = hdnAttachment;
        }

        $("[id$='fileLabel']").val(fileString);
    }
    else if (type == "Delete") {
        _UtilityExpenseID = $(elem).closest('tr').find(".hdnUtilityId").val();
    }
}
//End

//For Employee Expense
function FilterEmpExpnesesDetails(PageNumber, Paging) {
    debugger;

    var param = {
        ExpenseType: $("[id$='ddlExtype']").val(),
        EmpExStatus: $("[id$='EmpExStatus']").val(),
        PaymentDate: $("[id$='EExpPayDate']").val(),
        Pagenumber: PageNumber,
        Paging: Paging,
        Rows: $("[id$='ddlEmployeeExpDetails']").val(),
        Action: "FilterEmpExpenses"
    }
    $.post("EMS/Expenses/UtilityBills/CallBacks/UtilityExpenseHandler.aspx", param, function (data) {
        var start = data.indexOf("###StartExpExpenses###") + 22;
        var end = data.indexOf("###EndExpExpenses###");
        var returnHtml = $.trim(data.substring(start, end));
        $(".EmpExpenseDetails").html(returnHtml);
        if (Paging == true) {
            GeneratePaging($("[id$='hdnEmpExpenseRows']").val(), $("#ddlEmployeeExpDetails").val(), "divEmpExpDetails", "FilterEmpExpnesesDetails");
        }
       if ($("[id$='hdnEmpExpenseRows']").val() > 0) {

            $("#divEmpExpDetails .spanInfo").html("Showing " + $("#EmpExpenseDetails tr:first").children().eq(0).html() + " to "
                + $("#EmpExpenseDetails tr:last").children().eq(0).html() + " of " + $("[id$='hdnEmpExpenseRows']").val() + " entries");
        }
    });
}
function AddUpdateEmExpense(_CallFrom) {
    debugger;
    var count = 0;
    var EmployeeExpense = new Object();
    EmployeeExpense.EmployeeExpenseID = _EmployeeExpenseID;
  
    EmployeeExpense.ExpenseType = $("[id$='EType']").val() || "";
    EmployeeExpense.BillAmount = $("[id$='TotalAmount']").val() || "";
    EmployeeExpense.PaidAmount = $("[id$='EPaidAmount']").val() || "";
    EmployeeExpense.PaymentDate = $("[id$='EPaymentDate']").val() || "";
    EmployeeExpense.Status = $("[id$='EStatus']").val() || "";
    EmployeeExpense.Attachement = $("[id$='hdnFileName']").val() || "";
    EmployeeExpense.AttachementPath = $("[id$='hdnFilePath']").val() || "";
    EmployeeExpense.Comments = $("[id$='EComments']").val() || "";

    $(".required").each(function () {
        if ($(this).val() == "") {
            $(this).css("border-color", "red");
            count++
        }
        else {
            $(this).css("border-color", "");
            $("#btnAddEmployeeEx").attr("data-dismiss", "modal")
        }
    })
    if (count != 0) {
        $("#btnAddEmployeeEx").removeAttr("data-dismiss")
        showErrorMessage("Please review the form carefully for the errors")
        return;
    }
    $("#Loader").show();
    $.post("/EMS/Expenses/UtilityBills/CallBacks/UtilityExpenseHandler.aspx", { objEmployeeEx: JSON.stringify(EmployeeExpense), Action: "AddUpdateEmpExpenses", CallFrom: _CallFrom }, function (data) {
        var start = data.indexOf("###StartExpExpenses###") + 22;
        var end = data.indexOf("###EndExpExpenses###");
        var returnHtml = $.trim(data.substring(start, end));
        $(".EmpExpenseDetails").html(returnHtml);
        
            GeneratePaging($("[id$='hdnEmpExpenseRows']").val(), $("#ddlEmployeeExpDetails").val(), "divEmpExpDetails", "FilterEmpExpnesesDetails");
        
     if ($("[id$='hdnEmpExpenseRows']").val() > 0) {

            $("#divEmpExpDetails .spanInfo").html("Showing " + $("#EmpExpenseDetails tr:first").children().eq(0).html() + " to "
                + $("#EmpExpenseDetails tr:last").children().eq(0).html() + " of " + $("[id$='hdnEmpExpenseRows']").val() + " entries");
        }
        if (_CallFrom == "Add") {
            showSuccessMessage("Employee Expense is Added Successfully!");
        }
        else {
            showSuccessMessage("Employee Expense is Updated Successfully!");
        }
        ClearFields();
        $("#Loader").hide();
    })


}

function UpdateFieldsFormEmpExp(elem, type) {
    $(".required").each(function () {
        $(this).css("border-color", "");
    })
    debugger;
    if (type == "Add") {
        ClearFields();
        $("[id$='TitleModal']").text("");
        $("[id$='TitleModal']").text("Add Employee Expense");
        $("[id$='btnAddEmployeeEx']").val("");
        $("[id$='btnAddEmployeeEx']").val("Add Employee Expenses");
        $("[id$='btnAddEmployeeEx']").attr("onclick", "AddUpdateEmExpense('Add')");
    }
    else if (type == "Update") {
        UploadFileFormReadyCommon();
        _EmployeeExpenseID = $(elem).closest('tr').find(".hdnEmployeeExpenseID").val();
        var hdnExpenseType = $.trim($(elem).closest('tr').find(".hdnExpenseType").val());
        var hdnTotalAmmount = $.trim($(elem).closest('tr').find(".hdnTotalAmmount").val());
        var hdnPaidAmount = $.trim($(elem).closest('tr').find(".hdnPaidAmount").val());
        var hdnPaymentDate = $.trim($(elem).closest('tr').find(".hdnPaymentDate").val());
        var hdnStatus = $.trim($(elem).closest('tr').find(".hdnStatus").val());
        var hdnAttachment = $.trim($(elem).closest('tr').find(".hdnAttachment").val());
        var hdnFilePath = $.trim($(elem).closest('tr').find(".hdnFilePath").val());
        var hdnComments = $.trim($(elem).closest('tr').find(".hdnComments").val());
        $("[id$='TitleModal']").text("");
        $("[id$='TitleModal']").text("Update Exmployee Expense");
        $("[id$='btnAddEmployeeEx']").val("");
        $("[id$='btnAddEmployeeEx']").val("Update Employee Expenses");
        $("[id$='btnAddEmployeeEx']").attr("onclick", "AddUpdateEmExpense('Update')");

        $("[id$='EType']").val(hdnExpenseType);
        $("[id$='TotalAmount']").val(hdnTotalAmmount);
        $("[id$='EPaidAmount']").val(hdnPaidAmount);
        $("[id$='EPaymentDate']").val(hdnPaymentDate);
        $("[id$='EStatus']").val(hdnStatus);
        $("[id$='EComments']").val(hdnComments);
        $("[id$='hdnFileName']").val(hdnAttachment);
        $("[id$='hdnFilePath']").val(hdnFilePath);
        var fileString = "";
        $("[id$='fileLabel']").val("");
        if (hdnAttachment.length > 15) {
            var StartfileString = hdnAttachment.substring(0, 7);
            var EndfileString = hdnAttachment.slice(hdnAttachment.length - 7);
            fileString = StartfileString + "..." + EndfileString;
        }
        else {
            fileString = hdnAttachment;
        }

        $("[id$='fileLabel']").val(fileString);
    }
    else if (type == "Delete") {
        _EmployeeExpenseID = $(elem).closest('tr').find(".hdnEmployeeExpenseID").val();
    }
}
function DeleteEmpExpense(elem) {
    debugger;


    $("#Loader").show()
    $.post("/EMS/Expenses/UtilityBills/CallBacks/UtilityExpenseHandler.aspx", { EmployeeExpenseID: _EmployeeExpenseID, Action: "DeleteEmpExpense" }, function (data) {
        var start = data.indexOf("###StartExpExpenses###") + 22;
        var end = data.indexOf("###EndExpExpenses###");
        var returnHtml = $.trim(data.substring(start, end));
        $(".EmpExpenseDetails").html(returnHtml);
       
            GeneratePaging($("[id$='hdnEmpExpenseRows']").val(), $("#ddlEmployeeExpDetails").val(), "divEmpExpDetails", "FilterEmpExpnesesDetails");
       
      if ($("[id$='hdnEmpExpenseRows']").val() > 0) {

            $("#divEmpExpDetails .spanInfo").html("Showing " + $("#EmpExpenseDetails tr:first").children().eq(0).html() + " to "
                + $("#EmpExpenseDetails tr:last").children().eq(0).html() + " of " + $("[id$='hdnEmpExpenseRows']").val() + " entries");
        }
        showSuccessMessage("Employee Expense is Deleted Successfully!");

        $("#Loader").hide();
    })

}
//End

//For Other Expense
function FilterOthExpnesesDetails(PageNumber, Paging) {
    debugger;

    var param = {
        ExpenseType: $("[id$='dllOthExpenseType']").val(),
        EmpExStatus: $("[id$='ddlOthStatus']").val(),
        PaymentDate: $("[id$='OthPaymentDate']").val(),
        Pagenumber: PageNumber,
        Paging: Paging,
        Rows: $("[id$='ddlEmployeeExpDetails']").val(),
        Action: "FilterOthExpenses"
    }
    $.post("EMS/Expenses/UtilityBills/CallBacks/UtilityExpenseHandler.aspx", param, function (data) {
        var start = data.indexOf("###StartOthExpenses###") + 22;
        var end = data.indexOf("###EndOthExpenses###");
        var returnHtml = $.trim(data.substring(start, end));
        $(".OthExpenseDetails").html(returnHtml);
        if (Paging == true) {
            GeneratePaging($("[id$='hdnOthExpenseRows']").val(), $("#ddlOtherExpDetails").val(), "divOthDetails", "FilterOthExpnesesDetails");
        }
        if ($("[id$='hdnOthExpenseRows']").val() > 0) {

            $("#divOthDetails .spanInfo").html("Showing " + $("#OthExpenseDetails tr:first").children().eq(0).html() + " to "
                + $("#OthExpenseDetails tr:last").children().eq(0).html() + " of " + $("[id$='hdnOthExpenseRows']").val() + " entries");
        }
    });
}
function AddUpdateOthExpense(_CallFrom) {
    debugger;
    var count = 0;
   
    var OtherExpense = new Object();
    OtherExpense.OtherExpenseID = _OtherExpenseID;
    OtherExpense.ExpenseType = $("[id$='OtherExpenseType']").val() || "";
    OtherExpense.BillAmount = $("[id$='OthTotalAmount']").val() || "";
    OtherExpense.PaidAmount = $("[id$='OthPaidAmount']").val() || "";
    OtherExpense.PaymentDate = $("[id$='OthPayDate']").val() || "";
    OtherExpense.Status = $("[id$='OtherStatus']").val() || "";
    OtherExpense.Attachement = $("[id$='hdnFileName']").val() || "";
    OtherExpense.AttachementPath = $("[id$='hdnFilePath']").val() || "";
    OtherExpense.Comments = $("[id$='OthComments']").val() || "";

    $(".required").each(function () {
        if ($(this).val() == "") {
            $(this).css("border-color", "red");
            count++
        }
        else {
            $(this).css("border-color", "");
            $("#btnAddOthExpenses").attr("data-dismiss", "modal")
        }
    })
    if (count != 0) {
        $("#btnAddOthExpenses").removeAttr("data-dismiss")
        showErrorMessage("Please review the form carefully for the errors")
        return;
    }
    $("#Loader").show();
    $.post("/EMS/Expenses/UtilityBills/CallBacks/UtilityExpenseHandler.aspx", { objOtherExpenses: JSON.stringify(OtherExpense), Action: "AddUpdateOthExpenses", CallFrom: _CallFrom }, function (data) {
        var start = data.indexOf("###StartOthExpenses###") + 22;
        var end = data.indexOf("###EndOthExpenses###");
        var returnHtml = $.trim(data.substring(start, end));
        $(".OthExpenseDetails").html(returnHtml);
         GeneratePaging($("[id$='hdnOthExpenseRows']").val(), $("#ddlOtherExpDetails").val(), "divOthDetails", "FilterOthExpnesesDetails");
       
         if ($("[id$='hdnOthExpenseRows']").val() > 0) {

            $("#divOthDetails .spanInfo").html("Showing " + $("#OthExpenseDetails tr:first").children().eq(0).html() + " to "
                + $("#OthExpenseDetails tr:last").children().eq(0).html() + " of " + $("[id$='hdnOthExpenseRows']").val() + " entries");
        }
        if (_CallFrom == "Add") {
            showSuccessMessage("Other Expense is Added Successfully!");
        }
        else {
            showSuccessMessage("Other Expense is Updated Successfully!");
        }
        ClearFields();
        $("#Loader").hide();
    })


}

function UpdateFieldsFormOthExp(elem, type) {
    $(".required").each(function () {
        $(this).css("border-color", "");
    })
    debugger;
    if (type == "Add") {
        ClearFields();
        $("[id$='TitleModal']").text("");
        $("[id$='TitleModal']").text("Add Other Expense");
        $("[id$='btnAddOthExpenses']").val("");
        $("[id$='btnAddOthExpenses']").val("Add Other Expenses");
        $("[id$='btnAddOthExpenses']").attr("onclick", "AddUpdateOthExpense('Add')");
    }
    else if (type == "Update") {
        UploadFileFormReadyCommon();
        _OtherExpenseID = $(elem).closest('tr').find(".hdnOtherExpenseID").val();
        var hdnExpenseType = $.trim($(elem).closest('tr').find(".hdnExpenseType").val());
        var hdnTotalAmmount = $.trim($(elem).closest('tr').find(".hdnTotalAmmount").val());
        var hdnPaidAmount = $.trim($(elem).closest('tr').find(".hdnPaidAmount").val());
        var hdnPaymentDate = $.trim($(elem).closest('tr').find(".hdnPaymentDate").val());
        var hdnStatus = $.trim($(elem).closest('tr').find(".hdnStatus").val());
        var hdnAttachment = $.trim($(elem).closest('tr').find(".hdnAttachment").val());
        var hdnFilePath = $.trim($(elem).closest('tr').find(".hdnFilePath").val());
        var hdnComments = $.trim($(elem).closest('tr').find(".hdnComments").val());
        $("[id$='TitleModal']").text("");
        $("[id$='TitleModal']").text("Update Other Expense");
        $("[id$='btnAddOthExpenses']").val("");
        $("[id$='btnAddOthExpenses']").val("Update Other Expenses");
        $("[id$='btnAddOthExpenses']").attr("onclick", "AddUpdateOthExpense('Update')");

        $("[id$='OtherExpenseType']").val(hdnExpenseType);
        $("[id$='OthTotalAmount']").val(hdnTotalAmmount);
        $("[id$='OthPaidAmount']").val(hdnPaidAmount);
        $("[id$='OthPayDate']").val(hdnPaymentDate);
        $("[id$='OtherStatus']").val(hdnStatus);
        $("[id$='OthComments']").val(hdnComments);
        $("[id$='hdnFileName']").val(hdnAttachment);
        $("[id$='hdnFilePath']").val(hdnFilePath);
        var fileString = "";
        $("[id$='fileLabel']").val("");
        if (hdnAttachment.length > 15) {
            var StartfileString = hdnAttachment.substring(0, 7);
            var EndfileString = hdnAttachment.slice(hdnAttachment.length - 7);
            fileString = StartfileString + "..." + EndfileString;
        }
        else {
            fileString = hdnAttachment;
        }

        $("[id$='fileLabel']").val(fileString);
    }
    else if (type == "Delete") {
        _OtherExpenseID = $(elem).closest('tr').find(".hdnOtherExpenseID").val();
    }
}
function DeleteOtherExpenses() {
    debugger;


    $("#Loader").show()
    $.post("/EMS/Expenses/UtilityBills/CallBacks/UtilityExpenseHandler.aspx", { OtherExpenseID: _OtherExpenseID, Action: "DeleteOthExpense" }, function (data) {
        var start = data.indexOf("###StartOthExpenses###") + 22;
        var end = data.indexOf("###EndOthExpenses###");
        var returnHtml = $.trim(data.substring(start, end));
        $(".OthExpenseDetails").html(returnHtml);
        
            GeneratePaging($("[id$='hdnOthExpenseRows']").val(), $("#ddlOtherExpDetails").val(), "divOthDetails", "FilterOthExpnesesDetails");
     
        if ($("[id$='hdnOthExpenseRows']").val() > 0) {

            $("#divOthDetails .spanInfo").html("Showing " + $("#OthExpenseDetails tr:first").children().eq(0).html() + " to "
                + $("#OthExpenseDetails tr:last").children().eq(0).html() + " of " + $("[id$='hdnOthExpenseRows']").val() + " entries");
        }
        showSuccessMessage("Other Expense is Deleted Successfully!");

        $("#Loader").hide();
    })

}
//End
/*End Created By Faiza bilal 7-24-2023 */