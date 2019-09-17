<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
<head runat="server">
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

    <link href="/anasayfa" rel="canonical" />
    <script type="text/javascript" src="/CustomCss/Temp.js"></script>

    <link rel="stylesheet" type="text/css" href="/Scripts/pager.css" />
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

        <div id="divIcerik" class="ticiContainer homeContainer">

            <!--<div id="mainHolder_divPopupContent" class="PopupContent">
                <div id="divPopupText" style="display: none;">
                    <img style="width: 100%" src="Uploads/EditorUploads/demo_pop-up.jpg">
                </div>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $.fancybox($("#divPopupText").html());
                    });
                </script>
            </div>-->
            <div class="clear"></div>
            <div class="leftBlock hidden-phone">

                <uc1:Kategori runat="server" ID="Kategori" />

                <uc1:Carousel runat="server" ID="Carousel" />
                <div class="Block_item OzelBlokIcerik">

                    <div class="Block_Text">
                        <img src="/Uploads/EditorUploads/solbanner1.jpg" class="img-responsive" style="">
                    </div>
                    <div class="Block_Alt">
                    </div>
                </div>
                <div class="Block_item OzelBlokIcerik">

                    <div class="Block_Text">
                        <img src="/Uploads/EditorUploads/solbanner2.jpg" class="img-responsive" style="">
                    </div>
                    <div class="Block_Alt">
                    </div>
                </div>
            </div>
            <div class="centerCount">

                <script type="text/javascript">
                    $(document).ready(function () {
                        // Home Page Slide Show
                        if ($("#pnlSlider").length > 0) {
                        }
                    });
                    $(window).load(function () {
                        $('div.HPSItems').flexslider({
                        });
                    });
                </script>
                <div id="pnlSlider">

                    <div class="HomePageSlideShowContainer">
                        <div class="HomePageSlideShow" id="HomePageSlideShow">
                            <div class="HPSItems">
                                <ul class="slides">


                                    <asp:Repeater runat="server" ID="rptSlider">
                                        <ItemTemplate>

                                            <li>
                                                <a href='<%#Eval("Link")%>'>
                                                    <img src='/Dosyalar/Slider/Mini/<%#Eval("Banner")%>' />
                                                </a>
                                            </li>

                                        </ItemTemplate>
                                    </asp:Repeater>


                                </ul>
                            </div>
                        </div>
                        <div class="navi">
                        </div>
                    </div>

                </div>
                <div class="clear"></div>

                <div class="categoryTitleText">
                    <h1>VİTRİN ÜRÜNLERİ</h1>
                </div>
                <div class="ProductListContent">
                    <div class="ProductList">

                        <asp:Repeater runat="server" ID="rptUrunler" OnItemCommand="rptUrunler_ItemCommand">
                            <ItemTemplate>
                                <div class="productItem">

                                    <%#tukendi(Convert.ToInt32(Eval("Stok")))%>
                                    <div class="productImage">
                                        <a title="mp erkek spor" href="/urundetay/<%#Eval("ID")%>/<%#Tools.UrlSeo(Eval("UrunAdi").ToString().ToLower()) %>">
                                            <img class="resimOrginal" src="/Dosyalar/Urun/Mini/<%#Eval("Resim")%>" data-original="" alt="<%#Eval("UrunAdi")%>">
                                        </a>
                                    </div>
                                    <div class="productDetail">
                                        <div class="productMarka" style="display: none;"><%#Eval("UrunAdi")%></div>

                                        <div class="productPrice" ID="fiyat" runat="server" visible="false">
                                            <span style="font-size: 11px;">KDV Dahil</span>
                                            <div class="discountPrice">
                                                <span><%#kdvDahil(Convert.ToDecimal(Eval("IndirimliFiyat")),Convert.ToInt32(Eval("Kdv")))%>
                                                </span>
                                            </div>
                                            <div class="regularPrice">
                                                <span><%# alisFiyatGoster(Convert.ToDecimal(Eval("AlisFiyat")),Convert.ToDecimal(Eval("IndirimliFiyat")),Convert.ToInt32(Eval("Kdv")))%> 
                                                </span>
                                                <span class="regularKdv">KDV Dahil
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="productIcon">
                                        <%# yeniGoster(Convert.ToInt32(Eval("Yeni")))%>
                                        <div class="favori">
                                            <a class="favoriteslist tip">Favorilere Ekle</a>
                                        </div>
                                        <div class="mycartIcon tip" title="Sepete Ekle">
                                        <%--    <asp:LinkButton ID="lnkSepeteEkle" OnClientClick="javascript:return alert('Ürün Sepete Eklendi..');" CommandName="sepet" CommandArgument='<%#Eval("ID")%>' runat="server"><%#(Convert.ToInt32(Eval("Stok")) > 0) ? "Sepete Ekle" : "" %></asp:LinkButton>--%>
                                           <a href="/urundetay/<%#Eval("ID")%>/<%#Tools.UrlSeo(Eval("UrunAdi").ToString().ToLower()) %>">Sipariş Ver</a>
                                        </div>
                                        <div class="examineIcon tip" title="Ürünü İncele"><a href='/urundetay/<%#Eval("ID")%>/<%#Tools.UrlSeo(Eval("UrunAdi").ToString().ToLower()) %>'>İncele</a></div>
                                        <%# idirimHesapla(Convert.ToInt32(Eval("IndirimliFiyat")),Convert.ToInt32(Eval("AlisFiyat"))) %>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="clear"></div>
                <div style="width: 100%; height: 50px; text-align: center;">
                    <cc1:CollectionPager ID="CollectionPager1" ControlCssClass="Sayfalama" PageSize="18" runat="server" BackText="Geri" BackNextButtonStyle="" FirstText="İlk" LastText="Son" NextText="İleri" QueryStringKey="Sayfa" ResultsFormat="Sayfa  {0}  {1} (of {2})" PagingMode="QueryString" PageNumbersDisplay="Numbers" ResultsLocation="None" LabelText="Sayfa : " PageNumbersSeparator=" "></cc1:CollectionPager>
                </div>
            </div>
            <div class="rightBlock hidden-phone">
            </div>
            <!-- Cache ZamanÄ± 27.6.2015 14:32:16 -->
        </div>
        <div class="clear"></div>
        <uc1:Footer runat="server" ID="Footer" />
        <span id="rfvMail" style="display: none;"></span>
        <span id="revMail" style="display: none;"></span>
    </form>
    <div id="fb-root"></div>
</body>
</html>
