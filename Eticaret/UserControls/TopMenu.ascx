<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TopMenu.ascx.cs" Inherits="UserControls_TopMenu" %>

<div id="logo">
    <div class="welcome" id="divMemberPanel" runat="server" visible="false">
        <span>Hoşgeldiniz,  
            <asp:Literal ID="ltrKullanici" runat="server"></asp:Literal>
        </span>
       
        <asp:LinkButton ID="lnkCikis" OnClick="lnkCikis_Click" runat="server">Çıkış</asp:LinkButton>
         
        <div class="uyegirisiyapti" style="display: none;">
          
          
        </div>
    </div>
    <a href="/anasayfa">
        <img style="" src="/images/logo.png"></a>
    <div class="header-links">
        <ul class="nav navbar-nav pull-left">
            <li id="kullnici" runat="server" visible="false">
                <a></a>
            </li>
            <li>
                <a href="/anasayfa">
                    <i class="fa fa-home"></i>
                    <span>Anasayfa
                    </span>
                </a>
            </li>

            <li id="hesabim" runat="server" visible="false">
                
                <a href="/hesabim/<%=Session["UyeID"].ToString()%>">
                    <i class="fa fa-user"></i>
                    <span>Hesabım
                    </span>
                </a>
            </li>
           <%-- <li id="sepetim" runat="server">
                <a href="/sepet">
                    <i class="fa fa-shopping-cart"></i>
                    <span>Sepetim
                    </span>
                </a>
            </li>--%>
           <%-- <li id="siparislerim" runat="server" >
                <a href="/siparisler">
                    <i class="fa fa-crosshairs"></i>
                    <span>Siparişlerim
                    </span>
                </a>
            </li>--%>


            <li id="uyeol" runat="server">
                <a href="/uyeol">
                    <i class="fa fa-unlock"></i>
                    <span>Üye Ol
                    </span>
                </a>
            </li>
            <li id="uyegirisi" runat="server">
                <a href="/uyegirisi">
                    <i class="fa fa-lock"></i>
                    <span>Üye Girişi
                    </span>
                </a>
            </li>
        </ul>
    </div>
</div>
   