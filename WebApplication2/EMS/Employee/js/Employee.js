var MedicalBenefID;
var EmpBankAccID;
var EmpDocumentID;
var EmpID = 0;
var ActiveInActiveEmployee;
var TabID;
var formData;
var UploadFilesLength;

$(document).ready(function () {
    debugger
    if ($("#linkUploadFiles").click(function () {
        debugger
        UploadEmployeeDocuments();
    }));
});
function EmployeeProfile(EmpID) {
    debugger
    $("#Loader").show()
    var Params = {
        EmpID: $.trim(EmpID),
    }
    $.post("/EMS/Employee/EmployeeProfile.aspx", Params, function (data) {
        debugger
        var Start = data.indexOf("###StartProfile###") + 18;
        var End = data.indexOf("###EndProfile###");
        var returnHtml = $.trim(data.substring(Start, End));
        $("#EMS").html('')
        jQuery('<div/>', {
            id:"divEmployeeProfile",
            class: "divEmployeeProfile",
        }).appendTo('#EMS');
        $(".divEmployeeProfile").html(returnHtml);
        if ($("[id$='hdnEmpID']").val() != undefined) {
            debugger
            if (TabID !== undefined) {
                $('#tab' + TabID).trigger('click')
            }

        }
        debugger
        $("#Loader").hide()
        EmpID = EmpID
        debugger


    });
}
function AddEmployee() {
    debugger
    $(".required").each(function () {
        $(this).css("border-color", "");
    });
    let FirstName = $.trim($("#FirstName").val())
    let LastName = $.trim($("#LastName").val())
    let MiddleName = $.trim($("#MiddleName").val())
    let DOB = $.trim($("#DOB").val())
    let Gender = $.trim($("#Gender").val())
    let Email = $.trim($("#Email").val())
    let Phone = $.trim($("#Phone").val())
    let CNIC = $.trim($("#CNIC").val())
    let Address = $.trim($("#Address").val())
    let MaritalStatus = $.trim($("#MaritalStatus").val())
    let EmergencyPhone = $.trim($("#EmergencyPhone").val())
    let EmergencyContactName = $.trim($("#EmergencyContactName").val())
    var validate = false;
    $(".required").each(function () {
        if ($(this).val() == "") {
            $(this).css("border-color", "red");
            validate = true
            return
        }
        else {
            $(this).css("border-color", "");
            $("#btnAddEmployee").attr("data-dismiss", "modal")

        }
    });
    if (validate == true) {
        $("#btnAddEmployee").removeAttr("data-dismiss")
        showErrorMessage("Please review the form carefully for the errors")
        return
    }
    var Params = {
        FirstName: FirstName,
        LastName: LastName,
        MiddleName: MiddleName,
        Email: Email,
        DOB: DOB,
        Gender: Gender,
        Phone: Phone,
        CNIC: CNIC,
        Address: Address,
        MaritalStatus: MaritalStatus,
        EmergencyPhone: EmergencyPhone,
        EmergencyContactName: EmergencyContactName,
        ActiveInActive: $("#ActiveInActive").val(),
        Action: "AddEmployee"
    }
    $("#Loader").show()

    $.post("/EMS/Employee/CallBacks/FiltersEmployee.aspx", Params, function (data) {
        debugger
        var Start = data.indexOf("###StartEmpDetails###") + 21;
        var End = data.indexOf("###EndEmpDetails###");
        var returnHtml = $.trim(data.substring(Start, End));
        $(".EmpDetails").html(returnHtml);
        GeneratePaging($("[id$='hdnEmpRows']").val(), $("#ddlEmployeeDetails").val(), "divEmpDetails", "FilterEmployeeDetails");
        if ($("[id$='hdnEmpRows']").val() > 0) {
            $("#divEmpDetails .spanInfo").html("Showing " + $("#EmpDetails tr:first").children().eq(0).html() + " to "
                + $("#EmpDetails tr:last").children().eq(0).html() + " of " + $("[id$='hdnEmpRows']").val() + " entries");
        }
        showSuccessMessage("Employee is Added Successfully")
        ClearFields()
        $("#Loader").hide()

    });

}
function UpdateEmployeeInformation(Check, elem) {
    debugger
    if (Check == "Update") {
        $.trim($("#FirstName").val($(elem).parentsUntil().find("[id$='EmployeeName']").text().split(' ')[0]))
        $.trim($("#LastName").val($(elem).parentsUntil().find("[id$='EmployeeName']").text().split(' ')[1]))
        if ($("[id$='EmployeeName']").text().split(' ')[2] != undefined) {
            $.trim($("#MiddleName").val($(elem).parentsUntil().find("[id$='EmployeeName']").text().split(' ')[2].slice(1, -1)))
        }
        $.trim($("#DOB").val($(elem).parentsUntil().find("[id$='EmpBirthday']").text()))
        $.trim($("#Gender").val($(elem).parentsUntil().find("[id$='EmpGender']").text()))
        $.trim($("#Email").val($(elem).parentsUntil().find("[id$='EmpEmail']").text()))
        $.trim($("#JoiningDate").val($(elem).parentsUntil().find("[id$='EmpJoiningDate']").text()))
        $.trim($("#Phone").val($(elem).parentsUntil().find("[id$='EmpContactNo']").text()))
        $.trim($("#MaxRemindEMPID").val($(elem).parentsUntil().find("[id$='MaxRemindEmpID']").text()))
        $.trim($("#CNIC").val($(elem).parentsUntil().find("[id$='EmpCNIC']").text()))
        $.trim($("#Address").val($(elem).parentsUntil().find("[id$='EmpAddress']").text()))
        $.trim($("#EmergencyPhone").val($(elem).parentsUntil().find("[id$='EmpEmergencyContactNo']").text()))
        $.trim($("#EmergencyContactName").val($(elem).parentsUntil().find("[id$='EmpEmerContName']").text()))

    }
    if (Check == "Save") {
        let FirstName = $.trim($("#FirstName").val())
        let LastName = $.trim($("#LastName").val())
        let MiddleName = $.trim($("#MiddleName").val())
        let DOB = $.trim($("#DOB").val())
        let Gender = $.trim($("#Gender").val())
        let Email = $.trim($("#Email").val())
        let Phone = $.trim($("#Phone").val())
        let MaxRemindEMPID = $.trim($("#MaxRemindEMPID").val())
        let CNIC = $.trim($("#CNIC").val())
        let Address = $.trim($("#Address").val())
        let MaritalStatus = $.trim($("[id$='MaritalStatus'] option:selected").val())
        let EmergencyPhone = $.trim($("#EmergencyPhone").val())
        let EmergencyContactName = $.trim($("#EmergencyContactName").val())
        let BloodGroup = $("[id$='ddlBloodGroup'] option:selected").val()

        var validate = false;
        $(".required").each(function () {
            if ($(this).val() == "") {
                $(this).css("border-color", "red");
                validate = true
                return
            }
            else {
                $(this).css("border-color", "");
                $("#btnUpdateEmployeeInformation").attr("data-dismiss", "modal")

            }
        });
        if (validate == true) {
            $("#btnUpdateEmployeeInformation").removeAttr("data-dismiss")
            showErrorMessage("Please review the form carefully for the errors")
            return
        }
        var Params = {
            FirstName: FirstName,
            LastName: LastName,
            MiddleName: MiddleName,
            Email: Email,
            DOB: DOB,
            Gender: Gender,
            MaxRemindID: MaxRemindEMPID,
            Phone: Phone,
            CNIC: CNIC,
            Address: Address,
            MaritalStatus: MaritalStatus,
            EmergencyPhone: EmergencyPhone,
            EmergencyContactName: EmergencyContactName,
            BloodGroup: BloodGroup,
            EmployeeID: $("[id$='hdnEmpID']").val(),
            Action: "UpdateEmployee"
        }
        $("#Loader").show()

        $.post("/EMS/Employee/CallBacks/FiltersEmployee.aspx", Params, function (data) {
            debugger
            EmployeeProfile($("[id$='hdnEmpID']").val())
            ClearFields()
            showSuccessMessage("Employee is Updated Successfully")
            $("#Loader").hide()

        });
    }
}
function DeleteEmployee(EmployeeId, Check) {
    debugger
    if (Check == "Delete") {
        EmpID = EmployeeId
    }
    if (Check == "DeleteRecord") {
        debugger
        $("#Loader").show()

        var Params = {
            EmpID: EmpID,
            MaxRemindEMPID: $("#MaxEmployeeID").val(),
            EmployeeName: $("#EmployeeName").val(),
            ActiveInActive: $("#ActiveInActive").val(),
            Rows: $("#ddlEmployeeDetails").val(),
            Action: "DeleteEmployee"
        }
        $.post("/EMS/Employee/CallBacks/FiltersEmployee.aspx", Params, function (data) {
            debugger
            var Start = data.indexOf("###StartEmpDetails###") + 21;
            var End = data.indexOf("###EndEmpDetails###");
            var returnHtml = $.trim(data.substring(Start, End));
            $(".EmpDetails").html(returnHtml);
            GeneratePaging($("[id$='hdnEmpRows']").val(), $("#ddlEmployeeDetails").val(), "divEmpDetails", "FilterEmployeeDetails");
            if ($("[id$='hdnEmpRows']").val() > 0) {
                $("#divEmpDetails .spanInfo").html("Showing " + $("#EmpDetails tr:first").children().eq(0).html() + " to "
                    + $("#EmpDetails tr:last").children().eq(0).html() + " of " + $("[id$='hdnEmpRows']").val() + " entries");
            }
            ClearFields()
            showSuccessMessage("Employee deleted Successfully")
            $("#Loader").hide()

        });
    }
}
function ActiveInActive(EmployeeId, Check, ActiveInActive) {
    debugger
    if (Check == "Active") {
        EmpID = EmployeeId
        ActiveInActiveEmployee = ActiveInActive
        if (ActiveInActiveEmployee == "True") {
            $("#MessageActiveInActive").text("Are You Sure To InActive Employee")
        } else {
            $("#MessageActiveInActive").text("Are You Sure To Active Employee")
        }
    }
    if (Check == "ActiveRecord") {
        debugger
        $("#Loader").show()
        if (ActiveInActiveEmployee == "True") {
            ActiveInActiveEmployee = "False"
        } else {
            ActiveInActiveEmployee = "True"
        }
        var Params = {
            EmpID: EmpID,
            ActiveInActiveEmployee: ActiveInActiveEmployee,
            MaxRemindEMPID: $("#MaxEmployeeID").val(),
            EmployeeName: $("#EmployeeName").val(),
            ActiveInActive: $("#ActiveInActive").val(),
            Rows: $("#ddlEmployeeDetails").val(),
            Action: "ActiveInActiveEmployee"
        }
        $.post("/EMS/Employee/CallBacks/FiltersEmployee.aspx", Params, function (data) {
            debugger
            var Start = data.indexOf("###StartEmpDetails###") + 21;
            var End = data.indexOf("###EndEmpDetails###");
            var returnHtml = $.trim(data.substring(Start, End));
            $(".EmpDetails").html(returnHtml);
            GeneratePaging($("[id$='hdnEmpRows']").val(), $("#ddlEmployeeDetails").val(), "divEmpDetails", "FilterEmployeeDetails");
            if ($("[id$='hdnEmpRows']").val() > 0) {
                $("#divEmpDetails .spanInfo").html("Showing " + $("#EmpDetails tr:first").children().eq(0).html() + " to "
                    + $("#EmpDetails tr:last").children().eq(0).html() + " of " + $("[id$='hdnEmpRows']").val() + " entries");
            }

            if (ActiveInActiveEmployee == "False") {
                showSuccessMessage("Employee InActive Successfully")
            } else {
                showSuccessMessage("Employee Active Successfully")
            }
            ClearFields()
            $("#Loader").hide()

        });
    }
}
function FilterEmployeeDetails(Pagenumber, Paging) {
    debugger
    var Params = {
        MaxRemindEMPID: $("#MaxEmployeeID").val(),
        EmployeeName: $("#EmployeeName").val(),
        ActiveInActive: $("#ActiveInActive").val(),
        Pagenumber: Pagenumber,
        Paging: Paging,
        Rows: $("#ddlEmployeeDetails").val(),
        Action: "FilterEmployeeDetails"
    }
    $.post("/EMS/Employee/CallBacks/FiltersEmployee.aspx", Params, function (data) {
        debugger
        var Start = data.indexOf("###StartEmpDetails###") + 21;
        var End = data.indexOf("###EndEmpDetails###");
        var returnHtml = $.trim(data.substring(Start, End));
        $(".EmpDetails").html(returnHtml);
        if (Paging == true) {
            GeneratePaging($("[id$='hdnEmpRows']").val(), $("#ddlEmployeeDetails").val(), "divEmpDetails", "FilterEmployeeDetails");
        }
        if ($("[id$='hdnEmpRows']").val() > 0) {
            $("#divEmpDetails .spanInfo").html("Showing " + $("#EmpDetails tr:first").children().eq(0).html() + " to "
                + $("#EmpDetails tr:last").children().eq(0).html() + " of " + $("[id$='hdnEmpRows']").val() + " entries");
        }
    });
}
function AddMedicalBeneficiaries(Check) {
    debugger
    if (Check == "Add") {
        $(".AddMedicalBeneficiaries").css("display", "")
        $(".UpdateMedicalBeneficiaries").css("display", "none")
        $("#ddlAddMBRelationShip").val()
    }
    if (Check == "AddRecord") {
        let FirstName = $.trim($("#AddMBFName").val())
        let LastName = $.trim($("#AddMBLName").val())
        let DOB = $.trim($("#AddMBDateOfBirth").val())
        let RelationShip = $.trim($("#ddlAddMBRelationShip").val())
        let CNIC = $.trim($("#AddMBCNIC").val())
        let TotalAllowance = $.trim($("#AddMBTotalAllowance").val())
        let GivenAllowance = $.trim($("#AddMBGivenAllowance").val())
        let RemainingAllowance = parseFloat(TotalAllowance) - parseFloat(GivenAllowance)
        var validate = false;
        $(".MBValidation").each(function () {
            if ($(this).val() == "") {
                $(this).css("border-color", "red");
                validate = true
                return
            }
            else {
                $(this).css("border-color", "");
                $("#btnAddMedicalBeneficiaries").attr("data-dismiss", "modal")

            }
        });
        if (validate == true) {
            $("#btnAddMedicalBeneficiaries").removeAttr("data-dismiss")
            showErrorMessage("Please review the form carefully for the errors")
            return
        }
        var Params = {
            FirstName: FirstName,
            LastName: LastName,
            RelationShip: RelationShip,
            DOB: DOB,
            EmpID: $("[id$='hdnEmpID']").val(),
            CNIC: CNIC,
            TotalAllowance: TotalAllowance,
            GivenAllowance: GivenAllowance,
            RemainingAllowance: RemainingAllowance,
            Action: "AddMedicalBeneficiaries"
        }
        $("#Loader").show()

        $.post("/EMS/Employee/CallBacks/FiltersEmployee.aspx", Params, function (data) {
            debugger
            TabID = "MedicalBeneficiaries"
            EmployeeProfile($("[id$='hdnEmpID']").val())
            ClearFields()
            showSuccessMessage("Employee MedicalBeneficiaries  Added Successfully")
            $("#Loader").hide()
        });
    }
}
function UpdateMedicalBeneficiaries(MedicalBeneficiariesId, elem, Check) {
    debugger
    if (Check == "Update") {
        $(".UpdateMedicalBeneficiaries").css("display", "")
        $(".AddMedicalBeneficiaries").css("display", "none")
        MedicalBenefID = MedicalBeneficiariesId
        $.trim($("#AddMBFName").val($(elem).closest("tr").find(".RelationshipName").text().split(' ')[0]))
        $.trim($("#AddMBLName").val($(elem).closest("tr").find(".RelationshipName").text().split(' ')[1]))
        $.trim($("#AddMBDateOfBirth").val($(elem).closest("tr").find(".DateOfBirth").text()))
        $.trim($("#ddlAddMBRelationShip").val($(elem).closest("tr").find(".RelationToEmployee").text()))
        $.trim($("#AddMBCNIC").val($.trim($(elem).closest("tr").find(".CNIC").text())))
        $.trim($("#AddMBTotalAllowance").val($(".TotalAllowances").text()))
        $.trim($("#AddMBRemainingAllowance").val($(".RemainingAllowances").text()))
        $.trim($("#AddMBGivenAllowance").val($(".GivenAllowances").text()))
        $("#select2-ddlAddMBRelationShip-container").text($.trim($(elem).closest("tr").find(".RelationToEmployee").text()))
    }
    if (MedicalBeneficiariesId == "UpdateRecord") {
        $("#Loader").show()

        let FirstName = $.trim($("#AddMBFName").val())
        let LastName = $.trim($("#AddMBLName").val())
        let DOB = $.trim($("#AddMBDateOfBirth").val())
        let RelationShip = $.trim($("#ddlAddMBRelationShip").val())
        let CNIC = $.trim($("#AddMBCNIC").val())
        let TotalAllowance = $.trim($("#AddMBTotalAllowance").val())
        let GivenAllowance = $.trim($("#AddMBGivenAllowance").val())
        var validate = false;
        $(".MBValidation").each(function () {
            if ($(this).val() == "") {
                $(this).css("border-color", "red");
                validate = true
                return
            }
            else {
                $(this).css("border-color", "");
                $("#UpdateMedicalBeneficiaries").attr("data-dismiss", "modal")
            }
        });
        if (validate == true) {
            $("#UpdateMedicalBeneficiaries").removeAttr("data-dismiss")
            showErrorMessage("Please review the form carefully for the errors")
            return
        }

        var Params = {
            FirstName: FirstName,
            LastName: LastName,
            RelationShip: RelationShip,
            DOB: DOB,
            MedicalBeneficiariesId: MedicalBenefID,
            CNIC: CNIC,
            TotalAllowance: TotalAllowance,
            GivenAllowance: GivenAllowance,
            EmpID: $("[id$='hdnEmpID']").val(),
            Action: "UpdateMedicalBeneficiaries"
        }
        $.post("/EMS/Employee/CallBacks/FiltersEmployee.aspx", Params, function (data) {
            debugger
            TabID = "MedicalBeneficiaries"
            EmployeeProfile($("[id$='hdnEmpID']").val())
            ClearFields()
            showSuccessMessage("Employee MedicalBeneficiaries  Updated Successfully")
            $("#Loader").hide()

        });
    }
}
function DeleteMedicalBeneficiaries(MedicalBeneficiariesId, Check) {
    debugger
    if (Check == "Delete") {
        MedicalBenefID = MedicalBeneficiariesId
    }
    if (Check == "DeleteRecord") {
        debugger
        $("#Loader").show()

        var Params = {
            MedicalBeneficiariesId: MedicalBenefID,
            EmpID: $("[id$='hdnEmpID']").val(),
            Action: "DeleteMedicalBeneficiaries"
        }
        $.post("/EMS/Employee/CallBacks/FiltersEmployee.aspx", Params, function (data) {
            debugger
            TabID = "MedicalBeneficiaries"
            EmployeeProfile($("[id$='hdnEmpID']").val())
            ClearFields()
            showSuccessMessage("Employee MedicalBeneficiaries  Deleted Successfully")
            $("#Loader").hide()

        });
    }

}
function AddOfficeInfo(Check, elem) {
    debugger
    if (Check == "Add") {
        debugger
        $.trim($("#MaxRemindEMPID").val($(elem).parentsUntil().find("[id$='MaxEmployeeID']").text()))
        $.trim($("#AddOIJoiningDate").val($(elem).parentsUntil().find("[id$='DateofJoin']").text()))
        $.trim($("#AddOIContractDate").val($(elem).parentsUntil().find("[id$='ContractDate']").text()))
        $.trim($("#AddOITerminationDate").val($(elem).parentsUntil().find("[id$='TerminationDate']").text()))
        $("#select2-EMS_ddlSpecialization-container").text($.trim($("[id$='EmpSpecialization']").text()))
    } if (Check == "UpdateRecord") {
        $("#Loader").show()
        let MaxEmpId = $("#MaxRemindEMPID").val()
        let Shift = $("[id$='AddOIShift']  option:selected").val()
        let JoiningDate = $("#AddOIJoiningDate").val()
        let ContractDate = $("#AddOIContractDate").val()
        let TerminationDate = $("#AddOITerminationDate").val()
        let EmployeeStatus = $("[id$='AddOIEmployeeStatus'] option:selected").val()
        let Designation = $("[id$='ddlDesignation'] option:selected").val()
        let Department = $("[id$='ddlDepartment'] option:selected").val()
        let Teams = $("[id$='ddlTeams'] option:selected").val()
        let Qualification = $("[id$='ddlQualification'] option:selected").val()
        let Specialization = $("[id$='ddlSpecialization'] option:selected").val()
        let Location = $("[id$='Location'] option:selected").val()


        var validate = false;
        $(".OIValidation").each(function () {
            if ($(this).val() == "") {
                $(this).css("border-color", "red");
                validate = true
                return
            }
            else {
                $(this).css("border-color", "");
                $("#btnAddOfficeInfo").attr("data-dismiss", "modal")
            }
        });
        if (validate == true) {
            $("#btnAddOfficeInfo").removeAttr("data-dismiss")
            showErrorMessage("Please review the form carefully for the errors")
            return
        }
        var Params = {
            MaxEmpId: MaxEmpId,
            Shift: Shift,
            JoiningDate: JoiningDate,
            EmployeeStatus: EmployeeStatus,
            Department: Department,
            Teams: Teams,
            Qualification: Qualification,
            Specialization: Specialization,
            Designation: Designation,
            ContractDate: ContractDate,
            TerminationDate: TerminationDate,
            Location: Location,

            EmployeeID: $("[id$='hdnEmpID']").val(),
            Action: "AddOfficeInfo"
        }
        $.post("/EMS/Employee/CallBacks/FiltersEmployee.aspx", Params, function (data) {
            debugger
            TabID = "OfficeInfo"
            EmployeeProfile($("[id$='hdnEmpID']").val())
            //var Start = data.indexOf("###StartEmpInfo###") + 18;
            //var End = data.indexOf("###EndEmpInfo###");
            //var returnHtml = $.trim(data.substring(Start, End));
            //$("#ProfileInfo").html(returnHtml);
            //var Start = data.indexOf("###StartOfficeInfo###") + 21;
            //var End = data.indexOf("###EndOfficeInfo###");
            //var returnHtml = $.trim(data.substring(Start, End));
            //$("#OfficeInfo").html(returnHtml);
            ClearFields()
            showSuccessMessage("Information added successfully")
            $("#Loader").hide()

        });
    }

}
function AddAccountInfo(Check, elem) {
    if (Check == "Add") {
        $(".AddAccountInfo").css("display", "")
        $(".UpdateEmployeeBankAccount").css("display", "none")
        if ($("#tbodyAccountInfo tr").length == 4) {
            showErrorMessage("Banks info Limit Exceeds");
        }
    }
    debugger
    if (Check == "AddRecord") {
        $("#Loader").show()

        $("[id$='ddlBankName']").val()
        let BankName = $.trim($("[id$='ddlBankName']").val())
        let AccountTitle = $.trim($("#AddAccountTitle").val())
        let AccountNumber = $.trim($("#AddAccountNumber").val())
        let IBANNumber = $.trim($("#AddIBANNumber").val())
        let BranchCode = $.trim($("#AddBranchCode").val())
        var validate = false;
        $(".AIValidation").each(function () {
            if ($(this).val() == "") {
                $(this).css("border-color", "red");
                validate = true
                return
            }
            else {
                $(this).css("border-color", "");
                $("#btnAddAccountInfo").attr("data-dismiss", "modal")
            }
        });
        if (validate == true) {
            $("#btnAddAccountInfo").removeAttr("data-dismiss")
            showErrorMessage("Please review the form carefully for the errors")
            return
        }
        var Params = {
            BankName: BankName,
            AccountTitle: AccountTitle,
            AccountNumber: AccountNumber,
            IBANNumber: IBANNumber,
            BranchCode: BranchCode,
            EmployeeID: $("[id$='hdnEmpID']").val(),
            Action: "AddAccountInfo"
        }
        $.post("/EMS/Employee/CallBacks/FiltersEmployee.aspx", Params, function (data) {
            debugger
            TabID = "AccountInfo"
            EmployeeProfile($("[id$='hdnEmpID']").val())
            ClearFields()
            showSuccessMessage("Employeee Accounts Info Added successfully")
            $("#Loader").hide()

        });
    }
}
function UpdateEmployeeBankAccount(EmployeeBankAccount, elem, Check) {
    debugger
    if (Check == "Update") {
        $(".AddAccountInfo").css("display", "none")
        $(".UpdateEmployeeBankAccount").css("display", "")
        EmpBankAccID = EmployeeBankAccount
        $("[id$='ddlBankName']").val($.trim($(elem).closest("tr").find(".BankName").text()))
        $.trim($("#AddAccountTitle").val($.trim($(elem).closest("tr").find(".AccountTitle").text())))
        $.trim($("#AddAccountNumber").val($.trim($(elem).closest("tr").find(".AccountNumber").text())))
        $.trim($("#AddIBANNumber").val($.trim($(elem).closest("tr").find(".IBANNumber").text())))
        $.trim($("#AddBranchCode").val($.trim($(elem).closest("tr").find(".BranchCode").text())))
        $("#select2-EMS_ddlBankName-container").text($.trim($(elem).closest("tr").find(".BankName").text()))
    }
    if (Check == "UpdateRecord") {
        $("#Loader").show()
        var validate = false;
        $(".AIValidation").each(function () {
            if ($(this).val() == "") {
                $(this).css("border-color", "red");
                validate = true
                return
            }
            else {
                $(this).css("border-color", "");
                $("#btnUpdateEmployeeBankAccount").attr("data-dismiss", "modal")
            }
        });
        if (validate == true) {
            $("#btnUpdateEmployeeBankAccount").removeAttr("data-dismiss")
            showErrorMessage("Please review the form carefully for the errors")
            return
        }
        let BankName = $.trim($("[id$='ddlBankName']").val())
        let AccountTitle = $.trim($("#AddAccountTitle").val())
        let AccountNumber = $.trim($("#AddAccountNumber").val())
        let IBANNumber = $.trim($("#AddIBANNumber").val())
        let BranchCode = $.trim($("#AddBranchCode").val())
        var Params = {
            BankName: BankName,
            AccountTitle: AccountTitle,
            AccountNumber: AccountNumber,
            IBANNumber: IBANNumber,
            BranchCode: BranchCode,
            EmployeeID: $("[id$='hdnEmpID']").val(),
            EmpBankAccID: EmpBankAccID,
            Action: "UpdateAccountInfo"
        }
        $.post("/EMS/Employee/CallBacks/FiltersEmployee.aspx", Params, function (data) {
            debugger
            TabID = "AccountInfo"

            EmployeeProfile($("[id$='hdnEmpID']").val())
            ClearFields()
            showSuccessMessage("Employeee Accounts Info Updated successfully")
            $("#Loader").hide()

        });
    }
}
function DeleteEmployeeBankAccount(BankAccID, Check) {
    debugger
    if (Check == "Delete") {
        EmpBankAccID = BankAccID
    }
    if (Check == "DeleteRecord") {
        debugger
        $("#Loader").show()

        var Params = {
            EmpBankAccID: EmpBankAccID,
            EmployeeID: $("[id$='hdnEmpID']").val(),
            Action: "DeleteAccountInfo"
        }
        $.post("/EMS/Employee/CallBacks/FiltersEmployee.aspx", Params, function (data) {
            debugger
            TabID = "AccountInfo"

            EmployeeProfile($("[id$='hdnEmpID']").val())
            ClearFields()
            showSuccessMessage("Employeee Account Deleted successfully")
            $("#Loader").hide()

        });
    }
}
function AddDocumentsInfo(Check, elem) {
    debugger
    if (Check == "Add") {
        $(".AddDocumentsInfo").css("display", "")
        $(".UpdateDocumentsInfo").css("display", "none")
        $("#divEmpDocumentsFilesInnerNew").hide()

    }
    debugger
    if (Check == "AddRecord") {
        $("#Loader").show()

        let DocumentType = $.trim($("[id$='ddlDocumentType'] option:selected").val())
        var EmpDocAttacmentName = "";
        var DocumentPath = "";
        var DocumentName = "";


        $("#divEmpDocumentsFilesInner .Emp-document-files-wrapper").each(function () {

            EmpDocAttacmentName += $(this).find(".hdnOriginalFileName").val() + ",";
            DocumentPath += $(this).find(".hdnDocumentPath").val() + ",";
            DocumentName += $(this).find(".hdnOriginalFileName").val().split('.')[0] + ",";

        });
        if (EmpDocAttacmentName.length > 0) {
            EmpDocAttacmentName = EmpDocAttacmentName.slice(0, -1);
        }
        if (DocumentPath.length > 0) {
            DocumentPath = DocumentPath.slice(0, -1);
        }
        if (DocumentName.length > 0) {
            DocumentName = DocumentName.slice(0, -1);
        }
        var Params = {
            DocumentName: DocumentName,
            DocumentType: DocumentType,
            EmployeeID: $("[id$='hdnEmpID']").val(),
            EmpDocAttacmentName: EmpDocAttacmentName,
            DocumentPath: DocumentPath,
            Action: "AddDocumentsInfo"
        }
        $.post("/EMS/Employee/CallBacks/FiltersEmployee.aspx", Params, function (data) {
            debugger
            TabID = "DocumentsInfo"
            EmployeeProfile($("[id$='hdnEmpID']").val())
            ClearFields()
            showSuccessMessage("Documents is attached successfully")
            $("#Loader").hide()

        });
    }
}
function DeleteEmployeeDocuments(DocumentID, Check) {
    debugger
    if (Check == "Delete") {
        EmpDocumentID = DocumentID
    }
    if (Check == "DeleteRecord") {
        debugger
        $("#Loader").show()

        var Params = {
            DocumentID: EmpDocumentID,
            EmployeeID: $("[id$='hdnEmpID']").val(),
            Action: "DeleteDocumentInfo"
        }
        $.post("/EMS/Employee/CallBacks/FiltersEmployee.aspx", Params, function (data) {
            debugger
            TabID = "DocumentsInfo"

            EmployeeProfile($("[id$='hdnEmpID']").val())
            ClearFields()
            showSuccessMessage("Employee Documnets deleted Successfully")
            $("#Loader").hide()

        });
    }
}
function UpdateEmployeeDocuments(DocumentID, elem, Check, fileName, DocTypeID, DocumentName) {
    debugger
    if (Check == "Update") {
        $(".AddDocumentsInfo").css("display", "none")
        $(".UpdateDocumentsInfo").css("display", "")
        $("[id$='ddlDocumentType']").find("option:selected").val(DocTypeID)
        AppendUploadedFile(fileName.split('.')[0], fileName, fileName);
        $(".AddDocumentName").val(DocumentName)
        EmpDocumentID = DocumentID

    }
    if (Check == "UpdateRecord") {
        let DocumentType = $.trim($("[id$='ddlDocumentType'] option:selected").val())
        var EmpDocAttacmentName = "";
        var DocumentPath = "";
        var DocumentName = "";

        $("#divEmpDocumentsFilesInner .Emp-document-files-wrapper").each(function () {
            EmpDocAttacmentName += $(this).find(".hdnOriginalFileName").val() + ",";
            DocumentPath += $(this).find(".hdnDocumentPath").val() + ",";
            DocumentName += $(this).find(".hdnOriginalFileName").val().split('.')[0] + ",";
        });
        if (EmpDocAttacmentName.length > 0) {
            EmpDocAttacmentName = EmpDocAttacmentName.slice(0, -1);
        }
        if (DocumentPath.length > 0) {
            DocumentPath = DocumentPath.slice(0, -1);
        }
        if (DocumentName.length > 0) {
            DocumentName = DocumentName.slice(0, -1);
        }
        var Params = {
            DocumentID: EmpDocumentID,
            DocumentName: DocumentName,
            EmpDocAttacmentName: EmpDocAttacmentName,
            DocumentType: DocumentType,
            EmployeeID: $("[id$='hdnEmpID']").val(),
            DocumentPath: DocumentPath,
            Action: "UpdateEmpDocumentsInfo"
        }
        $.post("/EMS/Employee/CallBacks/FiltersEmployee.aspx", Params, function (data) {
            debugger
            TabID = "DocumentsInfo"
            EmployeeProfile($("[id$='hdnEmpID']").val())
            ClearFields()
            showSuccessMessage("Documents attachment Updated successfully")

        });
    }
}
function GetSpecialization() {
    debugger
    var Params = {
        QualificationID: $("[id$='ddlQualification'] option:selected").val(),
        Action: "GetSpecialization"
    }
    $.post("/EMS/Employee/CallBacks/FiltersEmployee.aspx", Params, function (data) {
        debugger
        var Start = data.indexOf("###StartSpecialization###") + 25;
        var End = data.indexOf("###EndSpecialization###");
        var returnHtml = $.trim(data.substring(Start, End));

        $("[id$='divSpecialization']").html(returnHtml)
        $("[id$='divSpecialization']").show()

    });
}
/*$("#form1").on('submit', function (e)*/
function addfile(){
    debugger;
    
    //e.preventDefault();
    //e.stopImmediatePropagation();
    //$.ajax
    //    ({
    //        type: 'POST',
    //        enctype: 'multipart/form-data',
    //        url: '/EMS/Employee/EmployeeDocuments.ashx',          
    //        cache: false,
    //        contentType: false,
    //        processData: false,
    //        data: formData,
    //        success: function (data, response) {
    //            debugger
    //            if (UploadFilesLength == 1) {
    //                debugger
    //                var responseHTML = JSON.parse(data)
    //                AppendUploadedFile(responseHTML.fileName, responseHTML.path, responseHTML.path);
    //            } else {
    //                var check = new RegExp('["\']([^\'"]*)[\'"][^:]*:[^"\']*["\']([^\'"]*)[\'"]', "g");
    //                var newData = {};
    //                data.replace(check, function (a, b, c) {
    //                    if (typeof newData[b] == "undefined") {
    //                        newData[b] = c;
    //                    } else if (typeof newData[b] == "object") {
    //                        newData[b].push(c);
    //                    } else {
    //                        var ca = newData[b];
    //                        newData[b] = [ca, c];
    //                    }
    //                    return a;
    //                });
    //                debugger
    //                var FileName = newData.fileName
    //                var Path = newData.path

    //                for (let i = 0; i < FileName.length; i++) {

    //                    AppendUploadedFile(FileName[i], Path[i], Path[i]);
    //                }
    //            }
    //            debugger;
    //        },
    //        error: function (err) {
    //        }
    //    });
    debugger
}
function AddSalaryInfo(Check, elem) {
    debugger
    var Action = "";
    if ($("[id$='hdnSalaryID']").val() != "") {
        Action = "UpdateSalaryInfo"

    } else {
        Action = "AddSalaryInfo"
    }

    if (Check == "Add") {
        debugger
        $.trim($("#SICurrentSalary").val($(elem).parentsUntil().find("[id$='CurrentSalary']").text()))
        $.trim($("#SIPreviousSalary").val($(elem).parentsUntil().find("[id$='PreviousSalary']").text()))
        $.trim($("#SILastIncrementDate").val($(elem).parentsUntil().find("[id$='LastIncrementDate']").text()))
        $.trim($("#SIIncrementAmount").val($(elem).parentsUntil().find("[id$='IncrementAmount']").text()))
        $.trim($("#SITravellingAllowance").val($(elem).parentsUntil().find("[id$='TravellingAllowance']").text()))
        $.trim($("#SIMedicalAllowance").val($(elem).parentsUntil().find("[id$='MedicalAllowance']").text()))
        $.trim($("#SIOtherAllowance").val($(elem).parentsUntil().find("[id$='OtherAllowance']").text()))
        $.trim($("#SIDearnessAllowance").val($(elem).parentsUntil().find("[id$='DearnessAllowance']").text()))
        $.trim($("#SIProvidentFund").val($(elem).parentsUntil().find("[id$='ProvidentFund']").text()))
        $.trim($("#SITax").val($(elem).parentsUntil().find("[id$='Tax']").text()))
    } if (Check == "UpdateRecord") {
        $("#Loader").show()
        let CurrentSalary = $("#SICurrentSalary").val()
        let PreviousSalary = $("#SIPreviousSalary").val()
        let LastIncrementDate = $("#SILastIncrementDate").val()
        let IncrementAmount = $("#SIIncrementAmount").val()
        let TravellingAllowance = $("#SITravellingAllowance").val()
        let MedicalAllowance = $("#SIMedicalAllowance").val()
        let OtherAllowance = $("#SIOtherAllowance").val()
        let DearnessAllowance = $("#SIDearnessAllowance").val()
        let ProvidentFund = $("#SIProvidentFund").val()
        let Tax = $("#SITax").val()
        var validate = false;
        $(".SIValidation").each(function () {
            if ($(this).val() == "" || $(this).val() == "0.00") {
                $(this).css("border-color", "red");
                validate = true
                return
            }
            else {
                $(this).css("border-color", "");
                $("#btnAddSalaryInfo").attr("data-dismiss", "modal")
            }
        });
        if (validate == true) {
            $("#btnAddSalaryInfo").removeAttr("data-dismiss")
            showErrorMessage("Please review the form carefully for the errors")
            return
        }
        var Params = {
            CurrentSalary: CurrentSalary,
            PreviousSalary: PreviousSalary,
            LastIncrementDate: LastIncrementDate,
            IncrementAmount: IncrementAmount,
            IncrementAmount: IncrementAmount,
            TravellingAllowance: TravellingAllowance,
            MedicalAllowance: MedicalAllowance,
            OtherAllowance: OtherAllowance,
            DearnessAllowance: DearnessAllowance,
            ProvidentFund: ProvidentFund,
            Tax: Tax,
            EmployeeID: $("[id$='hdnEmpID']").val(),
            SalaryID: $("[id$='hdnSalaryID']").val(),

            Action: Action
        }
        $.post("/EMS/Employee/CallBacks/FiltersEmployee.aspx", Params, function (data) {
            debugger
            TabID = "SalaryInfo"
            EmployeeProfile($("[id$='hdnEmpID']").val())
            ClearFields()
            showSuccessMessage("Salary Information added successfully")
            $("#Loader").hide()

        });
    }

}
function UploadEmployeeDocuments() {
    debugger
    new AjaxUpload('#linkUploadFiles', {
        action: "/EMS/Employee/EmployeeDocuments.ashx",
        dataType: 'json',
        contentType: "application/json; charset=uft-8",
        data: {
            EmployeeID: $("[id$='hdnEmpID']").val(),
            DocumentName: $("[id$='AddDocumentName']").val(),
            DocumentType: $("[id$='AddDocumentType']").val(),
            formData: formData
        },
        onComplete: function (file, response) {
            debugger
            var responseHTML = $.parseJSON($(response).html());
            AppendUploadedFile(responseHTML.fileName, responseHTML.path, file);
        }
    });
}
function AppendUploadedFile(fileName, path, file) {
    debugger;
    var documentFile = '' +
        '<div class="Emp-document-files-wrapper">' +
        GetFileLink(file, _PracticeDocumentsPath + "/" + path) +
        '<input type="hidden" class="hdnDocumentId" value="0" />' +
        '<input type="hidden" class="hdnDocumentPath" value="' + _PracticeDocumentsPath + "/" + path + '" />' +
        '<input type="hidden" class="hdnOriginalFileName" value="' + file + '" />' +
        '<input type="hidden" class="hdnDeleted" value="false" />' +
        '</div>';

    $("[id$='divEmpDocumentsFilesInner']").append(documentFile);
}
var arrFileTypes = ["jpg", "jpeg", "png", "gif", "bmp", "webp"];
function GetFileLink(file, path) {
    debugger;

    var fileLink = "";
    var fileType = $.trim(file.substring(file.length - 3, file.length));
    fileType = fileType.toLocaleLowerCase();

    if ($.inArray(fileType, arrFileTypes) < 0) {

        if (fileType == "pdf") {
            fileLink = '' +
                '<embed src="' + path + '" width="600" height="500" alt="pdf">' +
                '<div class="hover-action-div">' +
                '<span class="fa fa-trash" aria-hidden="true" onclick="DeleteAttachment(this)" style="margin-left: 4px;" title="Delete"></span>' +
                '<span class="fa fa-download" aria-hidden="true" onclick="DownloadPatientDocumentFile(this)" style="margin-left: 4px;" title="Download"></span>' +
                '</div>';
        }
        else {
            fileLink = '' +
                '<div class="col-md-6">' +
                '<div class="form-group">' +
                '<span onclick="DownloadPatientDocumentFile(this)" style="float: left; color: #00F; margin: 0 5px 0 0;" target="_blank">' + file + '</span>' +
                '<span class="fa fa-trash" aria-hidden="true" onclick="DeleteAttachment(this)" style="margin-left: 4px;" title="Delete"></span>' +
                '<span class="fa fa-download" aria-hidden="true" onclick="DownloadPatientDocumentFile(this)" style="margin-left: 4px;" title="Download"></span>';
                '</div >' +
                '</div >'

        }
    }
    else {
        fileLink = '' +
            '<img src="' + path + '" />' +
            '<div class="hover-action-div">' +
            '<span class="fa fa-trash" aria-hidden="true" onclick="DeleteAttachment(this)" style="margin-left: 4px;" title="Delete"></span>' +
            '<span class="fa fa-download" aria-hidden="true" onclick="DownloadPatientDocumentFile(this)" style="margin-left: 4px;" title="Download"></span>' +
            '</div>';
    }

    return fileLink;
}
function DownloadPatientDocumentFile(elem) {
    debugger;
    var filePath = $(elem).closest(".Emp-document-files-wrapper").find(".hdnDocumentPath").val();
    var fileName = $(elem).closest(".Emp-document-files-wrapper").find(".hdnOriginalFileName").val();
    saveToDisk(filePath, fileName);
}
function DownloadFromGrid(filePath, fileName) {
    debugger
    saveToDisk(filePath, fileName);
}
function DeleteAttachment(elem) {
    debugger;
    $(elem).closest(".Emp-document-files-wrapper").remove();
}
function ClearFields() {
    debugger
    $('input[type="text"]').val("")
    $('input[type="password"]').val("")
    $('input[type="email"]').val("")
    $('input[type="number"]').val("")
    $(".Emp-document-files-wrapper").remove()
    $("#uploader").val("")
    MedicalBenefID = "";
    EmpBankAccID = "";
    EmpDocumentID = "";
    ActiveInActiveEmployee = "";
}

function UploadMultifiles() {
    debugger;
    var DocumnetType = $("[id$='ddlDocumentType']").val();
    if (DocumnetType == "") {
       // $("[id$='ddlDocumentType']").addClass("error");
        showErrorMessage("Select Documnet Type")
        $("#uploader").val("")
       
        return
    }
    else {
    var uploadedFiles = $('#uploader')[0].files;
    UploadFilesLength = uploadedFiles.length
    if (uploadedFiles.length > 10) {
        return false;
    }
    if (uploadedFiles.length > 0) {
         formData = new FormData();
        for (var i = 0; i < uploadedFiles.length; i++) {
            debugger;
            formData.append(uploadedFiles[i].name, uploadedFiles[i]);
            filename = uploadedFiles[i].name;
            

        }
       
    }
        addfile();
    }
    
   
   
}