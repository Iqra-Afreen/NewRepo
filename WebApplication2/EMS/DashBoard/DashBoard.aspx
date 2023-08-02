<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="EMS.DashBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            ###StartEMS###
            <div class="page-header">
                <div class="row">
                    <div class="col-sm-12">
                        <h3 class="page-title">Welcome Admin!</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ul>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-md-4 col-sm-4 col-lg-4 col-xl-4">
                    <div class="card dash-widget">
                        <a class="dashLink" onclick="EMSNav('Employee/EmployeeDetails.aspx')">
                            <div class="card-body dashTabs">

                                <span class="dash-widget-icon"><i class="fa fa-users"></i></span>
                                <div class="dash-widget-info">
                                    <h3>Employees</h3>
                                </div>
                                <div class="dashWidgetFooter">
                                    View All
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-lg-4 col-xl-4">
                    <div class="card dash-widget">
                        <a class="dashLink" onclick="EMSSubNav('HRCore/Attendance/Attendance.aspx')">
                        <div class="card-body dashTabs">
                            <span class="dash-widget-icon"><i class="fa fa-calendar"></i></span>
                            <div class="dash-widget-info">
                                <h3>Attendance</h3>
                            </div>
                        </div>
                             </a>
                    </div>
                </div>
              
                 <div class="col-md-4 col-sm-4 col-lg-4 col-xl-4">
                    <div class="card dash-widget">
                        <a class="dashLink" onclick="EMSNav('Asset/Asset.aspx')">
                        <div class="card-body dashTabs">
                            <span class="dash-widget-icon"><i class="fa fa-cube"></i></span>
                            <div class="dash-widget-info">
                                <h3>Asset</h3>
                            </div>
                        </div>
                             </a>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-lg-4 col-xl-4">
                    <div class="card dash-widget">
                        <a class="dashLink" onclick="EMSSubNav('Settings/Permissions/Permissions.aspx')">
                        <div class="card-body dashTabs">
                            <span class="dash-widget-icon"><i class="fa fa-gear"></i></span>
                            <div class="dash-widget-info">
                                <h3>Settings</h3>
                            </div>
                        </div>
                             </a>
                    </div>
                </div>
            </div>
            <script>
                    $(document).ready(function () {
                        $('.dash-widget').hover(function () {
                            $('.dash-widget').stop().fadeTo('fast', 0.3);
                            $(this).stop().fadeTo('fast', 1);
                        }, function () {
                            $('.dash-widget').stop().fadeTo('fast', 1);
                        });
        });
            </script>
            ###EndEMS###
        </div>
    </form>
</body>
</html>
