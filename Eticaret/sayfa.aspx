<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sayfa.aspx.cs" Inherits="sayfa" %>

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
                <div class="clear"></div>

                <div class="categoryTitleText">
                    <br />
                    <h1 style="font-size: 22px; font-weight: bold;">
                        <asp:Literal ID="ltrBaslik" runat="server"></asp:Literal></h1>
                </div>
                <asp:Literal ID="ltrDetay" runat="server"></asp:Literal>

                <div class="clear"></div>

                <div class="clear"></div>
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
