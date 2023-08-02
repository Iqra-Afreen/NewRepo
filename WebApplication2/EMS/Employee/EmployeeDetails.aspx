<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDetails.aspx.cs" Inherits="EMS.EMS.Employee.EmployeeDetails" MasterPageFile="~/EMS.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="EMS">
    ###StartEMS###
    <div class="page-header">
        <div class="row align-items-center">
            <div class="col">
                <h3 class="page-title">Employee</h3>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a onclick="EMSNav('DashBoard/DashBoard.aspx')">Dashboard</a></li>
                    <li class="breadcrumb-item active">Employee</li>
                </ul>
            </div>
            <div class="col-auto float-right ml-auto">
                <a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_employee"><i class="fa fa-plus"></i>Add Employee</a>
                <a class="btn add-btn mr-1" href="#" onclick="PrintExcel('Employee')"><i class="fa fa-file-excel-o" aria-hidden="true"></i>Export</a>


            </div>
        </div>
    </div>
    <div class="row filter-row">
        <div class="col-sm-6 col-md-3">
            <div class="form-group form-focus">
                <input type="text" class="form-control floating" id="MaxEmployeeID" />
                <label class="focus-label">Employee ID</label>
            </div>
        </div>
        <div class="col-sm-6 col-md-3">
            <div class="form-group form-focus">
                <input type="text" class="form-control floating" id="EmployeeName" />
                <label class="focus-label">Employee Name</label>
            </div>
        </div>
        <div class="col-sm-6 col-md-3">
            <div class="form-group form-focus select-focus">
                <select class="select floating" id="ActiveInActive">
                    <option value="true">Active</option>
                    <option value="false">InActive</option>
                </select>
                <label class="focus-label">Active InActive Employee</label>
            </div>
        </div>
        <div class="col-sm-6 col-md-3">
            <a href="#" class="btn btn-success btn-block" onclick="FilterEmployeeDetails(0,true)">Search </a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 Grid" id="divEmpDetails">
            <div class="table-responsive divForPrint" style="overflow-y: auto; max-height: 300px">
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Employee ID</th>
                            <th>Gender</th>
                            <th>Designation</th>
                            <th class="text-nowrap">Join Date</th>
                            <th>Date Of Birth</th>
                            <th>Qualification</th>
                            <th>CNIC</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>Contact</th>
                            <th class="removeForExcel">Action</th>
                        </tr>
                    </thead>
                    <tbody class="EmpDetails" id="EmpDetails">
                        <asp:Repeater runat="server" ID="rptEmpDetails" OnItemDataBound="EncDec">
                            <ItemTemplate>
                                <tr>
                                    <td class="text-right"><%# Eval("ROWNUMBER") %></td>
                                    <td onclick="EmployeeProfile('<%# Eval("EmployeeID") %>')" class="text-left" title="Click to view Details"><span class="TextBlue"><%# Eval("EmployeeName") %></span></td>
                                    <td onclick="EmployeeProfile('<%# Eval("EmployeeID") %>')" class="text-right" title="Click to view Details"><%# Eval("MaxEmployeeID") %></td>
                                    <td class="text-left"><%# Eval("Gender") %></td>
                                    <td class="text-left"><%# Eval("Designation") %></td>
                                    <td class="text-right"><%# Eval("JoiningDate","{0:d}") %></td>
                                    <td class="text-right"><%# Eval("DateofBirth","{0:d}") %></td>
                                    <td class="text-left"><%# Eval("Qualification") %></td>
                                    <td class="text-left">
                                        <asp:Label runat="server" ID="txtCNIC"></asp:Label></td>
                                    <td onclick="EmployeeProfile('<%# Eval("EmployeeID") %>')" class="text-left"><%# Eval("EmailID") %></td>
                                    <td class="text-left"><%# Eval("Address") %></td>
                                    <td class="text-left">
                                        <asp:Label runat="server" ID="txtContact"></asp:Label></td>
                                    <td class="text-center removeForExcel">
                                        <a href="#" data-toggle="modal" data-target="#delete_employee" title="Delete" onclick="DeleteEmployee('<%# Eval("EmployeeID") %>','Delete')">
                                            <i class="fa fa-trash"></i></a>
                                        <a href="#" data-toggle="modal" data-target="#ActiveInActive_employee" onclick="ActiveInActive('<%# Eval("EmployeeID") %>','Active','<%# Eval("EmployeeActiveStatus") %>')" title="Active User"><i class="fa fa-user"></i></a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:HiddenField runat="server" ID="hdnEmpRows" />
                    </tbody>
                </table>

            </div>
            <div class="message">
                <span class="iconInfo m_7"></span>
                <span class="spanInfo"></span>
            </div>
            <div class="pager">
                <div class="PageEntries">
                    <span class="float_left">show&nbsp;</span>
                    <span class="float_left">
                        <select id="ddlEmployeeDetails" class="mt_8" onchange="RowsChange('FilterEmployeeDetails');">
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
    <div id="add_employee" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Employee</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="ClearFields('Add')">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">First Name <span class="text-danger">*</span></label>
                                <input class="form-control required" type="text" id="FirstName" onkeypress="return validateSpecialCharExceptComma(event)" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Middle Name</label>
                                <input class="form-control" type="text" id="MiddleName" onkeypress="return validateSpecialCharExceptComma(event)" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Last Name</label>
                                <input class="form-control required" type="text" id="LastName" onkeypress="return validateSpecialCharExceptComma(event)" />
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Gender<span class="text-danger">*</span></label>
                                <select class="select" id="Gender">
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Email <span class="text-danger">*</span></label><span class="error" style="display: none">A valid email address is required</span>
                                <input class="form-control" type="email" id="Email" onfocusout="checkemail()" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Date of Birth <span class="text-danger">*</span></label>
                                <div class="cal-icon">
                                    <input class="form-control datetimepicker required" type="text" id="DOB" />
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Contact No <span class="text-danger">*</span></label>
                                <input class="form-control required" type="text" id="Phone" onkeypress="return ValidateNumber(event)" maxlength="11" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Emergency Contact Name<span class="text-danger">*</span></label>
                                <input class="form-control required" type="text" id="EmergencyContactName" onkeypress="return validateSpecialCharExceptComma(event)" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Emergency Contact No <span class="text-danger">*</span></label>
                                <input class="form-control required" type="text" id="EmergencyPhone" onkeypress="return ValidateNumber(event)" maxlength="11" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Marital Status</label>
                                <select class="select" id="MaritalStatus">
                                    <option value="Single">Single</option>
                                    <option value="Married">Married</option>
                                    <option value="Divorced">Divorced</option>
                                    <option value="Widowed">Widowed</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">CNIC <span class="text-danger">*</span></label>
                                <input class="form-control required" type="text" id="CNIC" onkeypress="return ValidateNumber(event)" maxlength="13" />
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-form-label">Address <span class="text-danger"></span></label>
                                <input class="form-control" type="text" id="Address" />
                            </div>
                        </div>
                    </div>

                    <div class="submit-section">
                        <input class="btn btn-primary submit-btn" data-dismiss="modal" type="button" onclick="AddEmployee()" value="Add Employee" id="btnAddEmployee" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal custom-modal fade" id="delete_employee" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form-header">
                        <h3>Delete Employee</h3>
                        <p>Are you sure want to delete?</p>
                    </div>
                    <div class="modal-btn delete-action">
                        <div class="row">
                            <div class="col-6">
                                <a href="javascript:void(0);" class="btn btn-primary continue-btn" onclick="DeleteEmployee('','DeleteRecord')" data-dismiss="modal">Delete</a>
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
    <div class="modal custom-modal fade" id="ActiveInActive_employee" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form-header">
                        <h3 id="TitleActiveInActive">Active InActive Employee</h3>
                        <p id="MessageActiveInActive"></p>
                    </div>
                    <div class="modal-btn delete-action">
                        <div class="row">
                            <div class="col-6">
                                <a href="javascript:void(0);" class="btn btn-primary continue-btn" onclick="ActiveInActive('','ActiveRecord')" data-dismiss="modal">Active-InActive</a>
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
    <script src="Styles/js/jquery.maskedinput.min.js"></script>
    <script src="Styles/js/mask.js"></script>
    <script src="EMS/Employee/js/Employee.js"></script>
    <script src="Scripts/table2excel.js"></script>
<%--    <script src="../../Scripts/Common.js"></script>--%>

    <script>
        $(document).ready(function () {
            debugger
            GeneratePaging($("[id$='hdnEmpRows']").val(), $("#ddlEmployeeDetails").val(), "divEmpDetails", "FilterEmployeeDetails");
            if ($("[id$='hdnEmpRows']").val() > 0) {

                $("#divEmpDetails .spanInfo").html("Showing " + $("#EmpDetails tr:first").children().eq(0).html() + " to "
                    + $("#EmpDetails tr:last").children().eq(0).html() + " of " + $("[id$='hdnEmpRows']").val() + " entries");
            }
            (function ($) {
                'use strict';

                $.mask.definitions['~'] = '[+-]';
                $('#Phone').mask('(999) 999-9999');
                $('#EmergencyPhone').mask('(999) 999-9999');
                $('#CNIC').mask('99999-9999999-9');

                $('input').blur(function () {
                    $('#info').html('Unmasked value: ' + $(this).mask());
                }).dblclick(function () {
                    $(this).unmask();
                });
            })(jQuery);
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
    </script>
    ###EndEMS###
</asp:Content>
