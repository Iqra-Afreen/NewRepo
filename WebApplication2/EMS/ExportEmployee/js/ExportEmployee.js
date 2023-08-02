$(document).ready(function () {
    debugger
    $("[id$='DDFilterEmpName']").select2();
    $("[id$='DDFilterDesignation']").select2();
    $("[id$='DDFilterLocation']").select2();
    $("[id$='DDFilterGender']").select2();
    $("[id$='DDFilterDepartment']").select2();
    $("[id$='DDFilterActiveInActive']").select2();
    $("[id$='DDFilterShift']").select2();
    $("#lstBox1").html($("[id$='Select1']").html());
});

function sortOptions(selectElement) {

    var options = selectElement.find('option').get();
    options.sort(optionsSort);
    selectElement.html(options).get(0).selectedIndex = 0;


}

function optionsSort(o1, o2) {

    if (o1.text == o2.text) return 0;
    return (o1.text > o2.text) ? 1 : -1;
}
$('#btnRight').click(function (e) {
    debugger

    var selectedOpts = $('#lstBox1 option:selected');
    if (selectedOpts.length == 0) {
        showErrorMessage("Nothing to move Select option.");
        e.preventDefault();
    }

    $('#lstBox2').append($(selectedOpts).clone());
    $('#lstBox2').css("border-color", "lightgray");
    $(selectedOpts).remove();
    sortOptions($("#lstBox2"))

    e.preventDefault();
});
$('#btnAllRight').click(function (e) {
    debugger
    var selectedOpts = $('#lstBox1 option');
    sortOptions($("#lstBox2"));
    if (selectedOpts.length == 0) {
        showErrorMessage("Nothing to move.");
        e.preventDefault();
    }

    $('#lstBox2').append($(selectedOpts).clone());
    $('#lstBox2').css("border-color", "lightgray");
    $(selectedOpts).remove();
    sortOptions($("#lstBox2"))

    e.preventDefault();
})
$('#btnLeft').click(function (e) {
    debugger

    var selectedOpts = $('#lstBox2 option:selected');
    if (selectedOpts.length == 0) {
        showErrorMessage("Nothing to move Select option.");
        e.preventDefault();
    }

    $('#lstBox1').append($(selectedOpts).clone());
    $('#lstBox2').css("border-color", "lightgray");
    $(selectedOpts).remove();
    sortOptions($("#lstBox1"))

    e.preventDefault();
});
$('#btnAllLeft').click(function (e) {
    debugger

    var selectedOpts = $('#lstBox2 option');
    if (selectedOpts.length == 0) {
        showErrorMessage("Nothing to move.");
        e.preventDefault();
    }

    $('#lstBox1').append($(selectedOpts).clone());
    $('#lstBox2').css("border-color", "lightgray");
    $(selectedOpts).remove();
    sortOptions($('#lstBox1'))

    e.preventDefault();
});

function SaveReport(fileName) {
    debugger;
    $("#CustomizeReport").table2excel({
        filename: fileName,
    });
}
function ViewDetail(Check) {
    debugger
    var RequiredColumns = $("#lstBox2 option").map(function () {
        return $(this).text();
    }).get().join(',');

    var parms = {
        RequiredColumns: RequiredColumns,
        EmployeeName: $.trim($("[id$='DDFilterEmpName']").val()),
        Gender: ($.trim($("[id$='DDFilterGender']").val()) != "Select Gender") ? ($.trim($("[id$='DDFilterGender']").val())): "",
        Department: $.trim($("[id$='DDFilterDepartment']").val()),
        Location: ($.trim($("[id$='DDFilterLocation']").val()) != "Select Location") ? ($.trim($("[id$='DDFilterLocation']").val())): "",
        Shift: ($.trim($("[id$='DDFilterShift']").val()) != "Select Shift") ? ($.trim($("[id$='DDFilterShift']").val())): "",
        Designation: ($("[id$='FilterDesignation'] option:selected").text() != "Select Designation") ? $("[id$='FilterDesignation']").text(): "",
        ActiveStatus: $.trim($("[id$='DDFilterActiveInActive']").val()),
        Rows: Check=="View"?10:"",
        Action: "LoadReport"
    };
    if (RequiredColumns == "") {
        $("#lstBox2").css("border-color", "red");
        showErrorMessage("Please Select Columns to View in Table")
    }
    else {
        $.post("/EMS/ExportEmployee/ExportEmployee.aspx", parms, function (data) {
            debugger

            var start = data.indexOf("###StartEmployeeDatatable###") + 28
            var end = data.indexOf("###EndEmployeeDatatable###")
            var returnhtml = $.trim(data.substring(start, end));
            if (Check == "Save") {
                SaveReport("Employee");
            }
            else
                $("#CustomizeReport").html(returnhtml).show();
                if ($("#ExportEmployee tr").length == 1) {
                    $("#ExportEmployee").append("<span style='color:red;width:auto;height:40px;white-space:nowrap;display:block;padding:12px 0 '>No Record Found !</span>");
                }

            });
    }
}