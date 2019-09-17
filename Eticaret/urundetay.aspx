<%@ Page Language="C#" AutoEventWireup="true" CodeFile="urundetay.aspx.cs" Inherits="urundetay" %>

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

        .urunTukendi {
            background: #000;
            color: #fff;
            padding: 20px;
            font-size: 18px;
        }
    </style>
    <link href="index.html" rel="canonical" />
    <script type="text/javascript" src="/CustomCss/Temp.js"></script>

    <link href="include/SmoothProduct/css/smoothproducts.css" rel="stylesheet" />
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
            <div class="centerCount UrunDetayCenter col-lg-12 col-md-12 col-xs-12 col-sm-12">


                <input type="hidden" name="ctl00$mainHolder$UrunDetay$hddnUrunID" id="hddnUrunID" value="2378">

                <style type="text/css">
                    .urunsecoverlay {
                        position: fixed;
                        background-color: #000;
                        opacity: 0.5;
                        z-index: 99999;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                    }

                    .urunsecbody #divUrunEkSecenek {
                        background-color: #FFF;
                        position: relative;
                        z-index: 1000000;
                        padding: 5px;
                        border-radius: 5px;
                    }

                        .urunsecbody #divUrunEkSecenek .tooltipp {
                            position: absolute;
                            top: -50px;
                            left: 50%;
                            margin-left: -130px;
                            background-color: #ff0000;
                            width: 260px;
                            height: 40px;
                            line-height: 40px;
                            text-align: center;
                            color: #FFF;
                            border-radius: 5px;
                        }

                            .urunsecbody #divUrunEkSecenek .tooltipp i {
                            }
                </style>
                <script type="text/html" id="kampanyaTemplate">
                    <div class="campaignsItem">
                        <div class="campaignsItemS1">

                            <input type="radio" data-template-bind='[{"attribute": "value", "value": "ID"}, {"attribute": "rel", "value": "HedefUrunID"}]' class="kampanyaSecenek" />
                        </div>
                        <div class="campaignsItemS3">
                            <span data-content="Tanim"></span>
                        </div>
                    </div>
                </script>


                <script type="text/html" id="secilemezKampanyaTemplate">
                    <div class="campaignsItem">
                        <div class="campaignsItemS1">
                            <img src="/App_Themes/Default/images/kampanyaUnlem.png" />
                        </div>
                        <div class="campaignsItemS3">
                            <span data-content="Tanim"></span>
                        </div>
                    </div>
                </script>

                <style type="text/css">
                    .eksecenekLine {
                        clear: both;
                        display: block;
                        margin-bottom: 3px;
                    }
                </style>

                <style>
                    .detayEdit {
                        position: fixed;
                        left: 0;
                        z-index: 9999;
                        top: 300px;
                        -webkit-box-shadow: 3px 3px 8px 0px rgba(186,179,186,1);
                        -moz-box-shadow: 3px 3px 8px 0px rgba(186,179,186,1);
                        box-shadow: 3px 3px 8px 0px rgba(186,179,186,1);
                    }

                    .btnEdit {
                        padding: 5px;
                        background-color: #fff;
                        color: #000;
                        display: block;
                        border-radius: 2px;
                        position: relative;
                        cursor: pointer;
                    }

                    .editUl {
                        display: none;
                    }

                        .editUl a {
                            display: block;
                            background-color: #fff;
                            border-radius: 2px;
                            line-height: 34px;
                            padding: 0 80px 0 5px;
                            font-size: 14px;
                            border: 1px solid #e1e1e1;
                            margin: 5px 0 5px 0;
                        }

                            .editUl a:hover {
                                background-color: #f1f1f1;
                            }

                    .btnEdit:hover .editUl {
                        display: block;
                        padding: 5px 0;
                    }

                    .basarili {
                        width: 100%;
                        height: 45px;
                        background: #def0d8;
                        padding: 10px;
                        color: #7a9872;
                        border: 1px solid #ddead8;
                    }

                    .basarisiz {
                        width: 100%;
                        height: 45px;
                        background: #f2dedf;
                        padding: 10px;
                        color: #b17e7b;
                        border: 1px solid #ddead8;
                    }

                    #yorumdiv {
                        width: 100%;
                        height: auto;
                        border-top: 1px solid #B6B6B6;
                        color: #000;
                    }

                    .yorumblok {
                        width: 100%;
                        height: auto;
                        border-top: 1px solid #B6B6B6;
                    }
                </style>

                <div id="divPanelKisayol"></div>

                <div class="ProductDetail row">
                    <div class="basarili" style="background:darkgreen;color:#fff;" id="Div1" visible="false" runat="server">
                            Siparişiniz <b><u>başarıyla</u></b> iletildi.
                        </div>
                    <div class="categoryTitle col-md-12 col-lg-12 col-xs-12 col-sm-12">
                        <div class="proCategoryTitle categoryTitleText">
                            <a href="/">Anasayfa <span>&gt;</span> </a>
                            <a href="#">
                                <asp:Literal ID="ltrUstKategori" runat="server"></asp:Literal></a> &gt; 
                            <a href="#">
                                <asp:Literal ID="ltrAltKategori" runat="server"></asp:Literal></a>
                        </div>
                        <a id="linkOncekiSayfa" class="back hidden-phone" href="javascript:history.back(-1)">&lt; &lt; Önceki Sayfaya Dön</a>
                    </div>
                    <div class="clear"></div>
                    <div id="print_div">
                    </div>
                    <div id="ProductDetailMain" class="ProductDetailMain col-md-12 col-lg-12 col-xs-12 col-sm-12">
                        <div class="ProductDetailMainRow row">
                            <div class="leftImage col-md-5 col-lg-5 col-xs-12 col-sm-5">

                                <div class="sp-loading">
                                    <img src="/include/SmoothProduct/images/sp-loading.gif" /><br>
                                    Yükleniyor
                                </div>
                                <div class="sp-wrap">

                                    <asp:Repeater runat="server" ID="rptCokluUrunler">
                                        <ItemTemplate>
                                            <a href="/Dosyalar/CokluResim/<%#Eval("Resim")%>">
                                                <img src="/Dosyalar/CokluResim/Mini/<%#Eval("Resim")%>"></a>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>



                                <!-- JS ======================================================= -->

                                <script src="/include/SmoothProduct/js/smoothproducts.min.js"></script>
                                <script type="text/javascript">
                                    /* wait for images to load */
                                    $(window).load(function() {
                                        $('.sp-wrap').smoothproducts();
                                    });
	</script>

                            </div>
                            <div class="RightDetail col-md-7 col-lg-7 col-xs-12 col-sm-7">
                                <div class="markaresmi" style="display: none;">
                                    <a id="mainHolder_UrunDetay_linkMarkaResmi" href="/deneme-marka"></a>
                                </div>
                                <div class="ProductName">
                                    <h1>
                                        <span>
                                            <asp:Literal ID="ltrUrunAdi" runat="server"></asp:Literal>
                                        </span>

                                    </h1>
                                </div>
                                <div class="PriceList">
                                    <div class="Formline puanVer">
                                        <div id="PuanVer">
                                            <div id="ctl00_mainHolder_UrunDetay_rrUrunPuan" class="RadRating RadRating_Default">
                                                <ul class="rrtExact">
                                                    <li><a title="1" href="#"><span>1</span></a></li>
                                                    <li><a title="2" href="#"><span>2</span></a></li>
                                                    <li><a title="3" href="#"><span>3</span></a></li>
                                                    <li><a title="4" href="#"><span>4</span></a></li>
                                                    <li><a title="5" href="#"><span>5</span></a></li>
                                                </ul>
                                                <input id="ctl00_mainHolder_UrunDetay_rrUrunPuan_ClientState" name="ctl00_mainHolder_UrunDetay_rrUrunPuan_ClientState" type="hidden" autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="PuanVerSag">
                                        </div>
                                    </div>
                                    <div id="divMarka" class="Formline">
                                        <span class="left_line lineTitle">Marka</span>
                                        <span class="center_line lineTitle">:</span>
                                        <span class="right_line Marka">
                                            <a id="mainHolder_UrunDetay_linkMarkaAdi" href="#"><span>
                                                <asp:Literal ID="ltrMarka" runat="server"></asp:Literal>
                                            </span></a>
                                        </span>
                                    </div>


                                    <div id="divIndirimOrani" runat="server" class="Formline IndirimOraniContent" title="İndirimli Ürün">
                                        <span class="left_line lineTitle">İndirim Oranı</span>
                                        <span class="center_line lineTitle">:</span>
                                        <span class="right_line indirimliOrani">
                                            <asp:Literal ID="ltrIndirim" runat="server"></asp:Literal>
                                        </span>
                                    </div>
                                    <div id="pnlFiyatlar">



                                        <div id="divIndirimliFiyat" runat="server"  visible="false">
                                            <div class="Formline PiyasafiyatiContent" id="alisFiyatGoster" runat="server">
                                                <span class="left_line lineTitle">Fiyat</span>
                                                <span class="center_line lineTitle">:</span>
                                                <span class="right_line" id="fiyat">
                                                    <span class="spanFiyat">
                                                        <asp:Literal ID="ltrAlisFiyati" runat="server"></asp:Literal>
                                                    </span><span class="spanKdv">(KDV Dahil)</span>
                                                </span>
                                            </div>

                                            <div class="Formline IndirimliFiyatContent">
                                                <span class="left_line lineTitle">
                                                    <asp:Literal ID="ltrFiyatAdi" runat="server"></asp:Literal></span>
                                                <span class="center_line lineTitle">:</span>
                                                <meta content="TUR">
                                                <span class="right_line indirimliFiyat" id="indirimliFiyat">
                                                    <span class="spanFiyat">
                                                        <asp:Literal ID="ltrFiyat" runat="server"></asp:Literal>
                                                    </span><span class="spanKdv">(KDV Dahil)</span>
                                                </span>
                                            </div>
                                        </div>




                                    </div>






                                </div>

                                <div class="clear"></div>

                                <div class="clear"></div>
                                <div id="divSatinAl" class="buybutton">
                                    <div class="buyfast">
                                        <input name="ctl00$mainHolder$UrunDetay$btnHemenAl" type="button" id="mainHolder_UrunDetay_btnHemenAl" class="buyfastbutton button" value="Hemen Al" onclick="hemenAl();">
                                    </div>
                                    <div class="BasketBtn">
                                        <div class="Basketinp">
                                        </div>
                                        <%--<div class="basketBtn" runat="server" visible="true" id="sepetGoster">
                                            <div id="divAdetCombo" class="Formline" style="border-bottom: 0;">
                                                <span class="left_line lineTitle2">ADET</span>
                                                <span class="center_line lineTitle2">:</span>
                                                <span class="right_line" id="Span1">
                                                    <asp:DropDownList ID="drpAdet" runat="server" class="selectboxx" Style="min-width: 50px;">
                                                        <asp:ListItem Value="1">1</asp:ListItem>
                                                        <asp:ListItem Value="2">2</asp:ListItem>
                                                        <asp:ListItem Value="3">3</asp:ListItem>
                                                        <asp:ListItem Value="4">4</asp:ListItem>
                                                        <asp:ListItem Value="5">5</asp:ListItem>
                                                        <asp:ListItem Value="6">6</asp:ListItem>
                                                        <asp:ListItem Value="7">7</asp:ListItem>
                                                        <asp:ListItem Value="8">8</asp:ListItem>
                                                        <asp:ListItem Value="9">9</asp:ListItem>
                                                        <asp:ListItem Value="10">10</asp:ListItem>
                                                    </asp:DropDownList>

                                                </span>
                                                 
                                            </div>
                                      
                                        </div>--%>
                                        <div style="clear:both;"></div>
                                         <h3>Sipariş Ver</h3><br />
                                        Ad Soyad:
                                        <asp:TextBox runat="server" Style="background:#ccc;" ID="txtAdSoyad"></asp:TextBox>

                                        Telefon:
                                        <asp:TextBox runat="server" Style="background:#ccc;" ID="txtTelefon"></asp:TextBox>

                                           Email:
                                        <asp:TextBox runat="server" Style="background:#ccc;" ID="txtEmail"></asp:TextBox>

                                          Adet:
                                        <asp:TextBox runat="server" Style="background:#ccc;" ID="txtAdet"></asp:TextBox>
                                           Sipariş Notunuz:
                                        <asp:TextBox runat="server" Style="background:#ccc;" ID="txtNot" TextMode="MultiLine" Height="150"></asp:TextBox>
                                        <asp:Label runat="server" ID="lblMesaj" Visible="false"></asp:Label>
                                        <asp:Button Text="Gönder" OnClick="Unnamed_Click" Style="background:#FC6236;color:#fff;padding:10px;border:none;cursor:pointer;"  runat="server" />
                                        <span runat="server" id="tukendi" class="urunTukendi">Tükendi</span>
                                        <div class="btnPaypal" style="display: none;">
                                        </div>
                                    </div>
                                </div>

                                <div class="clear"></div>
                                <!--Karşılaştırma-->
                            </div>


                            <div class="clear ResetClear"></div>

                            <div class="clear ResetClear"></div>
                            <div class="urunOzellik col-md-12 col-lg-12 col-xs-12 col-sm-12">
                                <div class="urunTab">
                                    <ul>
                                        <li style="cursor: pointer;" class="TabOzellikler active"><a href="javascript:;">Ürün Özellikleri</a></li>
                                        <li class="hidden-phone TabYorumlar" style="cursor: pointer;"><a href="javascript:;">Yorumlar</a></li>
                                        <li class="hidden-phone TabOdemeSecenekleri" style="cursor: pointer;"><a href="javascript:;">Ödeme Seçenekleri</a></li>
                                        <li class="hidden-phone TabUrunOnerileri" style="cursor: pointer;"><a href="javascript:;">Ürün Önerileri</a></li>
                                    </ul>
                                </div>
                                <div class="basarili" id="basarili" visible="false" runat="server">
                                    Yorum <b><u>başarılı.</u></b> Yorumunuz onaylandıktan sonra bu sayfada yer alacaktır..
                                </div>
                                <div class="basarisiz" id="basarisiz" visible="false" runat="server">
                                    Yorum <b><u>başarısız.</u> Daha sonra tekrar deneyin..</b>
                                </div>
                                <div class="urunDetayPanel" style="clear: both;">
                                    <div class="urunTabAlt">
                                        <asp:Literal ID="ltrUrunDetay" runat="server"></asp:Literal>
                                    </div>
                                </div>
                                <div class="urunDetayPanel" style="clear: both; display: none;">
                                    <div class="urunTabAlt">
                                        <div id="yorumYaz" style="display: block; width: 400px; height: auto;">
                                            <div id="mainHolder_UrunDetay_UpdatePanel1">

                                                <asp:Panel runat="server" ID="pnlYorumOf" Visible="false">
                                                    <img style="margin: 0 auto 20px; width: 160px; display: block;" src="/App_Themes/Default/images/YorumAlert.png">
                                                    Yorum yazabilmek için üye girişi yapmalısınız.
                                                    <asp:LinkButton ID="mainHolder_UrunDetay_linkYorumUyeGirisi" Style="font-weight: bold; text-decoration: underline; font-size: 13px;" OnClick="lbkUyeGirisi_Click" runat="server">Üye Girişi</asp:LinkButton>

                                                </asp:Panel>


                                            </div>

                                            <asp:Panel runat="server" ID="pnlYorumOn" Visible="false">


                                                <asp:TextBox ID="txtYorum" placeholder="Yorumunuzu buraya yazın.." Height="200" TextMode="MultiLine" runat="server"></asp:TextBox>
                                                <br />
                                                <asp:Button ID="Button1" Style="margin-left: 10px;" class="newsbutton button" ValidationGroup="bulten" OnClick="Button1_Click" runat="server" Text="Kaydet" />
                                            </asp:Panel>
                                            <br />
                                            <br />
                                            <br />
                                            <h5>Bu Ürüne Ait Yorumlar</h5>
                                            <div id="yorumdiv">
                                                <asp:Repeater runat="server" ID="rptYorumlar">
                                                    <ItemTemplate>
                                                        <div class="yorumblok">
                                                            <strong><%#Eval("Ad")%>   <%#Eval("Soyad")%> </strong>
                                                            <span style="color: #333;">&nbsp;<%#Convert.ToDateTime(Eval("EklenmeTarihi")).ToShortDateString().ToString()%></span>
                                                            <p>
                                                                <%#Eval("Yorum")%>
                                                            </p>

                                                            <div>
                                                            </div>
                                                        </div>
                                                        <br />
                                                    </ItemTemplate>
                                                </asp:Repeater>


                                                <span id="mainHolder_UrunDetay_rfvYorumIsim"></span>
                                                <span id="mainHolder_UrunDetay_rfvYorumMail"></span>
                                                <span id="mainHolder_UrunDetay_rfvYorumMesaj"></span>
                                                <span id="mainHolder_UrunDetay_revYorumMail"></span>
                                                <div id="mainHolder_UrunDetay_vsYorum">
                                                </div>

                                                <asp:Panel runat="server" ID="pnlIlkYorum" Visible="false">
                                                    <span style="color: #1A3468; display: block; font-size: 13px; font-weight: bold; line-height: 18px; text-align: center; width: 100%;">Bu ürün için hiç yorum yapılmamış.İlk yorum yapan siz olun.</span>
                                                </asp:Panel>

                                            </div>
                                        </div>



                                    </div>
                                    <div class="clear"></div>

                                    <div class="clear"></div>

                                    <div class="clear"></div>

                                    <div class="clear"></div>

                                </div>
                                <div class="urunDetayPanel" style="clear: both; display: none;">
                                    <div id="mainHolder_UrunDetay_divOdemeSecenekleriIcerik" class="urunTabAlt">



                                        <div id="divTaksitContainer">
                                            <asp:Literal ID="ltrOdemeSecenekleri" runat="server"></asp:Literal>
                                        </div>
                                    </div>
                                </div>
                                <div class="urunDetayPanel" style="clear: both; display: none;">
                                    <div class="urunTabAlt">
                                        <div id="mainHolder_UrunDetay_UpdatePanel2">

                                            <ul>
                                                <li>
                                                    <p>
                                                        <strong>Bu ürünün açıklamalarında, fiyat veya diğer özelliklerinde bir hata olduğunu düşünüyorsanız aşağıdaki formu doldurarak bize geri dönebilirsiniz.<br>
                                                            <br>
                                                        </strong>
                                                    </p>
                                                </li>

                                                <li>
                                                    <strong class="oneriValidate" style="display: block; height: 30px; position: relative; width: 45%;">E-mail Adresiniz
                                                <span id="mainHolder_UrunDetay_rfvtxtbxMail" class="validate" style="visibility: hidden;">Lütfen E-posta Adresinizi Giriniz.<span class="validateOk"></span></span>
                                                        <span id="mainHolder_UrunDetay_revtxtbxMail" class="validate" style="visibility: hidden;">Lütfen E-posta Adresinizi Kontrol Ediniz.<span class="validateOk"></span></span>
                                                    </strong>
                                                    <input name="ctl00$mainHolder$UrunDetay$txtbxMail" type="text" maxlength="255" id="mainHolder_UrunDetay_txtbxMail" class="textbox" style="width: 324px;">
                                                </li>
                                                <li>
                                                    <strong style="display: block; height: 30px; width: 100%; margin-top: 10px; float: left;">Notlar</strong>
                                                    <textarea name="ctl00$mainHolder$UrunDetay$txtbxNotlar" rows="2" cols="20" id="mainHolder_UrunDetay_txtbxNotlar" class="textarea" style="width: 324px;"></textarea>
                                                </li>

                                                <li>
                                                    <input type="submit" name="ctl00$mainHolder$UrunDetay$btnGonder" value="Gönder" onclick="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$mainHolder$UrunDetay$btnGonder&quot;, &quot;&quot;, true, &quot;OneriGrup&quot;, &quot;&quot;, false, false))" id="mainHolder_UrunDetay_btnGonder" class="button uyeol">
                                                </li>
                                            </ul>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="divBenzerUrun" class="productModule2 col-md-12 col-lg-12 col-xs-12 col-sm-12">
                            <div style="width: 100%; height: auto; text-align: center;">
                                <h4>Benzer Ürünler</h4>
                            </div>
                            <ul class="row">
                                <asp:Repeater runat="server" ID="rptBenzerUrunler">
                                    <ItemTemplate>
                                        <li>
                                            <div class="productModuleItem2">
                                                <div class="moduleimage2">
                                                    <a href="/urundetay/<%#Eval("ID")%>/<%#Tools.UrlSeo(Eval("UrunAdi").ToString().ToLower()) %>">
                                                        <img class="lazy" src="/Dosyalar/Urun/Mini/<%#Eval("Resim")%>" data-original="/Dosyalar/Urun/Mini/<%#Eval("Resim")%>" alt="<%#Eval("UrunAdi")%>" style="display: inline-block;">
                                                    </a>
                                                </div>
                                                <div class="modulename2"><%#Eval("UrunAdi")%></div>
                                                <div class="moduleprice2">

                                                    <div class="modulediscount" id="fiyat" runat="server" visible="false">
                                                        <span><%#kdvDahil(Convert.ToDecimal(Eval("IndirimliFiyat")),Convert.ToInt32(Eval("Kdv")))%>
                                                        </span>
                                                        <span class="modulekdv">KDV Dahil
                                                        </span>
                                                    </div>

                                                </div>
                                            </div>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>

                        <img id="mainHolder_UrunDetay_imgCookie" src="/Handlers/SetUrunDetayCookie.ashx?UrunKartiID=2337&amp;KategoriID=3" style="height: 1px; width: 1px;">


                        <div class="urunsecoverlay" style="display: none;"></div>
                        <div id="sonuc" style="display: none;"></div>

                        <div id="divKombin" style="display: none;">
                        </div>

                        <div id="divKendinTasarla" style="display: none;">
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
