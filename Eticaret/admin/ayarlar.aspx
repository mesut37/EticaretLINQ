<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="ayarlar.aspx.cs" Inherits="admin_ayarlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid primary-content">
        <!-- PRIMARY CONTENT HEADING -->
        <div class="primary-content-heading clearfix">
            <h2>Genel Ayarlar</h2>
            <ul class="breadcrumb pull-left">
                <li><i class="icon ion-home"></i><a href="default.aspx">Anasayfa</a></li>
                <li><a href="ayarlar.aspx">Genel Ayarlar</a></li>

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
                            <label for="text-input1">Firma Adı </label>
                            <asp:TextBox ID="txtFirmaAdi" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Web Adres</label>
                            <asp:TextBox ID="txtWeb" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Yetkili Kişi</label>
                            <asp:TextBox ID="txtYetkiliKisi" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Telefon 1</label>
                            <asp:TextBox ID="txtTelefon" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Telefon 2</label>
                            <asp:TextBox ID="txtTelefon2" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Fax</label>
                            <asp:TextBox ID="txtFax" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">E-Mail</label>
                            <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Adres</label>
                            <asp:TextBox ID="txtAdres" TextMode="MultiLine" Height="200" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Vergi No</label>
                            <asp:TextBox ID="txtVergiNo" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Vergi Dairesi</label>
                            <asp:TextBox ID="txtVergiDairesi" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Sunucu Email Adresi (İletişim formu vs.. formlarda kullanılacak e-mail adresi)</label>
                            <asp:TextBox ID="txtSunucuEmail" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Sunucu Email Şifresi (İletişim formu vs.. formlarda kullanılacak e-mail şifresi)</label>
                            <asp:TextBox ID="txtEmailSifre" TextMode="Password" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                </div>
            </div>

        </div>
        <!-- END CUSTOM MINIMAL -->

        <!-- CUSTOM COLORED -->


    </div>
</asp:Content>

