var formvalidation = true;
function AddUser() {
    debugger
    let UserName = $.trim($("#AddUserName").val());
    let Pasword = $.trim($("#Pasword").val());
    let ConfirmPasword = $.trim($("#ConfirmPasword").val());
    if (Pasword != ConfirmPasword) {
        checkpassword();
        return;
    }
    let Email = $.trim($("#Email").val());
    if (UserName == "" && Pasword == "" && ConfirmPasword == "" && Email == "" && formvalidation == true) {
        alert("Please Add all field valid!");
        return;
    }
    var Params = {
        UserName: UserName,
        Pasword: Pasword,
        Email: Email,
        Action: "AddUser"
    }
    $.post("/EMS/UserAccount/CallBacks/UserHandler.aspx",Params, function (data) {
        debugger
        $("#add_user").remove();
        $('.modal-backdrop').remove()
        EMSNav('UserAccount/User.aspx');
    });
 
}
function showErrorMessage(mesg) {
    $(".divMesg").stop().fadeOut();
    if (mesg != "") {
        $(".divMesg").html(mesg).removeClass("success").addClass("warning").fadeIn(2000).fadeOut(1000000);
    } else {
        $(".divMesg").html("Error: Please review the form carefully for the errors.").removeClass("success").addClass("warning").fadeIn(2000).fadeOut(10000);
    }
}
function ViewPassword() {
    debugger
    if ($(".Password").is(":Password")) {
        $(".Password").removeAttr("type");
        $(".Password").attr('type', 'text');
    }
    else if ($(".Password").is(":text")) {

        $(".Password").removeAttr("type");
        $(".Password").attr('type', 'password');
    }
}
function UpdateUser(elem) {
    debugger
    var userid = $(elem).closest('tr').find('.userid').text();
    var usernname=$(elem).closest('tr').find('.username').text();
    var useremail = $(elem).closest('tr').find('.useremail').text();
    var userstatus = $(elem).closest('tr').find('.userstatus').text();
    var userpassword = $(elem).closest('tr').find('.userpassword').text();
    $('#UpdateUserName').val(usernname);
    $('#UpdateEmail').val(useremail);
    $('#UpdatePasword').val(userpassword);
    $('#UpdateConfirmPasword').val(userpassword);
    $('#hdnuserid').val(userid);
    $("#update_user").modal('show');
}
function UpdateUserRecord() {
    debugger
    let UserName = $.trim($("#UpdateUserName").val());
    let Pasword = $.trim($("#UpdatePasword").val());
    let ConfirmPasword = $.trim($("#UpdateConfirmPasword").val());
    if (Pasword != ConfirmPasword) {
        alert("Password Does not match");
        return;
    }
    let Email = $.trim($("#UpdateEmail").val());
    if (UserName == "" && Pasword == "" && ConfirmPasword == "" && Email == "" && formvalidation == true) {
        alert("Please Add all field valid!");
        return;
    }
    var userid = $('#hdnuserid').val();
    var Params = {
        UserId: userid,
        UserName: UserName,
        Pasword: Pasword,
        Email: Email,
        Action: "UpdateUser"
    }
    $.post("/EMS/UserAccount/CallBacks/UserHandler.aspx", Params, function (data) {
        debugger
        $("#update_user").remove();
        $('.modal-backdrop').remove();
        EMSNav('UserAccount/User.aspx');
    });
}
function Updatecheckpassword() {
    let Pasword = $.trim($("#UpdatePasword").val());
    let ConfirmPasword = $.trim($("#UpdateConfirmPasword").val());
    if (Pasword != ConfirmPasword) {
        $(".Updateerror").css('color', 'red');
        $(".Updateerror").show();
        }
        else {
        $(".Updateerror").hide();
        }
}
function checkpassword() {
    let Pasword = $.trim($("#Pasword").val());
    let ConfirmPasword = $.trim($("#ConfirmPasword").val());
    if (Pasword != ConfirmPasword) {
        $(".Passworderror").css('color', 'red');
        $(".Passworderror").show();
        formvalidation = false;
    }
    else {
        formvalidation = true;
        $(".Passworderror").hide();
    }
}
function Updatecheckemail() {
    if (!ValidateEmail($("#UpdateEmail").val())) {
        $(".emailerror").css('color', 'red');
        $(".emailerror").show();
        formvalidation = false;
    }
    else {
        $(".emailerror").hide();
        formvalidation = true;
    }
};
function DeleteUserDialog(elem) {
    debugger
    var userid = $(elem).closest('tr').find('.userid').text();
    $('#hdnuserid').val(userid);
    $("#delete_user").modal("show");
}
function DeleteUser() {
    var userid = $('#hdnuserid').val();
    $.post("/EMS/UserAccount/CallBacks/UserHandler.aspx", { UserId: userid, Action:"DeleteUser" }, function (data) {
        debugger
        $("#delete_user").remove();
        $('.modal-backdrop').remove();
        EMSNav('UserAccount/User.aspx');
    });
}
function FilterUserDetails(Pagenumber, Paging) {
    debugger
    var Params = {
        Pagenumber: Pagenumber,
        Paging: Paging,
        Rows: $("#ddlUserDetails").val(),
        Action: "FilterUserDetails"
    }
    $.post("/EMS/UserAccount/CallBacks/UserHandler.aspx", Params, function (data) {
        debugger
        var Start = data.indexOf("###StartUserDetails###") + 22;
        var End = data.indexOf("###EndUserDetails###");
        var returnHtml = $.trim(data.substring(Start, End));
        $(".UserDetails").html(returnHtml);
        if (Paging == true) {
            GeneratePaging($("[id$='hdnUserRows']").val(), $("#ddlUsereDetails").val(), "divUserDetails", "FilterUserDetails");
        }
        if ($("[id$='hdnUserRows']").val() > 0) {
            $("#divUserDetails .spanInfo").html("Showing " + $("#UserDetails tr:first").children().eq(0).html() + " to "
                + $("#UserDetails tr:last").children().eq(0).html() + " of " + $("[id$='hdnUserRows']").val() + " entries");
        }
    });
}