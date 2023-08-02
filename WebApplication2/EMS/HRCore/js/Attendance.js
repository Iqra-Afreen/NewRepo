var EmployeeNamesDD;
$(document).ready(function () {
    debugger
    var d = new Date();
    var currentMonth = 0;
    var month = d.getMonth();
    var currentYear = d.getFullYear();
    month = month + 1;
    if (month < 10) {
        currentMonth = '0' + month;
    }
    $("#AttendanceDate").val(currentMonth + "/" + currentYear);

    $("#AttendanceReport").html($("[id$='hdnEmpID']").val()).show();
    TextColor();
 /*   sortTable();*/

    //DDSearchEmployeByName
    var start = EmployeeNamesDD.indexOf("###StartEmployeeName###") + 23
    var end = EmployeeNamesDD.indexOf("###EndEmployeeName###");
    var returnhtml = $.trim(EmployeeNamesDD.substring(start, end));
    $("#SearchByEmpName").html(returnhtml).show();
    //DDAddEmployeeName
    var start = EmployeeNamesDD.indexOf("###StartAddEmployeeName###") + 26
    var end = EmployeeNamesDD.indexOf("###EndAddEmployeeName###");
    var returnhtml = $.trim(EmployeeNamesDD.substring(start, end));
    $("#AddEmployeeName").html(returnhtml).show();

    $("[id$='DDSearchEmpName']").select2();
    $("[id$='DDEmpName']").select2();

});
function TextColor() {
    debugger;
    $(".Attendance").each(function () {
        if ($.trim($(this).text()) == "P") {
            $(this).addClass("text-success")
        }
        else if ($.trim($(this).text()) == "A") {
            $(this).addClass("text-danger")
        }
        else if ($.trim($(this).text()) == "SL") {
            $(this).addClass("text-warning")
        }
    })
    $(".DaysNames").each(function () {
        if ($.trim($(this).text()) == "Sat" || $.trim($(this).text()) == "Sun") {
            $(this).addClass("text-danger");
        }
    })
}
$(".datetimepicker").datetimepicker({
    format: 'MM/YYYY'
}).on('dp.change', function (e) { FilterEmployeeAttendance() });
$(".datepicker").datetimepicker({ format: 'MM/DD/YYYY', minDate: -1, });

var AttendanceId = "";
function UpdateAttendance(AttendanceDate, Description, AttendanceMark, AttendanceID, elem) {
    debugger;
    var EmpName = $(elem).closest("tr").find(".EmpName").text();
    AttendanceId = AttendanceID;

    $("#add_attendance").modal('show');

    $("#AddBtn").hide();
    $("#UpdateBtn").show();
    $("#titleAdd").hide();
    $("#titleUpdate").show();
    $("#select2-EMS_DDEmpName-container").text(EmpName);
    $("[id$='DDEmpName']").attr('disabled', true);
    $(".datepicker").val(AttendanceDate);
    $(".datepicker").attr('disabled', true);
    AttendanceMark = (AttendanceMark) == "A" ? "Absent" : (AttendanceMark) == "P" ? "Present" : "Short Leave";
    $("#AttendanceType").val(AttendanceMark);
    $("#Description").val(Description)

}
function UpdateEmpAttendance() {
    debugger;
    var params = {
        AttendanceID: AttendanceId,
        Attendance: $.trim($("[id$='AttendanceType'] option:selected").val()),
        Description: $.trim($("[id$='Description']").val()),
        Action: "UpdateAttendance"
    }
    $.post("/EMS/HRCore/Attendance/Attendance.aspx", params, function (data) {

        var start = data.indexOf("###StartEmployeeAttendance###") + 29
        var end = data.indexOf("###EndEmployeeAttendance###");
        var returnhtml = $.trim(data.substring(start, end));
        $("#AttendanceReport").html(returnhtml).show();
        TextColor();
        showSuccessMessage("Attendance Updated Successfully");

    });
    ClearFields();

}
function FilterEmployeeAttendance(filter) {
    debugger;
    var Date = $("#AttendanceDate").val().split("/");
    var AttendanceMonth = Date[0];
    var AttendanceYear = Date[1];
    var Params = {
        EmployeeName: $.trim($("[id$='DDSearchEmpName'] option:selected").text()),
        EmpId: $.trim($("[id$='DDSearchEmpName'] option:selected").val()),
        AttendanceMonth: AttendanceMonth,
        AttendanceYear: AttendanceYear,
        Location: $.trim($("[id$='DdlLocation'] option:selected").val()),
        Shift: $.trim($("[id$='DdlShift'] option:selected").val()),

        Action: "FilterEmployeeAttendance"
    }
    $.post("/EMS/HRCore/Attendance/Attendance.aspx", Params, function (data) {
        debugger;
        var start = data.indexOf("###StartEmployeeAttendance###") + 29
        var end = data.indexOf("###EndEmployeeAttendance###");
        var returnhtml = $.trim(data.substring(start, end));
        $("#AttendanceReport").html(returnhtml).show();
        TextColor();

        if (filter != "change") {
            debugger;
            var start = data.indexOf("###StartEmployeeName###") + 23
            var end = data.indexOf("###EndEmployeeName###");
            var returnhtml = $.trim(data.substring(start, end));
            $("#SearchByEmpName").html(returnhtml).show();
            $("[id$='DDSearchEmpName']").select2();
        }

        var start = data.indexOf("###StartAddEmployeeName###") + 26
        var end = data.indexOf("###EndAddEmployeeName###");
        var returnhtml = $.trim(data.substring(start, end));
        $("#AddEmployeeName").html(returnhtml).show();
        $("[id$='DDEmpName']").select2();
    });


}

var EmployeeID = "";
function OpenAttendanceModal(AttendanceDate, EmployeeId, elem) {
    debugger;
    var EmpName = $(elem).closest("tr").find(".EmpName").text();
    EmployeeID = EmployeeId;

    $("#add_attendance").modal('show');

    $("#select2-EMS_DDEmpName-container").text(EmpName);
    $("[id$='DDEmpName']").attr('disabled', true);
    $(".datepicker").val(AttendanceDate);
    $(".datepicker").attr('disabled', true);

}
function AddAttendance() {
    debugger;
    var Name = $.trim($("#EMS_DDEmpName").text());
    var AttendanceDate = $.trim($("[id$='AddAttendanceDate']").val());
    var Attendance = $.trim($("[id$='AttendanceType'] option:selected").val());

    if (EmployeeID == "") {
        EmployeeID = $.trim($("[id$='DDEmpName'] option:selected").val());
    }

    var SearchDate = $("[id$='AttendanceDate']").val().split("/");
    var AttendanceMonth = SearchDate[0];
    var AttendanceYear = SearchDate[1];

    if (Name == "" && AttendanceDate == "" && Attendance == "") {
        $(".DDEmpName").css("border-color", "red");
        $("[id$='AddAttendanceDate']").css("border-color", "red");
        $("[id$='AttendanceType']").css("border-color", "red");
        showErrorMessage("Please Enter Data");
        return;
    }
    else if (Name == "") {
        $("[id$='AttendanceType']").css("border-color", "#D3D3D3");
        $("[id$='AddAttendanceDate']").css("border-color", "#D3D3D3");
        $(".DDEmpName").css("border-color", "red");
        showErrorMessage("Please Select Employee Name");
        return;
    }
    else if (AttendanceDate == "") {
        $(".DDEmpName").css("border-color", "#D3D3D3");
        $("[id$='AttendanceType']").css("border-color", "#D3D3D3");
        $("[id$='AddAttendanceDate']").css("border-color", "red");
        showErrorMessage("Please Select Date");
        return
    }
    else if (Attendance == "") {
        $(".DDEmpName").css("border-color", "#D3D3D3");
        $("[id$='AddAttendanceDate']").css("border-color", "#D3D3D3");
        $("[id$='AttendanceType']").css("border-color", "red");
        showErrorMessage("Please Select Attendance");
        return
    }

    var params = {
        //Searching
        EmployeeName: $.trim($("[id$='DDSearchEmpName'] option:selected").text()),
        AttendanceMonth: AttendanceMonth,
        AttendanceYear: AttendanceYear,
        Location: $.trim($("[id$='DdlLocation'] option:selected").val()),
        Shift: $.trim($("[id$='DdlShift'] option:selected").val()),

        //Adding
        Name: Name,
        EmployeeID: EmployeeID,
        AttendanceDate: AttendanceDate,
        Attendance: Attendance,
        AttendanceTime: $.trim($("[id$='AttendanceTime']").val()),
        Description: $.trim($("[id$='Description']").val()),
        Action: "AddAttendance"
    }
    $.post("/EMS/HRCore/Attendance/Attendance.aspx", params, function (data) {

        debugger;
        var start = data.indexOf("###StartEmployeeAttendance###") + 29
        var end = data.indexOf("###EndEmployeeAttendance###");
        var returnhtml = $.trim(data.substring(start, end));
        $("#AttendanceReport").html(returnhtml).show();
        TextColor();
        showSuccessMessage("Attendance Added Successfully");

    });
    ClearFields();
}
function ClearFields() {
    debugger;

    $("#select2-EMS_DDEmpName-container").css("border-color", "#D3D3D3");
    $("[id$='AddAttendanceDate']").css("border-color", "#D3D3D3");
    $("[id$='AttendanceType']").css("border-color", "#D3D3D3");

    $("#select2-EMS_DDEmpName-container").text("");
    $("#select2-EMS_DDEmpName-container").val("");
    $('#AttendanceType option:eq(0)').prop('selected', true)
    $("[id$='Description']").val("");
    $("[id$='DDEmpName']").attr('disabled', false);
    $("#AddAttendanceDate").val("");
    $(".datepicker").attr('disabled', false);
    $("#AddBtn").show();
    $("#UpdateBtn").hide();
    $("#titleAdd").show();
    $("#titleUpdate").hide();
    $("#add_attendance").modal('hide');
}

function sortTable() {
    debugger
    var table, rows, switching, i, x, y, shouldSwitch;
    table = document.getElementById("EmployeeAttendance");
    switching = true;
    /*Make a loop that will continue until
    no switching has been done:*/
    while (switching) {
        //start by saying: no switching is done:
        switching = false;
        rows = table.rows;
        /*Loop through all table rows (except the
        first, which contains table headers):*/
        for (i = 1; i < (rows.length - 2); i++) {
            //start by saying there should be no switching:
            shouldSwitch = false;
            /*Get the two elements you want to compare,
            one from current row and one from the next:*/
            x = rows[i].getElementsByTagName("td")[0];
            y = rows[i + 1].getElementsByTagName("td")[0];
            //check if the two rows should switch place:
            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                //if so, mark as a switch and break the loop:
                shouldSwitch = true;
                break;
            }
        }
        if (shouldSwitch) {
            /*If a switch has been marked, make the switch
            and mark that a switch has been done:*/
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
        }
    }
}