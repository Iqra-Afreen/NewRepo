<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KitchenExpense.aspx.cs" Inherits="EMS.EMS.Expenses.KitchenExpense.KitchenExpense"  MasterPageFile="~/EMS.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="EMS">
    ###StartEMS###
  
<%--    <script>

       



        $(document).ready(function () {
            $("#fa-plus").click(function () {
                $("#clone").clone().appendTo("#Tablebody");
            });
            
            
        });
        function myFunction() {
            var x = document.getElementById("#fa-plus");
            if (x.style.display === "none") {
                x.style.display = "none";
            } else {
                x.style.display = "block";
            }
        
        }
    </script>--%>
   
    <div class="page-header">
        <div class="row align-items-center">
            <div class="col">
                <h3 class="page-title">Kitchen Expenses</h3>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a onclick="EMSNav('DashBoard/DashBoard.aspx')">Dashboard</a></li>
                    <li class="breadcrumb-item active">Expenses</li>
                </ul>
            </div>
            <div class="col-auto float-right ml-auto">
                <a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_employee"><i class="fa fa-plus"></i>Add Kitchen Expenses</a>
                


            </div>
        </div>
    </div>
    <div class="row filter-row">
        <div class="col-md-2">
            <div class="form-group form-focus">
                <input type="text" class="form-control floating" id="ItemName" />
                <label class="focus-label">Item Name</label>
            </div>
        </div>
        <div class="col-md-2">
          <div class="form-group form-focus ">
              <input type="text" class="form-control floating" id="PurchasedBy" />
                <label class="focus-label">Purchased By</label>
            </div>
        </div>

            <div class="col-md-2">
             <div class="form-group form-focus select-focus">
               <input type="date" class="form-control floating datepicker" id="Purchasedates" />
                <label class="focus-label">Purchase Date</label>
            </div>
        </div>
      
        <div class="col-md-2">
            <a href="#" class="btn btn-success btn-block" onclick="SearchKitchenExpense(0,true)">Search </a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 Grid" id="divKitchenExpense">
            <div class="table-responsive divForPrint" style="overflow-y: auto; max-height: 300px">
                <table class="table text-center">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Item</th>
                            <th>Purchase From</th>
                            <th>Purchase Date</th>
                            <th>Purchase By</th>
                            <th>Total Ammount</th>
                            <th>Action</th>
                            
                        </tr>
                    </thead>
                    <tbody class="KitchenExpense" id="KitchenExpenses">
                        <asp:Repeater ID="rptKitchenExpense" runat="server">
                            <ItemTemplate>
                                    <tr>
                            <td id="ROWNUMBER"><%# Eval("ROWNUMBER") %></td>
                            
                            <td id="Item"><%# Eval("Item") %></td>
                           <td id="PurchaseFrom"><%# Eval("PurchaseFrom") %></td>
                            
                            <td id="PurchaseDate"><%# Eval("PurchaseDate") %></td>
                            <td id="PurchaseBy"><%# Eval("PurchaseBy") %></td>
                            <td id="Amount"><%# Eval("Amount") %></td>
                            <td hidden id="BillNo"> <%# Eval("BillNo") %></td>
                            <td hidden id="Category"> <%# Eval("Category") %></td>
                            <td hidden id="Unitcost"> <%# Eval("Unitcost") %></td>
                            <td hidden id="Qty"> <%# Eval("Qty") %></td>
                            <td hidden id="TotalPrice"> <%# Eval("TotalPrice") %></td>
                            <td hidden id="KitchenExpenseID"> <%# Eval("KitchenExpenseID") %></td>
                            <td hidden id="Discount"> <%# Eval("Discount") %></td>
                         <td>
                             <span> <a href="#" data-toggle="modal" data-target="#Edit_Item" title="Edit" onclick="GetDataForUpdate(this)"><i class="fa fa-pencil"></i></a></span>
                             <%--<span> <a href="#" data-toggle="modal" data-target="#view_Item" title="View" onclick=""><i class="fa fa-eye"></i></a></span>--%>
                             <span>
                                 <a href="#" data-toggle="modal" data-target="#delete_KitchenExpense" title="Delete" onclick="DeleteRecord(this,'getid')">
                                <i class="fa fa-trash"></i></a>
                             </span>
                         </td>
                            
                        </tr>

                            </ItemTemplate>
                        </asp:Repeater>
                         <asp:HiddenField runat="server" ID="hdnTotalRows" />
                    
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
                        <select id="ddlKitchenExpense" class="mt_8" onchange="RowsChange('FilterKitchenExpense');">
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
    <%--//start Dialog box when we click on add kitchen Expense--%>
    <div id="add_employee" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Kitchen Expense</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="ClearFields('Add')">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                  <div class="row">
						<div class="col-sm-12">
							<form>
								<div class="row">
					
								
									<div class="col-sm-3 col-md-3">
										<div class="form-group">
											<label>Bill No <span class="text-danger">*</span></label>
											<div class="">
												<input class="form-control" type="text" id="AddBillNo"/>
											</div>
										</div>
									</div>
                                     <div class="col-sm-3 col-md-3">
										<div class="form-group">
											<label>Purchase By <span class="text-danger">*</span></label>
											<div>
												<input class="form-control" type="text" id="AddPurchaseBy"/>
											</div>
										</div>
									</div>
                                    <div class="col-sm-3 col-md-3">
										<div class="form-group">
											<label>Purchase Date <span class="text-danger">*</span></label>
											<div class="cal-icon">
												<input class="form-control datetimepicker" type="text" id="AddPurchaseDate"/>
											</div>
										</div>
									</div>
                                     <div class="col-sm-3 col-md-3">
										<div class="form-group">
											<label>Purchase From <span class="text-danger">*</span></label>
											<div>
												<input class="form-control" type="text" id="AddPurchaseFrom"/>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12 col-sm-12">
										<div class="table-responsive">
											<table class="table table-hover table-white">
												<thead>
													<tr>
														<th style="width: 20px"></th>
                                                        <th class="col-sm-1">Category</th>
														<th class="col-sm-1">Item</th>
														<th class="col-sm-1">Total Price</th>
                                                       
                                                        <th class="col-sm-1">Discount</th>
														<th style="width:100px;">Unit Cost</th>
														<th style="width:80px;">Qty</th>
														<th>Amount</th>
														<th> </th>
													</tr>
												</thead>
												<tbody id="Tablebody">
												<tr id="clone" class="clone">
													<td></td>
													<td>
														<input class="form-control" type="text" style="min-width:100px" id="AddCategory"/>
													</td>
													<td>
														<input class="form-control AddItem" type="text" style="min-width:100px" id="AddItem"/>
													</td>
                                                    <td>
														<input class="form-control" style="width:100px" type="text" id="AddTotalPrice" onkeyup="calculateAmount(this)"/>
													</td>
                                                    <td>
														<input class="form-control" style="width:100px" type="text" id="AddDiscount" onkeyup="calculateAmount(this)"/>
													</td>
                                                   
													<td>
														<input class="form-control" style="width:100px" type="text" id="AddUnitCost" onkeyup="calculateAmount(this)" />
													</td>
													<td>
														<input class="form-control" style="width:80px" type="text" id="AddQty" onkeyup="calculateAmount(this)"/>
													</td>
													<td>
														<input class="form-control" readonly style="width:120px" type="text" id="AddAmount"/>
													</td>
													<td>
                                                        <a href="javascript:void(0)" class="text-success font-18" title="Add"><i class="fa fa-plus" id="fa-plus" onclick="addandremoveRow('Add',this)"></i></a>
                                                        <a href="javascript:void(0)" class="text-danger font-18" title="Remove"><i class="fa fa-trash-o deleteRowButton myDIV" id="myDIV" style="display:none" onclick="addandremoveRow('Delete',this)"></i></a>
													</td>
												</tr>
									            
                                                    

												</tbody>
											</table>
										</div>
									
										
									</div>
								</div>
							 <div class="submit-section">
                        <input class="btn btn-primary submit-btn" data-dismiss="modal" type="button" onclick="AddkitchecnExp(this)" value="Add Expense" id="btnAddEmployee" />
                    </div>
							</form>
						</div>
					</div>

                   
                </div>
            </div>
        </div>
    </div>
        <%--//End Dialog box when we click on add kitchen Expense--%>
    <div class="modal custom-modal fade" id="delete_KitchenExpense" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form-header">
                        <h3>Delete Item</h3>
                        <p>Are you sure want to delete?</p>
                    </div>
                    <div class="modal-btn delete-action">
                        <div class="row">
                            <div class="col-6">
                                <a href="javascript:void(0);" class="btn btn-primary continue-btn" onclick="DeleteRecord(this,'Yesdelete')" data-dismiss="modal">Delete</a>
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
    <div class="modal custom-modal fade Edit_Item" id="Edit_Item" role="dialog" >

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
   <%-- <script src="EMS/Employee/js/Employee.js"></script>--%>
    <script src="EMS/Expenses/KitchenExpense/js/KitchenExpense.js"></script>
    <script src="Scripts/table2excel.js"></script>
<%--    <script src="../../Scripts/Common.js"></script>--%>

    <script>
        //$(document).ready(function () {
        //    debugger
        //    GeneratePaging($("[id$='hdnEmpRows']").val(), $("#ddlEmployeeDetails").val(), "divEmpDetails", "FilterEmployeeDetails");
        //    if ($("[id$='hdnEmpRows']").val() > 0) {

        //        $("#divEmpDetails .spanInfo").html("Showing " + $("#EmpDetails tr:first").children().eq(0).html() + " to "
        //            + $("#EmpDetails tr:last").children().eq(0).html() + " of " + $("[id$='hdnEmpRows']").val() + " entries");
        //    }
        //    (function ($) {
        //        'use strict';

        //        $.mask.definitions['~'] = '[+-]';
        //        $('#Phone').mask('(999) 999-9999');
        //        $('#EmergencyPhone').mask('(999) 999-9999');
        //        $('#CNIC').mask('99999-9999999-9');

        //        $('input').blur(function () {
        //            $('#info').html('Unmasked value: ' + $(this).mask());
        //        }).dblclick(function () {
        //            $(this).unmask();
        //        });
        //    })(jQuery);
        //})
        //if ($('.datetimepicker').length > 0) {
        //    $('.datetimepicker').datetimepicker({
        //        format: 'DD/MM/YYYY',
        //        icons: {
        //            up: "fa fa-angle-up",
        //            down: "fa fa-angle-down",
        //            next: 'fa fa-angle-right',
        //            previous: 'fa fa-angle-left'
        //        }
        //    });
        //}
    </script>
    ###EndEMS###
</asp:Content>



