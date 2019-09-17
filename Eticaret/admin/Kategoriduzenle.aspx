<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="Kategoriduzenle.aspx.cs" Inherits="Kategoriduzenle" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="Stylesheet" href="include/drpSearch/chosen.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
    <script src="include/drpSearch/chosen.jquery.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid primary-content">
        <!-- PRIMARY CONTENT HEADING -->
        <div class="primary-content-heading clearfix">
            <h2>Kategori Düzenle</h2>
            <ul class="breadcrumb pull-left">
                <li><i class="icon ion-home"></i><a href="default.aspx">Anasayfa</a></li>
                <li><a href="kategoriler.aspx">Kategoriler</a></li>
            </ul>
            <!-- quick task modal -->
            <!-- end quick task modal -->
        </div>
        <div id="formsubmitbutton">
            <asp:Button ID="Button1" Style="width: 120px;" class="btn btn-primary" runat="server" OnClientClick="ButtonClicked()" Text="Düzenle" OnClick="Button1_Click" />
            <asp:Button ID="Button2" Style="width: 140px;" class="btn btn-primary" runat="server" Text="Yeni Kategori Ekle" OnClick="Button2_Click" />
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
                    <span>Kategori Düzenle</span>
                </h3>
                <div class="btn-group widget-header-toolbar">
                    <a href="#" class="btn btn-link btn-toggle-expand"><i class="icon ion-ios7-arrow-up"></i></a>
                    <a href="#" class="btn btn-link btn-remove"><i class="icon ion-ios7-close-empty"></i></a>
                </div>
            </div>
            <div class="widget-content">

                <ul class="nav nav-pills nav-pills-custom-minimal custom-minimal-bottom tabs-iconized" role="tablist">
                    <li class="active"><a href="#genel" role="tab" data-toggle="tab">Genel</a></li>
                    <li class=""><a href="#konum" role="tab" data-toggle="tab">Konumlandırma</a></li>
                    <li class=""><a href="#seo" role="tab" data-toggle="tab">Seo Ayarları</a></li>
                    <li class=""><a href="#diger" role="tab" data-toggle="tab">Diğer</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane fade active in" id="genel">
                        <div class="form-group">
                            <label for="text-input1">Kategori Adı</label>
                            <asp:TextBox ID="txtKategoriAdi" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Kategori İçeriği</label>
                            <CKEditor:CKEditorControl ID="txtDetay" runat="server"></CKEditor:CKEditorControl>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Kategori Resmi</label>

                            <asp:FileUpload ID="fuKategori" runat="server" />
                            <br />
                            <asp:Image ID="imgKategori" Width="200" runat="server" />
                        </div>

                    </div>
                    <div class="tab-pane fade" id="konum">
                        <div class="form-group">
                            <label for="text-input1">Kategori Konumlandırması</label>
                            <br />
                            <div id="container">
                                <asp:DropDownList ID="drpKategoriler" runat="server" class="chosen-select">
                                </asp:DropDownList>
                            </div>
                            <script type="text/javascript">
                                var config = {
                                    '.chosen-select': {},
                                    '.chosen-select-deselect': { allow_single_deselect: true },
                                    '.chosen-select-no-single': { disable_search_threshold: 10 },
                                    '.chosen-select-no-results': { no_results_text: 'Üzgünüz, hiçbir şey bulunamadı!' },
                                    '.chosen-select-width': { width: "95%" }
                                }
                                for (var selector in config) {
                                    $(selector).chosen(config[selector]);
                                }
                            </script>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Sıra</label>
                            <asp:TextBox ID="txtSira" class="form-control" runat="server"></asp:TextBox>
                        </div>

                    </div>
                    <div class="tab-pane fade" id="seo">
                        <div class="form-group">
                            <label for="text-input1">Kategori başlığı (Title)</label>
                            <asp:TextBox ID="txtTitle" class="form-control" runat="server"></asp:TextBox>
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
                        <%--<div class="form-group">
                            <label for="text-input1">Harici Link Bağlantısı</label>
                            <asp:TextBox ID="txtLink"  class="form-control" runat="server"></asp:TextBox>
                        </div>--%>

                        <div class="form-group">
                            <label for="text-input1">Kategori Durumu</label><br />

                            <label class="switch-input">
                                <asp:CheckBox ID="chkDurum" runat="server" Checked="true" />

                                <i data-swon-text="Aktif" data-swoff-text="Pasif"></i>
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Açılır Kategoride Resim Olarak Göster</label><br />

                            <label class="switch-input">
                                <asp:CheckBox ID="chkResimVitrin" runat="server" />

                                <i data-swon-text="Aktif" data-swoff-text="Pasif"></i>
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Alt Menüde Göster</label><br />

                            <label class="switch-input">
                                <asp:CheckBox ID="chkAltmenu" runat="server" />

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

