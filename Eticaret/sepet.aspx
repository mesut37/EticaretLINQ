<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sepet.aspx.cs" Inherits="sepet" %>

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
    </style>

    <link href="index.html" rel="canonical" />
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




            <div class=" col-md-12 col-lg-12 col-xs-12 col-sm-12">
                <div class="Basketstep col-md-12 col-lg-12 col-xs-12 col-sm-12">
                    <ul>
                        <li class="onestepsec bSepet"><i></i>
                            <div><span>SEPETİM</span><span class="onesteptext">Alışveriş Sepetim</span></div>
                        </li>
                        <li class="pasif bAdres"><i></i>
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
                <div class="BasketDetail col-md-9 col-lg-9 col-xs-12 col-sm-12">
                    <h4 class="sepetTitle">Sepetim<span>Sepetinize eklediğiniz ürün listesi</span></h4>
                    <asp:Literal ID="ltrUrunYok" runat="server"></asp:Literal>
                    <div class="sepett" id="sepetGoruntule" runat="server">
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <thead>
                                <tr>
                                    <td width="5%" class="hidden-phone"></td>
                                    <td width="45%">Ürün Adı</td>
                                    <td width="15%" style="text-align: center;">Adet</td>
                                    <td width="15%" style="text-align: center;">Fiyat</td>
                                    <td width="15%" style="text-align: center;">Tutar</td>
                                    <td width="10%" style="text-align: center;">Sil</td>
                                </tr>
                            </thead>
                            <tbody>

                                <asp:Repeater runat="server" ID="rptSepet" OnItemCommand="rptSepet_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="hidden-phone" width="10%"><a href="#">
                                                <img src="/Dosyalar/Urun/Mini/<%#Eval("Resim")%>" style="width: 60px;"></a></td>
                                            <td width="27%"><a href="#" rel="0"><%#Eval("UrunAdi")%>  </a>

                                            </td>
                                            <td width="15%" style="text-align: center;">
                                                <div>
                                                    <asp:TextBox ID="txtAdet" Text='<%#Eval("Adet")%>' Style="float: left; margin-right: 5px; text-align: center; width: 18px;" class="textbox txtSepetAdet" runat="server"></asp:TextBox>

                                                    <asp:LinkButton ID="lnkhuncelle" runat="server" CommandName="guncelle" CommandArgument='<%#Eval("ID")%>'> <img src="/images/update.png" width="43" /></asp:LinkButton>
                                                </div>

                                            </td>
                                            <td width="15%" style="text-align: center; font-size: 18px; color: #434a54;"><%#fiyatGetir(Convert.ToDecimal(Eval("IndirimliFiyat")),Convert.ToInt32(Eval("Kdv")))%></td>
                                            <td width="20%" style="text-align: center; font-size: 18px; color: #434a54;"><%#toplamFiyatGetir(Convert.ToDecimal(Eval("IndirimliFiyat")),Convert.ToInt32(Eval("Kdv")),Convert.ToInt32(Eval("Adet")))%></td>
                                            <td width="13%" style="text-align: center;">
                                                <asp:LinkButton ID="lnkSil" class="sepet-sil" CommandName="sil" CommandArgument='<%#Eval("ID")%>' runat="server" OnClientClick="javascript:return confirm('Bu ürünü sepetten silmek istediğinize emin misiniz ?');">Sil</asp:LinkButton>

                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>


                            </tbody>
                        </table>
                    </div>
                    <a id="mainHolder_ucSepetim_linkAlisverisDevam" class="alisverisedevamet button" href="/anasayfa" target="_parent">&lt; ALIŞVERİŞE DEVAM ET</a>
                    <div class="clear"></div>

                    <div class="clear"></div>
                    <div id="mainHolder_ucSepetim_divKasaOnuFirsatlar" class="KasaOnuFirsatlar">
                        <div class="SepetKampanyaTittle">Kasa Önü Fırsatlar</div>
                        <div class="KasaOnuFirsatlarContent">
                            <ul>

                                <asp:Repeater runat="server" ID="rptKasaOnu" OnItemCommand="rptKasaOnu_ItemCommand">
                                    <ItemTemplate>
                                        <li>
                                            <a title="<%#Eval("Urunadi")%>" href="/urundetay/<%#Eval("ID")%>/<%#Tools.UrlSeo(Eval("UrunAdi").ToString().ToLower()) %>">
                                                <img data-original="/Dosyalar/Urun/<%#Eval("Resim")%>" src="/Dosyalar/Urun/Mini/<%#Eval("Resim")%>" alt="<%#Eval("UrunAdi")%>" class="lazy" style="display: inline;">
                                            </a>
                                            <span><%#Eval("UrunAdi")%>
                                            </span>
                                            <span><%#Eval("IndirimliFiyat")%>+ KDV
                                            </span>
                                            <asp:Button ID="btnSepeteEkle" CommandName="sepet" CommandArgument='<%#Eval("ID")%>' class="button" OnClientClick="javascript:return alert('Ürün Sepete Eklendi..');" runat="server" Text="Sepete Ekle" />
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </ul>
                        </div>
                    </div>
                </div>
                <div class="BasketAccount col-md-3 col-lg-3 col-xs-12 col-sm-12">
                    <div class="BasketRigth">
                        <h4 class="sepetTitle2">Sipariş Özeti</h4>
                        <ul>
                            <li><span>SİPARİŞ TUTARI</span><span class="tut"><asp:Literal ID="ltrSiparisTutari" runat="server"></asp:Literal>
                                TL
                            </span></li>
                            <li><span>KDV </span><span class="tut">
                                <asp:Literal ID="ltrKdvTutar" runat="server"></asp:Literal>
                                TL
                            </span></li>
                         <%--   <li><span>İNDİRİMLER </span><span class="tut">0,00 TL
                            </span></li>--%>
                            <li class="genelToplam"><span>SEPET TOPLAMI </span><span class="tut">
                                <asp:Literal ID="ltrToplam" runat="server"></asp:Literal>
                                TL
                            </span></li>
                            <li>
                                <asp:Button ID="btnTamamla" OnClick="btnTamamla_Click" style="float: right; text-align: center;" class="button basketCompletebtn" runat="server" Text="ALIŞVERİŞİ TAMAMLA &gt;" />
                            </li>
                        </ul>
                    </div>
                </div>


            </div>




        </div>
        <div class="clear"></div>
      
        <span id="rfvMail" style="display: none;"></span>
        <span id="revMail" style="display: none;"></span>
    </form>
    <div id="fb-root"></div>
</body>
</html>
