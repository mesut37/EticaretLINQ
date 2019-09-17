<%@ Page Language="C#" AutoEventWireup="true" CodeFile="odeme.aspx.cs" Inherits="odeme" %>

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

    <link href="index.html" rel="canonical" />
    <script type="text/javascript" src="/CustomCss/Temp.js"></script>

    <link rel="stylesheet" type="text/css" href="/Scripts/pager.css" />

    <link type="text/css" rel="stylesheet" href="/include/Tab/css/responsive-tabs.css" />
    <link type="text/css" rel="stylesheet" href="/include/Tab/css/style.css" />

</head>
<body>
    <form runat="server" id="formGlobal">

        <div id="header" class="homeHeader">
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






            <script type="text/html" id="odemeSecenekTemplate">
                <div class="odemeSecenekLine">

                    <input type="radio" name="odemeSecenekItem" data-template-bind='[{"attribute": "value", "value": "ID"}, {"attribute": "rel", "value": "BankaKomisyonYuzdesi"}]' class="odemeSecenek" />
                    <span data-content="Tanim"></span>
                    <span data-content="ToplamTutar" data-format="currency" data-format-options="tr"></span>
                    <span data-content="AylikTutar" data-format="currency" data-format-options="tr"></span>
                </div>
            </script>

            <div class="OdemeContent  col-md-12 col-lg-12 col-xs-12 col-sm-12">
                <div class="Basketstep col-md-12 col-lg-12 col-xs-12 col-sm-12" style="margin-bottom: 20px;">
                    <ul>
                        <li class="gecti bSepet"><i></i>
                            <div><span>SEPETİM</span><span class="onesteptext">Alışveriş Sepetim</span></div>
                        </li>
                        <li class="gecti bAdres"><i></i>
                            <div><span>ADRES</span><span class="onesteptext">Adres Seçimi</span></div>
                        </li>
                        <li class="onestepsec bOdeme"><i></i>
                            <div><span>ÖDEME</span><span class="onesteptext">Ödeme Bilgileri</span></div>
                        </li>
                        <li class="pasif bSiparis"><i></i>
                            <div><span>SİPARİŞ</span><span class="onesteptext">Sipariş Onayı</span></div>
                        </li>
                    </ul>
                </div>

                <div class="clear"></div>


                <div class="BasketDetail col-md-9 col-lg-9 col-xs-12 col-sm-12" >
                    <h4 class="sepetTitle">Ödeme Bilgileri<span>Siparişinizi tamamlamak için lütfen bir ödeme türü seçiniz?</span></h4>

                    <div id="horizontalTab">
                        <ul>
                            <li>
                                <a href="#tab-1">Kredi Kartı</a>

                            </li>
                            <li><a href="#tab-2">Havale / EFT</a></li>
                            <li><a href="#tab-3">Kapıda Ödeme</a></li>

                        </ul>
                        <div id="tab-1">
                            <div id="mainHolder_ucOdeme_divKrediKartiTab" class="Left" style="display: block;">
                                <div class="CrediCardContent">

                                    <div class="CrediCardName odemeBankaAdi">
                                        <div class="CrediCardNameLabel">
                                            Banka
                                        </div>
                                        <div class="CrediCardNameInput">
                                            <select name="ctl00$mainHolder$ucOdeme$ddlBanka" id="ddlBanka">
                                                <option value="16">TÜRKİYE FİNANS</option>
                                                <option value="17">İNG BANK</option>
                                                <option value="21">TEK ÇEKİM</option>
                                                <option value="1">BONUS CARD</option>
                                                <option value="2">AXESS</option>
                                                <option value="3">WORLDCARD</option>
                                                <option value="4">MAXIMUM CARD</option>
                                                <option value="6"></option>
                                                <option value="8">ASYA CARD</option>
                                                <option value="10">CARD FINANS</option>

                                            </select>

                                        </div>
                                    </div>
                                    <div class="CrediCardName" id="odemeTaksit">
                                        <input type="hidden" name="ctl00$mainHolder$ucOdeme$hddnSeciliKrediKartiOdemeSecenegi" id="hddnSeciliKrediKartiOdemeSecenegi" value="5">
                                        <div class="divOdemeSecenekleriTittle">
                                            <div></div>
                                            <span>Taksit S.</span>
                                            <span>Toplam T.</span>
                                            <span>Aylık T.</span>
                                        </div>
                                        <div id="divOdemeSecenekleri">
                                            <div class="odemeSecenekLine">

                                                <input type="radio" name="odemeSecenekItem" class="odemeSecenek" value="5" rel="0">
                                                <span>Tek Çekim</span>
                                                <span data-format="currency" data-format-options="tr">12,44 TL</span>
                                                <span data-format="currency" data-format-options="tr">12,44 TL</span>
                                            </div>
                                            <div class="odemeSecenekLine">

                                                <input type="radio" name="odemeSecenekItem" class="odemeSecenek" value="6" rel="2">
                                                <span>3 Taksit</span>
                                                <span data-format="currency" data-format-options="tr">12,69 TL</span>
                                                <span data-format="currency" data-format-options="tr">3,17 TL</span>
                                            </div>
                                            <div class="odemeSecenekLine">

                                                <input type="radio" name="odemeSecenekItem" class="odemeSecenek" value="11" rel="3">
                                                <span>6 Taksit</span>
                                                <span data-format="currency" data-format-options="tr">12,81 TL</span>
                                                <span data-format="currency" data-format-options="tr">2,14 TL</span>
                                            </div>
                                            <div class="odemeSecenekLine">

                                                <input type="radio" name="odemeSecenekItem" class="odemeSecenek" value="32" rel="0">
                                                <span>9 Taksit</span>
                                                <span data-format="currency" data-format-options="tr">12,44 TL</span>
                                                <span data-format="currency" data-format-options="tr">1,38 TL</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="CrediCardName m_closable">
                                        <div class="CrediCardNameLabel">
                                            Kart Sahibinin Adı Soyadı
                                        </div>
                                        <div class="CrediCardNameInput">
                                            <input name="ctl00$mainHolder$ucOdeme$txtbxCCIsim" type="text" id="txtbxCCIsim">
                                        </div>
                                    </div>
                                    <div class="CrediCardNo m_closable">
                                        <div class="CrediCardNoLabel">
                                            Kredi Kartı Numarası
                                        </div>
                                        <div class="CrediCardNoInput">
                                            <input name="ctl00$mainHolder$ucOdeme$txtbxCC1" type="text" maxlength="4" id="txtbxCC1" class="ccBox is-keypad" onkeydown="ShiftCC(event)" onclick="SelectText(this)" onkeypress="return handleCCChars(event,false)">
                                            <input name="ctl00$mainHolder$ucOdeme$txtbxCC2" type="text" maxlength="4" id="txtbxCC2" class="ccBox is-keypad" onkeydown="ShiftCC(event)" onclick="SelectText(this)" onkeypress="return handleCCChars(event,false)">
                                            <input name="ctl00$mainHolder$ucOdeme$txtbxCC3" type="text" maxlength="4" id="txtbxCC3" class="ccBox is-keypad" onkeydown="ShiftCC(event)" onclick="SelectText(this)" onkeypress="return handleCCChars(event,false)">
                                            <input name="ctl00$mainHolder$ucOdeme$txtbxCC4" type="text" maxlength="4" id="txtbxCC4" class="ccBox is-keypad" onkeydown="ShiftCC(event)" onclick="SelectText(this)" onkeypress="return handleCCChars(event,false)">
                                        </div>
                                    </div>
                                    <div class="CrediCardName" id="divKartKampanyaSecenek" style="display: none;">
                                        <input type="hidden" name="ctl00$mainHolder$ucOdeme$hddnSeciliKartKampanyasi" id="hddnSeciliKartKampanyasi">
                                        <div class="CrediCardNameLabel">
                                            Kart Kampanyası
                                        </div>
                                        <div class="CrediCardNameInput">
                                            <select name="ctl00$mainHolder$ucOdeme$ddlKartKampanyasi" id="ddlKartKampanyasi">
                                                <option value="-1">Seçiniz</option>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="CrediCardDate m_closable">
                                        <div class="CrediCardDateLabel">
                                            Son Kullanma Tarihi
                                        </div>
                                        <div class="CrediCardDateInput">
                                            <select name="ctl00$mainHolder$ucOdeme$ddlCCAy" id="ddlCCAy">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>

                                            </select>
                                            <select name="ctl00$mainHolder$ucOdeme$ddlCCYil" id="ddlCCYil">
                                                <option value="2015">2015</option>
                                                <option value="2016">2016</option>
                                                <option value="2017">2017</option>
                                                <option value="2018">2018</option>
                                                <option value="2019">2019</option>
                                                <option value="2020">2020</option>
                                                <option value="2021">2021</option>
                                                <option value="2022">2022</option>
                                                <option value="2023">2023</option>
                                                <option value="2024">2024</option>
                                                <option value="2025">2025</option>
                                                <option value="2026">2026</option>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="CrediCardSecure m_closable">
                                        <div class="CrediCardSecureLabel">
                                            Güvenlik Kodu
                                        </div>
                                        <div class="CrediCardSecureInput">
                                            <input name="ctl00$mainHolder$ucOdeme$txtbxCVV" type="text" maxlength="4" id="txtbxCVV" class="ccBox is-keypad" onkeydown="ShiftCC(event)" onclick="SelectText(this)" onkeypress="return handleCCChars(event,false)">
                                            <select name="ctl00$mainHolder$ucOdeme$sltKartTipi" id="sltKartTipi">
                                                <option value="VISA">Visa</option>
                                                <option value="MASTER">MasterCard</option>
                                                <option value="AMEX">AMEX</option>
                                            </select>
                                        </div>
                                    </div>




                                    <span id="spn3DContainer" style="display: inline;">
                                        <span class="aspNetDisabled" style="display: none;">
                                            <input id="cb3DSecureOdeme" type="checkbox" name="ctl00$mainHolder$ucOdeme$cb3DSecureOdeme" disabled="disabled"><label for="cb3DSecureOdeme">3D Secure ile ödeme yapmak istiyorum.</label></span></span>
                                    <span id="spnPayUOneClickContainer" style="display: none;">
                                        <input id="cbPayUOneClick" type="checkbox" name="ctl00$mainHolder$ucOdeme$cbPayUOneClick"><label for="cbPayUOneClick">Kart Bilgilerimi sonraki ödemelerimde kolayca kullanabilmem için kaydet.</label></span>
                                </div>
                               
                                <asp:Button ID="btnKrediKarti" OnClick="btnKrediKarti_Click" class="basketCompletebtn button" Width="200" Style="float: right;" runat="server" Text="Siparişi Tamamla &gt;" />
                           <br />
                                <asp:CheckBox ID="CheckBox3" Checked="true" Enabled="false" runat="server" />
                              
                                <span style="font-size:13px;">
                                    Ön bilgilendirme şartlarını& Mesafeli satış sözleşmesi 'ni okudum , onaylıyorum.
                                </span>
                                <br />
                                  </div>
                        </div>
                        <div id="tab-2">
                            <div id="mainHolder_ucOdeme_divHavaleTab" class="Left HavaleLeft" style="clear: both; display: block;">
                                <input type="hidden" name="ctl00$mainHolder$ucOdeme$hddnHavaleHesapID" id="hddnHavaleHesapID" value="1">


                                <asp:RadioButtonList ID="rdlBankalar" Style="background: #f2f2f2; width: 100%;" runat="server">
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Class="required" ControlToValidate="rdlBankalar" runat="server" ErrorMessage="Banka Seçiniz"></asp:RequiredFieldValidator>

                            </div>
                            <asp:Button ID="btnHavale" OnClick="btnHavale_Click" class="basketCompletebtn button" Width="200" Style="float: right;" runat="server" Text="Siparişi Tamamla &gt;" />
                               <br />
                                <asp:CheckBox ID="CheckBox1" Checked="true" Enabled="false" runat="server" />
                              
                                <span style="font-size:13px;">
                                    Ön bilgilendirme şartlarını& Mesafeli satış sözleşmesi 'ni okudum , onaylıyorum.
                                </span>
                                <br />
                            
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                        <div id="tab-3">
                            <div id="mainHolder_ucOdeme_divKapidaOdemeTab" class="Left KapidaOdemeLeft" style="clear: both; display: block;">
                                <div class="KapidaOdemeTittle">
                                    Kapıda Ödeme Seçenekleri
                                </div>
                                <div class="KapidaOdemeContent">
                                    <div class="KapidaOdemeLine">
                                        <div class="KapidaOdemeInput">
                                            <asp:CheckBox ID="chkKapida" Enabled="false" Checked="true" runat="server" />
                                            
                                        </div>
                                        <div class="KapidaOdemeLabel">
                                            Kapıda Nakit Ödeme
                                   <b> 5,00 TL</b> yada  Kapıda Kredi Kartı ile Ödeme
                                   <b> 5,00 TL</b>
                                        </div>
                                    </div>
                                    <div class="clear"></div>
                                    
                                </div>
                            </div>
                            <asp:Button ID="btnKapida" OnClick="btnKapida_Click" class="basketCompletebtn button" Width="200" Style="float: right;" runat="server" Text="Siparişi Tamamla &gt;" />
                             <br />
                                <asp:CheckBox ID="CheckBox2" Checked="true" Enabled="false" runat="server" />
                              
                                <span style="font-size:13px;">
                                    Ön bilgilendirme şartlarını& Mesafeli satış sözleşmesi 'ni okudum , onaylıyorum.
                                </span>
                                <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>

                    </div>





                    <script src="/include/Tab/js/jquery-2.1.0.min.js"></script>
                    <!--<![endif]-->

                    <!-- Responsive Tabs JS -->
                    <script src="/include/Tab/js/jquery.responsiveTabs.js" type="text/javascript"></script>

                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('#horizontalTab').responsiveTabs({
                                rotate: false,
                                startCollapsed: 'accordion',
                                collapsible: 'accordion',
                                setHash: true,
                                disabled: [3, 4],
                                activate: function (e, tab) {
                                    $('.info').html('Tab <strong>' + tab.id + '</strong> activated!');
                                },
                                activateState: function (e, state) {
                                    //console.log(state);
                                    $('.info').html('Switched from <strong>' + state.oldState + '</strong> state to <strong>' + state.newState + '</strong> state!');
                                }
                            });

                            $('#start-rotation').on('click', function () {
                                $('#horizontalTab').responsiveTabs('startRotation', 1000);
                            });
                            $('#stop-rotation').on('click', function () {
                                $('#horizontalTab').responsiveTabs('stopRotation');
                            });
                            $('#start-rotation').on('click', function () {
                                $('#horizontalTab').responsiveTabs('active');
                            });
                            $('.select-tab').on('click', function () {
                                $('#horizontalTab').responsiveTabs('activate', $(this).val());
                            });

                        });
    </script>

                    <div class="clear"></div>



                </div>
                <div class="BasketAccount col-md-3 col-lg-3 col-xs-12 col-sm-12">

                    <div class="OdemeContent">



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
                                                            <img src="/Dosyalar/Urun/Mini/<%#Eval("Resim")%>" title="<%#Eval("UrunAdi")%>">
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
                            <div class="Odeme-RightLine">
                                <div class="Left">KARGO ÜCRETİ</div>
                                <div class="Right" id="divIndirimler">
                                    <asp:Literal ID="ltrKargo" runat="server"></asp:Literal>
                                </div>
                            </div>
                            <div class="Odeme-RightLine" id="divBankaKomsiyonu" style="display: none;">
                                <div class="Left">BANKA KOMİSYONU</div>
                                <div class="Right" id="divBankaKomsiyonTutari">
                                </div>
                            </div>
                            <div class="Odeme-RightLine genelToplam" style="background-color: #fff;">
                                <div class="Left">TAHSİL EDİLECEK TUTAR</div>
                                <div class="Right" id="divToplamOdeme">
                                    <asp:Literal ID="ltrToplam" runat="server"></asp:Literal>
                                    TL</div>
                            </div>


                        </div>
                    </div>
                </div>
                <input type="hidden" name="pan" value="">
                <input type="hidden" name="cv2" value="">
                <input type="hidden" name="Ecom_Payment_Card_ExpDate_Year" value="">
                <input type="hidden" name="Ecom_Payment_Card_ExpDate_Month" value="">
                <input type="hidden" name="cardType" value="">
                <input type="hidden" name="clientid" value="">
                <input type="hidden" name="amount" value="">
                <input type="hidden" name="oid" value="">
                <input type="hidden" name="okUrl" value="">
                <input type="hidden" name="failUrl" value="">
                <input type="hidden" name="rnd" value="">
                <input type="hidden" name="hash" value="">
                <input type="hidden" name="islemtipi" value="">
                <input type="hidden" name="taksit" value="">
                <input type="hidden" name="storetype" value="3d_pay">
                <input type="hidden" name="lang" value="tr">


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
