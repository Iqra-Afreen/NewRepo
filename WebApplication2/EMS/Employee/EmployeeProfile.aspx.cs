using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EMS.App_Code.DAL;
using EMS.App_Code;


namespace EMS.EMS.Employee
{
    public partial class EmployeeProfile : System.Web.UI.Page
    {
        EncryptionAndDeccryption encryptionAndDeccryption = new EncryptionAndDeccryption();

        long EmpID = 0;
        DataSet ProfileDetails = null;
        DataTable Specialization = null;
        EmployeeDB employeedb = new EmployeeDB();

        protected void Page_Load(object sender, EventArgs e)
        {
            
            ProfileDetails = new DataSet();
            
            EmpID = long.Parse(Request.Form["EmpID"]);
            ProfileDetails = employeedb.GetEmployeeProfileDetails(EmpID);
            DDLEmployeeProfile();
            EmployeeInfo();
            MedicalBeneficiaries();
            AccountInfo();
            DocumentsInfo();
            OfficeInfo();
            SalaryInfo();
            hdnEmpID.Value = EmpID.ToString().Trim();
        }
        private void EmployeeInfo()
        {
            if (ProfileDetails.Tables.Count > 0)
            {
                if (ProfileDetails.Tables[0].Rows.Count > 0)
                {
                    DataRow drv = ProfileDetails.Tables[0].Rows[0];
                    EmployeeName.Text += drv["FirstName"].ToString().Trim() + " " + drv["LastName"].ToString().Trim();
                    if (!string.IsNullOrEmpty(drv["MiddleName"].ToString()))
                        EmployeeName.Text += " " + "(" + drv["MiddleName"].ToString().Trim() + ")";
                    MaxRemindEmpID.Text = drv["MaxEmployeeID"].ToString().Trim();
                    EmpEmail.Text = drv["EmailID"].ToString();
                    EmpBirthday.Text = Convert.ToDateTime(drv["DateofBirth"].ToString()).ToString("MM/dd/yyyy").Trim();
                    EmpAddress.Text = drv["Address"].ToString().Trim();
                    EmpGender.Text = drv["Gender"].ToString().Trim();
                    EmpMaritalStatus.Text = drv["MaritalStatus"].ToString().Trim();
                    EmpEmerContName.Text = drv["EmergencyContactName"].ToString().Trim();
                    EmpEmergencyContactNo.Text = drv["EmergencyContact"].ToString().Trim();
                    EmpContactNo.Text = encryptionAndDeccryption.Decrypt(drv["ContactNumber"].ToString().ToString()).ToString().Trim();
                    EmpCNIC.Text = encryptionAndDeccryption.Decrypt(drv["CNIC"].ToString()).ToString().Trim();
                    EmpBloodGroup.Text = drv["BloodGroup"].ToString().Trim();

                    if(!string.IsNullOrEmpty(drv["BloodGroup"].ToString()))
                        ddlBloodGroup.Value = drv["BloodGroup"].ToString().Trim();

                    if (!string.IsNullOrEmpty(drv["MaritalStatus"].ToString().Trim()))
                        MaritalStatus.Value = drv["MaritalStatus"].ToString().Trim();

                    if (!string.IsNullOrEmpty(drv["TotalAllowance"].ToString().Trim()))
                        TotalAllowance.InnerText = Convert.ToDecimal(drv["TotalAllowance"].ToString()).ToString("0");
                    else
                        TotalAllowance.InnerText = "0";
                    if (!string.IsNullOrEmpty(drv["RemainingAllowance"].ToString().Trim()))
                        RemainingAllowance.InnerText = Convert.ToDecimal(drv["RemainingAllowance"].ToString()).ToString("0");
                    else
                        RemainingAllowance.InnerText = "0";
                    if (!string.IsNullOrEmpty(drv["GivenAllowance"].ToString().Trim()))
                        GivenAllowance.InnerText = Convert.ToDecimal(drv["GivenAllowance"].ToString()).ToString("0");
                    else
                        GivenAllowance.InnerText = "0";
                }

            }
        }

        private void MedicalBeneficiaries()
        {
            if (ProfileDetails.Tables[1].Rows.Count > 0)
            {
                rptMedicalBeneficiaries.DataSource = ProfileDetails.Tables[1];
                rptMedicalBeneficiaries.DataBind();
            }
        }
        private void AccountInfo()
        {
            if (ProfileDetails.Tables[2].Rows.Count > 0)
            {
                rptAccountInfo.DataSource = ProfileDetails.Tables[2];
                rptAccountInfo.DataBind();
            }
        }
        private void OfficeInfo()
        {
            if (ProfileDetails.Tables[3].Rows.Count > 0)
            {
                DataRow drv = ProfileDetails.Tables[3].Rows[0];
                if (!string.IsNullOrEmpty(drv["JoiningDate"].ToString()))
                {
                    EmpJoiningDate.Text = Convert.ToDateTime(drv["JoiningDate"].ToString()).ToString("dd/MM/yyyy").Trim();
                    DateofJoin.Text = Convert.ToDateTime(drv["JoiningDate"].ToString()).ToString("dd/MM/yyyy").Trim();
                }
                MaxEmployeeID.Text = drv["MaxEmployeeID"].ToString().Trim();
                Shift.Text = drv["Shift"].ToString().Trim();
                AddOIShift.Value= drv["Shift"].ToString().Trim(); ;
                Department.Text = drv["Department"].ToString().Trim();
                Team.Text = drv["Team"].ToString().Trim();
                EmpTeam.Text = drv["Team"].ToString().Trim();
                EmployeeStatus.Text = drv["EmployeeStatus"].ToString().Trim();
                EmpDesignation.Text = drv["Designation"].ToString().Trim();
                Designation.Text = drv["Designation"].ToString().Trim();
                Qualification.Text = drv["Qualification"].ToString().Trim();
                if (!string.IsNullOrEmpty(drv["ContractDate"].ToString()))
                {
                    ContractDate.Text = Convert.ToDateTime(drv["ContractDate"].ToString()).ToString("dd/MM/yyyy").Trim();
                }
                if (!string.IsNullOrEmpty(drv["TerminationDate"].ToString()))
                {
                    TerminationDate.Text = Convert.ToDateTime(drv["TerminationDate"].ToString()).ToString("dd/MM/yyyy").Trim();
                }

                Location.Text = drv["Location"].ToString().Trim();

                if (!string.IsNullOrEmpty(drv["Specialization"].ToString()))
                {
                    EmpSpecialization.Text = drv["Specialization"].ToString().Trim();
                    ddlSpecialization.DataSource = Specialization; 
                    ddlSpecialization.DataValueField = "SpecializationID";
                    ddlSpecialization.DataTextField = "SpecializationName";
                    ddlSpecialization.DataBind();
                    ddlSpecialization.Items.Insert(0, new ListItem("Select Specialization", ""));
                    divSpecialization.Attributes.Remove("style");
                    ddlSpecialization.SelectedIndex = int.Parse(drv["SpecializationID"].ToString());
                }
                if (!string.IsNullOrEmpty(drv["DesignationId"].ToString().Trim()))
                    ddlDesignation.SelectedIndex = int.Parse(drv["DesignationId"].ToString().Trim())-1;

                if(!string.IsNullOrEmpty(drv["Department"].ToString().Trim()))
                    ddlDepartment.Value = (drv["Department"].ToString().Trim());

                if (!string.IsNullOrEmpty(drv["TeamId"].ToString().Trim()))
                    ddlTeams.SelectedIndex = int.Parse(drv["TeamId"].ToString().Trim());

                if (!string.IsNullOrEmpty(drv["Qualification"].ToString().Trim()))
                    ddlQualification.Value = drv["Qualification"].ToString().Trim();

                if (!string.IsNullOrEmpty(drv["EmployeeStatus"].ToString().Trim()))
                    AddOIEmployeeStatus.Value = drv["EmployeeStatus"].ToString().Trim();

                if (!string.IsNullOrEmpty(drv["Location"].ToString().Trim()))
                    AddOILocation.Value = drv["Location"].ToString().Trim();

            }
        }
        private void SalaryInfo()
        {
            if (ProfileDetails.Tables[5].Rows.Count > 0)
            {
                DataRow drv = ProfileDetails.Tables[5].Rows[0];
                if (!string.IsNullOrEmpty(drv["LastIncrementDate"].ToString()))
                {
                    LastIncrementDate.Text = Convert.ToDateTime(drv["LastIncrementDate"].ToString()).ToString("dd/MM/yyyy").Trim();
                }
                if (!string.IsNullOrEmpty(drv["CurrentSalary"].ToString()))
                {
                    CurrentSalary.Text = encryptionAndDeccryption.Decrypt(drv["CurrentSalary"].ToString().Trim());
                }
                if (!string.IsNullOrEmpty(drv["PreviousSalary"].ToString()))
                {
                    PreviousSalary.Text = encryptionAndDeccryption.Decrypt(drv["PreviousSalary"].ToString().Trim());
                }
                if (!string.IsNullOrEmpty(drv["IncrementAmount"].ToString()))
                {
                    IncrementAmount.Text = encryptionAndDeccryption.Decrypt(drv["IncrementAmount"].ToString().Trim());
                }
                if (!string.IsNullOrEmpty(drv["CurrentSalary"].ToString()))
                {
                    CurrentSalary.Text = encryptionAndDeccryption.Decrypt(drv["CurrentSalary"].ToString().Trim());

                }
                if (!string.IsNullOrEmpty(drv["TravellingAllowance"].ToString()))
                {
                    TravellingAllowance.Text = encryptionAndDeccryption.Decrypt(drv["TravellingAllowance"].ToString().Trim());
                }
                if (!string.IsNullOrEmpty(drv["MedicalAllowance"].ToString()))
                {
                    MedicalAllowance.Text = encryptionAndDeccryption.Decrypt(drv["MedicalAllowance"].ToString().Trim());
                }
                if (!string.IsNullOrEmpty(drv["OtherAllowance"].ToString()))
                {
                    OtherAllowance.Text = encryptionAndDeccryption.Decrypt(drv["OtherAllowance"].ToString().Trim());
                }
                if (!string.IsNullOrEmpty(drv["DearnessAllowance"].ToString()))
                {
                    DearnessAllowance.Text = encryptionAndDeccryption.Decrypt(drv["DearnessAllowance"].ToString().Trim());
                }
                if (!string.IsNullOrEmpty(drv["ProvidentFund"].ToString()))
                {
                    ProvidentFund.Text = encryptionAndDeccryption.Decrypt(drv["ProvidentFund"].ToString().Trim());
                }
                if (!string.IsNullOrEmpty(drv["Tax"].ToString()))
                {
                    Tax.Text = encryptionAndDeccryption.Decrypt(drv["Tax"].ToString().Trim());
                }

                hdnSalaryID.Value = drv["SalariesID"].ToString().Trim();

            }
        }
        private void DocumentsInfo()
        {
            if (ProfileDetails.Tables[4].Rows.Count > 0)
            {
                rptEmployeeDocuments.DataSource = ProfileDetails.Tables[4];
                rptEmployeeDocuments.DataBind();
            }
        }
        protected void DDLEmployeeProfile()
        {
            EmployeeDB employeedb = new EmployeeDB();

            DataTable Designation = employeedb.GetEmployeeDesignation();
            ddlDesignation.DataSource = Designation;
            ddlDesignation.DataValueField = "DesignationId";
            ddlDesignation.DataTextField = "DesignationName";
            ddlDesignation.DataBind();
            ddlDesignation.Items.Insert(0, new ListItem("Select Designation", ""));


            DataTable Teams = employeedb.GetEmployeeTeams();
            ddlTeams.DataSource = Teams;
            ddlTeams.DataValueField = "TeamId";
            ddlTeams.DataTextField = "TeamName";
            ddlTeams.DataBind();
            ddlTeams.Items.Insert(0, new ListItem("Select Teams", ""));



            DataTable DocumentType = employeedb.GetEmployeeDocumentType();
            ddlDocumentType.DataSource = DocumentType;
            ddlDocumentType.DataValueField = "DocumentTypeId";
            ddlDocumentType.DataTextField = "DocumentTypeName";
            ddlDocumentType.DataBind();
            ddlDocumentType.Items.Insert(0, new ListItem("Select Document Type", ""));


            DataTable BankName = employeedb.GetBankName();
            ddlBankName.DataSource = BankName;
            ddlBankName.DataValueField = "BankName";
            ddlBankName.DataTextField = "BankName";
            ddlBankName.DataBind();
            ddlBankName.Items.Insert(0, new ListItem("Select Bank Name", ""));


            Specialization = employeedb.GetSpecialization();


        }

        protected void GetSpecialization(string QualificationID)
        {

        }

        protected void EncDecMediBene(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                string CNIC = drv["CNIC"].ToString().TrimEnd();
                Label lblCNIC = (Label)e.Item.FindControl("txtCNIC");
                lblCNIC.Text = encryptionAndDeccryption.Decrypt(CNIC.ToString()).ToString();
            }
        }
        protected void EncDecAccountInfo(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                string AccountNumber = drv["AccountNumber"].ToString().TrimEnd();
                Label lblCNIC = (Label)e.Item.FindControl("txtAccountNumber");
                lblCNIC.Text = encryptionAndDeccryption.Decrypt(AccountNumber.ToString()).ToString().Trim();
                string IBANNumber = drv["IBANNumber"].ToString().TrimEnd();
                Label lblIBANNumber = (Label)e.Item.FindControl("txtIBANNumber");
                lblIBANNumber.Text = encryptionAndDeccryption.Decrypt(IBANNumber.ToString()).ToString().Trim();
            }
        }
    }
}