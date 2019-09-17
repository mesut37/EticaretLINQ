<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bankahesap.aspx.cs" Inherits="admin_bankahesap" %>

<%@ Register Src="~/admin/Uc/ucHeader.ascx" TagPrefix="uc1" TagName="ucHeader" %>
<%@ Register Src="~/admin/Uc/ucMenu.ascx" TagPrefix="uc1" TagName="ucMenu" %>


<!DOCTYPE html>
<html lang="tr" class="no-js">
<!--<![endif]-->


<!-- Mirrored from demo.thedevelovers.com/dashboard/queenadmin-1.1/tables-dynamic.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 09 Jun 2015 16:16:39 GMT -->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1254" />
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9" />



    <!-- CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="assets/css/ionicons.css" rel="stylesheet" type="text/css">
    <link href="assets/css/main.min.css" rel="stylesheet" type="text/css">

    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,300,400,700' rel='stylesheet' type='text/css'>

    <!-- Fav and touch icons -->
  
    <link rel="shortcut icon" href="assets/ico/favicon.png">

    <style>
        .center {
            text-align: center;
        }
    </style>
</head>

<body class="fixed-top-active dynamic-tables">
    <form runat="server" id="form1">
        <!-- WRAPPER -->
        <div class="wrapper">
            <!-- TOP NAV BAR -->
            <uc1:ucHeader runat="server" ID="ucHeader" />
            <!-- END TOP NAV BAR -->

            <!-- COLUMN LEFT -->
            <div id="col-left" class="col-left">
                <uc1:ucMenu runat="server" ID="ucMenu" />
            </div>
            <!-- END COLUMN LEFT -->

            <!-- COLUMN RIGHT -->
            <div id="col-right" class="col-right ">
                <div class="container-fluid primary-content">
                    <!-- PRIMARY CONTENT HEADING -->
                    <div class="primary-content-heading clearfix">
                        <h2>Banka Hesap Bilgileri</h2>
                        <ul class="breadcrumb pull-left">
                            <li><i class="icon ion-home"></i><a href="default.aspx">Anasayfa</a></li>
                            <li><a href="bankahesap.aspx">Banka Hesap Bilgileri</a></li>
                        </ul>
                        <div class="sticky-content pull-right">
                            <div class="btn-group btn-dropdown">

                                <ul class="dropdown-menu dropdown-menu-right list-inline">
                                    <li><a href="#"><i class="icon ion-pie-graph"></i><span>Statistics</span></a></li>
                                    <li><a href="#"><i class="icon ion-android-inbox"></i><span>Inbox</span></a></li>
                                    <li><a href="#"><i class="icon ion-chatboxes"></i><span>Chat</span></a></li>
                                    <li><a href="#"><i class="icon ion-help-circled"></i><span>Help</span></a></li>
                                    <li><a href="#"><i class="icon ion-gear-a"></i><span>Settings</span></a></li>
                                    <li><a href="#"><i class="icon ion-help-buoy"></i><span>Support</span></a></li>
                                </ul>
                            </div>

                        </div>
                        <!-- quick task modal -->
                        <div class="modal fade" id="quick-task-modal" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="myModalLabel">Quick Task</h4>
                                    </div>
                                    <div class="modal-body">

                                        <div class="form-group">
                                            <label for="task-title" class="control-label sr-only">Title</label>
                                            <div class="col-sm-12">
                                                <input type="text" class="form-control" id="task-title" placeholder="Title">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label sr-only">Description</label>
                                            <div class="col-sm-12">
                                                <textarea class="form-control" name="task-description" rows="5" cols="30" placeholder="Description"></textarea>
                                            </div>
                                        </div>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary">Save Task</button>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end quick task modal -->
                    </div>
                    <!-- END PRIMARY CONTENT HEADING -->
                    <a href="hesapekle.aspx" style="width: 150px;" class="btn btn-success">Yeni Hesap Ekle</a>
                   <br /><br />
                     <!-- SHOW HIDE COLUMNS -->
                    <div class="widget">
                        <div class="widget-header clearfix">
                            <h3><i class="icon ion-android-keypad"></i>
                                <span>Banka Hesap Bilgileri</span>
                            </h3>
                            <div class="btn-group widget-header-toolbar visible-lg">
                                <a href="#" title="Expand/Collapse" class="btn btn-link btn-toggle-expand"><i class="icon ion-ios7-arrow-up"></i></a>
                                <a href="#" title="Remove" class="btn btn-link btn-remove"><i class="icon ion-ios7-close-empty"></i></a>
                            </div>
                        </div>
                        <div class="widget-content">

                            <div class="table-responsive">
                                <table id="datatable-column-interactive" class="table table-sorting table-hover table-bordered colored-header datatable">
                                    <thead>
                                        <tr>
                                            
                                            <th>Banka</th>
                                            <th>Şube Adı</th>
                                            <th>Şube Kodu</th>
                                            <th>Hesap Türü</th>
                                            <th>Hesap No</th>
                                            <th>İBAN</th>
                                            <th>İşlem</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <asp:Repeater runat="server" ID="rptBankaHesap" OnItemCommand="rptBankaHesap_ItemCommand">
                                            <ItemTemplate>
                                                <tr>
                                                    
                                                    <td style="text-align: left; padding-left: 8px;width:100px;"><strong><%#Eval("Banka")%></strong></td>

                                                    <td class="center"><%#Eval("SubeAdi")%></td>
                                                     <td class="center"><%#Eval("SubeKodu")%></td>
                                                     <td class="center"><%#Eval("HesapTuru")%></td>
                                                     <td class="center"><%#Eval("HesapNo")%></td>
                                                     <td class="center"><%#Eval("IBAN")%></td>

                                                    <td class="center">

                                                      <asp:Button ID="btnDuzenle" CommandArgument='<%#Eval("ID")%>' CommandName="duzenle" style="width: 100px; margin-right: -6px; height: 34px;" class="btn btn-warning" runat="server" Text="Düzenle" />
                                                        <asp:LinkButton ID="LinkButton1" class="btn btn-warning sil" runat="server" OnClientClick="javascript:return confirm('Bu kayıt kalıcı olarak silinsin mi?');" CommandName="sil" CommandArgument='<%#Eval("ID")%>'>Sil</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- END SHOW HIDE COLUMNS -->

                </div>
                <div class="right-sidebar">
                    <!-- CHAT -->
                    <div class="widget widget-chat-contacts">
                        <div class="widget-header clearfix">
                            <h3 class="sr-only">CHAT</h3>
                            <div class="btn-group btn-group-justified widget-header-toolbar visible-lg">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary btn-xs"><i class="icon ion-plus-circled"></i>Add</button>
                                </div>
                                <div class="btn-group">
                                    <button type="button" class="btn dropdown-toggle btn-xs btn-success" data-btnclass="btn-success" data-toggle="dropdown">
                                        Online
								
                                    <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-right chat-status" role="menu">
                                        <li><a href="#" class="online" data-btnclass="btn-success">Online</a></li>
                                        <li><a href="#" class="away" data-btnclass="btn-warning">Away</a></li>
                                        <li><a href="#" class="busy" data-btnclass="btn-danger">Busy</a></li>
                                        <li><a href="#" class="offline" data-btnclass="btn-default">Offline</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="widget-content">
                            <strong>Online (4)</strong>
                            <ul class="list-unstyled chat-contacts">
                                <li>
                                    <a href="#" id="theusername">
                                        <img src="assets/img/user1.png" class="img-circle" alt="Antonius">Antonius</a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="assets/img/user2.png" class="img-circle" alt="Antonius">Michael Smith</a>
                                </li>
                                <li class="away">
                                    <a href="#">
                                        <img src="assets/img/user3.png" class="img-circle" alt="Antonius">Stella Ray</a>
                                </li>
                                <li class="busy">
                                    <a href="#">
                                        <img src="assets/img/user4.png" class="img-circle" alt="Antonius">Jane Doe</a>
                                </li>
                            </ul>
                            <strong>Offline (6)</strong>
                            <ul class="list-unstyled chat-contacts contacts-offline">
                                <li>
                                    <a href="#">
                                        <img src="assets/img/user5.png" class="img-circle" alt="John Simmons">John Simmons</a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="assets/img/user6.png" class="img-circle" alt="Jack Bay">Jack Bay</a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="assets/img/user7.png" class="img-circle" alt="Daraiana">Daraiana</a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="assets/img/user8.png" class="img-circle" alt="Alessio Ferrara">Alessio Ferrara</a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="assets/img/user9.png" class="img-circle" alt="Sorana">Sorana</a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="assets/img/user10.png" class="img-circle" alt="Regan Morton">Regan Morton</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- END CHAT -->
                </div>
            </div>
            <!-- END COLUMN RIGHT -->
        </div>
        <!-- END WRAPPER -->

        <!-- Javascript -->
        <script src="assets/js/jquery/jquery-2.1.0.min.js"></script>
        <script src="assets/js/bootstrap/bootstrap.js"></script>
        <script src="assets/js/plugins/bootstrap-multiselect/bootstrap-multiselect.js"></script>
        <script src="assets/js/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/js/queen-common.min.js"></script>
        <script src="assets/js/plugins/datatable/jquery.dataTables.min.js"></script>
        <script src="assets/js/plugins/datatable/exts/dataTables.colVis.bootstrap.js"></script>
        <script src="assets/js/plugins/datatable/exts/dataTables.colReorder.min.js"></script>
        <script src="assets/js/plugins/datatable/exts/dataTables.tableTools.min.js"></script>
        <script src="assets/js/plugins/datatable/dataTables.bootstrap.js"></script>
        <script src="assets/js/queen-table.min.js"></script>
    </form>
</body>

<!-- Mirrored from demo.thedevelovers.com/dashboard/queenadmin-1.1/tables-dynamic.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 09 Jun 2015 16:16:44 GMT -->
</html>