<%@ Page Language="C#" AutoEventWireup="true" CodeFile="urunduzenle.aspx.cs" Inherits="admin_urunduzenle" %>

<%@ Register Src="~/admin/Uc/ucHeader.ascx" TagPrefix="uc1" TagName="ucHeader" %>
<%@ Register Src="~/admin/Uc/ucMenu.ascx" TagPrefix="uc1" TagName="ucMenu" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yönetim Paneli</title>
    <meta charset="utf-8">


    <!-- CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="assets/css/ionicons.css" rel="stylesheet" type="text/css">
    <link href="assets/css/main.min.css" rel="stylesheet" type="text/css">

    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,300,400,700' rel='stylesheet' type='text/css'>


    <style>
        #dvPreview {
            width: 100%;
            min-height: 1px;
            border: 1px solid #fcfcfc;
            background: #F9F9F9;
            margin-top: 20px;
            transition: all;
            transition: 2s ease-in-out;
        }

            #dvPreview img {
                margin: 10px;
                border: 2px solid #F5F5F5;
                cursor: pointer;
            }

        .upload {
            width: 110px;
            height: 100px;
            background: url(images/cam.png) no-repeat center center;
            overflow: hidden;
            border: 1px solid #ccc;
            border-radius: 3px;
            float: left;
            margin-right: 5px;
        }

            .upload:hover {
                border: 1px solid #767676;
            }

        div.upload input {
            display: block !important;
            width: 110px !important;
            height: 100px !important;
            opacity: 0 !important;
            overflow: hidden !important;
            cursor: pointer;
        }

        .upload2 {
            width: 110px;
            height: 100px;
            background: url(images/close.png) no-repeat center center;
            overflow: hidden;
            border: 1px solid #ccc;
            border-radius: 3px;
            float: left;
        }

            .upload2:hover {
                border: 1px solid #333;
            }

        div.upload2 input {
            display: block !important;
            width: 110px !important;
            height: 100px !important;
            opacity: 0 !important;
            overflow: hidden !important;
            cursor: pointer;
        }

        #divcokluResimler {
            width: 100%;
            height: auto;
            border: 1px solid #fcfcfc;
            background: #F9F9F9;
            margin-top: 20px;
        }
    </style>

    <script language="javascript" type="text/javascript">
        window.onload = function () {
            var fileUpload = document.getElementById("fileupload");
            fileUpload.onchange = function () {
                if (typeof (FileReader) != "undefined") {
                    var dvPreview = document.getElementById("dvPreview");
                    dvPreview.innerHTML = "";
                    var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
                    for (var i = 0; i < fileUpload.files.length; i++) {
                        var file = fileUpload.files[i];
                        if (regex.test(file.name.toLowerCase())) {
                            var reader = new FileReader();
                            reader.onload = function (e) {
                                var img = document.createElement("IMG");
                                img.height = "200";
                                img.width = "250";
                                img.src = e.target.result;
                                dvPreview.appendChild(img);
                            }
                            reader.readAsDataURL(file);
                        } else {
                            alert(file.name + " is not a valid image file.");
                            dvPreview.innerHTML = "";
                            return false;
                        }
                    }
                } else {
                    alert("This browser does not support HTML5 FileReader.");
                }
            }
        };
    </script>
</head>
<body class="fixed-top-active dashboard">
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
                        <h2>Ürün Düzenle</h2>
                        <ul class="breadcrumb pull-left">
                            <li><i class="icon ion-home"></i><a href="default.aspx">Anasayfa</a></li>
                            <li><a href="urunler.aspx">Ürünler</a></li>

                        </ul>

                        <!-- quick task modal -->

                        <!-- end quick task modal -->
                    </div>

                    <div id="formsubmitbutton">
                        <asp:Button ID="btnDuzenle" Style="width: 120px;" class="btn btn-success" OnClientClick="ButtonClicked()" runat="server" Text="Düzenle" OnClick="btnDuzenle_Click" />
                          <asp:Button ID="btnYeni" Style="width: 140px;" class="btn btn-success" runat="server" Text="Yeni Ürün Ekle" OnClick="btnYeni_Click" />
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
                                <span>Ürün Düzenle</span>
                            </h3>
                            <div class="btn-group widget-header-toolbar">
                                <a href="#" class="btn btn-link btn-toggle-expand"><i class="icon ion-ios7-arrow-up"></i></a>
                                <a href="#" class="btn btn-link btn-remove"><i class="icon ion-ios7-close-empty"></i></a>
                            </div>
                        </div>
                        <div class="widget-content">


                            <ul class="nav nav-pills nav-pills-custom-minimal custom-minimal-bottom tabs-iconized" role="tablist">
                                <li class="active"><a href="#genel" role="tab" data-toggle="tab">Genel Özellikler</a></li>
                                <li class=""><a href="#stok" role="tab" data-toggle="tab">Stok ve Fiyat Bilgileri</a></li>
                                <li class=""><a href="#diger" role="tab" data-toggle="tab">Diğer Detaylar</a></li>
                                <li class=""><a href="#cokluresim" role="tab" data-toggle="tab">Çoklu Resim</a></li>
                                <li class=""><a href="#seo" role="tab" data-toggle="tab">Seo Ayarları</a></li>
                            </ul>

                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="genel">
                                    <div class="form-group">
                                        <label for="text-input1">Kategori Konumlandırması</label>
                                        <br />
                                        <asp:DropDownList runat="server" ID="drpKategoriler">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label for="text-input1">Marka Seçimi</label>
                                        <br />
                                        <asp:DropDownList runat="server" ID="drpMarkalar">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label for="text-input1">Ürün Adı</label>
                                        <asp:TextBox ID="txtUrunAdi" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="text-input1">Stok Kodu</label>
                                        <asp:TextBox ID="txtStokKodu" class="form-control" placeholder="Örn: GNH4387" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="text-input1">KDV % (Örn: 18)</label>
                                        <asp:TextBox ID="txtKdv" class="form-control" Text="18" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="text-input1">Kargo Ağırlığı</label>
                                        <asp:TextBox ID="txtKArgoAgirlik" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="text-input1">Ürün Görseli</label>
                                        <asp:FileUpload ID="fuUrun" runat="server" />
                                        Desteklenen Türler: gif, png, jpg. Maks. Boyut 3Mb
                                <br />
                                        <br />
                                        <asp:Image ID="imgUrun" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <label for="text-input1">Ürün Durumu</label><br />

                                        <label class="switch-input">
                                            <asp:CheckBox ID="chkDurum" runat="server" Checked="true" />

                                            <i data-swon-text="Aktif" data-swoff-text="Pasif"></i>
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label for="text-input1">Vitrinde Göster</label><br />

                                        <label class="switch-input">
                                            <asp:CheckBox ID="chkVitrin" runat="server" />
                                            <i data-swon-text="Aktif" data-swoff-text="Pasif"></i>
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label for="text-input1">Fırsat Ürünü</label><br />

                                        <label class="switch-input">
                                            <asp:CheckBox ID="chkFirsat" runat="server" />

                                            <i data-swon-text="Aktif" data-swoff-text="Pasif"></i>
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label for="text-input1">Yeni Ürün</label><br />

                                        <label class="switch-input">
                                            <asp:CheckBox ID="chkYeni" runat="server" />

                                            <i data-swon-text="Aktif" data-swoff-text="Pasif"></i>
                                        </label>
                                    </div>


                                </div>
                                <div class="tab-pane fade" id="stok">

                                    <div class="form-group">
                                        <label for="text-input1">Stok</label>
                                        <asp:TextBox ID="txtStok" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="text-input1">Alış Fiyatı</label>
                                        <asp:TextBox ID="txtAlisFiyat" class="form-control" placeholder="0.00" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="text-input1">İndirimli Fiyat</label>
                                        <asp:TextBox ID="txtIndirimliFiyat" class="form-control" placeholder="0.00" runat="server"></asp:TextBox>

                                    </div>


                                </div>
                                <div class="tab-pane fade" id="diger">



                                    <div class="form-group">
                                        <label for="text-input1">Sıra</label>
                                        <asp:TextBox ID="txtSira" class="form-control" runat="server"></asp:TextBox>

                                    </div>
                                    <div class="form-group">
                                        <label for="text-input1">Kategori İçeriği</label>
                                        <CKEditor:CKEditorControl ID="txtDetay" runat="server"></CKEditor:CKEditorControl>
                                    </div>
                                    <div class="form-group">
                                        <label for="text-input1">Ödeme Seçenekleri</label>
                                        <CKEditor:CKEditorControl ID="txtOdeme" runat="server"></CKEditor:CKEditorControl>
                                    </div>

                                </div>
                                <div class="tab-pane fade" id="cokluresim">

                                    <div class="upload">
                                        <asp:FileUpload ID="fileupload" AllowMultiple="True" runat="server" />
                                    </div>
                                    <div class="upload2">
                                        <asp:Button ID="btnClose" runat="server" OnClick="btnClose_Click" />
                                    </div>
                                    <div style="clear: both;"></div>
                                    <div id="dvPreview">
                                    </div>
                                    <div id="divcokluResimler" runat="server">
                                        <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" class="btn btn-warning sil" runat="server" OnClientClick="javascript:return confirm('Bu ürüne ait tüm resim(ler) kalıcı olarak silinsin mi?');" Style="margin: 10px; height: 35px;">Tüm Resimleri Sil</asp:LinkButton>
                                        <table style="padding: 15px;">
                                            <asp:Repeater runat="server" ID="rptCokluResimler" OnItemCommand="rptCokluResimler_ItemCommand">
                                                <ItemTemplate>
                                                    <tr class="coklublock" style="border: 1px solid #f0f0f0;">
                                                        <td style="width: 100%;">
                                                            <img src="../Dosyalar/CokluResim/Mini/<%#Eval("Resim")%>" width="200" /></td>
                                                        <td>
                                                            <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="javascript:return confirm('Bu kayıt kalıcı olarak silinsin mi?');" CommandName="sil" Style="margin-left: -5px; height: 35px;" CommandArgument='<%#Eval("ID")%>'><img src="images/delete.png" /> </asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <AlternatingItemTemplate>
                                                    <tr class="coklublock" style="background: #f0f0f0; border: 1px solid #f0f0f0;">
                                                        <td style="width: 100%;">
                                                            <img src="../Dosyalar/CokluResim/Mini/<%#Eval("Resim")%>" width="200" /></td>
                                                        <td>
                                                            <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="javascript:return confirm('Bu kayıt kalıcı olarak silinsin mi?');" CommandName="sil" Style="margin-left: -5px; height: 35px;" CommandArgument='<%#Eval("ID")%>'><img src="images/delete.png" /> </asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </AlternatingItemTemplate>
                                            </asp:Repeater>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="seo">
                                    <div class="form-group">
                                        <label for="text-input1">Ürün başlığı (Title)</label>
                                        <asp:TextBox ID="txtTitle" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="text-input1">Anahtar kelimeler (Keywords)</label>
                                        <asp:TextBox ID="txtKeywords" Rows="7" TextMode="MultiLine" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="text-input1">Sayfa açıklaması (Description)</label>
                                        <asp:TextBox ID="txtDescription" Rows="7" TextMode="MultiLine" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                    <!-- END CUSTOM MINIMAL -->

                    <!-- CUSTOM COLORED -->


                </div>

            </div>
            <footer class="main-footer" style="padding: 8px;">
                <div class="pull-right hidden-xs">
                    <b>Versiyon</b> 1.0 (Beta)
                </div>
                &nbsp;&nbsp;&nbsp;Copyright © 2014-2015 <a href="http://eskayazilim.com">Eska Yazılım</a> Tüm hakları saklıdır.
            </footer>
            <!-- END COLUMN RIGHT -->
        </div>
        <!-- END WRAPPER -->

        <!-- Javascript -->
        <script src="assets/js/jquery/jquery-2.1.0.min.js"></script>
        <script src="assets/js/bootstrap/bootstrap.js"></script>
        <script src="assets/js/plugins/bootstrap-multiselect/bootstrap-multiselect.js"></script>
        <script src="assets/js/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/js/queen-common.min.js"></script>
        <script src="assets/js/plugins/stat/flot/jquery.flot.min.js"></script>
        <script src="assets/js/plugins/stat/flot/jquery.flot.resize.min.js"></script>
        <script src="assets/js/plugins/stat/flot/jquery.flot.time.min.js"></script>
        <script src="assets/js/plugins/stat/flot/jquery.flot.orderBars.js"></script>
        <script src="assets/js/plugins/stat/flot/jquery.flot.tooltip.min.js"></script>
        <script src="assets/js/plugins/mapael/raphael/raphael-min.js"></script>
        <script src="assets/js/plugins/mapael/jquery.mapael.js"></script>
        <script src="assets/js/plugins/mapael/maps/world_countries.js"></script>
        <script src="assets/js/plugins/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
        <script src="assets/js/plugins/moment/moment.min.js"></script>
        <script src="assets/js/plugins/bootstrap-editable/bootstrap-editable.min.js"></script>
        <script src="assets/js/plugins/jquery-maskedinput/jquery.masked-input.min.js"></script>
        <script src="assets/js/queen-charts.min.js"></script>
        <script src="assets/js/queen-maps.min.js"></script>
        <script src="assets/js/queen-elements.min.js"></script>




    </form>
</body>
</html>
