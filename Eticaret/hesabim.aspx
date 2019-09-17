<%@ Page Language="C#" AutoEventWireup="true" CodeFile="hesabim.aspx.cs" Inherits="hesabim" %>

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

    <title>Eticaret</title>

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
        <div>
            <uc1:UserMenu runat="server" ID="UserMenu" />
        
        </div>
    </div>
    <div class="centerCount UyelikBilgilerimContent col-md-9 col-lg-9 col-xs-12 col-sm-12">
        <div class="categoryTitle">
            <div class="categoryTitleText">
                <h1>Üyelik Bilgilerim</h1>
            </div>
        </div>
        <div class="uyelikBilgilerimRow row">
            <div class="uyelikBilgilerimSpan col-md-6 col-lg-6 col-xs-12 col-sm-12">
                <div class="span">
                    <label>
                        Adınız
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Style="float: right; color: red;" ControlToValidate="txtAd" runat="server" ErrorMessage="Boş Geçilemez.."></asp:RequiredFieldValidator>

                    </label>
                    <asp:TextBox ID="txtAd" runat="server" class="textbox"></asp:TextBox>
                    
                </div>
                <div class="span">
                    <label>
                        Soyadınız
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Style="float: right; color: red;" ControlToValidate="txtSoyad" runat="server" ErrorMessage="Boş Geçilemez.."></asp:RequiredFieldValidator>

                    </label>
                    <asp:TextBox ID="txtSoyad" runat="server" class="textbox"></asp:TextBox>
                     
                </div>
                <div class="span">
                    <label>Telefonunuz
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Style="float: right; color: red;" ControlToValidate="txtTel" runat="server" ErrorMessage="Boş Geçilemez.."></asp:RequiredFieldValidator>

                    </label>
                    <asp:TextBox ID="txtTel" runat="server" class="textbox"></asp:TextBox>
                </div>
                <div class="span">
                    <label>
                        E-mail Adresiniz
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Style="float: right; color: red;" ControlToValidate="txtEmail" runat="server" ErrorMessage="Boş Geçilemez.."></asp:RequiredFieldValidator>

                    </label>
                    <asp:TextBox ID="txtEmail" runat="server" class="textbox"></asp:TextBox>
                </div>
                <div class="span">
                    <label>
                        Şifre
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Style="float: right; color: red;" ControlToValidate="txtSifre" runat="server" ErrorMessage="Boş Geçilemez.."></asp:RequiredFieldValidator>

                    </label>
                    <asp:TextBox ID="txtSifre" TextMode="Password" runat="server" class="textbox"></asp:TextBox>
                    <div class="spanPass">
                
                     </div>
                </div>
            </div>
            <div class="uyelikBilgilerimSpan right col-md-6 col-lg-6 col-xs-12 col-sm-12">
                
                
                <div class="gridLeft gender">
                                <label>Cinsiyet</label>
                                <table id="mainHolder_rblCinsiyet">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="rdErkek" Checked="true" GroupName="cinsiyet" runat="server" /><label for="mainHolder_rblCinsiyet_1">Erkek</label></td>
                                            <td>
                                                <asp:RadioButton ID="rdKadin" runat="server" GroupName="cinsiyet" /><label for="mainHolder_rblCinsiyet_1">Kadın</label></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <span id="mainHolder_rfvCinsiyet" class="validateSol" style="visibility: hidden;">Lütfen Cinsiyet Seçiniz.<span class="validateSolOk"></span></span>
                            </div>
                <div class="clear"></div>
                <style type="text/css">
                    .kampanyaCheck input
                    {
                        width:auto;
                    }
                </style>
                <div class="span kampanyaCheck">
                    <asp:CheckBox ID="chkKampanya" runat="server" />
                   Kampanyalardan e-posta ile haberdar olmak istiyorum
                </div>
                <asp:Button ID="btnKaydet" runat="server" Text="Kaydet" OnClick="btnKaydet_Click" class="button uyeBilgilerim" />
                
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
