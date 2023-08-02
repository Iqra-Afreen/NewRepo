<%@ Page Title="" Language="C#" MasterPageFile="~/EMS.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="EMS.EMS.HRCore.Attendance.Attendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="EMS">
    ###StartEMS###
    <script src="../../../Styles/js/jquery-3.2.1.min.js"></script>
    <script src="../../../Styles/js/select2.min.js"></script>
    <script src="Styles/js/popper.min.js"></script>
    <script src="Styles/js/bootstrap.min.js"></script>
    <script src="Styles/js/moment.min.js"></script>
    <script src="Styles/js/bootstrap-datetimepicker.min.js"></script>
    <script src="Styles/js/jquery.dataTables.min.js"></script>
    <script src="Styles/js/dataTables.bootstrap4.min.js"></script>
    <script src="Scripts/table2excel.js"></script>
    <div class="page-header">
        <div class="row align-items-center">
            <div class="col">
                <h3 class="page-title">Attendance</h3>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                    <li class="breadcrumb-item active">Attendance</li>
                </ul>
            </div>
            <div class="col-auto float-right ml-auto">
                <a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_attendance"><i class="fa fa-plus"></i>Add Attendance</a>
            </div>
        </div>
    </div>
    <div class="row filter-row">
        <div class="col-sm-5 col-md-3">
            <div class="form-group form-focus select-focus">
                <div id="SearchByEmpName">
                </div>
                <label class="focus-label">Employee Name</label>
            </div>
        </div>
        <div class="col-sm-5 col-md-3">
            <div class="form-group form-focus select-focus">
                <input class="datetimepicker form-control floating" id="AttendanceDate" />
                <label class="focus-label">Select Month</label>
            </div>
        </div>

        <div class="col-sm-4 col-md-2">
            <div class="form-group form-focus select-focus">
                <select class="form-control floating" onchange="FilterEmployeeAttendance()" id="DdlLocation">
                    <option>All</option>
                    <option>Islamabad</option>
                    <option>Jampur</option>
                </select>
                <label class="focus-label">Location</label>
            </div>
        </div>

        <div class="col-sm-4 col-md-2">
            <div class="form-group form-focus select-focus">
                <select class="form-control floating" onchange="FilterEmployeeAttendance()" id="DdlShift">
                    <option>All</option>
                    <option>Morning</option>
                    <option>Night</option>
                </select>
                <label class="focus-label">Shift</label>
            </div>
        </div>
        <div class="col-sm-4 col-md-2">
            <a class="btn add-btn mr-1" href="#" onclick="PrintExcel('EmployeeAttendance')"><i class="fa fa-file-excel-o" aria-hidden="true"></i>Export</a>
        </div>
    </div>

    <asp:HiddenField runat="server" ID="hdnEmpID" />

    <!-- /Page Content ->
    <!-- Add Attendance Modal -->
    <div id="add_attendance" class="modal custom-modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="titleAdd">Add Attendance</h5>
                    <h5 class="modal-title" id="titleUpdate" style="display:none">Update Attendance</h5>
                    <button type="button" class="close" onclick="ClearFields()">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Select Employee <span class="text-danger">*</span></label>
                        <div id="AddEmployeeName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Attendance Date <span class="text-danger">*</span></label>
                        <div class="cal-icon">
                            <input class="form-control datepicker" type="text" id="AddAttendanceDate" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Attendance <span class="text-danger">*</span></label>
                        <select class="form-control" onchange="ShowTime()" id="AttendanceType">
                            <option></option>
                            <option>Present</option>
                            <option>Absent</option>
                            <option>Short Leave</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <textarea rows="4" class="form-control" id="Description"></textarea>
                    </div>
                    <div class="submit-section" id="AddBtn">
                        <input type="button" class="btn btn-primary submit-btn" onclick="AddAttendance()" value="Submit" />
                    </div>
                    <div class="submit-section" style="display: none" id="UpdateBtn">
                        <input type="button" class="btn btn-primary submit-btn" onclick="UpdateEmpAttendance()" value="Update" data-dismiss="modal" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /Add Attendance Modal -->
    <!-- Attendance Modal -->
    <div class="modal custom-modal fade" id="attendance_info" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Attendance Info</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card punch-status">
                                <div class="card-body">
                                    <h5 class="card-title">Timesheet <small class="text-muted">11 Mar 2019</small></h5>
                                    <div class="punch-det">
                                        <h6>Punch In at</h6>
                                        <p>Wed, 11th Mar 2019 10.00 AM</p>
                                    </div>
                                    <div class="punch-info">
                                        <div class="punch-hours">
                                            <span>3.45 hrs</span>
                                        </div>
                                    </div>
                                    <div class="punch-det">
                                        <h6>Punch Out at</h6>
                                        <p>Wed, 20th Feb 2019 9.00 PM</p>
                                    </div>
                                    <div class="statistics">
                                        <div class="row">
                                            <div class="col-md-6 col-6 text-center">
                                                <div class="stats-box">
                                                    <p>Break</p>
                                                    <h6>1.21 hrs</h6>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-6 text-center">
                                                <div class="stats-box">
                                                    <p>Overtime</p>
                                                    <h6>3 hrs</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card recent-activity">
                                <div class="card-body">
                                    <h5 class="card-title">Activity</h5>
                                    <ul class="res-activity-list">
                                        <li>
                                            <p class="mb-0">Punch In at</p>
                                            <p class="res-activity-time">
                                                <i class="fa fa-clock-o"></i>
                                                10.00 AM.
													
                                            </p>
                                        </li>
                                        <li>
                                            <p class="mb-0">Punch Out at</p>
                                            <p class="res-activity-time">
                                                <i class="fa fa-clock-o"></i>
                                                11.00 AM.
													
                                            </p>
                                        </li>
                                        <li>
                                            <p class="mb-0">Punch In at</p>
                                            <p class="res-activity-time">
                                                <i class="fa fa-clock-o"></i>
                                                11.15 AM.
													
                                            </p>
                                        </li>
                                        <li>
                                            <p class="mb-0">Punch Out at</p>
                                            <p class="res-activity-time">
                                                <i class="fa fa-clock-o"></i>
                                                1.30 PM.
													
                                            </p>
                                        </li>
                                        <li>
                                            <p class="mb-0">Punch In at</p>
                                            <p class="res-activity-time">
                                                <i class="fa fa-clock-o"></i>
                                                2.00 PM.
													
                                            </p>
                                        </li>
                                        <li>
                                            <p class="mb-0">Punch Out at</p>
                                            <p class="res-activity-time">
                                                <i class="fa fa-clock-o"></i>
                                                7.30 PM.
													
                                            </p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div id="AttendanceReport" style='display: none; min-height: auto; max-height: 70vh; overflow-y: auto;'></div>
    <script src="/EMS/HRCore/js/Attendance.js"></script>
    ###EndEMS###
    ###StartEmployeeAttendance###
    <asp:PlaceHolder ID="ViewEmployeeAttendance" runat="server" />
    ###EndEmployeeAttendance###
    ###StartEmployeeName###
    <asp:DropDownList class="form-control floating" onchange="FilterEmployeeAttendance('change')" ID="DDSearchEmpName" runat="server">
    </asp:DropDownList>
    ###EndEmployeeName###
    ###StartAddEmployeeName###
    <asp:DropDownList class="form-control DDEmpName" Style="width: 438px !important" ID="DDEmpName" runat="server">
    </asp:DropDownList>
    ###EndAddEmployeeName###
</asp:Content>
