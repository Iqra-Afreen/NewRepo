<%@ Page Title="" Language="C#" MasterPageFile="~/EMS.Master" AutoEventWireup="true" CodeBehind="EmployeeProfile.aspx.cs" Inherits="EMS.EMS.Employee.EmployeeProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EMS" runat="server">
    ###StartProfile###
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="page-title">Employee</h3>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a onclick="EMSNav('DashBoard/DashBoard.aspx')">Dashboard</a></li>
                        <li class="breadcrumb-item"><a onclick="EMSNav('Employee/EmployeeDetails.aspx')">Employee</a></li>
                        <li class="breadcrumb-item active">Profile</li>
                    </ul>
                </div>
            </div>
        </div>
    <div class="card mb-0">
        <div class="card-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="profile-view">
                        <div id="ProfileInfo">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="profile-info-left">
                                        <h3 class="user-name m-t-0 mb-0">
                                            <asp:Label runat="server" ID="EmployeeName"></asp:Label>
                                        </h3>
                                        <h6 class="text-muted">
                                            <asp:Label runat="server" ID="EmpTeam"></asp:Label></h6>
                                        <small class="text-muted">
                                            <asp:Label runat="server" ID="EmpDesignation"></asp:Label></small>
                                        <div class="staff-id">
                                            Employee ID :
                                            <asp:Label runat="server" ID="MaxRemindEmpID"></asp:Label>
                                        </div>
                                        <div class="small doj text-muted">
                                            Date of Join :
                                            <asp:Label runat="server" ID="EmpJoiningDate"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <ul class="personal-info">
                                        <li>
                                            <div class="title">Phone:</div>
                                            <div class="text">
                                                <asp:Label runat="server" ID="EmpContactNo"></asp:Label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="title">Email:</div>
                                            <div class="text">
                                                <asp:Label runat="server" ID="EmpEmail"></asp:Label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="title">Birthday:</div>
                                            <div class="text">
                                                <asp:Label runat="server" ID="EmpBirthday"></asp:Label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="title">Address:</div>
                                            <div class="text clear">
                                                <asp:Label runat="server" ID="EmpAddress"></asp:Label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="title">Gender:</div>
                                            <div class="text">
                                                <asp:Label runat="server" ID="EmpGender"></asp:Label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="title">CNIC:</div>
                                            <div class="text">
                                                <asp:Label runat="server" ID="EmpCNIC"></asp:Label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="title">Blood Group:</div>
                                            <div class="text">
                                                <asp:Label runat="server" ID="EmpBloodGroup"></asp:Label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="title">Emergency#:</div>
                                            <div class="text">
                                                <asp:Label runat="server" ID="EmpEmergencyContactNo"></asp:Label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="title">Emergency Contact Name:</div>
                                            <div class="text">
                                                <asp:Label runat="server" ID="EmpEmerContName"></asp:Label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="title">Marital Status:</div>
                                            <div class="text">
                                                <asp:Label runat="server" ID="EmpMaritalStatus"></asp:Label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="pro-edit"><a data-target="#profile_info" data-toggle="modal" class="edit-icon" href="#" onclick="UpdateEmployeeInformation('Update',this)"><i class="fa fa-pencil"></i></a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card tab-box">
        <div class="row user-tabs">
            <div class="col-lg-12 col-md-12 col-sm-12 line-tabs">
                <ul class="nav nav-tabs nav-tabs-bottom">
                    <li class="nav-item"><a href="#Medicalbeneficiaries" data-toggle="tab" class="nav-link active" id="tabMedicalBeneficiaries">Medical Beneficiaries</a></li>
                    <li class="nav-item"><a href="#OfficeInfo" data-toggle="tab" class="nav-link" id="tabOfficeInfo">Office Info</a></li>
                    <li class="nav-item"><a href="#AccountInfo" data-toggle="tab" class="nav-link" id="tabAccountInfo">Account Info</a></li>
                    <li class="nav-item"><a href="#DocumentsInfo" data-toggle="tab" class="nav-link" id="tabDocumentsInfo">Documents Info</a></li>
                    <li class="nav-item"><a href="#SalaryInfo" data-toggle="tab" class="nav-link" id="tabSalaryInfo">Salary Info</a></li>



                </ul>
            </div>
        </div>
    </div>
    <div class="tab-content">
        <div id="Medicalbeneficiaries" class="pro-overview tab-pane fade show active">
            <div class="row">
                <div class="col-md-12 d-flex">
                    <div class="card profile-box flex-fill">
                        <div class="card-body">
                            <div class="bodyHeader">
                                <h3 class="card-title"></h3>
                                <div class="text text-center">
                                    <label>Total Allowance :(<span runat="server" id="TotalAllowance" class="TotalAllowances"></span>)</label>
                                    <label>Remaining Allowance :(<span runat="server" id="RemainingAllowance" class="RemainingAllowances"></span>)</label>
                                    <label>Given Allowance :(<span runat="server" id="GivenAllowance" class="GivenAllowances"></span>)</label>
                                </div>
                                <a href="#" class="edit-icon" data-toggle="modal" data-target="#family_info_modal" onclick="AddMedicalBeneficiaries('Add')"><i class="fa fa-pencil"></i></a>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-nowrap" id="tblMedicalBeneficiaries">
                                    <thead>
                                        <tr>
                                            <th class="text-center">Name</th>
                                            <th class="text-center">Relationship</th>
                                            <th class="text-center">Date of Birth</th>
                                            <th class="text-center">CNIC</th>
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyMedicalBeneficiaries">
                                        <asp:Repeater runat="server" ID="rptMedicalBeneficiaries" OnItemDataBound="EncDecMediBene">
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="text-left RelationshipName"><%# Eval("RelationshipName") %></td>
                                                    <td class="text-left RelationToEmployee"><%# Eval("RelationToEmployee") %></td>
                                                    <td class="text-right DateOfBirth"><%#Eval("DateOfBirth","{0:d}") %></td>
                                                    <td class="text-right CNIC">
                                                        <asp:Label runat="server" ID="txtCNIC"></asp:Label></td>
                                                    <td class="text-center"><span data-toggle="modal" data-target="#family_info_modal" onclick="UpdateMedicalBeneficiaries('<%# Eval("MedicalbeneficiariesID") %>',this,'Update')">
                                                        <img src="../../Styles/img/pencil-edit-button.png" /></span>
                                                        <span data-toggle="modal" data-target="#delete_MedicalBenifectori" onclick="DeleteMedicalBeneficiaries('<%# Eval("MedicalbeneficiariesID") %>','Delete')">
                                                            <img src="../../Styles/img/recycleBin.png" /></span>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="OfficeInfo" class="pro-overview tab-pane fade show">
            <div class="row">
                <div class="col-md-12 d-flex">
                    <div class="card profile-box flex-fill">
                        <div class="card-body">
                            <h3 class="card-title"><a href="#" class="edit-icon" data-toggle="modal" data-target="#Office_Info" onclick="AddOfficeInfo('Add',this)"><i class="fa fa-pencil"></i></a></h3>
                            <div class="personal-info">
                                <div class="row">
                                    <div class="col-lg-4 pb-3">
                                        <div class="title">Employee ID</div>
                                        <div class="text">
                                            <asp:Label runat="server" ID="MaxEmployeeID"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 pb-3">
                                        <div class="title">Date of Join</div>
                                        <div class="text">
                                            <asp:Label runat="server" ID="DateofJoin"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 pb-3">
                                        <div class="title">Location</div>
                                        <div class="text">
                                            <asp:Label runat="server" ID="Location"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 pb-3">
                                        <div class="title">Contract Date</div>
                                        <div class="text">
                                            <asp:Label runat="server" ID="ContractDate"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 pb-3">
                                        <div class="title">Termination Date</div>
                                        <div class="text">
                                            <asp:Label runat="server" ID="TerminationDate"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 pb-3">
                                        <div class="title">Shift</div>
                                        <div class="text">
                                            <asp:Label runat="server" ID="Shift"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 pb-3">
                                        <div class="title">Employee Status</div>
                                        <div class="text">
                                            <asp:Label runat="server" ID="EmployeeStatus"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 pb-3">
                                        <div class="title">Department</div>
                                        <div class="text">
                                            <asp:Label runat="server" ID="Department"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 pb-3">
                                        <div class="title">Team</div>
                                        <div class="text">
                                            <asp:Label runat="server" ID="Team"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 pb-3">
                                        <div class="title">Designation</div>
                                        <div class="text">
                                            <asp:Label runat="server" ID="Designation"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 pb-3">
                                        <div class="title">Qualification</div>
                                        <div class="text">
                                            <asp:Label runat="server" ID="Qualification"></asp:Label>
                                            <asp:Label runat="server" ID="EmpSpecialization"></asp:Label>
                                        </div>
                                    </div>
                                </div>






                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div id="AccountInfo" class="pro-overview tab-pane fade show">
            <div class="row">
                <div class="col-md-12 d-flex">
                    <div class="card profile-box flex-fill">
                        <div class="card-body">
                            <div class="bodyHeader">
                                <h3 class="card-title"></h3>
                                <a href="#" class="edit-icon" data-toggle="modal" data-target="#Account_Info_modal" onclick="AddAccountInfo('Add')"><i class="fa fa-pencil"></i></a>
                            </div>
                            <div class="table-responsive">
                                <table class="table cell-border" id="tblAccountInfo">
                                    <thead>
                                        <tr>
                                            <th class="text-center">Bank Name</th>
                                            <th class="text-center">Account Title</th>
                                            <th class="text-center">Account Number</th>
                                            <th class="text-center">IBAN</th>
                                            <th class="text-center">Branch Code</th>
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyAccountInfo">
                                        <asp:Repeater runat="server" ID="rptAccountInfo" OnItemDataBound="EncDecAccountInfo">
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="text-left BankName"><%# Eval("BankName") %></td>
                                                    <td class="text-left AccountTitle"><%# Eval("AccountTitle") %></td>
                                                    <td class="text-right AccountNumber">
                                                        <asp:Label runat="server" ID="txtAccountNumber"></asp:Label></td>
                                                    <td class="text-right IBANNumber">
                                                        <asp:Label runat="server" ID="txtIBANNumber"></asp:Label></td>
                                                    <td class="text-right BranchCode">
                                                        <%# Eval("BranchCode") %></td>
                                                    <td class="text-center"><span data-toggle="modal" data-target="#Account_Info_modal" onclick="UpdateEmployeeBankAccount('<%# Eval("EmployeeBankAccountID") %>',this,'Update')">
                                                        <img src="../../Styles/img/pencil-edit-button.png" /></span>
                                                        <span data-toggle="modal" data-target="#delete_EmpAccountInfo" onclick="DeleteEmployeeBankAccount('<%# Eval("EmployeeBankAccountID") %>','Delete')">
                                                            <img src="../../Styles/img/recycleBin.png" /></span>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="DocumentsInfo" class="pro-overview tab-pane fade show">
            <div class="row">
                <div class="col-md-12 d-flex">
                    <div class="card profile-box flex-fill">
                        <div class="card-body">
                            <div class="bodyHeader">
                                <h3 class="card-title"></h3>
                                <a href="#" class="edit-icon" data-toggle="modal" data-target="#Documents_Info_modal" onclick="AddDocumentsInfo('Add')"><i class="fa fa-pencil"></i></a>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-nowrap" id="tblDocumentsInfo">
                                    <thead>
                                        <tr>
                                            <th class="text-center">Document Name
                                            </th>
                                            <th class="text-center">Document Type
                                            </th>
                                            <th class="text-center">Action
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyDocumentsInfo">
                                        <asp:Repeater runat="server" ID="rptEmployeeDocuments">
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="text-left DocumentName"><%# Eval("DocumentName") %></td>
                                                    <td class="text-left DocumentType"><%# Eval("DocumentType") %></td>
                                                    <td class="text-center"><span data-toggle="modal" data-target="#Documents_Info_modal" onclick="UpdateEmployeeDocuments('<%# Eval("EmployeeDocumentID") %>',this,'Update','<%# Eval("AttacmentDocName") %>',<%# Eval("DocumentTypeId") %>,'<%# Eval("DocumentName") %>')">
                                                        <img src="../../Styles/img/pencil-edit-button.png" /></span>
                                                        <span data-toggle="modal" data-target="#Documents_delete_Info" onclick="DeleteEmployeeDocuments('<%# Eval("EmployeeDocumentID") %>','Delete')">
                                                            <img src="../../Styles/img/recycleBin.png" /></span>
                                                        <span onclick="DownloadFromGrid('<%# Eval("DocumentPath") %>','<%# Eval("AttacmentDocName") %>')" class="fa fa-download"></span>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="SalaryInfo" class="pro-overview tab-pane fade show">
            <div class="row">
                <div class="col-md-12 d-flex">
                    <div class="card profile-box flex-fill">
                        <div class="card-body">
                            <h3 class="card-title"><a href="#" class="edit-icon" data-toggle="modal" data-target="#Salary_Info" onclick="AddSalaryInfo('Add',this)"><i class="fa fa-pencil"></i></a></h3>
                            <div class="personal-info row">

                                <h4 class="col-lg-12 card-title"><span>Salary Information</span></h4>
                                <div class="col-lg-3 pb-3">
                                    <div class="title">Current Salary</div>
                                    <div class="text">
                                        <asp:Label runat="server" ID="CurrentSalary"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-3 pb-3">
                                    <div class="title">Previous Salary</div>
                                    <div class="text">
                                        <asp:Label runat="server" ID="PreviousSalary"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-3 pb-3">
                                    <div class="title">Last Increment Date</div>
                                    <div class="text">
                                        <asp:Label runat="server" ID="LastIncrementDate"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-3 pb-3">
                                    <div class="title">Increment Amount</div>
                                    <div class="text">
                                        <asp:Label runat="server" ID="IncrementAmount"></asp:Label>
                                    </div>
                                </div>

                                <h4 class="col-lg-12 card-title"><span>Allowance Information</span></h4>
                                <div class="col-lg-3 pb-3">
                                    <div class="title">Travelling Allowance</div>
                                    <div class="text">
                                        <asp:Label runat="server" ID="TravellingAllowance"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-3 pb-3">
                                    <div class="title">Medical Allowance</div>
                                    <div class="text">
                                        <asp:Label runat="server" ID="MedicalAllowance"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-3 pb-3">
                                    <div class="title">Other Allowance</div>
                                    <div class="text">
                                        <asp:Label runat="server" ID="OtherAllowance"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-3 pb-3">
                                    <div class="title">Dearness Allowance</div>
                                    <div class="text">
                                        <asp:Label runat="server" ID="DearnessAllowance"></asp:Label>
                                    </div>
                                </div>
                                <h4 class="col-lg-12 card-title"><span>Others</span></h4>
                                <div class="col-lg-3 pb-3">
                                    <div class="title">Provident Fund</div>
                                    <div class="text">
                                        <asp:Label runat="server" ID="ProvidentFund"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-3 pb-3">
                                    <div class="title">Tax</div>
                                    <div class="text">
                                        <asp:Label runat="server" ID="Tax"></asp:Label>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
    <div id="profile_info" class="modal custom-modal fade" role="dialog" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Profile Information</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="ClearFields('Add')">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">First Name <span class="text-danger">*</span></label>
                                <input class="form-control validateprofileinfo" type="text" id="FirstName" onkeypress="return validateSpecialCharExceptComma(event)" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Middle Name</label>
                                <input class="form-control" type="text" id="MiddleName" onkeypress="return validateSpecialCharExceptComma(event)" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Last Name</label>
                                <input class="form-control validateprofileinfo" type="text" id="LastName" onkeypress="return validateSpecialCharExceptComma(event)" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Gender<span class="text-danger">*</span></label>
                                <select class="select" id="Gender">
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Email <span class="text-danger">*</span></label><span class="error" style="display: none">A valid email address is </span>
                                <input class="form-control validateprofileinfo" type="email" id="Email" onfocusout="checkemail()" />
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Date of Birth <span class="text-danger">*</span></label>
                                <div class="cal-icon">
                                    <input class="form-control datetimepicker validateprofileinfo" type="text" id="DOB" />
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Contact No <span class="text-danger">*</span></label>
                                <input class="form-control validateprofileinfo" type="text" id="Phone" onkeypress="return ValidateNumber(event)" maxlength="11" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Emergency Contact Name</label>
                                <input class="form-control validateprofileinfo" type="text" id="EmergencyContactName" onkeypress="return validateSpecialCharExceptComma(event)" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Emergency Contact No <span class="text-danger">*</span></label>
                                <input class="form-control validateprofileinfo" type="text" id="EmergencyPhone" onkeypress="return ValidateNumber(event)" maxlength="11" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Marital Status</label>
                                <select class="select" id="MaritalStatus" runat="server">
                                    <option value="Single">Single</option>
                                    <option value="Married">Married</option>
                                    <option value="Divorced">Divorced</option>
                                    <option value="Widowed">Widowed</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">CNIC <span class="text-danger">*</span></label>
                                <input class="form-control validateprofileinfo" type="text" id="CNIC" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Blood Group <span class="text-danger"></span></label>

                                <select class="select" id="ddlBloodGroup" runat="server">
                                    <option value="">Select BloodGroup</option>
                                    <option value="A+">A+</option>
                                    <option value="A-">A-</option>
                                    <option value="B+">B+</option>
                                    <option value="B-">B-</option>
                                    <option value="O+">O+</option>
                                    <option value="O-">O-</option>
                                    <option value="AB+">AB+</option>
                                    <option value="AB-">AB-</option>
                                </select>


                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-form-label">Address <span class="text-danger"></span></label>
                                <input class="form-control" type="text" id="Address" />
                            </div>
                        </div>
                    </div>

                    <div class="submit-section">
                        <input class="btn btn-primary submit-btn" data-dismiss="modal" type="button" onclick="UpdateEmployeeInformation('Save')" value="Update" id="btnUpdateEmployeeInformation" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="family_info_modal" class="modal custom-modal fade" role="dialog" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Medical beneficiaries</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="ClearFields()">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="form-scroll">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title"></h3>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>First Name <span class="text-danger">*</span></label>
                                            <input class="form-control MBValidation" type="text" id="AddMBFName" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Last Name <span class="text-danger">*</span></label>
                                            <input class="form-control MBValidation" type="text" id="AddMBLName" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Family Relation <span class="text-danger">*</span></label>
                                            <select class="select MBValidation" id="ddlAddMBRelationShip">
                                                <option value="">Select Family Relation</option>
                                                <option value="Father">Father</option>
                                                <option value="Mother">Mother</option>
                                                <option value="Son">Son</option>
                                                <option value="Spouse">Spouse</option>
                                                <option value="Daughter">Daughter</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Date of birth <span class="text-danger">*</span></label>
                                            <div class="cal-icon">
                                                <input class="form-control datetimepicker MBValidation" type="text" id="AddMBDateOfBirth" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-form-label">Total Allowance <small class="text-muted"></small></label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Rs</span>
                                                </div>
                                                <input class="form-control" type="number" min="0.00" step="50" id="AddMBTotalAllowance" placeholder="Total Allowance" value="0" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 divGivenAllowance">
                                        <div class="form-group">
                                            <label class="col-form-label">Given Allowance <small class="text-muted"></small></label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Rs</span>
                                                </div>
                                                <input class="form-control" type="number" min="0.00" step="50" id="AddMBGivenAllowance" placeholder="Given Allowance" value="0" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>CNIC <span class="text-danger">*</span></label>
                                            <input class="form-control MBValidation" type="text" id="AddMBCNIC" onkeypress="return ValidateNumber(event)" maxlength="13" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="submit-section">
                        <input type="button" class="btn btn-primary submit-btn AddMedicalBeneficiaries" onclick="AddMedicalBeneficiaries('AddRecord')" value="Add Medical Beneficiaries" data-dismiss="modal" id="btnAddMedicalBeneficiaries" />
                        <input type="button" class="btn btn-primary submit-btn UpdateMedicalBeneficiaries" onclick="UpdateMedicalBeneficiaries('UpdateRecord')" value="Update Medical Beneficiaries" style="display: none" data-dismiss="modal" id="btnUpdateMedicalBeneficiaries" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal custom-modal fade" id="delete_MedicalBenifectori" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form-header">
                        <p>Are you sure want to delete?</p>
                    </div>
                    <div class="modal-btn delete-action">
                        <div class="row">
                            <div class="col-6">
                                <a href="javascript:void(0);" class="btn btn-primary continue-btn" onclick="DeleteMedicalBeneficiaries('','DeleteRecord')" data-dismiss="modal">Delete</a>
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
    <div class="modal custom-modal fade" id="delete_EmpAccountInfo" role="dialog" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form-header">
                        <p>Are you sure want to delete?</p>
                    </div>
                    <div class="modal-btn delete-action">
                        <div class="row">
                            <div class="col-6">
                                <a href="javascript:void(0);" class="btn btn-primary continue-btn" onclick="DeleteEmployeeBankAccount('','DeleteRecord')" data-dismiss="modal">Delete</a>
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
    <div class="modal custom-modal fade" id="Documents_delete_Info" role="dialog" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form-header">
                        <p>Are you sure want to delete?</p>
                    </div>
                    <div class="modal-btn delete-action">
                        <div class="row">
                            <div class="col-6">
                                <a href="javascript:void(0);" class="btn btn-primary continue-btn" onclick="DeleteEmployeeDocuments('','DeleteRecord')" data-dismiss="modal">Delete</a>
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
    <div id="Office_Info" class="modal custom-modal fade" role="dialog" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Office Info</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="ClearFields()">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-scrolls">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label class="col-form-label">Max Employee ID <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control OIValidation" id="MaxRemindEMPID" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-form-label">Shift <span class="text-danger">*</span></label>
                                            <select class="form-control ddlShift OIValidation" id="AddOIShift" runat="server">
                                                <option value="">Select Shift</option>
                                                <option value="Morning">Morning</option>
                                                <option value="Evening">Evening</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-form-label">Location <span class="text-danger">*</span></label>
                                            <select class="form-control ddlLocation OIValidation" id="AddOILocation" runat="server">
                                                <option value="">Select Location</option>
                                                <option value="Islamabad">Islamabad</option>
                                                <option value="Jhanpur">Jhanpur</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-form-label">Joining Date <span class="text-danger">*</span></label>
                                            <div class="cal-icon">
                                                <input class="form-control datetimepicker OIValidation" type="text" id="AddOIJoiningDate" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-form-label">Contract Date <span class="text-danger">*</span></label>
                                            <div class="cal-icon">
                                                <input class="form-control datetimepicker OIValidation" type="text" id="AddOIContractDate" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-form-label">Termination  Date</label>
                                            <div class="cal-icon">
                                                <input class="form-control datetimepicker" type="text" id="AddOITerminationDate" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-form-label">Employee Status <span class="text-danger">*</span></label>
                                            <select class="ddlEmployeeStatus OIValidation" id="AddOIEmployeeStatus" runat="server">
                                                <option value="">Select Employee Status</option>
                                                <option value="intern">Intern</option>
                                                <option value="Probation">Probation</option>
                                                <option value="Permanent">Permanent</option>

                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-form-label">Designation <span class="text-danger"></span></label>

                                            <asp:DropDownList runat="server" ID="ddlDesignation" CssClass="ddlDesignation"></asp:DropDownList>

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-form-label">Department  <span class="text-danger">*</span></label>
                                            <select runat="server" id="ddlDepartment" class="ddlDepartment OIValidation">
                                                <option value="">Select Department</option>
                                                <option value="IT">IT</option>
                                                <option value="Billing">Billing</option>
                                                <option value="HR">HR</option>
                                                <option value="Accountant">Accountant</option>
                                            </select>

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-form-label">Team  <span class="text-danger">*</span></label>
                                            <asp:DropDownList runat="server" ID="ddlTeams" CssClass="ddlTeams OIValidation"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-form-label">Qualification  <span class="text-danger">*</span></label>
                                            <select runat="server" id="ddlQualification" class="ddlQualification OIValidation" onchange="GetSpecialization()">
                                                <option value="">Select Qualification</option>
                                                <option value="Matric">Matric</option>
                                                <option value="Intermediate">Intermediate</option>
                                                <option value="Bachelors">Bachelors</option>
                                                <option value="Master">Master</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4" id="divSpecialization" style="display: none" runat="server">
                                        <div class="form-group">
                                            <label class="col-form-label">Specialization  <span class="text-danger"></span></label>
                                            <asp:DropDownList runat="server" ID="ddlSpecialization" CssClass="ddlSpecialization"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="submit-section">
                            <input type="button" class="btn btn-primary submit-btn AddOfficeInfo" onclick="AddOfficeInfo('UpdateRecord')" value="Add Office Info" data-dismiss="modal" id="btnAddOfficeInfo" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="Account_Info_modal" class="modal custom-modal fade" role="dialog" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Bank Informations</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="ClearFields()">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-scrolls">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-form-label">BankName <span class="text-danger"></span></label>
                                            <asp:DropDownList runat="server" ID="ddlBankName" CssClass="ddlBankName AIValidation"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-form-label">Account Title<span class="text-danger">*</span></label>
                                            <input class="form-control AIValidation" type="text" id="AddAccountTitle" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-form-label">Account Number<span class="text-danger">*</span></label>
                                            <input class="form-control AIValidation" type="text" id="AddAccountNumber" onkeypress="return ValidateNumber(event)" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-form-label">IBAN<span class="text-danger">*</span></label>
                                            <input class="form-control AIValidation" type="text" id="AddIBANNumber" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-form-label">Branch Code <span class="text-danger">*</span></label>
                                            <input class="form-control AIValidation" type="text" id="AddBranchCode" onkeypress="return ValidateNumber(event)" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="submit-section">
                        <input type="button" class="btn btn-primary submit-btn AddAccountInfo" onclick="AddAccountInfo('AddRecord')" value="Add Account Info" data-dismiss="modal" id="btnAddAccountInfo" />
                        <input type="button" class="btn btn-primary submit-btn UpdateEmployeeBankAccount" onclick="UpdateEmployeeBankAccount('','','UpdateRecord')" value="Update Account Info" style="display: none" data-dismiss="modal" id="btnUpdateEmployeeBankAccount" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="Documents_Info_modal" class="modal custom-modal fade" role="dialog" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Documents Info</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="ClearFields()">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-scrolls">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Document Type </label>
                                            <asp:DropDownList runat="server" ID="ddlDocumentType" CssClass="select"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <div id="divEmpDocumentsFiles" class="col-md-12">
                                                <div>
                                                    Attachment(s)<div style="float: right;">

                                                        <%--<a href="javascript:void(0);" id="linkUploadFiles" style="color: #1155CC;" type="file" name="userfile" multiple >Upload file(s)</a>--%>
                                                        <%--<input type="submit" name="submit" id="btnUpload" value="Upload file(s)" style="color: #1155CC;" onclick="UploadDocuments" />--%>

                                                        <input type="file" id="uploader" name="uploader" multiple="multiple" onchange="UploadMultifiles();" />


                                                    </div>
                                                </div>

                                                <div id="divEmpDocumentsFilesInner" style="height: 230px; margin-bottom: 5px" class="divEmpDocumentsFilesInner">
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="submit-section">
                        <input type="button" class="btn btn-primary submit-btn AddDocumentsInfo" onclick="AddDocumentsInfo('AddRecord')" value="Add Documents Info" data-dismiss="modal" />
                        <input type="button" class="btn btn-primary submit-btn UpdateDocumentsInfo" onclick="UpdateEmployeeDocuments('','','UpdateRecord')" value="Update Documents Info" style="display: none" data-dismiss="modal" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="Salary_Info" class="modal custom-modal fade" role="dialog" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Salary Info</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="ClearFields()">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-scrolls">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title">Salary Information</h3>

                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label class="col-form-label">Current Salary <span class="text-danger">*</span></label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Rs</span>
                                                </div>
                                                <input type="text" class="form-control SIValidation" value="0.00" id="SICurrentSalary" onkeypress="return ValidateNumber(event)" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label class="col-form-label">Previous Salary </label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Rs</span>
                                                </div>
                                                <input type="text" class="form-control" value="0.00" id="SIPreviousSalary" onkeypress="return ValidateNumber(event)" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label class="col-form-label">Last Increment Date </label>
                                            <div class="cal-icon">
                                                <input class="form-control datetimepicker" type="text" id="SILastIncrementDate" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="col-form-label">Increment amount</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Rs</span>
                                            </div>
                                            <input type="text" class="form-control" value="0.00" id="SIIncrementAmount" onkeypress="return ValidateNumber(event)" />
                                        </div>
                                    </div>
                                </div>
                                <hr />
                                <h3 class="card-title">Allowance Information</h3>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label class="col-form-label">Travelling Allowance</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Rs</span>
                                                </div>
                                                <input type="text" class="form-control" value="0.00" id="SITravellingAllowance" onkeypress="return ValidateNumber(event)" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label class="col-form-label">Medical Allowance</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Rs</span>
                                                </div>
                                                <input type="text" class="form-control" value="0.00" id="SIMedicalAllowance" onkeypress="return ValidateNumber(event)" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label class="col-form-label">Other Allowance</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Rs</span>
                                                </div>
                                                <input type="text" class="form-control" value="0.00" id="SIOtherAllowance" onkeypress="return ValidateNumber(event)" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label class="col-form-label">Dearness Allowance</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Rs</span>
                                                </div>
                                                <input type="text" class="form-control" value="0.00" id="SIDearnessAllowance" onkeypress="return ValidateNumber(event)" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <hr />
                                <h3 class="card-title">Other</h3>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label class="col-form-label">Provident Fund </label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Rs</span>
                                                </div>
                                                <input type="text" class="form-control" value="0.00" id="SIProvidentFund" onkeypress="return ValidateNumber(event)" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label class="col-form-label">Tax </label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Rs</span>
                                                </div>
                                                <input type="text" class="form-control" value="0.00" id="SITax" onkeypress="return ValidateNumber(event)" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="submit-section">
                        <input type="button" class="btn btn-primary submit-btn AddSalaryInfo" onclick="AddSalaryInfo('UpdateRecord')" value="Add Salary Info" data-dismiss="modal" id="btnAddSalaryInfo" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField runat="server" ID="hdnEmpID" />
    <asp:HiddenField runat="server" ID="hdnSalaryID" />

    <script src="Styles/js/jquery-3.2.1.min.js"></script>
    <script src="Styles/js/popper.min.js"></script>
    <script src="Styles/js/bootstrap.min.js"></script>
    <script src="Styles/js/jquery.slimscroll.min.js"></script>
    <script src="Styles/js/select2.min.js"></script>
    <script src="Styles/js/moment.min.js"></script>
    <script src="Styles/js/bootstrap-datetimepicker.min.js"></script>
    <script src="Styles/js/jquery.dataTables.min.js"></script>
    <script src="Styles/js/dataTables.bootstrap4.min.js"></script>



    <script src="EMS/Employee/js/Employee.js"></script>
    <script src="Scripts/ajaxupload.js"></script>
    <script src="Styles/js/jquery.maskedinput.min.js"></script>
    <script src="Styles/js/mask.js"></script>


    <script>
        if ($('.select').length > 0) {
            $('.select').select2({
                minimumResultsForSearch: -1,
                width: '100%'
            });
        }
        if ($('.datatable').length > 0) {
            $('.datatable').DataTable({
                "bFilter": false,
            });
        }
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
        var _PracticeDocumentsPath = '<%=ResolveUrl("~/EmployeeDocuments")%>';
        debugger
        (function ($) {
            'use strict';

            $.mask.definitions['~'] = '[+-]';
            $('#Phone').mask('(999) 999-9999');
            $('#EmergencyPhone').mask('(999) 999-9999');
            $('#CNIC').mask('99999-9999999-9');
            $('#AddMBCNIC').mask('99999-9999999-9');

            $('input').blur(function () {
                $('#info').html('Unmasked value: ' + $(this).mask());
            }).dblclick(function () {
                $(this).unmask();
            });
        })(jQuery);
        $(".ddlDesignation").select2();
        $(".ddlDepartment").select2();
        $(".ddlTeams").select2();
        $(".ddlQualification").select2();
        $(".ddlEmployeeStatus").select2();
        $(".ddlShift").select2();
        $(".ddlBankName").select2();
        $(".ddlLocation").select2();
        $(".ddlSpecialization").select2();
        $('#tblAccountInfo').DataTable({});
        $('#tblMedicalBeneficiaries').DataTable({});
        $('#tblDocumentsInfo').DataTable({});



    </script>
    ###EndProfile###
</asp:Content>
