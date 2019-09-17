<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="uyedetay.aspx.cs" Inherits="admin_uyedetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid primary-content">
        <!-- PRIMARY CONTENT HEADING -->
        <div class="primary-content-heading clearfix">
            <h2>Üye Detay</h2>
            <ul class="breadcrumb pull-left">
                <li><i class="icon ion-home"></i><a href="default.aspx">Anasayfa</a></li>
                <li><a href="ayarlar.aspx">Tüm Üyeler</a></li>

            </ul>

            <!-- quick task modal -->

            <!-- end quick task modal -->
        </div>
        <div id="formsubmitbutton">
            <asp:Button ID="Button1" Style="width: 120px;" class="btn btn-success" OnClientClick="ButtonClicked()" runat="server" Text="Kaydet" OnClick="Button1_Click" />
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
                <strong>Başarılı</strong>Kayıt başarılı bir şekilde düzenlendi...
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
                    <span>Genel Ayarlar</span>
                </h3>
                <div class="btn-group widget-header-toolbar">
                    <a href="#" class="btn btn-link btn-toggle-expand"><i class="icon ion-ios7-arrow-up"></i></a>
                    <a href="#" class="btn btn-link btn-remove"><i class="icon ion-ios7-close-empty"></i></a>
                </div>
            </div>
            <div class="widget-content">
                <ul class="nav nav-pills nav-pills-custom-minimal custom-minimal-bottom tabs-iconized" role="tablist">
                    <li class="active"><a href="#genel" role="tab" data-toggle="tab">Genel</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade active in" id="genel">
                        <div class="form-group">
                            <label for="text-input1">Ad Soyad </label>
                            <asp:TextBox ID="txtAdSoyad" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">E-mail</label>
                            <asp:TextBox ID="txtEmail" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Adres</label>
                            <asp:TextBox ID="txtAdres" TextMode="MultiLine" Enabled="false" Height="200" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Telefon</label>
                            <asp:TextBox ID="txtTelefon" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Cinsiyet</label>
                            <asp:TextBox ID="txtCinsiyet" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Şehir</label>
                            <asp:TextBox ID="txtSehir" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">İlçe</label>
                            <asp:TextBox ID="txtIlce" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Posta Kodu</label>
                            <asp:TextBox ID="txtPostaKodu" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">T.C. Kimlik</label>
                            <asp:TextBox ID="txtTc" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Üye Olma Tarihi</label>
                            <asp:TextBox ID="txtEklenme" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Kampanyalardan Haberdar Olmak İstiyorum</label><br />

                            <label class="switch-input">
                                <asp:CheckBox ID="chkKampanya" Enabled="false" runat="server" Checked="true" />

                                <i data-swon-text="Evet" data-swoff-text="Hayır"></i>
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Üye Onayı</label><br />

                            <label class="switch-input">
                                <asp:CheckBox ID="chkOnay" runat="server" Checked="true" />

                                <i data-swon-text="Var" data-swoff-text="Yok"></i>
                            </label>
                        </div>

                    </div>

                </div>
            </div>

        </div>
        <!-- END CUSTOM MINIMAL -->

        <!-- CUSTOM COLORED -->


    </div>
</asp:Content>

