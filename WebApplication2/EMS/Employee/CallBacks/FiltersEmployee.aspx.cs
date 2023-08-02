using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using EMS.App_Code.DAL;
using System.Data;
using System.Xml;

namespace EMS.EMS.Employee.CallBacks
{
    public partial class FiltersEmployee : System.Web.UI.Page
    {
        EmployeeDB employeeDB = new EmployeeDB();
        EncryptionAndDeccryption encryptionAndDeccryption = new EncryptionAndDeccryption();

        DataSet ProfileDetails = null;
        int Pagenumber = 0;
        int Rows = 10;
        protected void Page_Load(object sender, EventArgs e)
        {
            string Action = Request.Form["Action"];
            if (Action == "AddEmployee"){
                AddEmployee();return;
            }
            if (Action == "UpdateEmployee"){
                UpdateEmployee();return;
            }
            if (Action == "DeleteEmployee"){
                DeleteEmployee(); return;
            }
            if (Action == "ActiveInActiveEmployee"){
                ActiveInActiveEmployee(); return;
            }
            if (Action == "AddMedicalBeneficiaries"){
                AddMedicalBeneficiaries(); return;
            }
            if (Action == "UpdateMedicalBeneficiaries"){
                UpdateMedicalBeneficiaries(); return;
            }
            if (Action == "DeleteMedicalBeneficiaries"){
                DeleteMedicalBeneficiaries(); return;
            }
            if (Action == "FilterEmployeeDetails") { 
                FilterEmployeeDetails(); return;
            }
            if (Action == "AddOfficeInfo"){
                AddOfficeInfo(); return;
            }
            if (Action == "AddAccountInfo"){
                AddAccountInfo(); return;
            }
            if (Action == "UpdateAccountInfo"){
                UpdateAccountInfo(); return;
            }
            if (Action == "DeleteAccountInfo"){
                DeleteAccountInfo(); return;
            }
            if (Action == "AddDocumentsInfo"){
                AddDocumentsInfo();return;  
            }
            if (Action == "DeleteDocumentInfo") {
                DeleteDocumentsInfo(); return;
            }
            if (Action == "UpdateEmpDocumentsInfo"){
                UpdateDocumentsInfo(); return;
            }
            if (Action == "AddSalaryInfo")
            {
                AddSalaryInfo(); return;
            }
            if (Action == "UpdateSalaryInfo")
            {
                UpdateSalaryInfo(); return;
            }
            if (Action == "GetSpecialization") {
                GetSpecialization(); return;
            }
        }
        private void AddEmployee()
        {
            EmployeeDB employeedb = new EmployeeDB();
            string FirstName = Request.Form["FirstName"];
            string LastName = Request.Form["LastName"];
            string MiddleName = Request.Form["MiddleName"];
            string DOB = Request.Form["DOB"];
            string Gender = Request.Form["Gender"];
            string Email = Request.Form["Email"];
            string Address = Request.Form["Address"];
            string Phone = encryptionAndDeccryption.Encrypt(Request.Form["Phone"]);
            string CNIC = encryptionAndDeccryption.Encrypt(Request.Form["CNIC"]);
            string MaritalStatus = Request.Form["MaritalStatus"];
            string EmergencyContactName = Request.Form["EmergencyContactName"];
            string EmergencyPhone = Request.Form["EmergencyPhone"];
            long EmpID = employeedb.AddEmployee(0,FirstName, LastName, MiddleName, DOB, Gender, Email, Phone, CNIC, Address, EmergencyPhone, EmergencyContactName, MaritalStatus);
            FilterEmployeeDetails();
        }
        private void UpdateEmployee()
        {
            EmployeeDB employeedb = new EmployeeDB();
            string FirstName = Request.Form["FirstName"];
            string LastName = Request.Form["LastName"];
            string MiddleName = Request.Form["MiddleName"];
            string DOB = Request.Form["DOB"];
            string Gender = Request.Form["Gender"];
            string Email = Request.Form["Email"];
            string Phone = encryptionAndDeccryption.Encrypt(Request.Form["Phone"]);
            string CNIC = encryptionAndDeccryption.Encrypt(Request.Form["CNIC"]);
            string Address = Request.Form["Address"];
            string EmployeeID= Request.Form["EmployeeID"];
            string MaritalStatus = Request.Form["MaritalStatus"];
            string EmergencyContactName = Request.Form["EmergencyContactName"];
            string EmergencyPhone = Request.Form["EmergencyPhone"];
            string BloodGroup = Request.Form["BloodGroup"];

            long EmpID = employeedb.UpdateEmployee(long.Parse(EmployeeID), FirstName, LastName, MiddleName, DOB, Gender, Email, Phone, CNIC, Address, EmergencyPhone, EmergencyContactName, MaritalStatus,BloodGroup);
        }
        private void DeleteEmployee()
        {
            EmployeeDB employeedb = new EmployeeDB();
            string EmpID = Request.Form["EmpID"];
            long EmployeeBankAccountID = employeedb.DeleteEmployee(long.Parse(EmpID));
            FilterEmployeeDetails();
        }
        private void ActiveInActiveEmployee()
        {
            EmployeeDB employeedb = new EmployeeDB();
            string EmpID = Request.Form["EmpID"];
            string ActiveInActiveEmployee = Request.Form["ActiveInActiveEmployee"];

            long EmpployeeID = employeedb.Employee_ActiveInActive(long.Parse(EmpID),Convert.ToBoolean(ActiveInActiveEmployee));
            FilterEmployeeDetails();
        }
        private void FilterEmployeeDetails()
        {
            EmployeeDB employeedb = new EmployeeDB();
            if (!string.IsNullOrEmpty(Request.Form["Pagenumber"]))
                Pagenumber = Convert.ToInt32(Request.Form["Pagenumber"]);
            if (!string.IsNullOrEmpty(Request.Form["Rows"]))
                Rows = Convert.ToInt32(Request.Form["Rows"]);
            string MaxRemindEMPID = Request.Form["MaxRemindEMPID"];
            string EmployeeName = Request.Form["EmployeeName"];
            string ActiveInActive = Request.Form["ActiveInActive"];

            DataSet ds = employeedb.GetAllEmployees(Rows, Pagenumber, EmployeeName, MaxRemindEMPID,Convert.ToBoolean(ActiveInActive));
            rptEmpDetails.DataSource = ds.Tables[0];
            rptEmpDetails.DataBind();
            hdnEmpRows.Value = ds.Tables[1].Rows[0]["TotalRows"].ToString();
        }
        private void AddMedicalBeneficiaries()
        {
            EmployeeDB employeedb = new EmployeeDB();
            string FirstName = Request.Form["FirstName"];
            string LastName = Request.Form["LastName"];
            string DOB = Request.Form["DOB"];
            string EmpID = Request.Form["EmpID"];
            string CNIC = encryptionAndDeccryption.Encrypt(Request.Form["CNIC"]);
            string RelationShip = Request.Form["RelationShip"];
            string TotalAllowance = Request.Form["TotalAllowance"];
            string GivenAllowance = Request.Form["GivenAllowance"];
            string RemainingAllowance = Request.Form["RemainingAllowance"];
            long MedicalBeneficiariesID = employeedb.AddMedicalBeneficiaries(0, EmpID, FirstName, LastName, DOB, CNIC, RelationShip, TotalAllowance, GivenAllowance);
        }
        private void UpdateMedicalBeneficiaries()
        {
            EmployeeDB employeedb = new EmployeeDB();
            string FirstName = Request.Form["FirstName"];
            string LastName = Request.Form["LastName"];
            string DOB = Request.Form["DOB"];
            string MedicalBeneficiariesId = Request.Form["MedicalBeneficiariesId"];
            string EmpID = Request.Form["EmpID"];
            string CNIC = encryptionAndDeccryption.Encrypt(Request.Form["CNIC"]);
            string RelationShip = Request.Form["RelationShip"];
            string TotalAllowance = Request.Form["TotalAllowance"];
            string GivenAllowance = Request.Form["GivenAllowance"];
            string RemainingAllowance = Request.Form["RemainingAllowance"];
            employeedb.UpdateMedicalBeneficiaries(long.Parse(MedicalBeneficiariesId), EmpID, FirstName, LastName, DOB, CNIC, RelationShip, TotalAllowance, GivenAllowance);

        }
        private void DeleteMedicalBeneficiaries()
        {
            EmployeeDB employeedb = new EmployeeDB();
            string MedicalBeneficiariesId = Request.Form["MedicalBeneficiariesId"];
            employeedb.DeleteMedicalBeneficiaries(long.Parse(MedicalBeneficiariesId));

        }

        public void AddOfficeInfo()
        {
            EmployeeDB employeedb = new EmployeeDB();
            string EmpID = Request.Form["EmployeeID"];
            string MaxEmpId = Request.Form["MaxEmpId"];
            string Shift = Request.Form["Shift"];
            string JoiningDate = Request.Form["JoiningDate"];
            string EmployeeStatus = Request.Form["EmployeeStatus"];
            string Department = Request.Form["Department"];
            string Teams = Request.Form["Teams"];
            string Qualification = Request.Form["Qualification"];
            string Designation = Request.Form["Designation"];
            string Specialization = Request.Form["Specialization"];
            string ContractDate = Request.Form["ContractDate"];
            string TerminationDate = Request.Form["TerminationDate"];
            string Location = Request.Form["Location"];

            employeedb.AddOfficeInfo(long.Parse(EmpID), Shift, MaxEmpId, EmployeeStatus, Teams,
                Designation, Department, Qualification, JoiningDate, Specialization, ContractDate, TerminationDate, Location);
        }

        private void AddAccountInfo()
        {
            EmployeeDB employeedb = new EmployeeDB();
            string EmpID = Request.Form["EmployeeID"];
            string AccountTitle = Request.Form["AccountTitle"];
            string BankName = Request.Form["BankName"];
            string AccountNumber = encryptionAndDeccryption.Encrypt(Request.Form["AccountNumber"]);
            string IBANNumber = encryptionAndDeccryption.Encrypt(Request.Form["IBANNumber"]);
            string BranchCode = Request.Form["BranchCode"];
            long EmployeeBankAccountID = employeedb.AddAccountInfo(0, long.Parse(EmpID), BankName, AccountTitle, AccountNumber, IBANNumber, BranchCode);
        }
        private void UpdateAccountInfo()
        {
            EmployeeDB employeedb = new EmployeeDB();
            string EmpBankAccID = Request.Form["EmpBankAccID"];
            string EmpID = Request.Form["EmployeeID"];
            string BankName = Request.Form["BankName"];
            string AccountTitle = Request.Form["AccountTitle"];
            string AccountNumber = encryptionAndDeccryption.Encrypt(Request.Form["AccountNumber"]);
            string IBANNumber = encryptionAndDeccryption.Encrypt(Request.Form["IBANNumber"]);
            string BranchCode = Request.Form["BranchCode"];
            long EmployeeBankAccountID = employeedb.UpdateAccountInfo(long.Parse(EmpBankAccID), long.Parse(EmpID), AccountTitle, BankName , AccountNumber, IBANNumber, BranchCode);
        }
        private void DeleteAccountInfo()
        {
            EmployeeDB employeedb = new EmployeeDB();
            string EmpBankAccID = Request.Form["EmpBankAccID"];
            long EmployeeBankAccountID = employeedb.DeleteAccountInfo(long.Parse(EmpBankAccID));
        }
        private void AddDocumentsInfo()
        {
            EmployeeDB employeedb = new EmployeeDB();
            string EmpID = Request.Form["EmployeeID"];
            string DocumentName = Request.Form["DocumentName"];
            string DocumentType = Request.Form["DocumentType"];
            string EmpDocAttacmentName = Request.Form["EmpDocAttacmentName"];
            string DocumentPath = Request.Form["DocumentPath"];
            string[] _EmpDocAttacmentName = EmpDocAttacmentName.Split(',');
            string[] _DocumentPath = DocumentPath.Split(',');
            string[] _DocumentName = DocumentName.Split(',');

            for (int i = 0; i < _EmpDocAttacmentName.Length; i++)
            {
                employeedb.AddEmployeeDocuments(0, long.Parse(EmpID), _DocumentName[i], DocumentType, _DocumentPath[i], _EmpDocAttacmentName[i]); 
            }
        }
        private void UpdateDocumentsInfo()
        {
            EmployeeDB employeedb = new EmployeeDB();
            string EmpDocumentID = Request.Form["DocumentID"];
            string DocumentType = Request.Form["DocumentType"];
            string DocumentName = Request.Form["DocumentName"];

            string EmpDocAttacmentName = Request.Form["EmpDocAttacmentName"];
            string DocumentPath = Request.Form["DocumentPath"];
            string[] _EmpDocAttacmentName = EmpDocAttacmentName.Split(',');
            string[] _DocumentPath = DocumentPath.Split(',');
            string[] _DocumentName = DocumentName.Split(',');
            for (int i = 0; i < _EmpDocAttacmentName.Length; i++)
            {
                employeedb.UpdateDocumentsInfo(long.Parse(EmpDocumentID), _DocumentName[i], DocumentType, _DocumentPath[i], _EmpDocAttacmentName[i]);
            }
        }
        private void DeleteDocumentsInfo()
        {
            EmployeeDB employeedb = new EmployeeDB();
            string EmpDocumentID = Request.Form["DocumentID"];
            long EmployeeBankAccountID = employeedb.DeleteDocumentsInfo(long.Parse(EmpDocumentID));
        }
        public void AddSalaryInfo()
        {
            EmployeeDB employeedb = new EmployeeDB();
            string EmployeeID = Request.Form["EmployeeID"];

            string CurrentSalary = encryptionAndDeccryption.Encrypt(Request.Form["CurrentSalary"]);
            string PreviousSalary = encryptionAndDeccryption.Encrypt(Request.Form["PreviousSalary"]);
            string LastIncrementDate = (Request.Form["LastIncrementDate"]) ;
            string IncrementAmount = encryptionAndDeccryption.Encrypt(Request.Form["IncrementAmount"]) ;
            string TravellingAllowance = encryptionAndDeccryption.Encrypt(Request.Form["TravellingAllowance"]);
            string MedicalAllowance = encryptionAndDeccryption.Encrypt(Request.Form["MedicalAllowance"]);
            string OtherAllowance = encryptionAndDeccryption.Encrypt(Request.Form["OtherAllowance"]) ;
            string DearnessAllowance = encryptionAndDeccryption.Encrypt(Request.Form["DearnessAllowance"]);
            string ProvidentFund = encryptionAndDeccryption.Encrypt(Request.Form["ProvidentFund"]);
            string Tax = encryptionAndDeccryption.Encrypt(Request.Form["Tax"]);

            employeedb.AddSalaryInfo(0,long.Parse(EmployeeID), CurrentSalary, PreviousSalary, LastIncrementDate, IncrementAmount, TravellingAllowance,
                MedicalAllowance, OtherAllowance, DearnessAllowance, ProvidentFund, Tax);
        }
        public void UpdateSalaryInfo()
        {
            EmployeeDB employeedb = new EmployeeDB();
            string SalaryID = Request.Form["SalaryID"];
            string CurrentSalary = encryptionAndDeccryption.Encrypt(Request.Form["CurrentSalary"]);
            string PreviousSalary = encryptionAndDeccryption.Encrypt(Request.Form["PreviousSalary"]);
            string LastIncrementDate = (Request.Form["LastIncrementDate"]);
            string IncrementAmount = encryptionAndDeccryption.Encrypt(Request.Form["IncrementAmount"]);
            string TravellingAllowance = encryptionAndDeccryption.Encrypt(Request.Form["TravellingAllowance"]);
            string MedicalAllowance = encryptionAndDeccryption.Encrypt(Request.Form["MedicalAllowance"]);
            string OtherAllowance = encryptionAndDeccryption.Encrypt(Request.Form["OtherAllowance"]);
            string DearnessAllowance = encryptionAndDeccryption.Encrypt(Request.Form["DearnessAllowance"]);
            string ProvidentFund = encryptionAndDeccryption.Encrypt(Request.Form["ProvidentFund"]);
            string Tax = encryptionAndDeccryption.Encrypt(Request.Form["Tax"]);

            employeedb.UpdateSalaryInfo(long.Parse(SalaryID), CurrentSalary, PreviousSalary, LastIncrementDate, IncrementAmount, TravellingAllowance,
                MedicalAllowance, OtherAllowance, DearnessAllowance, ProvidentFund, Tax);
        }
        protected void GetSpecialization()
        {
            EmployeeDB employeedb = new EmployeeDB();

            DataTable Specialization = employeedb.GetSpecialization((Request.Form["QualificationID"]));
            ddlSpecialization.DataSource = Specialization;
            ddlSpecialization.DataValueField = "SpecializationID";
            ddlSpecialization.DataTextField = "SpecializationName";
            ddlSpecialization.DataBind();
            ddlSpecialization.Items.Insert(0, new ListItem("Select Specialization", ""));
        }
        protected void EncDec(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                string ContactNumber = drv["ContactNumber"].ToString().TrimEnd();
                string CNIC = drv["CNIC"].ToString().TrimEnd();

                Label lblContactNumber = (Label)e.Item.FindControl("txtContact");
                Label lblCNIC = (Label)e.Item.FindControl("txtCNIC");
                lblContactNumber.Text = encryptionAndDeccryption.Decrypt(ContactNumber.ToString()).ToString();
                lblCNIC.Text = encryptionAndDeccryption.Decrypt(CNIC.ToString()).ToString();

            }
        }
    }


}