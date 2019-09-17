<%@ Page Language="C#" AutoEventWireup="true" CodeFile="uyeol.aspx.cs" Inherits="uyeol" %>

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

            <script type="text/javascript">
                function ValidateCheckBox(sender, args) {
                    if (document.getElementById("mainHolder_chkSozlesme").checked == true) {
                        args.IsValid = true;
                    } else {
                        args.IsValid = false;
                    }
                }
            </script>
            <div class="centerCount UyeolContent">
                <div class="userLogin">

                    <div class="newuserForm">
                        <div class="basarili" id="basarili" visible="false" runat="server">
                            Üyelik kaydınız <b><u>başarıyla</u></b> oluşturuldu. Şimdi giriş yapın..
                        </div>
                        <div class="basarisiz" id="basarisiz" visible="false" runat="server">
                            Üyelik kaydı sırasında bir <b><u>hata</u></b> meydana geldi..
                        </div>
                        <div class="basarisiz" id="emailvar" visible="false" runat="server">
                            Bu email adresi zaten kayıtlı..
                        </div>
                        <div class="FormTitle">
                            Yeni Üyelik
                            <br>

                            <p>
                            </p>
                        </div>
                        <div class="grid uyeOlGrid_Sol col-md-6 col-lg-6 col-xs-12 col-sm-12">
                            <div class="gridLeft">
                                <label>Adınız *</label>
                                <asp:TextBox ID="txtAd" class="textbox" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Style="float: right; color: red;" ControlToValidate="txtAd" runat="server" ErrorMessage="Boş Geçilemez.."></asp:RequiredFieldValidator>

                            </div>
                            <div class="gridLeft">
                                <label>Soyadınız *</label>
                                <asp:TextBox ID="txtSoyad" class="textbox" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Style="float: right; color: red;" ControlToValidate="txtSoyad" runat="server" ErrorMessage="Boş Geçilemez.."></asp:RequiredFieldValidator>
                            </div>
                            <div class="gridLeft">
                                <label>Telefon *</label>
                                <asp:TextBox ID="txtTelefon" class="textbox" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Style="float: right; color: red;" ControlToValidate="txtTelefon" runat="server" ErrorMessage="Boş Geçilemez.."></asp:RequiredFieldValidator>

                            </div>

                            <div class="gridLeft gender">
                                <label>Cinsiyet *</label>
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
                            <br />
                            <div class="gridLeft">
                                <label>Adresiniz </label>
                                <asp:TextBox ID="txtAdres" TextMode="MultiLine" Height="200" class="textbox" runat="server"></asp:TextBox>

                            </div>
                        </div>
                        <div class="grid bordernone uyeOlGrid_Sag col-md-6 col-lg-6 col-xs-12 col-sm-12">

                            <div class="gridLeft">
                                <label>İl</label>
                                <asp:DropDownList ID="drpIl" runat="server">
                                    <asp:ListItem Value="01">Adana</asp:ListItem>
                                    <asp:ListItem Value="02">Adıyaman</asp:ListItem>
                                    <asp:ListItem Value="03">Afyonkarahisar</asp:ListItem>
                                    <asp:ListItem Value="04">Ağrı</asp:ListItem>
                                    <asp:ListItem Value="05">Amasya</asp:ListItem>
                                    <asp:ListItem Value="06">Ankara</asp:ListItem>
                                    <asp:ListItem Value="07">Antalya</asp:ListItem>
                                    <asp:ListItem Value="08">Artvin</asp:ListItem>
                                    <asp:ListItem Value="09">Aydın</asp:ListItem>
                                    <asp:ListItem Value="10">Balıkesir</asp:ListItem>
                                    <asp:ListItem Value="11">Bilecik</asp:ListItem>
                                    <asp:ListItem Value="12">Bingöl</asp:ListItem>
                                    <asp:ListItem Value="13">Bitlis</asp:ListItem>
                                    <asp:ListItem Value="14">Bolu</asp:ListItem>
                                    <asp:ListItem Value="15">Burdur</asp:ListItem>
                                    <asp:ListItem Value="16">Bursa</asp:ListItem>
                                    <asp:ListItem Value="17">Çanakkale</asp:ListItem>
                                    <asp:ListItem Value="18">Çankırı</asp:ListItem>
                                    <asp:ListItem Value="19">Çorum</asp:ListItem>
                                    <asp:ListItem Value="20">Denizli</asp:ListItem>
                                    <asp:ListItem Value="21">Diyarbakır</asp:ListItem>
                                    <asp:ListItem Value="22">Edirne</asp:ListItem>
                                    <asp:ListItem Value="23">Elazığ</asp:ListItem>
                                    <asp:ListItem Value="24">Erzincan</asp:ListItem>
                                    <asp:ListItem Value="25">Erzurum</asp:ListItem>
                                    <asp:ListItem Value="26">Eskişehir</asp:ListItem>
                                    <asp:ListItem Value="27">Gaziantep</asp:ListItem>
                                    <asp:ListItem Value="28">Giresun</asp:ListItem>
                                    <asp:ListItem Value="29">Gümüşhane</asp:ListItem>
                                    <asp:ListItem Value="30">Hakkari</asp:ListItem>
                                    <asp:ListItem Value="31">Hatay</asp:ListItem>
                                    <asp:ListItem Value="32">Isparta</asp:ListItem>
                                    <asp:ListItem Value="33">Mersin</asp:ListItem>
                                    <asp:ListItem Value="34">İstanbul</asp:ListItem>
                                    <asp:ListItem Value="35">İzmir</asp:ListItem>
                                    <asp:ListItem Value="36">Kars</asp:ListItem>
                                    <asp:ListItem Value="37">Kastamonu</asp:ListItem>
                                    <asp:ListItem Value="38">Kayseri</asp:ListItem>
                                    <asp:ListItem Value="39">Kırklareli</asp:ListItem>
                                    <asp:ListItem Value="40">Kırşehir</asp:ListItem>
                                    <asp:ListItem Value="41">Kocaeli</asp:ListItem>
                                    <asp:ListItem Value="42">Konya</asp:ListItem>
                                    <asp:ListItem Value="43">Kütahya</asp:ListItem>
                                    <asp:ListItem Value="44">Malatya</asp:ListItem>
                                    <asp:ListItem Value="45">Manisa</asp:ListItem>
                                    <asp:ListItem Value="46">Kahramanmaraş</asp:ListItem>
                                    <asp:ListItem Value="47">Mardin</asp:ListItem>
                                    <asp:ListItem Value="48">Muğla</asp:ListItem>
                                    <asp:ListItem Value="49">Muş</asp:ListItem>
                                    <asp:ListItem Value="50">Nevşehir</asp:ListItem>
                                    <asp:ListItem Value="51">Niğde</asp:ListItem>
                                    <asp:ListItem Value="52">Ordu</asp:ListItem>
                                    <asp:ListItem Value="53">Rize</asp:ListItem>
                                    <asp:ListItem Value="54">Sakarya</asp:ListItem>
                                    <asp:ListItem Value="55">Samsun</asp:ListItem>
                                    <asp:ListItem Value="56">Siirt</asp:ListItem>
                                    <asp:ListItem Value="57">Sinop</asp:ListItem>
                                    <asp:ListItem Value="58">Sivas</asp:ListItem>
                                    <asp:ListItem Value="59">Tekirdağ</asp:ListItem>
                                    <asp:ListItem Value="60">Tokat</asp:ListItem>
                                    <asp:ListItem Value="61">Trabzon</asp:ListItem>
                                    <asp:ListItem Value="62">Tunceli</asp:ListItem>
                                    <asp:ListItem Value="63">Şanlıurfa</asp:ListItem>
                                    <asp:ListItem Value="64">Uşak</asp:ListItem>
                                    <asp:ListItem Value="65">Van</asp:ListItem>
                                    <asp:ListItem Value="66">Yozgat</asp:ListItem>
                                    <asp:ListItem Value="67">Zonguldak</asp:ListItem>
                                    <asp:ListItem Value="68">Aksaray</asp:ListItem>
                                    <asp:ListItem Value="69">Bayburt</asp:ListItem>
                                    <asp:ListItem Value="70">Karaman</asp:ListItem>
                                    <asp:ListItem Value="71">Kırıkkale</asp:ListItem>
                                    <asp:ListItem Value="72">Batman</asp:ListItem>
                                    <asp:ListItem Value="73">Şırnak</asp:ListItem>
                                    <asp:ListItem Value="74">Bartın</asp:ListItem>
                                    <asp:ListItem Value="75">Ardahan</asp:ListItem>
                                    <asp:ListItem Value="76">Iğdır</asp:ListItem>
                                    <asp:ListItem Value="77">Yalova</asp:ListItem>
                                    <asp:ListItem Value="78">Karabük</asp:ListItem>
                                    <asp:ListItem Value="79">Kilis</asp:ListItem>
                                    <asp:ListItem Value="80">Osmaniye</asp:ListItem>
                                    <asp:ListItem Value="81">Düzce</asp:ListItem>
                                </asp:DropDownList>

                                </asp:DropDownList>


                            </div>
                            <div class="gridLeft">
                                <label>İlçe</label>
                                <asp:TextBox ID="txtIlce" class="textbox" runat="server"></asp:TextBox>


                            </div>
                            <div class="gridLeft">
                                <label>E-mail*</label>
                                <asp:TextBox ID="txtEmail" class="textbox" runat="server"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Style="float: right; color: red;" ControlToValidate="txtEmail" runat="server" ErrorMessage="Boş Geçilemez.."></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Style="float: right; color: red;" ControlToValidate="txtEmail" ErrorMessage="Email Geçersiz.." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </div>
                            <div class="gridLeft">
                                <label>Şifre *</label>
                                <asp:TextBox ID="txtSifre" TextMode="Password" class="textbox" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Style="float: right; color: red;" ControlToValidate="txtSifre" runat="server" ErrorMessage="Boş Geçilemez.."></asp:RequiredFieldValidator>
                            </div>
                            <div class="gridLeft">
                                <label>Şifre Tekrar*</label>
                                <asp:TextBox ID="txtSifreTekrar" TextMode="Password" class="textbox" runat="server"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Style="float: right; color: red;" ControlToValidate="txtSifreTekrar" runat="server" ErrorMessage="Boş Geçilemez.."></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtSifreTekrar" ControlToCompare="txtSifre" Style="float: right; color: red;" ErrorMessage="Şifreler Uyuşmuyor.."></asp:CompareValidator>
                            </div>
                            <div class="gridLeft listAdd">
                                <label>
                                    <asp:CheckBox ID="chkKampanya" runat="server" />

                                    Kampanyalardan e-posta ile haberdar olmak istiyorum
                                </label>
                            </div>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                            <div>

                                <asp:Button ID="btnGonder" OnClick="btnGonder_Click" runat="server" Text="Kayıt Ol" class="button uyeol" />

                            </div>
                            <br />







                        </div>
                    </div>
                    <div id="divSozlesme" style="display: none;">
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
