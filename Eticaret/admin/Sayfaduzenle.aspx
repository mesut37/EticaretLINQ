<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="Sayfaduzenle.aspx.cs" Inherits="Sayfaduzenle" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid primary-content">
        <!-- PRIMARY CONTENT HEADING -->
        <div class="primary-content-heading clearfix">
            <h2>Sayfa Düzenle</h2>
            <ul class="breadcrumb pull-left">
                <li><i class="icon ion-home"></i><a href="#">Anasayfa</a></li>
                <li><a href="sayfalar.aspx">Sayfalar</a></li>

            </ul>

            <!-- quick task modal -->

            <!-- end quick task modal -->
        </div>




        <div id="formsubmitbutton">
            <asp:Button ID="Button1" Style="width: 120px;" class="btn btn-primary" OnClientClick="ButtonClicked()" runat="server" Text="Düzenle" OnClick="Button1_Click" />
            <asp:Button ID="Button2" Style="width: 120px;" class="btn btn-primary" runat="server" Text="Yeni Sayfa Ekle" OnClick="Button2_Click" />
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
                <strong>Başarılı</strong> Kayıt başarılı bir şekilde veritabanına eklendi...
					
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
                    <span>Sayfa Ekle</span>
                </h3>
                <div class="btn-group widget-header-toolbar">
                    <a href="#" class="btn btn-link btn-toggle-expand"><i class="icon ion-ios7-arrow-up"></i></a>
                    <a href="#" class="btn btn-link btn-remove"><i class="icon ion-ios7-close-empty"></i></a>
                </div>
            </div>
            <div class="widget-content">




                <ul class="nav nav-pills nav-pills-custom-minimal custom-minimal-bottom tabs-iconized" role="tablist">
                    <li class="active"><a href="#genel" role="tab" data-toggle="tab">Genel</a></li>

                    <li class=""><a href="#seo" role="tab" data-toggle="tab">Seo Ayarları</a></li>
                    <li class=""><a href="#diger" role="tab" data-toggle="tab">Diğer</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane fade active in" id="genel">
                        <div class="form-group">
                            <label for="text-input1">Sayfa Adı</label>
                            <asp:TextBox ID="txtSayfaAdi" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Sayfa İçeriği</label>
                            <CKEditor:CKEditorControl ID="txtDetay" runat="server"></CKEditor:CKEditorControl>
                        </div>

                    </div>

                    <div class="tab-pane fade" id="seo">
                        <div class="form-group">
                            <label for="text-input1">Sayfa başlığı (Title)</label>
                            <asp:TextBox ID="txtTitile" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Anahtar kelimeler (Keywords)</label>
                            <asp:TextBox ID="txtKeywords" TextMode="MultiLine" Rows="7" class="form-control" runat="server"></asp:TextBox>

                        </div>
                        <div class="form-group">
                            <label for="text-input1">Sayfa açıklaması (Description)</label>
                            <asp:TextBox ID="txtDescription" TextMode="MultiLine" Rows="7" class="form-control" runat="server"></asp:TextBox>

                        </div>
                    </div>
                    <div class="tab-pane fade" id="diger">
                        <div class="form-group">
                            <label for="text-input1">Sıra</label>
                            <asp:TextBox ID="txtSira" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <%--<div class="form-group">
                            <label for="text-input1">Harici Link Bağlantısı</label>
                            <asp:TextBox ID="txtLink"  class="form-control" runat="server"></asp:TextBox>
                        </div>--%>

                        <div class="form-group">
                            <label for="text-input1">Üst Menüde Göster</label><br />

                            <label class="switch-input">
                                <asp:CheckBox ID="chkUst" runat="server" Checked="true" />

                                <i data-swon-text="Aktif" data-swoff-text="Pasif"></i>
                            </label>
                        </div>

                        <div class="form-group">
                            <label for="text-input1">Alt Menüde Göster</label><br />

                            <label class="switch-input">
                                <asp:CheckBox ID="chkAlt" runat="server" Checked="true" />

                                <i data-swon-text="Aktif" data-swoff-text="Pasif"></i>
                            </label>
                        </div>

                        <div class="form-group">
                            <label for="text-input1">Sayfa Durumu</label><br />

                            <label class="switch-input">
                                <asp:CheckBox ID="chkDurum" runat="server" Checked="true" />

                                <i data-swon-text="Aktif" data-swoff-text="Pasif"></i>
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

