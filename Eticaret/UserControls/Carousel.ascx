<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Carousel.ascx.cs" Inherits="UserControls_Carousel" %>
<div id="divSlide" class="Block_item FirsatSlideItem">
    <div id="mainHolder_ctl01_divSlideBaslik" class="Block_Title">
        <span>FIRSAT ÜRÜNLERİ</span>
    </div>
    <div class="Block_Text">
        <div class="firsatUrunleri">
            <button class="Firsatprev"></button>
            <button class="Firsatnext"></button>
            <ul>

                <asp:Repeater runat="server" ID="rptFirsat">
                    <ItemTemplate>
                        <li class="firsatUrunleriItem">
                            <span class="firsatUrunResim">
                                <a href="/urundetay/<%#Eval("ID")%>/<%#Tools.UrlSeo(Eval("UrunAdi").ToString().ToLower()) %>">
                                    <img src="/Dosyalar/Urun/Mini/<%#Eval("Resim")%>" /></a>
                            </span>
                            <span class="firsatUrunAdi">
                                <a href="/urundetay/<%#Eval("ID")%>/<%#Tools.UrlSeo(Eval("UrunAdi").ToString().ToLower()) %>" style="font-size:13px;font-weight:bold;"><%#Eval("UrunAdi")%></a>
                            </span>
                            <span class="firsatUrunFiyat" >
                                <%#kdvDahil(Convert.ToDecimal(Eval("IndirimliFiyat")),Convert.ToInt32(Eval("Kdv")))%> 
                               <span style="font-size:11px;">KDV Dahil</span>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </div>
    <div class="Block_Alt">
    </div>
</div>
