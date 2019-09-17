<%@ Page Language="C#" AutoEventWireup="true" CodeFile="arama.aspx.cs" Inherits="arama" %>

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
     <link rel="stylesheet" type="text/css" href="/Scripts/pager.css" />
 

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

        .kategori:hover {
            color: #266690;
        }

        .urunyok {
            width: 100%;
            height: 200px;
            text-align: center;
            padding-top: 20px;
        }
    </style>
    <link href="/anasayfa" rel="canonical" />
    <script type="text/javascript" src="/CustomCss/Temp.js"></script>


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

                        <uc1:Kategori runat="server" ID="Kategori" />

                    </div>
                </div>
                <uc1:Navigation runat="server" ID="Navigation" />
            </div>
        </div>
        <div class="clear"></div>



        <div id="divIcerik" class="ticiContainer categoryContainer">


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


            <div class="leftBlock">


                <div class="Block_item KategoriFilitrelemeContent">
                    <div class="Block_Title"><span>as</span></div>
                    <div class="Block_Text KategoriFilitrelemeTxt">

                        <div class="clear"></div>


                        <%--<div class="KategoriFilitreleme markaFilitreContent">
                            <div class="KategoriFilitreTittle">
                                <asp:Literal ID="ltrKategoriAdi" runat="server"></asp:Literal>
                            </div>
                            <div class="clear"></div>
                            <div class="KategoriFilitreLine FilitreMaxHeight">
                                <table id="mainHolder_ctl00_chkMarkalar">
                                    <tbody>

                                        <asp:Repeater runat="server" ID="rptAltKategoriler">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><a href="kategori.aspx?ID=<%#Eval("ID")%>" class="kategori">
                                                        <img src="CustomCss/images/kat-icon.png" />
                                                        <%#Eval("KategoriAdi")%></a></td>
                                                </tr>

                                            </ItemTemplate>
                                        </asp:Repeater>

                                    </tbody>
                                </table>
                            </div>
                        </div>--%>
                        <div class="clear"></div>

                        <div id="Div1" class="KategoriFilitreleme" runat="server" visible="false">
                            <div class="KategoriFilitreTittle">Renk</div>
                            <div class="clear"></div>
                            <div class="KategoriFilitreLine">
                                <div class="FilitreMaxHeight">
                                    <table id="mainHolder_ctl00_rptEkSecenekler_chkEkSecenek_0">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <input id="mainHolder_ctl00_rptEkSecenekler_chkEkSecenek_0_0_0" type="checkbox" name="ctl00$mainHolder$ctl00$rptEkSecenekler$ctl00$chkEkSecenek$0" onclick="javascript: setTimeout('__doPostBack(\'ctl00$mainHolder$ctl00$rptEkSecenekler$ctl00$chkEkSecenek$0\',\'\')', 0)" value="1"><label for="mainHolder_ctl00_rptEkSecenekler_chkEkSecenek_0_0_0">Lacivert</label></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input id="mainHolder_ctl00_rptEkSecenekler_chkEkSecenek_0_1_0" type="checkbox" name="ctl00$mainHolder$ctl00$rptEkSecenekler$ctl00$chkEkSecenek$1" onclick="javascript: setTimeout('__doPostBack(\'ctl00$mainHolder$ctl00$rptEkSecenekler$ctl00$chkEkSecenek$1\',\'\')', 0)" value="28"><label for="mainHolder_ctl00_rptEkSecenekler_chkEkSecenek_0_1_0">Mavi</label></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input id="mainHolder_ctl00_rptEkSecenekler_chkEkSecenek_0_2_0" type="checkbox" name="ctl00$mainHolder$ctl00$rptEkSecenekler$ctl00$chkEkSecenek$2" onclick="javascript: setTimeout('__doPostBack(\'ctl00$mainHolder$ctl00$rptEkSecenekler$ctl00$chkEkSecenek$2\',\'\')', 0)" value="2"><label for="mainHolder_ctl00_rptEkSecenekler_chkEkSecenek_0_2_0">Kırmızı</label></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input id="mainHolder_ctl00_rptEkSecenekler_chkEkSecenek_0_3_0" type="checkbox" name="ctl00$mainHolder$ctl00$rptEkSecenekler$ctl00$chkEkSecenek$3" onclick="javascript: setTimeout('__doPostBack(\'ctl00$mainHolder$ctl00$rptEkSecenekler$ctl00$chkEkSecenek$3\',\'\')', 0)" value="3"><label for="mainHolder_ctl00_rptEkSecenekler_chkEkSecenek_0_3_0">Sarı</label></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input id="mainHolder_ctl00_rptEkSecenekler_chkEkSecenek_0_4_0" type="checkbox" name="ctl00$mainHolder$ctl00$rptEkSecenekler$ctl00$chkEkSecenek$4" onclick="javascript: setTimeout('__doPostBack(\'ctl00$mainHolder$ctl00$rptEkSecenekler$ctl00$chkEkSecenek$4\',\'\')', 0)" value="4"><label for="mainHolder_ctl00_rptEkSecenekler_chkEkSecenek_0_4_0">Beyaz</label></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input id="mainHolder_ctl00_rptEkSecenekler_chkEkSecenek_0_5_0" type="checkbox" name="ctl00$mainHolder$ctl00$rptEkSecenekler$ctl00$chkEkSecenek$5" onclick="javascript: setTimeout('__doPostBack(\'ctl00$mainHolder$ctl00$rptEkSecenekler$ctl00$chkEkSecenek$5\',\'\')', 0)" value="5"><label for="mainHolder_ctl00_rptEkSecenekler_chkEkSecenek_0_5_0">Siyah</label></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input id="mainHolder_ctl00_rptEkSecenekler_chkEkSecenek_0_6_0" type="checkbox" name="ctl00$mainHolder$ctl00$rptEkSecenekler$ctl00$chkEkSecenek$6" onclick="javascript: setTimeout('__doPostBack(\'ctl00$mainHolder$ctl00$rptEkSecenekler$ctl00$chkEkSecenek$6\',\'\')', 0)" value="6"><label for="mainHolder_ctl00_rptEkSecenekler_chkEkSecenek_0_6_0">Kahverengi</label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>






                    </div>
                    <div class="Block_Alt"></div>
                </div>

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
            <div class="urunyok" runat="server" visible="false" id="urunYok">
                <img src="/images/urunyok.png" width="150" />
            </div>
            <div class="centerCount" runat="server" ID="urunGoster" visible="true">


                <div class="clear"></div>

                <div class="clear"></div>
                <div class="categoryTitle">
                    <div class="categoryTitleText">
                        <h1>
                            <a href="/anasayfa">Anasayfa <span>&gt;</span> </a>
                            <asp:Literal ID="ltrKelime" runat="server"></asp:Literal></h1>
                    </div>
                    
                </div>
                <div class="clear"></div>


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

                                        <div class="productPrice">
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

                 <div style="width: 100%; height: 50px; text-align: center;">
                     <cc1:CollectionPager ID="CollectionPager2" ControlCssClass="Sayfalama" PageSize="18" runat="server" BackText="Geri" BackNextButtonStyle="" FirstText="İlk" LastText="Son" NextText="İleri" QueryStringKey="Sayfa" ResultsFormat="Sayfa  {0}  {1} (of {2})" PagingMode="QueryString" PageNumbersDisplay="Numbers" ResultsLocation="None" LabelText="Sayfa : " PageNumbersSeparator=" " runat="server"></cc1:CollectionPager>
                   
                </div>




            </div>

            <div class="rightBlock">
            </div>

            <!-- Cache Zamanı 27.6.2015 14:51:16 -->

        </div>
        <div class="clear"></div>

        <uc1:Footer runat="server" ID="Footer" />
        <span id="rfvMail" style="display: none;"></span>
        <span id="revMail" style="display: none;"></span>

    </form>

    <div id="fb-root"></div>



</body>
</html>
