be<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucMenu.ascx.cs" Inherits="Uc_ucMenu" %>
<%@ Register Src="~/admin/Uc/ucHeader.ascx" TagPrefix="uc1" TagName="ucHeader" %>


<nav id="main-nav" class="main-nav">
    <ul class="main-menu">
        <li class="has-submenu activ" id="anasayfa" runat="server" style="background: #1D92AF; margin-top: 5px;">
            <a href="default.aspx" style="color: #fff;"><span class="text">Ana Sayfa</span></a>
        </li>
        <li class="has-submenu" id="icerik" runat="server">
            <a href="#" class="submenu-toggle"><i class="icon ion-android-note"></i><span class="text">İçerik Yönetimi</span></a>
            <ul class="list-unstyled sub-menu collapse">
                <li>
                    <a href="sayfalar.aspx"><span class="text">Tüm Sayfalar</span></a>
                </li>
                <li>
                    <a href="sayfaekle.aspx"><span class="text">Sayfa Ekle</span></a>
                </li>
            </ul>
        </li>
        
        <li class="has-submenu" id="urun" runat="server">
            <a href="#" class="submenu-toggle"><i class="icon ion-android-mixer"></i><span class="text">Ürün Grupları</span></a>
            <ul class="list-unstyled sub-menu collapse">
                <li>
                    <a href="kategoriler.aspx"><span class="text">Kategoriler</span></a>
                </li>
                <li>
                    <a href="kategoriekle.aspx"><span class="text">Kategori Ekle</span></a>
                </li>
                <li>
                    <a href="urunler.aspx"><span class="text">Ürünler</span></a>
                </li>
                <li>
                    <a href="urunekle.aspx"><span class="text">Ürün Ekle</span></a>
                </li>
                <li>
                    <a href="markalar.aspx"><span class="text">Markalar</span></a>
                </li>
                <li>
                    <a href="markaekle.aspx"><span class="text">Marka Ekle</span></a>
                </li>
            </ul>
        </li>
        <li class="has-submenu">
            <a href="#" class="submenu-toggle"><i class="icon ion-ios7-copy"></i><span class="text">Siparişler</span></a>
            <ul class="list-unstyled sub-menu collapse">
                <li>
                    <a href="siparisler.aspx">
                        <span class="text">Tüm Siparişler</span>
                    </a>
                </li>
                <li>
                    <a href="bekleyensiparisler.aspx">
                        <span class="text">Bekleyen Siparişler</span>
                    </a>
                </li>
                <li>
                    <a href="onaylanansiparisler.aspx">
                        <span class="text">Onaylanan Siparişler</span>
                    </a>
                </li>
             
            </ul>
        </li>
    </ul>

    <ul class="main-menu">
        <li class="has-submenu">
            <a href="#" class="submenu-toggle"><i class="icon ion-ios7-pie"></i><span class="text">Üye Yönetimi</span></a>
            <ul class="list-unstyled sub-menu collapse">
                <li>
                    <a href="uyeler.aspx">
                        <span class="text">Tüm Üyeler</span>
                    </a>
                </li>
                <li>
                    <a href="onaysizuyeler.aspx">
                        <span class="text">Onaysız Üyeler</span>
                    </a>
                </li>
                <li>
                    <a href="onayliuyeler.aspx">
                        <span class="text">Onaylı Üyeler</span>
                    </a>
                </li>
            </ul>
        </li>
        <li class="has-submenu" style="border-bottom: 1px solid #dbdbdb;">
            <a href="#" class="submenu-toggle"><i class="icon ion-android-storage"></i><span class="text">Ayarlar</span></a>
            <ul class="list-unstyled sub-menu collapse">
                <li>
                    <a href="ayarlar.aspx">
                        <span class="text">Genel Ayarlar</span>
                    </a>
                </li>
                <li>
                    <a href="slider.aspx">
                        <span class="text">Slider Ayarları</span>
                    </a>
                </li>
                <li>
                    <a href="seo.aspx">
                        <span class="text">Seo Ayarları</span>
                    </a>
                </li>
                   <li>
                    <a href="urunyorumlari.aspx">
                        <span class="text">Ürün Yorumları</span>
                    </a>
                </li>
                <li>
                    <a href="ebulten.aspx">
                        <span class="text">E-Bülten Kayıtları</span>
                    </a>
                </li>
                 <li>
                    <a href="kargo.aspx">
                        <span class="text">Kargo Bilgileri</span>
                    </a>
                </li>
                 <li>
                    <a href="bankahesap.aspx">
                        <span class="text">Banka Hesap Bilgileri</span>
                    </a>
                </li>
                 <li>
                    <a href="havalebildirim.aspx">
                        <span class="text">Havale Bildirimleri</span>
                    </a>
                </li>
                  <li>
                    <a href="yonetici.aspx">
                        <span class="text">Yönetici İşlemleri</span>
                    </a>
                </li>
            </ul>
        </li>
    </ul>
</nav>
