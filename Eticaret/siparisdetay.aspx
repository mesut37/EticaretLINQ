<%@ Page Language="C#" AutoEventWireup="true" CodeFile="siparisdetay.aspx.cs" Inherits="siparisdetay" %>

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
            <div class="centerCount UyelikBilgilerimContent col-md-9 col-lg-9 col-xs-12 col-sm-12" runat="server" id="siparisDiv">
                <div class="categoryTitle">
                    <div class="categoryTitleText">
                        <h1>Sipariş Detayı</h1>
                    </div>
                </div>
               <h5> Teslimat Bilgileri</h5>
                <br />
                <ul>
                    <li>
                       Ad Soyad : <b><asp:Literal ID="ltrAdSoyad" runat="server"></asp:Literal></b>
                      
                    </li>
                    <li>
                          Telefon :  <b><asp:Literal ID="ltrTelefon" runat="server"></asp:Literal></b>
                    </li>
                    <li>
                        Şehir :  <b><asp:Literal ID="ltrSehir" runat="server"></asp:Literal></b>
                    </li>
                      <li>
                        İlçe :  <b><asp:Literal ID="ltrIlce" runat="server"></asp:Literal></b>
                    </li>
                     <li>
                        Adres :  <b><asp:Literal ID="ltrAdres" runat="server"></asp:Literal></b>
                    </li>
                     <li>
                        Posta Kodu : <b> <asp:Literal ID="ltrPostaKodu" runat="server"></asp:Literal></b>
                    </li>
                      <li>
                        Kullanıcı Tipi : <b> <asp:Literal ID="ltrTip" runat="server"></asp:Literal></b>
                    </li>
                     <li>
                        Fatura İsim : <b> <asp:Literal ID="ltrFaturaIsim" runat="server"></asp:Literal></b>
                    </li>
                  
                </ul><br />
                   <h5> Sipariş Bilgileri</h5>
                <br />
                <ul>
                     <li>
                        Sipariş Tarihi : <b> <asp:Literal ID="ltrEklenmeTarihi" runat="server"></asp:Literal></b>
                    </li>
                    <li>
                        Onaylanma :  <b><asp:Literal ID="ltrOnay" runat="server"></asp:Literal></b>
                    </li>
                     <li>
                        Sipariş Durumu : <b> <asp:Literal ID="ltrDurum" runat="server"></asp:Literal></b>
                    </li>
                      <li>
                        Kargo Firması : <b> <asp:Literal ID="ltrKargo" runat="server"></asp:Literal></b>
                    </li>
                      <li>
                        Ödeme Şekli : <b> <asp:Literal ID="ltrOdemeSekli" runat="server"></asp:Literal></b>
                    </li>
                      <li>
                        Tutar :  <b><asp:Literal ID="ltrTutar" runat="server"></asp:Literal></b>
                    </li>
                     <li runat="server" id="bankaHesap">
                        Banka Hesap :  <b><asp:Literal ID="ltrBankaHesap" runat="server"></asp:Literal></b>
                    </li>
                </ul>
                <br />
                   <h5> Ürün Bilgileri</h5>
                <br />
               <div class="table-responsive">
                                <table  style="width:100%;" id="datatable-column-interactive" class="table table-sorting table-hover table-bordered colored-header datatable">
                                    <thead>
                                        <tr>
                                            <th>Ürün Resmi</th>
                                            <th>Ürün Adı</th>
                                            <th>Fiyat</th>
                                            <th>Adet</th>
                                            <th>KDV</th>
                                            <th>Ürün Kategorisi</th>
                                          
                                       
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <asp:Repeater runat="server" ID="rptUrunler">
                                            <ItemTemplate>
                                                <tr>
                                                    <td style="text-align:center;">
                                                        <img src="../Dosyalar/Urun/Mini/<%#Eval("Resim")%>" width="80" /></td>
                                                    <td style=" text-align: center;"><strong><%#Eval("UrunAdi")%></strong></td>
                                                    <td  style="text-align:center;"><%#toplamTutarGetir(Convert.ToDecimal(Eval("IndirimliFiyat")),Convert.ToInt32(Eval("Kdv")))%></td> 
                                                    <td  style="text-align:center;"><%#Eval("Adet")%></td>
                                                    <td  style="text-align:center;">% <%#Eval("Kdv")%></td>
                                                    
                                                    <td  style="text-align:center;"><%# kategoriGetir(Convert.ToInt32(Eval("KatID")))%></td>
                                                  
                                                  
                                                    
                                                   
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                    </tbody>
                                </table>
                            </div>
                <br />
                <div runat="server" id="havaleBildirimDiv">
                  <a href="<%=havaleFormuLink %>" style="font-size:14px;">  Havale Bildirim Formu Sayfasına git <img src="/CustomCss/images/havale.png" width="15" /></a>
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
