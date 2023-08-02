<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="EMS.EMS.User_Account.User" MasterPageFile="~/EMS.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="EMS">
    ###StartEMS###
    <style>
        .view_logo {
            background: url(Styles/img/eye5.png);
            width: 18px;
            height: 16px;
            background-repeat: no-repeat;
            position: absolute;
            right: 22px;
            top: 54px;
        }
    </style>
    <div class="page-header">
        <div class="row align-items-center">
            <div class="col">
                <h3 class="page-title">User</h3>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a onclick="EMSNav('DashBoard/DashBoard.aspx')">Dashboard</a></li>
                    <li class="breadcrumb-item active">User</li>
                </ul>
            </div>
            <div class="col-auto float-right ml-auto">
                <a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_user"><i class="fa fa-plus"></i>Add User</a>

            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive Grid" id="divUserDetails" style="overflow-y: auto; max-height: 300px">
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>User Name</th>
                            <th>Email Address</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody class="UserDetails" id="UserDetails">
                        <asp:Repeater runat="server" ID="rptUserDetails" OnItemDataBound="EncDec">
                            <ItemTemplate>
                                <tr>
                                    <td class="text-center "><%# Eval("ROWNUMBER") %></td>
                                    <td style="display: none" class="text-center userid"><%# Eval("UserID") %></td>
                                    <td class="text-center username"><asp:Label runat="server" ID="txtUserName"></asp:Label></td>
                                    <td class="text-center useremail"><%# Eval("UserEmail") %></td>
                                    <td class="text-center userstatus"><%# Eval("Status") %></td>
                                    <td style="display: none" class="text-center userpassword"><asp:Label ID="LPassword" runat="server"></asp:Label></td>
                                    <td class="text-center">
                                         <i class="fa fa-pencil" title="Edit" onclick="UpdateUser(this)"></i>
                                        <i class="fa fa-trash-o" onclick="DeleteUserDialog(this)" title="Delete"></i>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:HiddenField runat="server" ID="hdnUserRows" />
                    </tbody>
                </table>
                <div class="message">
                    <span class="iconInfo m_7"></span>
                    <span class="spanInfo"></span>
                </div>
                <div class="pager">
                    <div class="PageEntries">
                        <span class="float_left">show&nbsp;</span>
                        <span class="float_left">
                            <select id="ddlUserDetails" class="mt_8" onchange="RowsChange('FilterUserDetails');">
                                <option value="10">10</option>
                                <option value="25">25</option>
                                <option value="50">50</option>
                                <option value="75">75</option>
                                <option value="100">100</option>
                                <option value="100000">All</option>
                            </select>
                        </span><span class="float_left">&nbsp;page</span>
                    </div>
                    <div class="PageButtons">
                        <ul class="float_right1 mr_15">
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="add_user" class="modal custom-modal fade" data-backdrop="static" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add User</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="ClearFields('Add')">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">User Name<span class="text-danger">*</span></label>
                                <input class="form-control" type="text" id="AddUserName" onkeypress="return ValidateAlphaNunmaric(event)" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Password<span class="text-danger">*</span></label><span class="Passworderror" style="display: none">Password dones not match</span>
                                <input class="form-control Password" type="password" maxlength="24" id="Pasword" />
                                <span class="spnViewUser view_logo" onclick="ViewPassword()" style="margin-left: 0px"></span>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Confirm Password<span class="text-danger">*</span></label>
                                <input class="form-control" type="password" id="ConfirmPasword" onfocusout="checkpassword()" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Email <span class="text-danger">*</span></label>
                                <span class="error" style="display: none">A valid email address is required</span>
                                <input class="form-control" type="email" id="Email" maxlength="50" onfocusout="checkemail()" />
                            </div>

                        </div>
                    </div>

                    <div class="submit-section">
                        <input class="btn btn-primary submit-btn" type="button" onclick="AddUser()" value="Add User" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="update_user" class="modal custom-modal fade" data-backdrop="static" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Update User</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="ClearFields('Add')">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">User Name<span class="text-danger">*</span></label>
                                <input class="form-control" type="text" id="UpdateUserName" onkeypress="return ValidateAlphaNunmaric(event)" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Password<span class="text-danger">*</span></label><span class="Updateerror" style="display: none">Password dones not match</span>
                                <input class="form-control Password" type="password" maxlength="24" id="UpdatePasword" />
                                <span class="spnViewUser view_logo" onclick="ViewPassword()" style="margin-left: 0px"></span>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Confirm Password<span class="text-danger">*</span></label>
                                <input class="form-control" type="password" id="UpdateConfirmPasword" onfocusout="Updatecheckpassword()" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Email <span class="text-danger">*</span></label>
                                <span class="emailerror" style="display: none">A valid email address is required</span>
                                <input class="form-control" type="email" id="UpdateEmail" maxlength="50" onfocusout="Updatecheckemail()" />
                            </div>

                        </div>
                    </div>

                    <div class="submit-section">
                        <input class="btn btn-primary submit-btn" type="button" onclick="UpdateUserRecord()" value="Update User" />
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" id="hdnuserid" />
    </div>

    <div class="modal custom-modal fade" data-backdrop="static" id="delete_user" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form-header">
                        <i class="fa fa-times-circle-o deletePopUpIcon"></i>
                        <p>Are you sure want to delete?</p>
                    </div>
                    <div class="modal-btn delete-action">
                        <div class="row">
                            <div class="col-6">
                                <a href="javascript:void(0);" onclick="DeleteUser()" class="btn btn-primary Delete-btn">Delete</a>
                            </div>
                            <div class="col-6">
                                <a href="javascript:void(0);" data-dismiss="modal" class="btn btn-primary cancel-btn">Cancel</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="Styles/js/jquery-3.2.1.min.js"></script>
    <script src="Styles/js/popper.min.js"></script>
    <script src="Styles/js/bootstrap.min.js"></script>
    <script src="Styles/js/jquery.slimscroll.min.js"></script>
    <script src="Styles/js/select2.min.js"></script>
    <script src="Styles/js/moment.min.js"></script>
    <script src="Styles/js/bootstrap-datetimepicker.min.js"></script>
    

    <%--    <script src="Styles/js/jquery.dataTables.min.js"></script>
    <script src="Styles/js/dataTables.bootstrap4.min.js"></script>--%>
    <script src="EMS/UserAccount/js/User.js"></script>
    <script>
        $(document).ready(function () {
            debugger
            GeneratePaging($("[id$='hdnUserRows']").val(), $("#ddlUsereDetails").val(), "divUserDetails", "FilterUserDetails");
            if ($("[id$='hdnUserRows']").val() > 0) {

                $("#divUserDetails .spanInfo").html("Showing " + $("#UserDetails tr:first").children().eq(0).html() + " to "
                    + $("#UserDetails tr:last").children().eq(0).html() + " of " + $("[id$='hdnUserRows']").val() + " entries");
            }
        })
        
    </script>
    ###EndEMS###
</asp:Content>
