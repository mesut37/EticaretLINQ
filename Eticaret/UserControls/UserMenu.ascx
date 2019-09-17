<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserMenu.ascx.cs" Inherits="UserControls_UserMenu" %>
<ul class="userMenu">
    <span class="mobileNav"><a class="btn-toogle" href="javascript:;"><i class="fa fa-bars"></i></a></span>
    <li><a href="/hesabim/<%=Session["UyeID"].ToString()%>"><span>Üyelik Bilgilerim</span></a></li>
    <li><a href="/adresfatura/<%=Session["UyeID"].ToString()%>"><span>Adres ve Fatura Bilgilerim</span></a></li>
    <li><a href="/sepet"><span>Alışveriş Sepetim</span></a></li>
    <li><a href="/siparisler"><span>Siparişlerim</span></a></li>
    <li><a href="/havalebildirim"><span>Havale Bildirim Formu</span></a></li>

    <li>

        <asp:LinkButton ID="lnkCikis" OnClick="lnkCikis_Click" runat="server">Çıkış</asp:LinkButton>
    </li>
</ul>
