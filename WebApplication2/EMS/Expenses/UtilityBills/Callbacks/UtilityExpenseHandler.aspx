<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UtilityExpenseHandler.aspx.cs" Inherits="EMS.EMS.Expenses.UtilityBills.Callbacks.UtilityExpenseHandler" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
              <%--End For Utility Expenses--%>
            ###StartUtilityExpenses###
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
                                        <input type="hidden" class="hdnPaymentDate" value="<%# Eval("PaymentDate") != DBNull.Value? (DateTime.Parse(Eval("PaymentDate").ToString()).ToString("yyyy-MM-dd")): Eval("PaymentDate")%>" />
                                        <input type="hidden" class="hdnBillDate" value="<%# Eval("BillDate") != DBNull.Value? (DateTime.Parse(Eval("BillDate").ToString()).ToString("yyyy-MM-dd")): Eval("BillDate") %>" />
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
            ###EndUtilityExpenses###
              <%--End For Utility Expenses--%>

              <%--For Employee Expenses--%>
            ###StartExpExpenses###
               <asp:Repeater runat="server" ID="rptEmpExpenses">
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
                                        <input type="hidden" class="hdnEmployeeExpenseID" value="<%# Eval("EmployeeExpenseID") %>" />
                                        <input type="hidden" class="hdnExpenseType" value="<%# Eval("ExpenseType") %>" />
                                       <input type="hidden" class="hdnTotalAmmount" value="<%# Eval("TotalAmmount", "{0:N}") %>" />
                                        <input type="hidden" class="hdnPaidAmount" value="<%# Eval("PaidAmount", "{0:N}") %>" />
                                        <input type="hidden" class="hdnPaymentDate" value="<%# Eval("PaymentDate") != DBNull.Value? (DateTime.Parse(Eval("PaymentDate").ToString()).ToString("yyyy-MM-dd")):Eval("PaymentDate") %>" />
                                        <input type="hidden" class="hdnStatus" value="<%# Eval("Status") %>" />
                                        <input type="hidden" class="hdnAttachment" value="<%# Eval("Attachment") %>" />
                                        <input type="hidden" class="hdnComments" value="<%# Eval("Comments") %>" />
                                        <input type="hidden" class="hdnFilePath" value="<%# Eval("FilePath") %>" />
                                        <span data-toggle="modal" data-target="#add_EmpExpense"><i class="la la-pencil" onclick="UpdateFieldsFormEmpExp(this, 'Update')"></i></span>
                                        <%-- <span><i class="la la-eye"></i></span>--%>
                                        <span data-toggle="modal" data-target="#delete_EmpExpense"><i class="la la-trash" onclick="UpdateFieldsFormEmpExp(this, 'Delete')"></i></span>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:HiddenField runat="server" ID="hdnEmpExpenseRows" />
            ###EndExpExpenses###
             <%--End For Employee Expenses--%>

           <%-- For Other Expenses--%>
            ###StartOthExpenses###
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
                                       
                                        <span data-toggle="modal" data-target="#delete_OthExpense"><i class="la la-trash" onclick="UpdateFieldsFormOthExp(this, 'Delete')"></i></span>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
             <asp:HiddenField runat="server" ID="hdnOthExpenseRows" />
            ###EndOthExpenses###
             <%--End For Other Expenses--%>
        </div>
    </form>
</body>
</html>
