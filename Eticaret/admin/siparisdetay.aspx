<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="siparisdetay.aspx.cs" Inherits="admin_siparisdetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="Stylesheet" href="include/drpSearch/chosen.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
    <script src="include/drpSearch/chosen.jquery.js" type="text/javascript"></script>
    <style>
        .siparisBilgi {
            font-size: 15px;
            background: #1688ae;
            color: #fff;
            padding: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid primary-content">
        <!-- PRIMARY CONTENT HEADING -->
        <div class="primary-content-heading clearfix">
            <h2>Sipariş Detayı</h2>
            <ul class="breadcrumb pull-left">
                <li><i class="icon ion-home"></i><a href="default.aspx">Anasayfa</a></li>
                <li><a href="siparisler.aspx">Tüm Siparişler</a></li>
            </ul>
            <!-- quick task modal -->
            <!-- end quick task modal -->
        </div>
        <div id="formsubmitbutton">
            <asp:Button ID="Button1" Style="width: 120px;" class="btn btn-primary" runat="server" OnClientClick="ButtonClicked()" Text="Düzenle" OnClick="Button1_Click" />

        </div>
        <div id="buttonreplacement" style="margin-left: 30px; display: none;">
            <img src="images/preload.gif" alt="loading...">
        </div>

        <script type="text/javascript">

            function ButtonClicked() {
                document.getElementById("formsubmitbutton").style.display = "none";
                document.getElementById("buttonreplacement").style.display = "";
                return true;
            }
            var FirstLoading = true;
            function RestoreSubmitButton() {
                if (FirstLoading) {
                    FirstLoading = false;
                    return;
                }
                document.getElementById("formsubmitbutton").style.display = "";
                document.getElementById("buttonreplacement").style.display = "none";
            }

            document.onfocus = RestoreSubmitButton;
        </script>


        <br />
        <asp:Panel runat="server" ID="pnlBasarili" Visible="false">
            <div class="alert alert-success fade in">
                <i class="icon ion-checkmark-circled"></i>
                <strong>Başarılı</strong> Kayıt başarılı bir şekilde düzenlendi...
            </div>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlHata" Visible="false">
            <div class="alert alert-danger fade in">
                <i class="icon ion-close-circled"></i>
                <strong>Hata!</strong> Bir hata oluştu lütfen daha sonra tekrar deneyin.
            </div>
        </asp:Panel>
        <div class="widget">
            <div class="widget-header clearfix">
                <h3><i class="icon ion-ios7-browsers"></i>
                    <span>Sipariş Detayı</span>
                </h3>
                <div class="btn-group widget-header-toolbar">
                    <a href="#" class="btn btn-link btn-toggle-expand"><i class="icon ion-ios7-arrow-up"></i></a>
                    <a href="#" class="btn btn-link btn-remove"><i class="icon ion-ios7-close-empty"></i></a>
                </div>
            </div>
            <div class="widget-content">

                <ul class="nav nav-pills nav-pills-custom-minimal custom-minimal-bottom tabs-iconized" role="tablist">
                    <li class="active"><a href="#genel" role="tab" data-toggle="tab">Genel</a></li>
                    <li class=""><a href="#teslimat" role="tab" data-toggle="tab">Teslimat Bilgleri</a></li>
                    <li class=""><a href="#urun" role="tab" data-toggle="tab">Ürün Bilgileri</a></li>
                    <li class=""><a href="#uye" role="tab" data-toggle="tab">Kullanıcı Durumu</a></li>

                </ul>

                <div class="tab-content">
                    <div class="tab-pane fade active in" id="genel">
                        <div class="form-group">
                            <label for="text-input1">Ad Soyad</label>
                            <asp:TextBox ID="txtAdSoyad" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Kullanıcı Tipi :</label>
                            <span class="siparisBilgi">
                                <asp:Literal ID="ltrKullaniciTip" runat="server"></asp:Literal></span>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Tutar :</label>
                            <span  class="siparisBilgi">
                                <asp:Literal ID="ltrTutar" runat="server"></asp:Literal></span>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Ödeme Şekli :</label>
                            <span class="siparisBilgi">
                                <asp:Literal ID="ltrOdemeSekli" runat="server"></asp:Literal></span>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Sipariş Tarihi</label>
                            <span  class="siparisBilgi"> <asp:Literal ID="ltrSiparisTarihi" runat="server"></asp:Literal></span>
                        </div>
                        <div class="form-group"  runat="server" id="bankaHesap" visible="false">
                            <label for="text-input1">Banka Hesap Bilgisi</label>
                            <span  class="siparisBilgi"> <asp:Literal ID="ltrBankaHesap" runat="server"></asp:Literal></span>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Onay</label><br />

                            <label class="switch-input">
                                <asp:CheckBox ID="chkOnay" runat="server" />

                                <i data-swon-text="Var" data-swoff-text="Yok"></i>
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Sipariş Durumu (Müşterinin göreceği, sipariş hakkındaki son durum)</label>
                            <asp:TextBox ID="txtSiparisDurumu" class="form-control" runat="server"></asp:TextBox>
                        </div>

                    </div>
                    <div class="tab-pane fade" id="teslimat">
                        <div class="form-group">
                            <label for="text-input1">Fatura İsim</label>
                            <asp:TextBox ID="txtFaturaIsim" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Telefon</label>
                            <asp:TextBox ID="txtTelefon" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Kargo</label>
                            <span  class="siparisBilgi"> <asp:Literal ID="ltrKargo" runat="server"></asp:Literal></span>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Şehir</label>
                            <asp:TextBox ID="txtSehir" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">İlçe</label>
                            <asp:TextBox ID="txtIlce" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Adres</label>
                            <asp:TextBox ID="txtAdres" TextMode="MultiLine" Height="150" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Posta Kodu</label>
                            <asp:TextBox ID="txtPostaKodu" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">TC</label>
                            <asp:TextBox ID="txtTc" class="form-control" runat="server"></asp:TextBox>
                        </div>

                    </div>
                    <div class="tab-pane fade" id="urun">
                        
                        
                        
                    <div class="widget-content">

                            <div class="table-responsive">
                                <table id="datatable-column-interactive" class="table table-sorting table-hover table-bordered colored-header datatable">
                                    <thead>
                                        <tr>
                                            <th>Ürün Resmi</th>
                                            <th>Ürün Adı</th>
                                            <th>Fiyat</th>
                                            <th>Adet</th>
                                            <th>KDV</th>
                                            <th>Ürün Kategorisi</th>
                                          
                                       
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <asp:Repeater runat="server" ID="rptUrunler">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <img src="../Dosyalar/Urun/Mini/<%#Eval("Resim")%>" width="80" /></td>
                                                    <td style="width: 180px; text-align: left; margin-left: 10px;"><strong><%#Eval("UrunAdi")%></strong></td>
                                                    <td class="center"><%#toplamTutarGetir(Convert.ToDecimal(Eval("IndirimliFiyat")),Convert.ToInt32(Eval("Kdv")))%></td> 
                                                    <td class="center"><%#Eval("Adet")%></td>
                                                    <td class="center">% <%#Eval("Kdv")%></td>
                                                    
                                                    <td class="center"><%# kategoriGetir(Convert.ToInt32(Eval("KatID")))%></td>
                                                  
                                                  
                                                    
                                                   
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                        

                    </div>
                    <div class="tab-pane fade" id="uye">
                        <div class="form-group" runat="server" id="uyeVar">
                            <label for="text-input1">Bu Kullanıcı Sisteme Üye</label>
                           <br /> 
                             <span  class="siparisBilgi"><a href="<%=uyeLink %>" style="color:#fff;">Üye Detayına Git</a></span>
                        </div>
                        <div class="form-group" runat="server" id="uyeYok">
                            <label for="text-input1">Bu Kullanıcı Sisteme Üye Değil</label>
                          <br />  IP Bilgisi :
                            <span  class="siparisBilgi"> <asp:Literal ID="ltrIp" runat="server"></asp:Literal></span>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <!-- END CUSTOM MINIMAL -->
        <!-- CUSTOM COLORED -->
    </div>
</asp:Content>

