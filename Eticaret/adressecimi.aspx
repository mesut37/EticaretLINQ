<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adressecimi.aspx.cs" Inherits="adressecimi" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>

<%@ Register Src="~/UserControls/TopMenu.ascx" TagPrefix="uc1" TagName="TopMenu" %>
<%@ Register Src="~/UserControls/MyCart.ascx" TagPrefix="uc1" TagName="MyCart" %>
<%@ Register Src="~/UserControls/Search.ascx" TagPrefix="uc1" TagName="Search" %>
<%@ Register Src="~/UserControls/Navigation.ascx" TagPrefix="uc1" TagName="Navigation" %>
<%@ Register Src="~/UserControls/Kategori.ascx" TagPrefix="uc1" TagName="Kategori" %>
<%@ Register Src="~/UserControls/Carousel.ascx" TagPrefix="uc1" TagName="Carousel" %>
<%@ Register Src="~/UserControls/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link href="/CustomCss/style.css" rel="stylesheet" type="text/css" />

    <link rel="apple-touch-icon" href="/Uploads/Images/apple-touch-icon.png" />
    <link rel="stylesheet" type="text/css" href="/Scripts/css-all-min.css" />


    <script type="text/javascript" src="/Scripts/siteBundle.min.js"></script>

    <script type="text/javascript" src="/Scripts/ticimax.js"></script>


    <script type="text/javascript" src="/Scripts/plugins/noty/jquery.noty.packaged.min.js"></script>
    <script type="text/javascript" src="/Scripts/angular.min.js"></script>
    <script type="text/javascript" src="/Scripts/angularjs/angular-locale_tr-tr.js"></script>



    <style type="text/css">
        #divTemaOnizleme {
            margin: 0 auto;
            background-color: #000;
            padding: 5px 20px;
            overflow: hidden;
        }

            #divTemaOnizleme select {
                border: 1px solid #ccc;
                padding: 6px 12px;
                height: 34px;
                width: 100%;
                color: #555;
                margin: 5px 0;
                background-color: #fff;
                background-image: none;
                border-radius: 4px;
            }

        #btnTemaOnizlemeIptal {
            margin-top: 4px;
            float: right;
            line-height: 34px;
            padding: 0 8px;
            background-color: #fff;
            border: 1px solid #ccc;
            color: #000;
            border-radius: 4px;
        }

        .required {
            color: rgb(255, 255, 255);
            padding: 5px;
            visibility: visible;
            background: red;
            float: left;
            margin-top: 5px;
            margin-left: 5px;
        }
    </style>

    <link href="/anasayfa" rel="canonical" />
    <script type="text/javascript" src="/CustomCss/Temp.js"></script>

    <link rel="stylesheet" type="text/css" href="/Scripts/pager.css" />
</head>
<body>
    <form runat="server" id="formGlobal">

        <div id="header" class="categoryHeader">
            <div class="headerContent">
                <uc1:TopMenu runat="server" ID="TopMenu" />


                <div class="userLang" style="position: absolute; top: 50px;">
                </div>
                <uc1:MyCart runat="server" ID="MyCart" />
                <div class="searchContent">
                    <uc1:Search runat="server" ID="Search" />
                </div>
                <div class="responseIcon" style="display: none;"></div>

                <div class="yanResimliMenu">
                    <a href="javascript:;" class="tumKategorilerClick"></a>
                    <div class="yanResimliMenuContent">

                        <div class="Block_item resimliYanMenu">
                            <div class="Block_Title"><span>Kategoriler</span></div>
                            <div class="Block_Text">
                                <div class="lfMenu">
                                    <uc1:Kategori runat="server" ID="Kategori1" />
                                </div>
                            </div>
                            <div class="Block_Alt">
                            </div>
                        </div>
                    </div>
                </div>
                <uc1:Navigation runat="server" ID="Navigation" />
            </div>
        </div>
        <div class="clear"></div>

        <div class="ticiContainer">

            <input type="hidden" name="ctl00$mainHolder$hddnKargoSehirID" id="hddnKargoSehirID">
            <input type="hidden" name="ctl00$mainHolder$hddnSeciliKargoID" id="hddnSeciliKargoID">
            <input type="hidden" name="ctl00$mainHolder$hddnSeciliKargoAdresID" id="hddnSeciliKargoAdresID">
            <input type="hidden" name="ctl00$mainHolder$hddnSeciliFaturaAdresID" id="hddnSeciliFaturaAdresID">
            <div class=" col-md-12 col-lg-12 col-xs-12 col-sm-12">
                <div class="Basketstep col-md-12 col-lg-12 col-xs-12 col-sm-12">
                    <ul>
                        <li class="gecti bSepet"><i></i>
                            <div><span>SEPETİM</span><span class="onesteptext">Alışveriş Sepetim</span></div>
                        </li>
                        <li class="onestepsec bAdres"><i></i>
                            <div><span>ADRES</span><span class="onesteptext">Adres Seçimi</span></div>
                        </li>
                        <li class="pasif bOdeme"><i></i>
                            <div><span>ÖDEME</span><span class="onesteptext">Ödeme Bilgileri</span></div>
                        </li>
                        <li class="pasif bSiparis"><i></i>
                            <div><span>SİPARİŞ</span><span class="onesteptext">Sipariş Onayı</span></div>
                        </li>
                    </ul>
                </div>
                <div class="clear"></div>

                <div class="BasketDetail col-md-9 col-lg-9 col-xs-12 col-sm-12">
                    <div class="orderSummary">
                        <div class="UyelikBilgilerimContent col-lg-12" id="AdresContent">
                            <h4 class="sepetTitle">Bu adresi Kullan<span>Teslimat adresiniz için lütfen aşağıdaki formu doldurun</span></h4>
                            <div class="row">
                                <h4 class="sepetTitle sepetTitle3">Kişisel Bilgiler</h4>
                                <div class="clear"></div>
                                <div class="span">
                                    <label>
                                        Ad Soyad
                                      
                                    </label>
                                    <asp:TextBox ID="txtAdSoyad" runat="server" class="textbox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="required" runat="server" ControlToValidate="txtAdSoyad" ErrorMessage="Boş Geçilemez.."></asp:RequiredFieldValidator>

                                </div>
                                <div class="span">
                                    <label>
                                        Telefon No
                                        
                                    </label>
                                    <asp:TextBox ID="txtTelefon" runat="server" class="textbox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" class="required" runat="server" ControlToValidate="txtTelefon" ErrorMessage="Boş Geçilemez.."></asp:RequiredFieldValidator>

                                </div>

                                <h4 class="sepetTitle sepetTitle3">Teslimat Bilgileri</h4>
                                <div class="clear"></div>
                                <div class="span">
                                    <label>
                                        Kargo Seçiniz
                                    </label>
                                    <asp:DropDownList ID="drpKargo" Class="selectboxx"  runat="server"></asp:DropDownList>
                                    

                                </div>


                            </div>
                            <div class="row right">

                                <div class="span">
                                    <label>Şehir</label>
                                    <asp:DropDownList ID="drpIl" Class="selectboxx" runat="server">
                                        <asp:ListItem Value="01">Adana</asp:ListItem>
                                        <asp:ListItem Value="02">Adıyaman</asp:ListItem>
                                        <asp:ListItem Value="03">Afyonkarahisar</asp:ListItem>
                                        <asp:ListItem Value="04">Ağrı</asp:ListItem>
                                        <asp:ListItem Value="05">Amasya</asp:ListItem>
                                        <asp:ListItem Value="06">Ankara</asp:ListItem>
                                        <asp:ListItem Value="07">Antalya</asp:ListItem>
                                        <asp:ListItem Value="08">Artvin</asp:ListItem>
                                        <asp:ListItem Value="09">Aydın</asp:ListItem>
                                        <asp:ListItem Value="10">Balıkesir</asp:ListItem>
                                        <asp:ListItem Value="11">Bilecik</asp:ListItem>
                                        <asp:ListItem Value="12">Bingöl</asp:ListItem>
                                        <asp:ListItem Value="13">Bitlis</asp:ListItem>
                                        <asp:ListItem Value="14">Bolu</asp:ListItem>
                                        <asp:ListItem Value="15">Burdur</asp:ListItem>
                                        <asp:ListItem Value="16">Bursa</asp:ListItem>
                                        <asp:ListItem Value="17">Çanakkale</asp:ListItem>
                                        <asp:ListItem Value="18">Çankırı</asp:ListItem>
                                        <asp:ListItem Value="19">Çorum</asp:ListItem>
                                        <asp:ListItem Value="20">Denizli</asp:ListItem>
                                        <asp:ListItem Value="21">Diyarbakır</asp:ListItem>
                                        <asp:ListItem Value="22">Edirne</asp:ListItem>
                                        <asp:ListItem Value="23">Elazığ</asp:ListItem>
                                        <asp:ListItem Value="24">Erzincan</asp:ListItem>
                                        <asp:ListItem Value="25">Erzurum</asp:ListItem>
                                        <asp:ListItem Value="26">Eskişehir</asp:ListItem>
                                        <asp:ListItem Value="27">Gaziantep</asp:ListItem>
                                        <asp:ListItem Value="28">Giresun</asp:ListItem>
                                        <asp:ListItem Value="29">Gümüşhane</asp:ListItem>
                                        <asp:ListItem Value="30">Hakkari</asp:ListItem>
                                        <asp:ListItem Value="31">Hatay</asp:ListItem>
                                        <asp:ListItem Value="32">Isparta</asp:ListItem>
                                        <asp:ListItem Value="33">Mersin</asp:ListItem>
                                        <asp:ListItem Value="34">İstanbul</asp:ListItem>
                                        <asp:ListItem Value="35">İzmir</asp:ListItem>
                                        <asp:ListItem Value="36">Kars</asp:ListItem>
                                        <asp:ListItem Value="37">Kastamonu</asp:ListItem>
                                        <asp:ListItem Value="38">Kayseri</asp:ListItem>
                                        <asp:ListItem Value="39">Kırklareli</asp:ListItem>
                                        <asp:ListItem Value="40">Kırşehir</asp:ListItem>
                                        <asp:ListItem Value="41">Kocaeli</asp:ListItem>
                                        <asp:ListItem Value="42">Konya</asp:ListItem>
                                        <asp:ListItem Value="43">Kütahya</asp:ListItem>
                                        <asp:ListItem Value="44">Malatya</asp:ListItem>
                                        <asp:ListItem Value="45">Manisa</asp:ListItem>
                                        <asp:ListItem Value="46">Kahramanmaraş</asp:ListItem>
                                        <asp:ListItem Value="47">Mardin</asp:ListItem>
                                        <asp:ListItem Value="48">Muğla</asp:ListItem>
                                        <asp:ListItem Value="49">Muş</asp:ListItem>
                                        <asp:ListItem Value="50">Nevşehir</asp:ListItem>
                                        <asp:ListItem Value="51">Niğde</asp:ListItem>
                                        <asp:ListItem Value="52">Ordu</asp:ListItem>
                                        <asp:ListItem Value="53">Rize</asp:ListItem>
                                        <asp:ListItem Value="54">Sakarya</asp:ListItem>
                                        <asp:ListItem Value="55">Samsun</asp:ListItem>
                                        <asp:ListItem Value="56">Siirt</asp:ListItem>
                                        <asp:ListItem Value="57">Sinop</asp:ListItem>
                                        <asp:ListItem Value="58">Sivas</asp:ListItem>
                                        <asp:ListItem Value="59">Tekirdağ</asp:ListItem>
                                        <asp:ListItem Value="60">Tokat</asp:ListItem>
                                        <asp:ListItem Value="61">Trabzon</asp:ListItem>
                                        <asp:ListItem Value="62">Tunceli</asp:ListItem>
                                        <asp:ListItem Value="63">Şanlıurfa</asp:ListItem>
                                        <asp:ListItem Value="64">Uşak</asp:ListItem>
                                        <asp:ListItem Value="65">Van</asp:ListItem>
                                        <asp:ListItem Value="66">Yozgat</asp:ListItem>
                                        <asp:ListItem Value="67">Zonguldak</asp:ListItem>
                                        <asp:ListItem Value="68">Aksaray</asp:ListItem>
                                        <asp:ListItem Value="69">Bayburt</asp:ListItem>
                                        <asp:ListItem Value="70">Karaman</asp:ListItem>
                                        <asp:ListItem Value="71">Kırıkkale</asp:ListItem>
                                        <asp:ListItem Value="72">Batman</asp:ListItem>
                                        <asp:ListItem Value="73">Şırnak</asp:ListItem>
                                        <asp:ListItem Value="74">Bartın</asp:ListItem>
                                        <asp:ListItem Value="75">Ardahan</asp:ListItem>
                                        <asp:ListItem Value="76">Iğdır</asp:ListItem>
                                        <asp:ListItem Value="77">Yalova</asp:ListItem>
                                        <asp:ListItem Value="78">Karabük</asp:ListItem>
                                        <asp:ListItem Value="79">Kilis</asp:ListItem>
                                        <asp:ListItem Value="80">Osmaniye</asp:ListItem>
                                        <asp:ListItem Value="81">Düzce</asp:ListItem>
                                    </asp:DropDownList>
                                    <span id="mainHolder_rfvddlSehir" class="validate" style="visibility: hidden;">Lütfen Şehir Seçiniz.<span class="validateOk"></span></span>
                                </div>
                                <div id="mainHolder_divIlceDDL" class="span">
                                    <label>İlçe</label>
                                    <asp:TextBox ID="txtIlce" runat="server" class="textbox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" class="required" ControlToValidate="txtIlce" runat="server" ErrorMessage="Boş Geçilemez"></asp:RequiredFieldValidator>
                                </div>
                                <div class="span">
                                    <label>
                                        Adres
                                       
                                    </label>
                                    <asp:TextBox ID="txtAdres" runat="server" TextMode="MultiLine" Height="150" class="textbox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtAdres" runat="server" class="required" ErrorMessage="Boş Geçilemez"></asp:RequiredFieldValidator>
                                </div>
                                <div class="span">
                                    <label>Posta Kodu</label>
                                    <asp:TextBox ID="txtPostaKodu" runat="server" class="textbox"></asp:TextBox>
                                </div>
                                <div class="span BireyselKurumsal">
                                    <table id="rblFaturaTipi">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <asp:RadioButton ID="rdBiryesel" GroupName="tip" Checked="true" runat="server" />
                                                    <label for="rblFaturaTipi_0">Bireysel</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:RadioButton ID="rdKurumsal" GroupName="tip" runat="server" />
                                                    <label for="rblFaturaTipi_0">Kurumsal</label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="mainHolder_divFirmaAdi" class="span">
                                    <label id="lblFirmaAdiText">
                                        Fatura'da Yazacak İsim</label>
                                    <asp:TextBox ID="txtFaturaIsim" runat="server" class="textbox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" class="required" ControlToValidate="txtFaturaIsim" runat="server" ErrorMessage="Boş Geçilemez.."></asp:RequiredFieldValidator>

                                </div>

                                <div class="span">
                                    <label id="lblVergiNoText">
                                        T.C. Kimlik No</label>
                                    <asp:TextBox ID="txtTc" runat="server" class="textbox"></asp:TextBox>
                                    <span id="mainHolder_lblTCKNBilgi" class="tckZorunlu">Zorunlu Değil</span>

                                </div>
                             

                            </div>
                        </div>
                    </div>
                </div>


                <div class="BasketAccount col-md-3 col-lg-3 col-xs-12 col-sm-12">

                    <div class="OdemeContent">
                           <asp:Button ID="btnDevam" OnClick="btnDevam_Click" class="basketCompletebtn button" runat="server" Text="DEVAM ET &gt;" />
                        

                        <h4 class="sepetTitle2">Sipariş Özeti</h4>
                        <div class="Odeme-Right">
                            <div id="sHediyeCeki" style="display: none;">
                                <div class="Odeme-RightLine">
                                    <div class="Left">HEDİYE ÇEKLERİ</div>
                                    <div class="Right">
                                        <select name="ctl00$mainHolder$ddlHediyeCekleri" id="ddlHediyeCekleri">
                                            <option value="">Seçiniz</option>

                                        </select>
                                    </div>
                                </div>
                                <div class="Odeme-RightLine">
                                    <div class="Left">DİĞER HEDİYE ÇEKLERİ</div>
                                    <div class="Right">
                                        <input name="ctl00$mainHolder$txtbxHediyeCekiKodu" type="text" id="txtbxHediyeCekiKodu">
                                    </div>
                                </div>
                                <div class="Odeme-RightLine">
                                    <div class="Left"></div>
                                    <div class="Right">
                                        <a href="javascript:hediyeCekiUygula();">Hediye Çeki Uygula</a>

                                    </div>
                                </div>
                            </div>
                            <style type="text/css">
                                .siparisOzet {
                                    overflow: hidden;
                                    padding: 0 0 10px 0;
                                    height: auto !important;
                                }

                                .SepetimLine * {
                                    height: auto !important;
                                    text-align: left;
                                    font-size: 11px !important;
                                    width: auto !important;
                                    line-height: 18px !important;
                                }

                                .UrunContent {
                                    max-height: 300px;
                                    overflow: auto;
                                }

                                .UrunItem {
                                    display: block;
                                    padding: 0 0 5px 0;
                                    float: left;
                                }

                                .UrunItemImg {
                                    width: 25% !important;
                                    height: 71px !important;
                                    overflow: hidden;
                                    float: left;
                                    text-align: center;
                                }

                                    .UrunItemImg img {
                                        max-width: 100%;
                                    }

                                .UrunItemSag {
                                    width: 75% !important;
                                    float: right !important;
                                }

                                .UrunItemName {
                                    float: left !important;
                                    text-align: left;
                                    padding-left: 3px;
                                }

                                .UrunItemAdet, .UrunItemPrice, .UrunItemTotal {
                                    color: #898989;
                                    padding-left: 3px;
                                    float: left;
                                    width: auto;
                                }

                                .carpma {
                                    font-weight: bold;
                                    margin: 0 3px;
                                    display: inline-block;
                                    float: left;
                                }
                            </style>
                            <div class="Odeme-RightLine siparisOzet">

                                <div class="SepetimLine" style="height: auto;">
                                    <a class="SepetimLineBtn SipariBaslik" style="display: none;">Sepetim</a>
                                    <div class="SepetimList">
                                        <div class="SepetimItemtitle" style="display: none;">
                                            <div class="UrunResim">Ürün</div>
                                            <div class="UrunAdi">Ürün Adı</div>
                                            <div class="UrunAdet">Adet</div>
                                            <div class="UrunFiyat">Ürün Fiyatı</div>
                                            <div class="UrunFiyatToplam">Fiyat</div>
                                        </div>
                                        <div class="UrunContent">

                                            <asp:Repeater runat="server" ID="rptSiparisOzeti">
                                                <ItemTemplate>
                                                    <div class="UrunItem">
                                                <div class="UrunItemImg">
                                                    <img alt="" src="/Dosyalar/Urun/Mini/<%#Eval("Resim")%>" title="<%#Eval("UrunAdi")%>" ">
                                                </div>
                                                <div class="UrunItemSag">
                                                    <div class="UrunItemName"><%#Eval("UrunAdi")%>  </div>
                                                    <div class="UrunItemPrice"><%#fiyatGetir(Convert.ToDecimal(Eval("IndirimliFiyat")),Convert.ToInt32(Eval("Kdv")))%></div>
                                                    <div class="carpma">X</div>
                                                    <div class="UrunItemAdet"><%#Eval("Adet")%></div>
                                                    <div class="UrunItemTotal" style="">Toplam Fiyat:<%#toplamFiyatGetir(Convert.ToDecimal(Eval("IndirimliFiyat")),Convert.ToInt32(Eval("Kdv")),Convert.ToInt32(Eval("Adet")))%></div>
                                                </div>
                                            </div>
                                                </ItemTemplate>
                                            </asp:Repeater>

                                        </div>
                                        <div class="SepetimTotalPriceContent" style="display: none;">
                                            <div class="SepetimTotal">
                                                Sipariş Notu <span>8,00 TL</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="Odeme-RightLine">
                                <div class="Left">SİPARİŞ TUTARI</div>
                                <div class="Right">
                                   <asp:Literal ID="ltrSiparisTutari" runat="server"></asp:Literal>
                                     TL
                                </div>
                            </div>
                            <div class="Odeme-RightLine">
                                <div class="Left">KDV TUTARI</div>
                                <div class="Right">
                                    <asp:Literal ID="ltrKdvTutar" runat="server"></asp:Literal>
                                     TL
                                </div>
                            </div>
                            <div class="Odeme-RightLine" style="display: none;">
                                <div class="Left">KARGO TUTARI</div>
                                <div class="Right" id="divKargoTutar">0,00 TL</div>
                            </div>
                            <div class="Odeme-RightLine" style="display: none;" id="divKapidaOdemeTutarSatir">
                                <div class="Left">KAPIDA ÖDEME TUTARI</div>
                                <div class="Right" id="divKapidaOdemeTutar">
                                </div>
                            </div>

                            <div class="Odeme-RightLine" id="divHediyePaketiSatir" style="display: none;">
                                <div class="Left">HEDİYE PAKETİ</div>
                                <div class="Right" id="divHediyePaketiTutari">
                                    0,00 TL
                                </div>
                            </div>
                            <div class="Odeme-RightLine" id="divHediyeCekiDetay" style="display: none;">
                                <div class="Left">HEDİYE ÇEKİ İNDİRİMİ</div>
                                <div class="Right" id="divHediyeCekiTutar">
                                </div>
                            </div>
                            <%--<div class="Odeme-RightLine">
                                <div class="Left">İNDİRİMLER</div>
                                <div class="Right" id="divIndirimler">
                                    0,00 TL
                                </div>
                            </div>--%>
                            <div class="Odeme-RightLine" id="divBankaKomsiyonu" style="display: none;">
                                <div class="Left">BANKA KOMİSYONU</div>
                                <div class="Right" id="divBankaKomsiyonTutari">
                                </div>
                            </div>
                            <div class="Odeme-RightLine genelToplam" style="background-color: #fff;">
                                <div class="Left">GENEL TOPLAM</div>
                                <div class="Right" id="divToplamOdeme"> <asp:Literal ID="ltrToplam" runat="server"></asp:Literal> TL</div>
                            </div>
                            <asp:Button ID="btnDevam2" OnClick="btnDevam_Click" class="basketCompletebtn button" runat="server" Text="DEVAM ET &gt;" />

                        </div>
                    </div>
                </div>
                <div class="clear"></div>

                <div class="clear"></div>
            </div>



        </div>
        <div class="clear"></div>
      
        <span id="rfvMail" style="display: none;"></span>
        <span id="revMail" style="display: none;"></span>
    </form>
    <div id="fb-root"></div>
</body>
</html>
