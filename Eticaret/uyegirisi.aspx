<%@ Page Language="C#" AutoEventWireup="true" CodeFile="uyegirisi.aspx.cs" Inherits="uyegirisi" %>

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
    <link href="index.html" rel="canonical" />
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

            <div class="centerCount UyeGirisiContent">
                <div id="mainHolder_Panel1" onkeypress="javascript:return WebForm_FireDefaultButton(event, 'mainHolder_btnGiris')">

                    <div class="newuserForm row">
                         <div class="basarili" id="basarili" visible="false" runat="server">
                                        Giriş <b><u>başarılı</u></b> Yönlendiriliyorsunuz..
                                    </div>
                        <div class="basarisiz" id="basarisiz" visible="false" runat="server">
                                        Giriş <b><u>başarısız</u></b>
                                    </div>
                        
                        <div class=" col-md-6 col-lg-6 col-xs-12 col-sm-12">
                            <div class="grid Login LoginSol">
                                <h4 class="LoginSol_h4">Üye Girişi</h4>
                                <div class="gridLeft">
                                    <label>E-mail Adresiniz *</label>
                                    <asp:TextBox ID="txtEmail" ValidationGroup="giris" runat="server" class="textbox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Style="color:red;float:right;" ControlToValidate="txtEmail" runat="server" ErrorMessage="Boş Geçilemez.."></asp:RequiredFieldValidator>
                                </div>
                                <div class="gridLeft">
                                    <label>Şifre *</label>
                                   <asp:TextBox ID="txtSifre" ValidationGroup="giris" TextMode="Password" runat="server" class="textbox"></asp:TextBox>
                                      <a href="/sifremiunuttum" style="text-decoration:underline;float:right;" class="forgetpasword">Şifremi unuttum</a>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Style="color:red;float:right;" ControlToValidate="txtSifre" runat="server" ErrorMessage="Boş Geçilemez.."></asp:RequiredFieldValidator>
                               
                                     </div>
                                
                                <div>
                                    <span style="color: #f00;">
                                        <span id="mainHolder_lblHata"></span></span>
                                    <asp:Button ID="btnGiris" OnClick="btnGiris_Click" ValidationGroup="giris"  runat="server" Text="Giriş" class="button userloginButton" />
                                    
                                </div>

                            </div>
                        </div>
                        <div class=" col-md-6 col-lg-6 col-xs-12 col-sm-12">
                            <div class="grid Login LoginSag">
                                <h4 class="LoginSag_h4">ÜYE OL</h4>
                                <asp:LinkButton ID="lnkUyeliksiz" ValidationGroup="noname" OnClick="lnkUyeliksiz_Click" class="uyeliksiz baglanButton" runat="server">Üyeliksiz Devam Et</asp:LinkButton>
                               

                                <a href="/uyeol" class="hizliuyelik baglanButton">Üye Ol</a>

                                <span id="mainHolder_SocialLogin_lblHata"></span>

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
