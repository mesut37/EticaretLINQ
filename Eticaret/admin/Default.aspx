<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .aktifclass {
            background: rgb(67, 145, 67);
            padding: 5px 15px 5px 15px;
            border-radius: 15px;
            color: #fff;
        }

        .pasifclass {
            background: darkgray;
            padding: 5px 15px 5px 15px;
            border-radius: 15px;
            color: #fff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid primary-content">
        <!-- PRIMARY CONTENT HEADING -->
        <div class="primary-content-heading clearfix">
            <h2>Başlangıç</h2>
            <ul class="breadcrumb pull-left">
                <li><i class="icon ion-home"></i><a href="#">Anasayfa</a></li>
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
                            <form class="form-horizontal" role="form">
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
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end quick task modal -->
        </div>
        <!-- END PRIMARY CONTENT HEADING -->

        <div class="widget widget-no-header widget-transparent bottom-30px">
            <!-- QUICK SUMMARY INFO -->
            <div class="widget-content">
                <h3 class="sr-only">QUICK SUMMARY INFO</h3>
                <div class="row">
                    <div class="col-sm-3 text-center">
                        <div class="quick-info horizontal">
                            <a href="#"><i class="icon ion-thumbsup pull-left bg-seagreen"></i></a>
                            <p>
                                <asp:Literal ID="ltrBekleyenSiparisler" runat="server"></asp:Literal><span><a href="#"><b>Bekleyen Siparişler</b></a></span>
                            </p>
                        </div>
                    </div>
                    <div class="col-sm-3 text-center">
                        <div class="quick-info horizontal">
                            <a href="#"><i class="icon ion-cash pull-left bg-green"></i></a>
                            <p>
                                <asp:Literal ID="ltrToplamGelir" runat="server"></asp:Literal>
                                <span><a href="#"><b>Toplam Gelir</b></a></span>
                            </p>
                        </div>
                    </div>
                    <div class="col-sm-3 text-center">
                        <div class="quick-info horizontal">
                            <i class="icon ion-arrow-graph-up-right pull-left bg-orange"></i>
                            <p>
                                <asp:Literal ID="ltrToplamUrun" runat="server"></asp:Literal><span><b>Toplam Ürün Adedi</b></span>
                            </p>
                        </div>
                    </div>
                    <div class="col-sm-3 text-center">
                        <div class="quick-info horizontal">
                            <i class="icon ion-person-stalker pull-left bg-blue"></i>
                            <p>
                                <asp:Literal ID="ltrUyeSayisi" runat="server"></asp:Literal>
                                <span><b>Toplam Üye Sayısı</b></span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END QUICK SUMMARY INFO -->
        </div>

        <div class="row">
            <div class="col-md-8">
                <!-- CHART WITH JUSTIFIED TAB -->
                <div class="widget">
                    <div class="widget-header clearfix">
                        <h3><i class="icon ion-bag"></i>
                            <span>Stoğu Bitmekte Olan Ürünler</span>
                        </h3>
                        <div class="btn-group widget-header-toolbar">
                            <a href="#" title="Expand/Collapse" class="btn btn-link btn-toggle-expand"><i class="icon ion-ios7-arrow-up"></i></a>
                            <a href="#" title="Remove" class="btn btn-link btn-remove"><i class="icon ion-ios7-close-empty"></i></a>
                        </div>
                    </div>
                    <div class="widget-content">
                        <table class="table table-condensed">
                            <thead>
                                <tr>
                                    <th>Ürün Adı</th>
                                    <th>Fiyatı</th>
                                    <th>Kategorisi</th>
                                    <th>Stok</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater runat="server" ID="rptStoguBitenler">
                                    <ItemTemplate>
                                        <tr>
                                            <td><a href="#"><%#Eval("UrunAdi")%></a></td>
                                            <td><a href="#"><%#string.Format("{0:c}",Eval("IndirimliFiyat"))%></a></td>
                                            <td><span style="background:#147da0;padding:5px;color:#fff;"> <%#katGetir(Eval("KatID").ToString())%></span></td>
                                            <td><%#Eval("Stok")%></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </tbody>
                        </table>
                        <a href="urunler.aspx" class="btn btn-primary btn-block">Tüm Ürünleri Göster</a>
                       
                    </div>
                </div>
                <!-- END CHART WITH JUSTIFIED TAB -->
            </div>
            <div class="col-md-4">
                <!-- ORDER STATUS -->
                <div class="widget">
                    <div class="widget-header clearfix">
                        <h3><i class="icon ion-bag"></i>
                            <span>Son Üyeler</span>
                        </h3>
                        <div class="btn-group widget-header-toolbar">
                            <a href="#" title="Expand/Collapse" class="btn btn-link btn-toggle-expand"><i class="icon ion-ios7-arrow-up"></i></a>
                            <a href="#" title="Remove" class="btn btn-link btn-remove"><i class="icon ion-ios7-close-empty"></i></a>
                        </div>
                    </div>
                    <div class="widget-content">
                        <table class="table table-condensed">
                            <thead>
                                <tr>
                                    <th>Adı</th>
                                    <th>Soyadı</th>
                                    <th>Şehir</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater runat="server" ID="rptSonUyeler">
                                    <ItemTemplate>
                                        <tr>
                                            <td><a href="#"><%#Eval("Ad")%></a></td>
                                            <td><a href="#"><%#Eval("Soyad")%></a></td>
                                            <td><%#Eval("Sehir")%></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </tbody>
                        </table>
                           <a href="uyeler.aspx" class="btn btn-primary btn-block">Tüm Üyeleri Göster</a>
                       
                    </div>
                </div>
                <!-- END ORDER STATUS -->
            </div>
        </div>

        <div class="widget">
            <div class="widget-header clearfix">
                <h3><i class="icon ion-ios7-copy"></i>
                    <span>Son Siparişler</span>
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

                                            <th>Ad Soyad</th>
                                             <th>Üyelik Durumu</th>
                                            <th>Ödeme Şekli</th>
                                            <th>Tutar</th>
                                            <th>Durum</th>
                                            <th>Onay</th>
                                            <th>Sipariş Tarihi</th>
                                           
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <asp:Repeater runat="server" ID="rptSiparisler" >
                                            <ItemTemplate>
                                                <tr>

                                                    <td style="text-align: left; padding-left: 8px;"><strong><%#Eval("AdSoyad")%></strong></td>
                                                     <td class="center"><%#UyelikDurumu(Convert.ToInt32(Eval("UyeID")))%></td>
                                                    <td class="center"><%#Eval("OdemeSekli")%></td>
                                                      <td class="center"><%#string.Format("{0:c}",Eval("Tutar"))%></td>
                                                     <td class="center"><%#Eval("Durum")%></td>
                                                    <td class="center"><%#(Convert.ToInt32(Eval("Onay"))==1)?"<span class='aktifclass'>Onaylandı</span>":"<span class='pasifclass'>Onaylanmadı</span>"%></td>
                                                     <td class="center"><%#Eval("EklenmeTarihi")%></td>
                                                    
                                                  
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                    <button type="button" class="btn btn-primary btn-block">Tüm Siparişleri Göster</button>
                </div>

            </div>

        </div>


        <div class="row">
            <div class="col-md-8">
                <!-- CHART WITH JUSTIFIED TAB -->
                <div class="widget">
                    <div class="widget-header clearfix">
                        <h3><i class="icon ion-android-earth"></i>
                            <span>Döviz Kurları</span>
                        </h3>
                        <div class="btn-group widget-header-toolbar">
                            <a href="#" title="Expand/Collapse" class="btn btn-link btn-toggle-expand"><i class="icon ion-ios7-arrow-up"></i></a>
                            <a href="#" title="Remove" class="btn btn-link btn-remove"><i class="icon ion-ios7-close-empty"></i></a>
                        </div>
                    </div>
                    <div class="widget-content">
                        <table class="table table-condensed">

                            <thead>
                                <tr>
                                    <th>Kur</th>
                                    <th>Alış</th>
                                    <th>Satış</th>

                                </tr>
                            </thead>
                            <tbody>

                                <tr>
                                    <td><a href="#">EURO</a></td>
                                    <td><a href="#">3.0382 TL</a></td>
                                    <td><a href="#">3.0382 TL</a></td>

                                </tr>
                                <tr>
                                    <td><a href="#">POUND</a></td>
                                    <td><a href="#">3.0382 TL</a></td>
                                    <td><a href="#">3.0382 TL</a></td>

                                </tr>
                                <tr>
                                    <td><a href="#">USD</a></td>
                                    <td><a href="#">3.0382 TL</a></td>
                                    <td><a href="#">3.0382 TL</a></td>

                                </tr>

                            </tbody>
                        </table>

                    </div>
                </div>
                <!-- END CHART WITH JUSTIFIED TAB -->
            </div>
            <div class="col-md-4">
                <!-- ORDER STATUS -->
                <div class="widget">
                    <div class="widget-header clearfix">
                        <h3><i class="icon ion-android-information"></i>
                            <span>Site Bilgileri</span>
                        </h3>
                        <div class="btn-group widget-header-toolbar">
                            <a href="#" title="Expand/Collapse" class="btn btn-link btn-toggle-expand"><i class="icon ion-ios7-arrow-up"></i></a>
                            <a href="#" title="Remove" class="btn btn-link btn-remove"><i class="icon ion-ios7-close-empty"></i></a>
                        </div>
                    </div>
                    <div class="widget-content">
                        <table class="table table-condensed">
                            <tbody>
                                <tr>
                                    <td><a href="#">Domain</a></td>
                                    <td>www.eskayazilim.com</td>
                                </tr>
                                <tr>
                                    <td><a href="#">Başlangıç Tarihi</a></td>
                                    <td><a href="#">12-11-2014</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">Bitiş Tarihi</a></td>
                                    <td><a href="#">12-11-2014</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">Siteyi Gör</a></td>
                                    <td><a href="#">www.site.com
                                    </a></td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                </div>
                <!-- END ORDER STATUS -->
            </div>
        </div>
    </div>
</asp:Content>

