<%@ Page Language="C#" AutoEventWireup="true" CodeFile="siparistamamla.aspx.cs" Inherits="siparistamamla" %>

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

        <div class="ticiContainer">
            
    <noscript>
        &lt;img height="1" width="1" alt="" style="display: none" src="https://www.facebook.com/offsite_event.php?id=6017707885883&amp;amp;value=0.01&amp;amp;currency=TRY" /&gt;
    </noscript>
    <div class=" col-md-12 col-lg-12 col-xs-12 col-sm-12">
        <div class="Basketstep col-md-12 col-lg-12 col-xs-12 col-sm-12">
            <ul>
                <li class="gecti bSepet"><i></i>
                    <div><span>SEPETİM</span><span class="onesteptext">Alışveriş Sepetim</span></div>
                </li>
                <li class="gecti bAdres"><i></i>
                    <div><span>ADRES</span><span class="onesteptext">Adres Seçimi</span></div>
                </li>
                <li class="gecti bOdeme"><i></i>
                    <div><span>ÖDEME</span><span class="onesteptext">Ödeme Bilgileri</span></div>
                </li>
                <li class="onestepsec bSiparis"><i></i>
                    <div><span>SİPARİŞ</span><span class="onesteptext">Sipariş Onayı</span></div>
                </li>
            </ul>
        </div>
        <div class="clear"></div>
        <div class="BasketDetail col-md-9 col-lg-9 col-xs-12 col-sm-12" style="width:100% !important;">
            <div class="SiparisTamamlaLine" style="text-align: center;">
                <span class="thanksSpan" style="font-size: 18px; color: #df513e;">Teşekkürler
                    <b>
                        <asp:Literal ID="ltrAdSoyad" runat="server"></asp:Literal>
                        ; </b></span>
                <span class="SiparisBasarili" style="color: #666666; font-size: 18px;"><br /><b>SİPARİŞİNİZ BAŞARI İLE KAYIT EDİLMİŞTİR.</b></span>
               
            </div>
            <br>
            
                    <div class="SiparisTamamlaLine" style="border: none; text-align: center;">
                        <ul>
                            <li>
                                <asp:Literal ID="ltrOdemeSekli" runat="server"></asp:Literal> ile ödeme seçeneğini sectiniz.</li>
                            <li>Sipariş detaylarınız siparişler bölümünden görebilirsiniz.</li>
                            <li><b>Bizi Tercih Ettiğiniz İçin Teşekkür Ederiz..</b></li>
                        </ul>
                    </div>
            <br />
            <br />
            <br /><br />
            <br />
            <br />
                    <div class="SiparisTamamlaLine" style="border: none;">
                        <a class="SiparisBack" href="/anasayfa">&lt;&lt; Anasayfaya Geri Dön
                        </a>
                        <div class="SiparisTutari" style="">
                            Sipariş Tutarınız = <span class="SiparisTutariLabel">
                                <asp:Literal ID="ltrTutar" runat="server"></asp:Literal> TL</span>
                        </div>
                        
                        
                    </div>
                
        </div>


        
        <div class="BasketCargodetail">

            
            
            <br>



            
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
