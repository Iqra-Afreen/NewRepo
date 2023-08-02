<%@ Page Title="" Language="C#" MasterPageFile="~/EMS.Master" AutoEventWireup="true" CodeBehind="Holidays.aspx.cs" Inherits="EMS.EMS.HRCore.Holidays.Holidays" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EMS" runat="server">
    ###StartEMS###
    <!-- Page Header -->
    <div class="page-header">
        <div class="row align-items-center">
            <div class="col">
                <h3 class="page-title">Holidays 2023</h3>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                    <li class="breadcrumb-item active">Holidays</li>
                </ul>
            </div>
            <div class="col-auto float-right ml-auto">
                <a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_holiday"><i class="fa fa-plus"></i>Add Holiday</a>
            </div>
        </div>
    </div>
    <!-- /Page Header -->

    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <table class="table table-striped custom-table mb-0">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Title </th>
                            <th>Holiday Date</th>
                            <th>Day</th>
                            <th class="text-right">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="holiday-completed">
                            <td>1</td>
                            <td>New Year</td>
                            <td>1 Jan 2023</td>
                            <td>Sunday</td>
                            <td></td>
                        </tr>
                        <tr class="holiday-completed">
                            <td>2</td>
                            <td>Good Friday</td>
                            <td>14 Apr 2023</td>
                            <td>Friday</td>
                            <td></td>
                        </tr>
                        <tr class="holiday-completed">
                            <td>3</td>
                            <td>May Day</td>
                            <td>1 May 2023</td>
                            <td>Monday</td>
                            <td class="text-center"></td>
                        </tr>
                        <tr class="holiday-completed">
                            <td>4</td>
                            <td>Memorial Day</td>
                            <td>28 May 2023</td>
                            <td>Monday</td>
                            <td class="text-center"></td>
                        </tr>
                        <tr class="holiday-upcoming">
                            <td>5</td>
                            <td>Labour Day</td>
                            <td>26 Jun 2023</td>
                            <td>Monday</td>
                            <td class="text-right">
                                <div class="dropdown dropdown-action">
                                    <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#edit_holiday"><i class="fa fa-pencil m-r-5"></i>Edit</a>
                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_holiday"><i class="fa fa-trash-o m-r-5"></i>Delete</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr class="holiday-upcoming">
                            <td>6</td>
                            <td>Eid</td>
                            <td>2 Sep 2023</td>
                            <td>Saturday</td>
                            <td class="text-right">
                                <div class="dropdown dropdown-action">
                                    <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#edit_holiday"><i class="fa fa-pencil m-r-5"></i>Edit</a>
                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_holiday"><i class="fa fa-trash-o m-r-5"></i>Delete</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr class="holiday-upcoming">
                            <td>7</td>
                            <td>Eid</td>
                            <td>18 Oct 2023</td>
                            <td>Wednesday</td>
                            <td class="text-right">
                                <div class="dropdown dropdown-action">
                                    <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#edit_holiday"><i class="fa fa-pencil m-r-5"></i>Edit</a>
                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_holiday"><i class="fa fa-trash-o m-r-5"></i>Delete</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr class="holiday-upcoming">
                            <td>8</td>
                            <td>Christmas</td>
                            <td>25 Dec 2023</td>
                            <td>Monday</td>
                            <td class="text-right">
                                <div class="dropdown dropdown-action">
                                    <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#edit_holiday"><i class="fa fa-pencil m-r-5"></i>Edit</a>
                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_holiday"><i class="fa fa-trash-o m-r-5"></i>Delete</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

			
    <!-- /Page Content -->

    <!-- Add Holiday Modal -->
    <div class="modal custom-modal fade" id="add_holiday" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Holiday</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label>Holiday Name <span class="text-danger">*</span></label>
                            <input class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label>Holiday Date <span class="text-danger">*</span></label>
                            <div class="cal-icon">
                                <input class="form-control datetimepicker" type="text"></div>
                        </div>
                        <div class="submit-section">
                            <button class="btn btn-primary submit-btn">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- /Add Holiday Modal -->

    <!-- Edit Holiday Modal -->
    <div class="modal custom-modal fade" id="edit_holiday" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Holiday</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label>Holiday Name <span class="text-danger">*</span></label>
                            <input class="form-control" value="New Year" type="text">
                        </div>
                        <div class="form-group">
                            <label>Holiday Date <span class="text-danger">*</span></label>
                            <div class="cal-icon">
                                <input class="form-control datetimepicker" value="01-01-2019" type="text"></div>
                        </div>
                        <div class="submit-section">
                            <button class="btn btn-primary submit-btn">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- /Edit Holiday Modal -->

    <!-- Delete Holiday Modal -->
    <div class="modal custom-modal fade" id="delete_holiday" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form-header">
                        <h3>Delete Holiday</h3>
                        <p>Are you sure want to delete?</p>
                    </div>
                    <div class="modal-btn delete-action">
                        <div class="row">
                            <div class="col-6">
                                <a href="javascript:void(0);" class="btn btn-primary continue-btn">Delete</a>
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
    <!-- /Delete Holiday Modal -->
		
    <!-- /Page Wrapper -->
    <!-- jQuery -->
    <script src="../../../Styles/js/jquery-3.2.1.min.js"></script>

    <!-- Bootstrap Core JS -->
    <script src="../../../Styles/js/popper.min.js"></script>
    <script src="../../../Styles/js/bootstrap.min.js"></script>

    <!-- Slimscroll JS -->
    <script src="../../../Styles/js/jquery.slimscroll.min.js"></script>

    <!-- Select2 JS -->
    <script src="../../../Styles/js/select2.min.js"></script>

    <!-- Datetimepicker JS -->
    <script src="../../../Styles/js/moment.min.js"></script>
    <script src="../../../Styles/js/bootstrap-datetimepicker.min.js"></script>

    <!-- Custom JS -->

    ###EndEMS###
</asp:Content>
