<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication2.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0" />
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects" />
    <meta name="robots" content="noindex, nofollow" />
    <title>MaxRemind - EMS</title>
    <link rel="shortcut icon" type="image/x-icon" href="Styles/img/favicon.png" />
    <link rel="stylesheet" href="Styles/css/bootstrap.min.css" />
    <link rel="stylesheet" href="Styles/css/font-awesome.min.css" />
    <link rel="stylesheet" href="Styles/css/style.css" />

</head>
<body class="account-page">
    <div class="main-wrapper">
        <div class="account-content">
            <div class="container">
                <div class="account-logo">
                    <a href="index.html">
                        <img src="Styles/img/logo2.png" alt="Dreamguy's Technologies" /></a>
                </div>

                <div class="account-box">
                    <div class="account-wrapper">
                        <h3 class="account-title">Login</h3>
                        <p class="account-subtitle">Welcome to MaxRemind EMS</p>
                        <asp:Label runat="server" ID="lblErrorMessage" style="color:Red;"></asp:Label>
                        <form runat="server">
                            <div class="form-group">
                                <label>User</label>
                                <asp:TextBox runat="server"  ID="txtUserName" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col">
                                        <label>Password</label>
                                    </div>
                                </div>
                                <asp:TextBox runat="server" CssClass="form-control" placeholder="Password" ID="txtPassword" TextMode="Password" Required="Required"></asp:TextBox>
                            </div>
                            <div class="form-group text-center">
                                <asp:Button runat="server" Text="Login" CssClass="btn btn-primary account-btn" OnClick="btn_LoginEMS" />
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="Styles/js/jquery-3.2.1.min.js"></script>

    <script src="Styles/js/popper.min.js"></script>
    <script src="Styles/js/bootstrap.min.js"></script>
    <script src="Styles/js/app.js"></script>
</body>
</html>
