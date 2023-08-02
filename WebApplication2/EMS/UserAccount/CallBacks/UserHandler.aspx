<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHandler.aspx.cs" Inherits="EMS.EMS.UserAccount.CallBacks.UserHandler" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            ###StartUserDetails###
            <asp:Repeater runat="server" ID="rptUserDetails">
                <ItemTemplate>
                    <tr>
                        <td class="text-center "><%# Eval("ROWNUMBER") %></td>
                        <td style="display: none" class="text-center userid"><%# Eval("UserID") %></td>
                        <td class="text-center username"><asp:Label runat="server" ID="txtUserName"></asp:Label></td>
                        <td class="text-center useremail"><%# Eval("UserEmail") %></td>
                        <td class="text-center userstatus"><%# Eval("Status") %></td>
                        <td style="display: none" class="text-center userpassword">
                            <asp:Label ID="LPassword" runat="server"></asp:Label></td>
                        <td class="text-center"><span onclick="UpdateUser(this)">
                            <img src="../../Styles/img/pencil-edit-button.png" /></span>
                            <span onclick="DeleteUserDialog(this)">
                                <img src="../../Styles/img/recycleBin.png" /></span>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <asp:HiddenField runat="server" ID="hdnUserRows" />
            ###EndUserDetails###
        </div>
    </form>
</body>
</html>
