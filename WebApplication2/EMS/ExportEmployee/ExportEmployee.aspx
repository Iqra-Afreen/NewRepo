<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExportEmployee.aspx.cs" Inherits="EMS.EMS.ExportEmployee.ExportEmployee" MasterPageFile="~/EMS.Master" %>


<asp:Content runat="server" ContentPlaceHolderID="EMS">
    ###StartEMS###
    <script src="../../Styles/js/select2.min.js"></script>
    <div class="row">
        <div class="FilterWrapper">
            <div class="row">
        <div class="col-3 pr-0 EmployeeNameRow">
            <div class="form-group">
                <label class="col-form-label" style="color:gray">Employee Name:</label>
                <asp:DropDownList runat="server" ID='DDFilterEmpName' class="form-control">
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-3 pr-0">
            <div class="form-group">
                <label class="col-form-label" style="color:gray">Location:</label>
                <select id='DDFilterLocation' class="form-control">
                    <option>Select Location</option>
                    <option>Islamabad</option>
                    <option>Jhanpur</option>
                </select>
            </div>
        </div>
        <div class="col-3 pr-0">
            <div class="form-group">
                <label class="col-form-label" style="color:gray">Employee Status:</label>
                <select id='DDFilterActiveInActive' class="form-control">
                    <option value="true">Active</option>
                    <option value="false">InActive</option>
                </select>
            </div>
        </div>
        <div class="col-3">
            <div class="form-group">
                <label class="col-form-label" style="color:gray">Gender:</label>
                <select id='DDFilterGender' class="form-control">
                    <option>Select Gender</option>
                    <option>Male</option>
                    <option>Female</option>
                </select>
            </div>
        </div>
        <div class="col-3 pr-0">
            <div class="form-group mb-0">
                <label class="col-form-label" style="color:gray">Shift:</label>
                <select id='DDFilterShift' class="form-control">
                    <option>Select Shift</option>
                    <option>Morning</option>
                    <option>Evening</option>
                </select>
            </div>
        </div>
        <div class="col-3 pr-0">
            <div class="form-group mb-0">
                <label class="col-form-label" style="color:gray">Department:</label>
                <select runat="server" id="DDFilterDepartment" class="form-control">
                    <option value="">Select Department</option>
                    <option value="IT">IT</option>
                    <option value="Billing">Billing</option>
                    <option value="HR">HR</option>
                    <option value="Accountant">Accountant</option>
                </select>
            </div>
        </div>
        <div class="col-3">
            <div class="form-group mb-0">
                <label class="col-form-label" style="color:gray">Designation:</label>
                <asp:DropDownList runat="server" id="DDFilterDesignation" class="form-control">
                </asp:DropDownList>
            </div>
        </div>
    </div>
    </div>
       </div> 

    <script src="EMS/ExportEmployee/js/ExportEmployee.js"></script>
    <script src="Scripts/table2excel.js"></script>
   
    <div class="move-option">
        <div class="subject-info-box-1">
            <p>Available Columns</p>
            <select id="Select1" class="form-control" runat="server" hidden></select>
            <select multiple="multiple" id='lstBox1' class="form-control">
            </select>
        </div>

        <div class="subject-info-arrows text-center">
            <input type='button' id='btnAllRight' value='>>' class="btn btn-default" /><br />
            <input type='button' id='btnRight' value='>' class="btn btn-default" /><br />
            <input type='button' id='btnLeft' value='<' class="btn btn-default" /><br />
            <input type='button' id='btnAllLeft' value='<<' class="btn btn-default" />
        </div>
        <div class="subject-info-box-2">
            <p>Report Columns</p>
            <select multiple="multiple" id='lstBox2' class="form-control">
            </select>
        </div>
    </div>
    <div class="report-filter-footer">
        <input type="button" value="View" id="ViewReport" onclick="ViewDetail('View')" />
        <input type="button" value="Save / Print" id="SaveReport" onclick="ViewDetail('Save')" />
    </div>
    <br />
    <div id="CustomizeReport" style='display: none' class="Printreport Grid"></div>

    ###EndEMS###
            ###StartEmployeeDatatable###
            <asp:PlaceHolder ID="ViewEmployeeReport" runat="server" />
    ###EndEmployeeDatatable###

</asp:Content>

