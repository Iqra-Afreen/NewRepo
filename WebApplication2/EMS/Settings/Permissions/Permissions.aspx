<%@ Page Title="" Language="C#" MasterPageFile="~/EMS.Master" AutoEventWireup="true" CodeBehind="Permissions.aspx.cs" Inherits="EMS.EMS.Settings.Permissions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EMS" runat="server">
###StartEMS###
<div class="col-sm-12"><h3 class="page-title pageheading">Roles & Permissions</h3></div>
    <div class="col-sm-12">
        <div class="row">
            <div class="col-sm-3">
                <div><button type="button" class="btn btn-primary StyleButton" data-toggle="modal" data-target="#add_employee">+ Add Roles</button></div>
                <ul class="list-group AdministratorTable">
                  <li class="list-group-item borderlist active p-2"><span class="borderlist1 contenttransmission">Administrator</span></li>
                  <li class="list-group-item borderlist p-2"><span class="contenttransmission">CEO</span></li>
                  <li class="list-group-item borderlist p-2"><span class="contenttransmission">Manager</span></li>
                  <li class="list-group-item borderlist p-2"><span class="contenttransmission">Team Leader</span> <i class="la la-trash sideicon penicon" data-toggle="modal" data-target="#add_employee2"></i><i class="la la-pencil sideicon " data-toggle="modal" data-target="#add_employee1"></i></li>
                  <li class="list-group-item borderlist p-2"><span class="contenttransmission">Accountant</span></li>
                  <li class="list-group-item borderlist p-2"><span class="contenttransmission">Web Developer</span></li>
                  <li class="list-group-item borderlist p-2"><span class="contenttransmission">Web Designer</span></li>
                  <li class="list-group-item borderlist p-2"><span class="contenttransmission">HR</span></li>
                  <li class="list-group-item borderlist p-2"><span class="contenttransmission">UI/UX Developer</span></li>
                  <li class="list-group-item borderlist p-2"><span class="contenttransmission">SEO Analyst</span></li>
                  </ul>
               <%-- <table class="AdministratorTable">
                    <tbody>
                    <tr><td class="pl-2 Administrator borderlist"><span class="AdministratorSpan" title="Administrator">Administrator</span></td></tr>
                    <tr><td class="pl-2 TextBefore borderlist"><span class="TextBeforespan" title="CEO">CEO</span></td></tr>
                    <tr><td class="pl-2 TextBefore borderlist"><span class="TextBeforespan" title="Manager">Manager</span></td></tr>
                    <tr><td class="pl-2 TextBefore borderlist"><span class="TextBeforespan">Team Leader</span></td><td style="padding: 10px;"><i class="la la-trash sideicon penicon" data-toggle="modal" data-target="#add_employee2"></i><i class="la la-pencil sideicon " data-toggle="modal" data-target="#add_employee1"></i></td></tr>
                    <tr><td class="pl-2 TextBefore borderlist"><span class="TextBeforespan">Accountant</span></td></tr>
                    <tr><td class="pl-2 TextBefore borderlist"><span class="TextBeforespan">Web Developer</span></td></tr>
                    <tr><td class="pl-2 TextBefore borderlist"><span class="TextBeforespan">Web Designer</span></td></tr>
                    <tr><td class="pl-2 TextBefore borderlist"><span class="TextBeforespan">HR</span></td></tr>
                    <tr><td class="pl-2 TextBefore borderlist"><span class="TextBeforespan">UI/UX Developer</span></td></tr>
                    <tr><td class="pl-2 TextBefore borderlist"><span class="TextBeforespan">SEO Analyst</span></td></tr>
                        </tbody>
                </table>--%>
                </div>
             <div class="col-sm-9">
              <h5>Module Access</h5>
                 <table class="AdministratorTable">
                 <tbody>
                 <tr class="TBody1"><td class="pl-2"><span class="">Employee</span></td>
                 <td>
                 <div class="ToggleHB" >
                 <label class="switch">
                 <input type="checkbox"/>
                 <span class="slider round"></span>
                </label>
                 </div>
                 </td>
                 </tr>
                 <tr class="TBody1"><td class="pl-2"><span class="">Holidays</span></td>
                 <td>
                 <div class="ToggleHB" >
                 <label class="switch">
  <input type="checkbox" checked />
  <span class="slider round"></span>
</label>
                 </div>
                 </td>
                 </tr>
                 <tr class="TBody1"><td class="pl-2"><span class="">Leaves</span></td>
                 <td>
                 <div class="ToggleHB" >
                  <label class="switch">
  <input type="checkbox" checked />
  <span class="slider round"></span>
</label>
                 </div>
                 </td>
                 </tr>
                 <tr class="TBody1"><td class="pl-2"><span class="">Events</span></td>
                 <td>
                 <div class="ToggleHB" >
                  <label class="switch">
  <input type="checkbox" checked />
  <span class="slider round"></span>
</label>
                 </div>
                 </td>
                 </tr>
                <tr class="TBody1">
                <td class="pl-2"><span class="">Chat</span></td>
                <td>
                <div class="ToggleHB" >
              <label class="switch">
  <input type="checkbox" checked />
  <span class="slider round"></span>
</label>
                </div>
                </td>
                </tr>
                <tr class="TBody1"><td class="pl-2"><span class="">Jobs</span></td>
                <td>
                <div class="ToggleHB" >
                <label class="switch">
                 <input type="checkbox"/>
                 <span class="slider round"></span>
                </label>
                </div>
                </td>
                </tr>
                </tbody>
                </table>
                <table class="AdministratorTable  table-striped">
                <tbody>
                <tr class="TBody1">
                       <td class="pl-2 pt-2 pb-2"><span class="">Module Permission</span></td>
                       <td class="pl-2 pt-2 pb-2"><span class="">View</span></td>
                       <td class="pl-2 pt-2 pb-2"><span class="">Add</span></td>
                       <td class="pl-2 pt-2 pb-2"><span class="">Edit</span></td>
                       <td class="pl-2 pt-2 pb-2"><span class="">Delete</span></td>
                       <td class="pl-2 pt-2 pb-2"><span class="">Export</span></td>
                </tr>
                <tr class="TBody1">
                       <td class="pl-2 pt-2 pb-2"><span class="">Employee</span></td>
                       <td class="pl-2 pt-2 pb-2">
                       <div class="form-check">
                       <input class="form-check-input form-check-input_div" type="checkbox" value="" id="" checked />
                       <label class="form-check-label" for="flexCheckChecked">
                       </label>
                       </div>
                       </td>
                       <td class="pl-2 pt-2 pb-2">
                       <div class="form-check">
                       <input class="form-check-input form-check-input_div" type="checkbox" value="" id="" checked />
                       <label class="form-check-label" for="flexCheckChecked">
                       </label>
                       </div>
                       </td>
                       <td class="pl-2 pt-2 pb-2">
                       <div class="form-check">
                       <input class="form-check-input form-check-input_div" type="checkbox" value="" id="" checked />
                       <label class="form-check-label" for="flexCheckChecked">
                       </label>
                       </div>
                       </td>
                       <td class="pl-2 pt-2 pb-2">
                       <div class="form-check">
                       <input class="form-check-input form-check-input_div" type="checkbox" value="" id="" checked />
                       <label class="form-check-label" for="flexCheckChecked">
                       </label>
                       </div>
                       </td>
                       <td class="pl-2 pt-2 pb-2">
                       <div class="form-check">
                       <input class="form-check-input form-check-input_div" type="checkbox" value="" id="" checked />
                       <label class="form-check-label" for="flexCheckChecked">
                       </label>
                       </div>
                       </td>
             </tr>
             <tr class="TBody1"><td class="pl-2 pt-2 pb-2">Holidays </td>
                      <td class="pl-2 pt-2 pb-2">
                      <div class="form-check">
                      <input class="form-check-input form-check-input_div" type="checkbox" value="" id="" checked />
                      <label class="form-check-label" for="flexCheckChecked">
                      </label>
                      </div>
                      </td>
                      <td class="pl-2 pt-2 pb-2">
                      <div class="form-check">
                      <input class="form-check-input form-check-input_div" type="checkbox" value="" id="" checked />
                      <label class="form-check-label" for="flexCheckChecked">
                      </label>
                      </div>
                      </td>
                      <td class="pl-2 pt-2 pb-2">
                      <div class="form-check">
                      <input class="form-check-input form-check-input_div" type="checkbox" value="" id="" checked />
                      <label class="form-check-label" for="flexCheckChecked">
                      </label>
                      </div>
                      </td>
                      <td class="pl-2 pt-2 pb-2">
                     <div class="form-check">
                     <input class="form-check-input form-check-input_div" type="checkbox" value="" id="" checked />
                     <label class="form-check-label" for="flexCheckChecked">
                     </label>
                     </div>
                     </td>
                     <td class="pl-2 pt-2 pb-2">
                     <div class="form-check">
                     <input class="form-check-input form-check-input_div" type="checkbox" value="" id="" checked />
                     <label class="form-check-label" for="flexCheckChecked">
                     </label>
                     </div>
                     </td>
            </tr>
            <tr class="TBody1">
                     <td class="pl-2 pt-2 pb-2">Leaves</td>
                     <td class="pl-2 pt-2 pb-2">
                     <div class="form-check">
                     <input class="form-check-input form-check-input_div" type="checkbox" value="" id="" checked />
                     <label class="form-check-label" for="flexCheckChecked">
                     </label>
                     </div>
                     </td>
                     <td class="pl-2 pt-2 pb-2">
                     <div class="form-check">
                     <input class="form-check-input form-check-input_div" type="checkbox" value="" id="" checked />
                     <label class="form-check-label" for="flexCheckChecked">
                     </label>
                     </div>
                     </td>
                     <td class="pl-2 pt-2 pb-2">
                     <div class="form-check">
                     <input class="form-check-input form-check-input_div" type="checkbox" value="" id="" checked />
                     <label class="form-check-label" for="flexCheckChecked">
                     </label>
                     </div>
                     </td>
                     <td class="pl-2 pt-2 pb-2">
                     <div class="form-check">
                     <input class="form-check-input form-check-input_div" type="checkbox" value="" id="" checked />
                     <label class="form-check-label" for="flexCheckChecked">
                     </label>
                     </div>
                     </td>
                     <td class="pl-2 pt-2 pb-2">
                     <div class="form-check">
                     <input class="form-check-input form-check-input_div" type="checkbox" value="" id="" checked />
                     <label class="form-check-label" for="flexCheckChecked">
                     </label>
                     </div>
                     </td>
          </tr>
          <tr class="TBody1"><td class="pl-2 pt-2 pb-2">Events </td>
                    <td class="pl-2 pt-2 pb-2">
                    <div class="form-check">
                    <input class="form-check-input form-check-input_div" type="checkbox" value="" id="" checked />
                    <label class="form-check-label" for="flexCheckChecked">
                    </label>
                    </div>
                    </td>
                    <td class="pl-2 pt-2 pb-2">
                    <div class="form-check">
                    <input class="form-check-input form-check-input_div" type="checkbox" value="" id="" checked />
                    <label class="form-check-label" for="flexCheckChecked">
                    </label>
                    </div>
                    </td>
                    <td class="pl-2 pt-2 pb-2">
                    <div class="form-check">
                    <input class="form-check-input form-check-input_div" type="checkbox" value="" id="" checked />
                    <label class="form-check-label" for="flexCheckChecked">
                    </label>
                    </div>
                    </td>
                    <td class="pl-2 pt-2 pb-2">
                    <div class="form-check">
                    <input class="form-check-input form-check-input_div" type="checkbox" value="" id="" checked />
                    <label class="form-check-label" for="flexCheckChecked">
                    </label>
                    </div>
                    </td>
                    <td class="pl-2 pt-2 pb-2">
                    <div class="form-check">
                    <input class="form-check-input form-check-input_div" type="checkbox" value="" id="" checked />
                    <label class="form-check-label" for="flexCheckChecked">
                    </label>
                    </div>
                    </td>
         </tr>
                           </tbody>
                   </table>
             </div>
        </div>
    </div>
       <div id="add_employee" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title modaltitle">Add Role</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="ClearFields('Add')">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                         <div class="col-sm-12 col-md-12">
							<div class="form-group">
								<label>Role Name <span class="text-danger">*</span></label>
								<div class="">
							<input class="form-control" type="text"/>
						  </div>
					   </div>
					</div>
                    <div style="text-align: center;"> <button type="button" class="btn btn-primary subbutton">Submit</button></div>
                </div>
            </div>
        </div>
    </div>

       <div id="add_employee1" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title modaltitle">Edit Role</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="ClearFields('Add')">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                         <div class="col-sm-12 col-md-12">
							<div class="form-group">
								<label>Role Name <span class="text-danger">*</span></label>
								<div class="">
							<input class="form-control" type="text" value="Team Leader"/>
						  </div>
					   </div>
                            
					</div>
                  <div style="text-align: center;"> <button type="button" class="btn btn-primary subbutton">Save</button></div>
                </div>
            </div>
        </div>
    </div>
     <div id="add_employee2" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title deleterolebox">Delete Role</h6>
                    
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="ClearFields('Add')">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p class="deleterolebox">Are you sure want to delete ?</p>
                    <div class="col-sm-12">
                        <div class="row">
                            <div class="col-sm-6"><div > <button type="button" class="btn btn-primary StyleButton Cancelbutton">Delete</button></div></div>
                             <div class="col-sm-6"><div> <button type="button" class="btn btn-primary StyleButton Cancelbutton">Cancel</button></div> </div>
                  
                    
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    ###EndEMS###
  
</asp:Content>
