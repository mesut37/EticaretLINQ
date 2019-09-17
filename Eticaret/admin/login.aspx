<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="admin_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yönetim Paneli Giriş</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Yönetim Paneli">
    <meta name="keywords" content="Yönetim Paneli">

    <!-- CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="assets/css/ionicons.css" rel="stylesheet" type="text/css">
    <link href="assets/css/main.min.css" rel="stylesheet" type="text/css">

    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,300,400,700' rel='stylesheet' type='text/css'>

    <!-- Fav and touch icons -->
</head>
<body class="middle-content page-login-social">
    <div class="container-fluid">
        <div class="content-box-bordered login-box box-with-help">
            <h1>Yönetim Paneli</h1>
            <form class="form-horizontal" runat="server" role="form">
                <div class="form-group">
                    <label for="inputEmail3b" class="control-label sr-only">Email</label>
                    <div class="col-sm-12">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icon ion-email"></i></span>
                            <asp:TextBox ID="txtKullaniciAdi" class="form-control" runat="server"  placeholder="Kullanıcı Adı"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3b" class="control-label sr-only">Password</label>
                    <div class="col-sm-12">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icon ion-locked"></i></span>
                           <asp:TextBox ID="txtSifre" class="form-control" TextMode="Password" runat="server"  placeholder="Şifre"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12">
                        <label class="fancy-checkbox">
                            <input type="checkbox">
                            <span>Beni Hatırla</span>
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-7">
                           <div id="formsubmitbutton">
                         <asp:Button ID="Button1" class="btn btn-success btn-block" OnClientClick="ButtonClicked()" runat="server" Text="Giriş" OnClick="Button1_Click" />
                    </div>
                    <div id="buttonreplacement" style="margin-left: 30px; display: none;">
                        <img src="images/preload.gif" alt="loading...">
                    </div>

                    <script type="text/javascript">

                        function ButtonClicked() {
                            document.getElementById("formsubmitbutton").style.display = "none";
                            document.getElementById("buttonreplacement").style.display = "";
                            return true;
                        }
                        var FirstLoading = true;
                        function RestoreSubmitButton() {
                            if (FirstLoading) {
                                FirstLoading = false;
                                return;
                            }
                            document.getElementById("formsubmitbutton").style.display = "";
                            document.getElementById("buttonreplacement").style.display = "none";
                        }

                        document.onfocus = RestoreSubmitButton;
                    </script>
                       
                    </div>
                </div>
                   <asp:Panel runat="server" ID="pnlBasarili" Visible="false">
            <div class="alert alert-success fade in">
                <i class="icon ion-checkmark-circled"></i>
                <strong>Başarılı</strong> Giriş başarılı yönlendiriliyorsunuz..
            </div>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlHata" Visible="false">
            <div class="alert alert-danger fade in">
                <i class="icon ion-close-circled"></i>
                <strong>Hata!</strong> Kullanıcı adı veya şifre hatalı
            </div>
        </asp:Panel>
            </form>
        </div>
    </div>
    <div style="width:100%;height:250px;border: 1px solid #E2E2E2;margin-top:50px;text-align:center;padding-top:10px;">
        
        <h3>
           Eska Yazılım E-ticaret Sistemleri
        </h3>
        <h5>
            © Copyright 2015 Tüm hakları saklıdır.
        </h5>
        <h5>
       <b> Telefon</b> : 0850 220 63 74
        </h5>
         <h5>
         <b> E-mail </b>: info@eskayazilim.com
        </h5>
    </div>
    <!-- Javascript -->
    <script src="assets/js/jquery/jquery-2.1.0.min.js"></script>
    <script src="assets/js/bootstrap/bootstrap.js"></script>
    <script src="assets/js/queen-form-layouts.min.js"></script>
</body>
</html>
