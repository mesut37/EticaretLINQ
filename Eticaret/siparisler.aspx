<%@ Page Language="C#" AutoEventWireup="true" CodeFile="siparisler.aspx.cs" Inherits="siparisler" %>

<%@ Register Src="~/UserControls/TopMenu.ascx" TagPrefix="uc1" TagName="TopMenu" %>
<%@ Register Src="~/UserControls/MyCart.ascx" TagPrefix="uc1" TagName="MyCart" %>
<%@ Register Src="~/UserControls/Search.ascx" TagPrefix="uc1" TagName="Search" %>
<%@ Register Src="~/UserControls/Navigation.ascx" TagPrefix="uc1" TagName="Navigation" %>
<%@ Register Src="~/UserControls/Kategori.ascx" TagPrefix="uc1" TagName="Kategori" %>
<%@ Register Src="~/UserControls/Carousel.ascx" TagPrefix="uc1" TagName="Carousel" %>
<%@ Register Src="~/UserControls/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/UserControls/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>

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

        <div id="divIcerik" class="ticiContainer innerContainer">

            <div class="leftBlock hesabimLeft col-md-3 col-lg-3 col-xs-12 col-sm-12" style="display: block;">
                <div runat="server" ID="hesabimGoruntule">
                    <uc1:UserMenu runat="server" ID="UserMenu" />

                </div>
            </div>
            <div class="centerCount SiparislerimContent col-md-9 col-lg-9 col-xs-12 col-sm-12" runat="server" id="siparisDiv">
                <div class="categoryTitle">
                    <div class="categoryTitleText">
                        <h1>Siparişlerim</h1>
                    </div>
                </div>
                <div class="Listem Siparislerim">
                    <div class="ListemItem Title" style="background: #eee;">
                        <div class="line1">Sipariş Tarihi</div>
                        <div class="line2">Onay</div>
                        <div class="line3">Tutar</div>
                        <div class="line4">Durum</div>
                        <div class="line5">Kargo Firması</div>
                        <div class="line6">Detay</div>
                    </div>


                    <asp:Repeater runat="server" ID="rptSiparisler">
                        <ItemTemplate>
                            <div class="ListemItem satir">
                                <div class="line1"><%#Eval("EklenmeTarihi")%></div>
                                <div class="line2"><%#(Convert.ToInt32(Eval("Onay")) == 1) ? "Onaylandı" : "Onaylanmadı"%></div>
                                <div class="line3"><%#string.Format("{0:c}",Eval("Tutar"))%></div>
                                <div class="line4"><%#Eval("Durum")%></div>
                                <div class="line5"><%#Eval("KargoAdi")%></div>
                                <div class="line6">
                                    <a href="/siparisdetay/<%#Eval("ID")%>" style="color:#2a80b9;font-size:13px; text-decoration: none;">Detay <img src="/CustomCss/images/detay.png" /> </a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                   


                    <input id="ctl00_mainHolder_rlvListe_ClientState" name="ctl00_mainHolder_rlvListe_ClientState" type="hidden" autocomplete="off"><span id="ctl00_mainHolder_rlvListe" style="display: none;"></span>
                </div>
             <div runat="server" id="havaleBildirimDiv">
                  <a href="/havalebildirim" style="font-size:14px;">  Havale Bildirim Formu Sayfasına git <img src="/CustomCss/images/havale.png" width="15" /></a>
             </div>
            </div>

        </div>
        <div class="clear"></div>

        <uc1:Footer runat="server" ID="Footer" />
        <span id="rfvMail" style="display: none;"></span>
        <span id="revMail" style="display: none;"></span>

    </form>

    <div id="fb-root"></div>



</body>
</html>
