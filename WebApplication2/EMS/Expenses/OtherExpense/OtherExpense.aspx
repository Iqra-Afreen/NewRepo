﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OtherExpense.aspx.cs" Inherits="EMS.EMS.Expenses.OtherExpense.OtherExpense" MasterPageFile="~/EMS.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="EMS">
    ###StartEMS###
    <style>
        #UAttachment {
            background-color: #F0F0F0;
            color: black;
            padding: 3px 8px;
            text-decoration: none;
            width: 85px;
            font-size: 11px;
            border: 1px solid #686868;
            height: auto;
            border-radius: 0px;
        }

        #fileLabel {
            font-size: 12px;
            padding-right: 20px;
            border: none;
            margin-bottom: 100px;
            margin-left: 0%;
            width: 120px;
            height: 20px;
            margin-top: -100px;
        }
    </style>
    <div class="page-header">
        <div class="row align-items-center">
            <div class="col">
                <h3 class="page-title">Other Expenses</h3>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a onclick="EMSNav('DashBoard/DashBoard.aspx')">Dashboard</a></li>
                    <li class="breadcrumb-item active">Expenses</li>
                </ul>
            </div>
            <div class="col-auto float-right ml-auto">
                <a href="#" class="btn add-btn" id="ModalForAddOthExpense" data-toggle="modal" data-target="#add_OthExpense"><i class="fa fa-plus"></i>Add Other Expenses</a>



            </div>
        </div>
    </div>
    <div class="row filter-row">
        <div class="col-md-2">
            <div class="form-group form-focus select-focus">
                <select class="form-control floating" id="dllOthExpenseType">
                    <option value="">Select Type</option>
                    <option value="Rent">Rent</option>
                    <option value="Repair">Repair</option>
                    <option value="Fuel">Fuel</option>
                    <option value="Taxes">Taxes</option>
                    <option value="Office Supplies">Office Supplies</option>
                    <option value="Maintenance">Maintenance</option>
                </select>
                <label class="focus-label">Expense Type</label>
            </div>
        </div>

        <div class="col-md-2">
            <div class="form-group form-focus select-focus">
                <select class="form-control floating" id="ddlOthStatus">
                    <option value="">Select Status</option>
                    <option value="Approved">Approved</option>
                    <option value="Pending">Pending</option>
                    <option value="Rejected">Rejected</option>
                </select>
                <label class="focus-label">Status</label>
            </div>
        </div>
        <div class="col-md-2">
            <div class="form-group form-focus select-focus">
                <input type="date" class="form-control floating" id="OthPaymentDate" />
                <label class="focus-label">Date</label>
            </div>
        </div>

        <div class="col-md-2">
            <a href="#" class="btn btn-success btn-block" onclick="FilterOthExpnesesDetails(0,true)">Search </a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 Grid" id="divOthDetails">
            <div class="table-responsive divForPrint" style="overflow-y: auto; max-height: 300px">
                <table class="table text-center">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Expense Type</th>
                            <th>Total Amount </th>
                            <th>Paid Amount</th>
                            <th>Paid Date</th>
                            <th>Status</th>
                            <th>Comment</th>
                            <th>Action</th>

                        </tr>
                    </thead>
                    <tbody class="OthExpenseDetails" id="OthExpenseDetails">
                        <asp:Repeater runat="server" ID="rptOthExpenses">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("ROWNUMBER") %></td>
                                    <td><%# Eval("ExpenseType") %></td>
                                    <td><%# Eval("TotalAmmount", "{0:N}") %></td>
                                    <td><%# Eval("PaidAmount", "{0:N}") %></td>
                                    <td><%# Eval("PaymentDate") %></td>
                                    <td><%# Eval("Status") %></td>
                                    <td title="<%# Eval("Comments") %>"><%#(Eval("Comments").ToString().Length > 20) ? Eval("Comments").ToString().Substring(0, 20) : Eval("Comments") %>...</td>
                                    <td>
                                        <input type="hidden" class="hdnOtherExpenseID" value="<%# Eval("OtherExpenseID") %>" />
                                        <input type="hidden" class="hdnExpenseType" value="<%# Eval("ExpenseType") %>" />
                                        <input type="hidden" class="hdnTotalAmmount" value="<%# Eval("TotalAmmount", "{0:N}") %>" />
                                        <input type="hidden" class="hdnPaidAmount" value="<%# Eval("PaidAmount", "{0:N}") %>" />
                                        <input type="hidden" class="hdnPaymentDate" value="<%# Eval("PaymentDate") != DBNull.Value? (DateTime.Parse(Eval("PaymentDate").ToString()).ToString("yyyy-MM-dd")):Eval("PaymentDate") %>" />
                                        <input type="hidden" class="hdnStatus" value="<%# Eval("Status") %>" />
                                        <input type="hidden" class="hdnAttachment" value="<%# Eval("Attachment") %>" />
                                        <input type="hidden" class="hdnComments" value="<%# Eval("Comments") %>" />
                                        <input type="hidden" class="hdnFilePath" value="<%# Eval("FilePath") %>" />
                                        <span data-toggle="modal" data-target="#add_OthExpense"><i class="la la-pencil" onclick="UpdateFieldsFormOthExp(this, 'Update')"></i></span>
                                        <%-- <span><i class="la la-eye"></i></span>--%>
                                        <span data-toggle="modal" data-target="#delete_OthExpense"><i class="la la-trash" onclick="UpdateFieldsFormOthExp(this, 'Delete')"></i></span>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:HiddenField runat="server" ID="hdnOthExpenseRows" />
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
                        <select id="ddlOtherExpDetails" class="mt_8" onchange="RowsChange('FilterEmployeeDetails');">
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
    <%--Modal for Other Expense--%>
    <div id="add_OthExpense" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Other Expense</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="ClearFields('Add')">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Expense Type <%--<span class="text-danger">*</span>--%></label>
                                <select class="form-control required" id="OtherExpenseType">
                                    <option value="">Select Type</option>
                                    <option value="Rent">Rent</option>
                                    <option value="Repair">Repair</option>
                                    <option value="Fuel">Fuel</option>
                                    <option value="Taxes">Taxes</option>
                                    <option value="Office Supplies">Office Supplies</option>
                                    <option value="Maintenance">Maintenance</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Total Ammount</label>
                                <input class="form-control required" type="text" id="OthTotalAmount" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Paid Amount</label>
                                <input class="form-control required" type="text" id="OthPaidAmount" />
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Date <%--<span class="text-danger">*</span>--%></label>
                                <input class="form-control required" type="date" id="OthPayDate" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Status <%--<span class="text-danger">*</span>--%></label>
                                <select class="form-control required" id="OtherStatus">
                                    <option value="">Select Status</option>
                                    <option value="Approved">Approved</option>
                                    <option value="Pending">Pending</option>
                                    <option value="Rejected">Rejected</option>

                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Attachement <%--<span class="text-danger">*</span>--%></label>
                                <div class="row form-control">
                                    <a class="d-inline form-control" name="UAttachment" href="javascript:void(0)" id="UAttachment">Choose File</a>
                                    <%-- <input class="form-control" name="UAttachment" style="width: 100px; color: transparent;" type="file" id="UAttachment" onclick="UploadFileFormReadyCommon()"/>--%>
                                    <input class="d-inline col-form-label" id="fileLabel" value="No file choosen" />
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-form-label">Comment <%--<span class="text-danger">*</span>--%></label>
                                <textarea class="form-control" id="OthComments"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="submit-section">
                        <input class="btn btn-primary submit-btn" data-dismiss="modal" type="button" onclick="AddUpdateOthExpense('Add')" value="Add Other Expenses" id="btnAddOthExpenses" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--End --%>

    <%--Modal for Delete Other Expense--%>
    <div class="modal custom-modal fade" id="delete_OthExpense" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form-header">
                        <h3>Delete Other Expenses</h3>
                        <p>Are you sure want to delete?</p>
                    </div>
                    <div class="modal-btn delete-action">
                        <div class="row">
                            <div class="col-6">
                                <a href="javascript:void(0);" class="btn btn-primary continue-btn" onclick="DeleteOtherExpenses()" data-dismiss="modal">Delete</a>
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
    <%--   End--%>


    <script src="Styles/js/jquery-3.2.1.min.js"></script>
    <script src="Styles/js/popper.min.js"></script>
    <script src="Styles/js/bootstrap.min.js"></script>
    <script src="Styles/js/jquery.slimscroll.min.js"></script>
    <script src="Styles/js/select2.min.js"></script>
    <script src="Styles/js/moment.min.js"></script>
    <script src="Styles/js/bootstrap-datetimepicker.min.js"></script>
    <script src="Styles/js/jquery.maskedinput.min.js"></script>
    <script src="Scripts/ajaxupload.js"></script>
    <script src="Styles/js/mask.js"></script>
    <script src="EMS/Employee/js/Employee.js"></script>
    <script src="Scripts/table2excel.js"></script>
    <script src="EMS/Expenses/UtilityBills/js/Expense.js"></script>
    <%--  <script src="../../Scripts/Common.js"></script>--%>

    <script>
        $(document).ready(function () {
            debugger
            GeneratePaging($("[id$='hdnOthExpenseRows']").val(), $("#ddlOtherExpDetails").val(), "divOthDetails", "FilterOthExpnesesDetails");
            if ($("[id$='hdnOthExpenseRows']").val() > 0) {
               
                $("#divOthDetails .spanInfo").html("Showing " + $("#OthExpenseDetails tr:first").children().eq(0).html() + " to "
                    + $("#OthExpenseDetails tr:last").children().eq(0).html() + " of " + $("[id$='hdnOthExpenseRows']").val() + " entries");
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
            if ($("[id$='ModalForAddOthExpense']").click(function () {
                UploadFileFormReadyCommon();
                UpdateFieldsFormOthExp('', 'Add');
            }));
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
