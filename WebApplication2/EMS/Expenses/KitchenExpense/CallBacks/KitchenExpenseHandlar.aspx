<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KitchenExpenseHandlar.aspx.cs" Inherits="EMS.EMS.Expenses.KitchenExpense.CallBacks.KitchenExpenseHandlar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            ###StartKitchenExpense###
              <asp:Repeater ID="rptKitchenExpense" runat="server">
                            <ItemTemplate>
                                    <tr>
                            <td><%# Eval("ROWNUMBER") %></td>
                            <td><%# Eval("Item") %></td>
                           <td><%# Eval("PurchaseFrom") %></td>
                            
                            <td><%# Eval("PurchaseDate") %></td>
                            <td><%# Eval("PurchaseBy") %></td>
                            <td><%# Eval("Amount") %></td>
                            
                         <td>
                             <span> <a href="#" data-toggle="modal" data-target="" title="Edit" onclick=""><i class="fa fa-pencil"></i></a></span>
                             <%--<span> <a href="#" data-toggle="modal" data-target="" title="View" onclick=")"><i class="fa fa-eye"></i></a></span>--%>
                             <span>
                                 <a href="#" data-toggle="modal" data-target="#delete_KitchenExpense" title="Delete" onclick="DeleteRecord(this,'getid')">
                                <i class="fa fa-trash"></i></a>
                             </span>
                         </td>
                            
                        </tr>

                            </ItemTemplate>
                        </asp:Repeater>
                         <asp:HiddenField runat="server" ID="hdnTotalRows" />

            ###EndKitchenExpense###
            ###StartEditkitchenExpense###
			
               <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Kitchen Expense</h5>
                    <button type="button" class="close" onclick="closeDialog(this)">
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
												<input class="form-control" type="text" id="txtBillNo" disabled/>
											</div>
										</div>
									</div>
                                     <div class="col-sm-3 col-md-3">
										<div class="form-group">
											<label>Purchase By <span class="text-danger">*</span></label>
											<div>
												<input class="form-control" type="text" id="txtPurchaseBy" />
											</div>
										</div>
									</div>
                                    <div class="col-sm-3 col-md-3">
										<div class="form-group">
											<label>Purchase Date <span class="text-danger">*</span></label>
											<div class="cal-icon">
												<input class="form-control datetimepicker" type="text" id="txtPurchaseDate" />
											</div>
										</div>
									</div>
									  <div class="col-sm-3 col-md-3">
										<div class="form-group">
											<label>Purchase From <span class="text-danger">*</span></label>
											<div>
												<input class="form-control" type="text" id="txtPurchaseFrom"/>
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
														<th style="width: 20px">#</th>
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
											
                                               <tr>
													<td id="txtRownumber"></td>
													<td id="txtKitchenExpenseID" hidden></td>
													<td>
														<input class="form-control" type="text" style="min-width:100px" id="txtCategory" />
													</td>
													<td>
														<input class="form-control" type="text" style="min-width:100px" id="txtItem" />
													</td>
                                                    <td>
														<input class="form-control" style="width:100px" type="text" id="txtTotalPrice" onkeyup="calculateAmount(this,'Edit')"/>
													</td>
                                                    <td>
														<input class="form-control" style="width:100px" type="text" id="txtDiscount" onkeyup="calculateAmount(this,'Edit')"/>
													</td>
                                                   
													<td>
														<input class="form-control" style="width:100px" type="text" id="txtUnitCost" onkeyup="calculateAmount(this,'Edit')"/>
													</td>
													<td>
														<input class="form-control" style="width:80px" type="text" id="txtQty" onkeyup="calculateAmount(this,'Edit')" />
													</td>
												   <td>
														<input class="form-control" style="width:80px" type="text" id="txtAmount" disabled />
													</td>
				
												</tr>
												
												
												</tbody>
											</table>
										</div>
									
										
									</div>
								</div>
							 <div class="submit-section">
                        <input class="btn btn-primary submit-btn" data-dismiss="modal" type="button" onclick="updatekitchecnExp(this)" value="Update Expense" id="btnAddEmployee" />
                    </div>
							</form>
						</div>
					</div>

                   
                </div>
            </div>
        </div>
			###EndEditkitchenExpense###
			###startAppendRow###
		
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
		
			###EndAppendRow###
        </div>
    </form>
</body>
</html>
