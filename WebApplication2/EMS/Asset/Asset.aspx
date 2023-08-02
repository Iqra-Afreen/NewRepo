<%@ Page Title="" Language="C#" MasterPageFile="~/EMS.Master" AutoEventWireup="true" CodeBehind="Asset.aspx.cs" Inherits="EMS.EMS.Asset.Asset" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EMS" runat="server">
     ###StartEMS###
    <div class="page-header">
        <div class="row align-items-center">
            <div class="col">
                <h3 class="page-title">Asset</h3>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a onclick="EMSNav('DashBoard/DashBoard.aspx')">Dashboard</a></li>
                    <li class="breadcrumb-item active">Asset</li>
               </ul>
          </div>
            <div class="col-auto float-right ml-auto">
                <a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_asset"><i class="fa fa-plus"></i>Add Asset</a>



            </div>
        </div>
    </div>
    <div class="row filter-row">

        <div class="col-md-2">
            <div class="form-group form-focus">
                <input type="text" class="form-control floating" id="" />
                <label class="focus-label">Employee Name</label>
         </div>
        </div>
        <div class="col-md-2">
            <div class="form-group form-focus select-focus">
                <select class="form-control floating">
                      <option>---Select---</option>
                    <option></option>
                    <option></option>
                </select>
                <label class="focus-label">Asset id</label>
            </div>
        </div>
        <div class="col-md-2">
            <div class="form-group form-focus select-focus">
                <input type="text" class="form-control floating datetimepicker" id="" />
                <label class="focus-label">Date</label>
            </div>
        </div>

        <div class="col-md-2">
            <a href="#" class="btn btn-success btn-block">Search </a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 Grid" id="divEmpDetails">
            <div class="table-responsive divForPrint" style="overflow-y: auto; max-height: 300px">
                <table class="table text-center">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Asset User</th>
                            <th>Asset Name</th>
                            <th>Asset id</th>
                            <th>Purchase Date</th>
                            <th class="text-nowrap">Warrenty</th>
                            <th>Warrenty End</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th>Action</th>

                        </tr>
                    </thead>
                    <tbody class="EmpDetails" id="EmpDetails">
                        <tr>
                            <td>1</td>
                            <td>Bushra Jabeen</td>
                            <td>Laptop</td>
                            <td>#AST-007</td>
                            <td>01-01-2023</td>
                            <td>12 Months</td>
                            <td>01-01-2023</td>
                            <td>
                            </td>
                            <td>
                                 <select class="PasueButton">
                                    <option>Select Status</option>
                                    <option>Pending</option>
                                    <option>Approved</option>
                                    <option>Returned</option>
                                    
                                </select>
                            </td>
                            <td><span><i class="la la-pencil" data-toggle="modal" data-target="#Update_Asset"></i></span>
                                <span><i class="la la-eye" data-toggle="modal" data-target="#View_Asset"></i></span>
                                <span><i class="la la-trash" data-toggle="modal" data-target="#delete_Asset"></i></span>
                            </td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <td>Iqra Parveen</td>
                            <td>Laptop</td>
                            <td>#AST-007</td>
                            <td>01-01-2023</td>
                            <td>12 Months</td>
                            <td>01-01-2023</td>
                            <td>
                               

                            </td>
                            <td>
                                 <select class="PasueButton">
                                     <option>Select Status</option>
                                    <option>Pending</option>
                                    <option>Approved</option>
                                    <option>Returned</option>
                                    
                                </select>
                            </td>
                            <td><span><i class="la la-pencil" data-toggle="modal" data-target="#Update_Asset"></i></span>
                                <span><i class="la la-eye" data-toggle="modal" data-target="#View_Asset"></i></span>
                                <span><i class="la la-trash" data-toggle="modal" data-target="#delete_Asset"></i></span>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Faiza Bilal</td>
                            <td>Laptop</td>
                            <td>#AST-007</td>
                            <td>01-01-2023</td>
                            <td>12 Months</td>
                            <td>01-01-2023</td>
                            <td>
                                

                            </td>
                            <td>
                                <select class="PasueButton">
                                   <option>Select Status</option>
                                    <option>Pending</option>
                                    <option>Approved</option>
                                    <option>Returned</option>
                                    
                                </select>
                            </td>
                            <td><span><i class="la la-pencil" data-toggle="modal" data-target="#Update_Asset"></i></span>
                                <span><i class="la la-eye" data-toggle="modal" data-target="#View_Asset"></i></span>
                                <span><i class="la la-trash" data-toggle="modal" data-target="#delete_Asset"></i></span>
                            </td>
                        </tr>

                        <tr>
                            <td>4</td>
                            <td>Rimsha Kawal</td>
                            <td>Laptop</td>
                            <td>#AST-007</td>
                            <td>01-01-2023</td>
                            <td>12 Months</td>
                            <td>01-01-2023</td>
                            <td></td>
                            <td>
                                 <select class="PasueButton">
                                     <option>Select Status</option>
                                    <option>Pending</option>
                                    <option>Approved</option>
                                    <option>Returned</option>
                                    
                                </select>
                            </td>
                            <td><span><i class="la la-pencil" data-toggle="modal" data-target="#Update_Asset"></i></span>
                                <span><i class="la la-eye" data-toggle="modal" data-target="#View_Asset"></i></span>
                                <span><i class="la la-trash" data-toggle="modal" data-target="#delete_Asset"></i></span>
                            </td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>Faiza Mustafa</td>
                            <td>Laptop</td>
                            <td>#AST-007</td>
                            <td>01-01-2023</td>
                            <td>12 Months</td>
                            <td>01-01-2023</td>
                            <td></td>
                            <td>
                                <select class="PasueButton">
                                    <option>Select Status</option>
                                    <option>Pending</option>
                                    <option>Approved</option>
                                    <option>Returned</option>
                                    
                                </select>
                            </td>
                            <td><span><i class="la la-pencil" data-toggle="modal" data-target="#Update_Asset"></i></span>
                                <span><i class="la la-eye" data-toggle="modal" data-target="#View_Asset"></i></span>
                                <span><i class="la la-trash" data-toggle="modal" data-target="#delete_Asset"></i></span>
                            </td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>Ghulam Mustafa</td>
                            <td>Laptop</td>
                            <td>#AST-007</td>
                            <td>01-01-2023</td>
                            <td>12 Months</td>
                            <td>01-01-2023</td>
                            <td></td>
                            <td>
                                <select class="PasueButton">
                                    <option>Select Status</option>
                                    <option>Pending</option>
                                    <option>Approved</option>
                                    <option>Returned</option>
                                    
                                </select>
                            </td>
                            <td><span><i class="la la-pencil" data-toggle="modal" data-target="#Update_Asset"></i></span>
                                <span><i class="la la-eye" data-toggle="modal" data-target="#View_Asset"></i></span>
                                <span><i class="la la-trash" data-toggle="modal" data-target="#delete_Asset"></i></span>
                            </td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>Arooj Fatima</td>
                            <td>Laptop</td>
                            <td>#AST-007</td>
                            <td>01-01-2023</td>
                            <td>12 Months</td>
                            <td>01-01-2023</td>
                            <td> </td>
                            <td>
                                 <select class="PasueButton">
                                    <option>Select Status</option>
                                    <option>Pending</option>
                                    <option>Approved</option>
                                    <option>Returned</option>
                                    
                                </select>
                            </td>
                            <td><span><i class="la la-pencil" data-toggle="modal" data-target="#Update_Asset"></i></span>
                                <span><i class="la la-eye" data-toggle="modal" data-target="#View_Asset"></i></span>
                                <span><i class="la la-trash" data-toggle="modal" data-target="#delete_Asset"></i></span>
                            </td>
                        </tr>
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
                        <select id="ddlEmployeeDetails" class="mt_8">
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
    <div id="add_asset" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Asset</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                      <div class="row">
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Asset Name</label>
                                <input class="form-control required" type="text" id="" />
                            </div>
                        </div>
                         <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Asset ID</label>
                                <input class="form-control required" type="text" id="" />
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Quantity </label>
                                <input class="form-control required" type="text" id="" />
                            </div>
                        </div>

                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Purchase Date </label>
                                <input class="form-control required" type="text" id="" />
                            </div>
                        </div>

                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Purchase From</label>
                                <input class="form-control required" type="text" id="" />
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Manufacturer </label>
                                <input class="form-control required" type="text" id="" />
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Model</label>
                                <input class="form-control required" type="text" id="" />
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Serial No </label>
                                <input class="form-control required" type="text" id="" />
                            </div>
                        </div>
                      
                    </div>
                    <div class="row">

                          <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Supplier </label>
                                <input class="form-control required" type="text" id="" />
                            </div>
                        </div>

                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Condition </label>
                                <span class="error" style="display: none">A valid email address is required</span>
                                <input class="form-control" type="text" id="" placeholder="" />
                            </div>
                        </div>

                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Warrenty </label>
                                <input class="form-control" type="text" id="" />
                            </div>
                        </div>
                        <div class="col-sm-3">

                            <div class="form-group">
                                <label class="col-form-label">Asset User </label>
                                <select class="form-control">
                                    <option>Select Asset User</option>
                                    <option></option>
                                    <option></option>
                                    <option></option>

                                </select>

                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Value </label>
                                <input class="form-control" type="text" id="" />
                            </div>
                        </div>
                         <div class="col-sm-3">

                            <div class="form-group">
                                <label class="col-form-label">Status </label>
                                <select class="form-control">
                                    <option>Select Status</option>
                                    <option>Pending</option>
                                    <option>Approved</option>
                                    <option>Returned</option>

                                </select>

                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-form-label">Description</label>

                                <textarea class="form-control"></textarea>
                            </div>
                        </div>
                       
                    </div>

                    <div class="submit-section">
                        <input class="btn btn-primary submit-btn" data-dismiss="modal" type="button" value="Add Asset" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal custom-modal fade" id="delete_Asset" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form-header">
                        <h3>Delete Asset</h3>
                        <p>Are you sure want to delete?</p>
                    </div>
                    <div class="modal-btn delete-action">
                        <div class="row">
                            <div class="col-6">
                                <a href="javascript:void(0);" class="btn btn-primary continue-btn" data-dismiss="modal">Delete</a>
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
    <div class="modal custom-modal fade" id="Update_Asset" role="dialog">
        <div class="modal-dialog modal-dialog-centered  modal-lg">
            <div class="modal-content">
                 <div class="modal-header">
                    <h5 class="modal-title">Update Asset</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Asset Name</label>
                                <input class="form-control required" type="text" id="" />
                            </div>
                        </div>
                         <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Asset ID</label>
                                <input class="form-control required" type="text" id="" />
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Quantity </label>
                                <input class="form-control required" type="text" id="" />
                            </div>
                        </div>

                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Purchase Date </label>
                                <input class="form-control required" type="text" id="" />
                            </div>
                        </div>

                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Purchase From</label>
                                <input class="form-control required" type="text" id="" />
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Manufacturer </label>
                                <input class="form-control required" type="text" id="" />
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Model</label>
                                <input class="form-control required" type="text" id="" />
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Serial No </label>
                                <input class="form-control required" type="text" id="" />
                            </div>
                        </div>
                      
                    </div>
                    <div class="row">

                          <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Supplier </label>
                                <input class="form-control required" type="text" id="" />
                            </div>
                        </div>

                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Condition </label>
                                <span class="error" style="display: none">A valid email address is required</span>
                                <input class="form-control" type="text" id="" placeholder="" />
                            </div>
                        </div>

                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Warrenty </label>
                                <input class="form-control" type="text" id="" />
                            </div>
                        </div>
                        <div class="col-sm-3">

                            <div class="form-group">
                                <label class="col-form-label">Asset User </label>
                                <select class="form-control">
                                    <option>Select Asset User</option>
                                    <option></option>
                                    <option></option>
                                    <option></option>

                                </select>

                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-form-label">Value </label>
                                <input class="form-control" type="text" id="" />
                            </div>
                        </div>
                         <div class="col-sm-3">

                            <div class="form-group">
                                <label class="col-form-label">Status </label>
                                <select class="form-control">
                                    <option>Select Status</option>
                                    <option>Pending</option>
                                    <option>Approved</option>
                                    <option>Returned</option>

                                </select>

                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-form-label">Description</label>

                                <textarea class="form-control"></textarea>
                            </div>
                        </div>
                       
                    </div>

                    <div class="submit-section">
                        <input class="btn btn-primary submit-btn" data-dismiss="modal" type="button" value="Update Asset" />
                    </div>
                </div>
            </div>
        </div>
    </div>
     <div class="modal custom-modal fade" id="View_Asset" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                 <div class="modal-header">
                    <h5 class="modal-title">View Asset</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                      <h1>View Asset</h1>

                    <div class="submit-section">
                        <input class="btn btn-primary submit-btn" data-dismiss="modal" type="button" value="View Asset" />
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
