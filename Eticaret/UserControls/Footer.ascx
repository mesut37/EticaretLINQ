<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Footer.ascx.cs" Inherits="UserControls_Footer" %>
<div id="footer" class="homeFooter">
    <div class="footerTop">
        <div class="newaslater">
            <label>E-Bültenimize Kayıt Olun</label>
            <div id="UpdatePanel1">
                <asp:TextBox ID="txtEbulten" placeholder="E-Mail Adresinizi Yazın" ValidationGroup="bulten" runat="server" class="newstext textbox"></asp:TextBox>

                <asp:Button ID="Button1" class="newsbutton button" ValidationGroup="bulten" OnClick="Button1_Click" runat="server" Text="Kaydet" />


            </div>
            <br />
            <br />
            <asp:Label ID="lblMesaj" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="footerCenter">

        <div class="ticiContainer">
            <div class="col-lg-6">
                <div class="footerSosyal">
                    <p>BİZİ TAKİP EDİN</p>
                    <a href="#">
                        <img src="/Uploads/EditorUploads/facebook.jpg" class="img-responsive" style="">
                    </a>
                    <a href="#">
                        <img src="/Uploads/EditorUploads/twitter.jpg" class="img-responsive" style="">
                    </a>
                    <a href="#">
                        <img src="/Uploads/EditorUploads/google.jpg" class="img-responsive" style="">
                    </a>
                    <a href="#">
                        <img src="/Uploads/EditorUploads/instagram.jpg" class="img-responsive" style="">
                    </a>
                    <a href="#">
                        <img src="/Uploads/EditorUploads/youtube.jpg" class="img-responsive" style="">
                    </a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="footerEmail">
                </div>
            </div>
        </div>

        <footer id="footer-area">
            <!-- Footer Links Starts -->
            <div class="footer-links">
                <!-- ticiContainer Starts -->
                <div class="ticiContainer">
                    <div class="col-md-3 col-sm-6">
                        <h5>Sayfalar</h5>
                        <ul>
                            <li><a href="/anasayfa">Anasayfa</a></li>
                            <asp:Repeater runat="server" ID="rptSayfalar">
                                <ItemTemplate>
                                    <li><a href="/Sayfa/<%#Eval("ID")%>/<%#Tools.UrlSeo(Eval("Baslik").ToString().ToLower()) %>"><%#Eval("Baslik")%></a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                            <li><a href="/iletisim">İletişim</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <h5>Ürünler</h5>
                        <ul>
                            <li><a href="/yeniurunler">Yeni Ürünler</a></li>
                            <li><a href="/firsaturunler">Fırsat Ürünleri</a></li>

                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <h5>Kategoriler</h5>
                        <ul>

                            <asp:Repeater runat="server" ID="rptKategoriler">
                                <ItemTemplate>
                                    <li><a href="/kategori/<%#Eval("ID")%>/<%#Tools.UrlSeo(Eval("KategoriAdi").ToString().ToLower()) %>"><%#Eval("KategoriAdi")%></a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <h5>İletişim</h5>
                        <ul>
                            <li>Adres :
                                <asp:Literal ID="ltrAdres" runat="server"></asp:Literal></li>
                            <li>Telefon :
                                <asp:Literal ID="ltrTelefon" runat="server"></asp:Literal></li>
                            <li>Fax :
                                <asp:Literal ID="ltrFax" runat="server"></asp:Literal></li>
                            <li>E-Mail :
                                <asp:Literal ID="ltrEmail" runat="server"></asp:Literal></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="copyright">
                <div class="ticiContainer">
                    <ul class="pull-left list-inline">
                        <li>
                            <img src="/Uploads/EditorUploads/world.jpg" alt="PaymentGateway">
                        </li>
                        <li>
                            <img src="/Uploads/EditorUploads/maximum.jpg" alt="PaymentGateway">
                        </li>
                        <li>
                            <img src="/Uploads/EditorUploads/bonus.jpg" alt="PaymentGateway">
                        </li>
                        <li>
                            <img src="/Uploads/EditorUploads/axess.jpg" alt="PaymentGateway">
                        </li>
                        <li>
                            <img src="/Uploads/EditorUploads/cardfinans.jpg" alt="PaymentGateway">
                        </li>
                        <li>
                            <img src="/Uploads/EditorUploads/advange.jpg" alt="PaymentGateway">
                        </li>
                    </ul>
                    <ul class="pull-right list-inline">
                        <li>
                            <img src="/Uploads/EditorUploads/paypal.jpg" alt="PaymentGateway">
                        </li>
                    </ul>
                </div>
            </div>
        </footer>

    </div>
</div>
<div align="center">
    <p class="ticimax_link_main" style="color: #000; margin: 15px 0;">
        2015 Eticaret Sitemleri
    </p>
</div>
