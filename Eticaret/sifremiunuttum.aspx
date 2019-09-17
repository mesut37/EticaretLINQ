<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sifremiunuttum.aspx.cs" Inherits="sifremiunuttum" %>

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

        <div id="divIcerik" class="ticiContainer innerContainer">
             
    <div class="centerCount SifremiUnuttumContent iletisimContent col-lg-12 col-md-12 col-xs-12 col-sm-12">
       
         <div class="SifremiUnuttum">
            <span id="mainHolder_lblHata"></span>
            <div class="SifremiUnuttumInput row">
                
                        <div class="col-md-12 col-lg-12 col-xs-12 col-sm-12">
                             <div class="basarili" id="basarili" visible="false" runat="server">
                            Yeni şifreniz e-mail adresinize gönderildi. E-mailinizi kontrol ediniz..
                        </div>
                        <div class="basarisiz" id="basarisiz" visible="false" runat="server">
                            Bir hata meydana geldi. Daha sonra tekrar deneyin..
                        </div>
                        <div class="basarisiz" id="emailyok" visible="false" runat="server">
                            Bu e-mail adresi ile ilgi bir kayıt yok..
                        </div>
                            <div class="line">
                                <p>
                                    Sitemize üye olduysanız ve şifrenizi hatırlamıyorsanız; üyelik formunda kayıtlı olan e-posta adresinizi aşağıdaki alana yazarak "Gönder" butonuna tıklayın.
                                </p>
                                <asp:TextBox ID="txtEmail" placeholder="E-mail Adresiniz.." runat="server" class="textbox"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Style="color:red;float:right;" runat="server" ControlToValidate="txtEmail" ErrorMessage="Boş Geçilemez.."></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Style="color:red;float:right;" runat="server" ControlToValidate="txtEmail" ErrorMessage="Geçersiz E-mail Adresi.." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                <asp:Button ID="btnGonder" OnClick="btnGonder_Click"  class="button" runat="server" Text="Gönder" />
                                
                            </div>
                        </div>
                    
            </div>
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