<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UtilityExpense.aspx.cs" Inherits="EMS.EMS.Expenses.UtilityBills.UtilityExpense" MasterPageFile="~/EMS.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="EMS">
    ###StartEMS###
   
    <style>
        .ViewButton {
            padding-top: 11px;
        }

        .img {
            border-radius: 50%;
            width: 30px;
        }

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
                <h3 class="page-title">Utility Expenses</h3>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a onclick="EMSNav('DashBoard/DashBoard.aspx')">Dashboard</a></li>
                    <li class="breadcrumb-item active">Expenses</li>
                </ul>
            </div>
            <div class="col-auto float-right ml-auto">
                <a href="#" class="btn add-btn" id="ModalForAddUtility" data-toggle="modal" data-target="#add_Utility"><i class="fa fa-plus"></i>Add Utility Expenses</a>



            </div>
        </div>
    </div>
    <div class="row filter-row">

        <div class="col-md-2">
            <div class="form-group form-focus select-focus">
                <select class="form-control floating" id="ddlBilltype">
                    <option value="">Select Bill Type</option>
                    <option value="Internet">Internet</option>
                    <option value="Electricity">Electricity</option>
                    <option value="Gas">Gas</option>
                    <option value="Water">Water</option>
                </select>
                <label class="focus-label">Bill Type</label>
            </div>
        </div>
        <div class="col-md-2">
            <div class="form-group form-focus select-focus">
                <select class="form-control floating" id="ddlPayMethod">
                    <option value="">Select Method</option>
                    <option value="Cheque">Cheque</option>
                    <option value="Cash">Cash</option>
                    <option valye="Other">Other</option>
                </select>
                <label class="focus-label">Payment Method</label>
            </div>
        </div>
        <div class="col-md-2">
            <div class="form-group form-focus select-focus">
                <input type="date" class="form-control floating datepicker" id="PayDate" />
                <label class="focus-label">Date</label>
            </div>
        </div>

        <div class="col-md-2">
            <a href="#" class="btn btn-success btn-block" onclick="FilterUExpnesesDetails(0,true)">Search </a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 Grid" id="divUDetails">
            <div class="table-responsive divForPrint" style="overflow-y: auto; max-height: 300px">
                <table class="table text-center">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Bill Type</th>
                            <th>Bill Amount</th>
                            <th>Paid Ammount</th>
                            <th class="text-nowrap">Payment Date</th>
                            <th>Balnace Due</th>
                            <th>Payment Method</th>
                            <th>Payee Name</th>
                            <th>Action</th>

                        </tr>
                    </thead>
                    <tbody class="UExpenseDetails" id="UExpenseDetails">
                        <asp:Repeater runat="server" ID="rptUExpenses">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("ROWNUMBER") %></td>
                                    <td><%# Eval("BillType") %></td>
                                    <td><%# Eval("BillAmount", "{0:N}") %></td>
                                    <td><%# Eval("PaidAmount", "{0:N}") %></td>
                                    <td><%# Eval("PaymentDate") %></td>
                                    <td><%# Eval("BalanceDue", "{0:N}") %></td>
                                    <td><%# Eval("PaymentMethod") %></td>
                                    <td><%# Eval("PayeeName") %></td>
                                    <td>
                                        <input type="hidden" class="hdnUtilityId" value="<%# Eval("UtilityExpenseID") %>" />
                                        <input type="hidden" class="hdnCheckNo" value="<%# Eval("CheckNo") %>" />
                                        <input type="hidden" class="hdnCompanyName" value="<%# Eval("CompanyName") %>" />
                                        <input type="hidden" class="hdnBillType" value="<%# Eval("BillType") %>" />
                                        <input type="hidden" class="hdnBillAmount" value="<%# Eval("BillAmount", "{0:N}") %>" />
                                        <input type="hidden" class="hdnPaidAmount" value="<%# Eval("PaidAmount", "{0:N}") %>" />
                                        <input type="hidden" class="hdnPaymentDate" value="<%# Eval("PaymentDate") != DBNull.Value? (DateTime.Parse(Eval("PaymentDate").ToString()).ToString("yyyy-MM-dd")): Eval("PaymentDate") %>" />
                                        <input type="hidden" class="hdnBillDate" value="<%#Eval("BillDate") != DBNull.Value? (DateTime.Parse(Eval("BillDate").ToString()).ToString("yyyy-MM-dd")):Eval("BillDate") %>" />
                                        <input type="hidden" class="hdnBalanceDue" value="<%# Eval("BalanceDue", "{0:N}") %>" />
                                        <input type="hidden" class="hdnPaymentMethod" value="<%# Eval("PaymentMethod") %>" />
                                        <input type="hidden" class="hdnPayeeName" value="<%# Eval("PayeeName") %>" />
                                        <input type="hidden" class="hdnAttachment" value="<%# Eval("Attachement ") %>" />
                                        <input type="hidden" class="hdnComments" value="<%# Eval("Comments") %>" />
                                        <input type="hidden" class="hdnFilePath" value="<%# Eval("FilePath") %>" />
                                        <span data-toggle="modal" data-target="#add_Utility"><i class="la la-pencil" onclick="UpdateFieldsForm(this, 'Update')"></i></span>
                                       <%-- <span><i class="la la-eye"></i></span>--%>
                                        <span data-toggle="modal" data-target="#delete_Utility"><i class="la la-trash" onclick="UpdateFieldsForm(this, 'Delete')"></i></span>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:HiddenField runat="server" ID="hdnUExpenseRows" />
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
                        <select id="ddlUExpenseDetails" class="mt_8" onchange="RowsChange('FilterUExpnesesDetails');">
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

    <%-- Modal for Add utility--%>
    <div id="add_Utility" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="TitleModal">Utility Expense</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="ClearFields('Add')">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-form-label">Check/Ref No <%--<span class="text-danger">*</span>--%></label>
                                <input class="form-control required" type="text" id="UCheckNumber" <%-- onkeypress="return validateSpecialCharExceptComma(event)"--%> />
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-form-label">Company Name <%--<span class="text-danger">*</span>--%></label>
                                <input class="form-control required" type="text" id="UCompanyName" onkeypress="return validateSpecialCharExceptComma(event)" />
                            </div>
                        </div>

                        <div class="col-sm-4 ViewButton p-t-10">
                            <div class="form-group">
                                <label class="col-form-label"><%--<span class="text-danger">*</span>--%></label>
                                <input class="form-control btn btn-primary" type="button" id="UOpenBill" value="Open Bill" onkeypress="return validateSpecialCharExceptComma(event)" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-form-label">Bill Type <%--<span class="text-danger">*</span>--%></label>
                                <select class="form-control required" id="UBillType">
                                    <option value="">Select Bill Type</option>
                                    <option value="Internet">Internet</option>
                                    <option value="Electricity">Electricity</option>
                                    <option valye="Gas">Gas</option>
                                    <option value="Water">Water</option>

                                </select>

                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-form-label">Bill Amount <%--<span class="text-danger">*</span>--%></label>
                                <input class="form-control required" type="text" id="UBillAmount" <%--onkeypress="return validateSpecialCharExceptComma(event)"--%> />
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-form-label">Bill Date <%--<span class="text-danger">*</span>--%></label>

                                <input type="date" class="form-control floating datepicker required" id="UBillDate" />

                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-form-label">Paid Amount <%--<span class="text-danger">*</span>--%></label>
                                <input class="form-control required" type="text" id="UPaidAmount" <%--onkeypress="return validateSpecialCharExceptComma(event)"--%> />
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-form-label">Balance Due <%--<span class="text-danger">*</span>--%></label>
                                <input class="form-control required" type="text" id="UBalanceDue" <%--onkeypress="return validateSpecialCharExceptComma(event)"--%> />
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-form-label">Payment Method <%--<span class="text-danger">*</span>--%></label>

                                <select class="form-control required" id="UPaymentMethod">
                                    <option value="">Payment Method</option>
                                    <option value="Cash">Cash</option>
                                    <option value="Cheque">Cheque</option>
                                    <option valye="Other">Other</option>

                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-form-label">Payment Date <%--<span class="text-danger">*</span>--%></label>
                                <input type="date" class="form-control floating datepicker" id="UPaymentDate" />
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-form-label">Payee Name <%--<span class="text-danger">*</span>--%></label><span class="error" style="display: none">A valid email address is required</span>
                                <input class="form-control required" type="text" id="UPayeeName" <%--<%--onfocusout="checkemail()"--%> placeholder="" />
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-form-label">Attachment <%--<span class="text-danger">*</span>--%></label>
                                <div class="row form-control">
                                    <a class="d-inline form-control" name="UAttachment" href="javascript:void(0)" id="UAttachment">Choose File</a>
                                    <%-- <input class="form-control" name="UAttachment" style="width: 100px; color: transparent;" type="file" id="UAttachment" onclick="UploadFileFormReadyCommon()"/>--%>
                                    <input class="d-inline col-form-label" id="fileLabel" value="No file choosen" />
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-form-label">Comments<%--<span class="text-danger">*</span>--%></label>

                                <textarea class="form-control" id="UComments"></textarea>
                            </div>
                        </div>

                    </div>

                    <div class="submit-section">
                        <input class="btn btn-primary submit-btn" data-dismiss="modal" type="button" onclick="AddUpdateUtilityExpense('Add')" value="Add Expenses" id="btnUtilityExpenses" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--End Modal for Add utility--%>

    

    <%-- Modal for Add Delete utility--%>
    <div class="modal custom-modal fade" id="delete_Utility" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form-header">
                        <h3>Delete Utility Expneses</h3>
                        <p>Are you sure want to delete?</p>
                    </div>
                    <div class="modal-btn delete-action">
                        <div class="row">
                            <div class="col-6">
                                <a href="javascript:void(0);" class="btn btn-primary continue-btn" onclick="DeleteUtility(this)" data-dismiss="modal">Delete</a>
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
    <%--End Modal for Add Delete utility--%>

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
    <%--    <script src="../../Scripts/Common.js"></script>--%>

    <script>

        $(document).ready(function () {
            debugger
            GeneratePaging($("[id$='hdnUExpenseRows']").val(), $("#ddlUExpenseDetails").val(), "divUDetails", "FilterUExpnesesDetails");
            if ($("[id$='hdnUExpenseRows']").val() > 0) {

                $("#divUDetails .spanInfo").html("Showing " + $("#UExpenseDetails tr:first").children().eq(0).html() + " to "
                    + $("#UExpenseDetails tr:last").children().eq(0).html() + " of " + $("[id$='hdnUExpenseRows']").val() + " entries");
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
            //Added By Faiza Bilal 9-27-2023 to add file, first it will be initialized   on form open
            if ($("[id$='ModalForAddUtility']").click(function () {
                UploadFileFormReadyCommon();
                UpdateFieldsForm('', 'Add');
            }));
           
            //End
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

