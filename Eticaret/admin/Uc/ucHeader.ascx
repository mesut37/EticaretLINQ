<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucHeader.ascx.cs" Inherits="Uc_ucHeader" %>
<nav class="top-bar navbar-fixed-top" role="navigation">
    <div class="logo-area">
        <a href="#" id="btn-nav-sidebar-minified" class="btn btn-link btn-nav-sidebar-minified pull-left"><i class="icon ion-arrow-swap"></i></a>
        <a class="btn btn-link btn-off-canvas pull-left"><i class="icon ion-navicon"></i></a>
        <div class="logo pull-left">
            <a href="default.aspx">
                <span id="logo-text"><b><strong>Yönetim</strong> Paneli</b></span>
            </a>
        </div>
    </div>
    <div class="top-bar-right pull-right">
        <div class="action-group hidden-xs hidden-sm">
            <ul>
                <!-- skins -->

                <!-- end skins -->

                <!-- notification: inbox -->

                <!-- end notification: inbox -->

                <!-- notification: general -->

                <!-- end notification: general -->
            </ul>
        </div>
        <div class="logged-user">
            <div class="btn-group">
                <a href="#" class="btn btn-link dropdown-toggle" data-toggle="dropdown">

                    <span class="name">İşlemler <i class="icon ion-ios7-arrow-down"></i></span>
                </a>
                <ul class="dropdown-menu" role="menu">
                    <li>
                        <a href="default.aspx">
                            <span class="text">Anasayfa</span>
                        </a>
                    </li>
                    <li>
                         <asp:LinkButton ID="lnkCikis" OnClick="lnkCikis_Click" runat="server">Çıkış</asp:LinkButton>
                    </li>

                  
                </ul>
            </div>
        </div>

    </div>
</nav>
