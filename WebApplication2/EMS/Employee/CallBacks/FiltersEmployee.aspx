<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FiltersEmployee.aspx.cs" Inherits="EMS.EMS.Employee.CallBacks.FiltersEmployee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            ###StartEmpDetails###
            <asp:Repeater runat="server" ID="rptEmpDetails" OnItemDataBound="EncDec">
                <ItemTemplate>
                    <tr>
                        <td class="text-right"><%# Eval("ROWNUMBER") %></td>
                        <td onclick="EmployeeProfile('<%# Eval("EmployeeID") %>')" class="text-left" title="Click to view Details"><span class="TextBlue"><%# Eval("EmployeeName") %></span></td>
                        <td onclick="EmployeeProfile('<%# Eval("EmployeeID") %>')" class="text-right"><%# Eval("MaxEmployeeID") %></td>
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
            ###EndEmpDetails###

            ###StartSpecialization###
            <div class="form-group">
                <label class="col-form-label">Specialization  <span class="text-danger"></span></label>
                <asp:DropDownList runat="server" ID="ddlSpecialization" CssClass="ddlSpecialization"></asp:DropDownList>
            </div>
            <script>
                $(".ddlSpecialization").select2();
            </script>
            ###EndSpecialization###

        </div>
    </form>
</body>
</html>
