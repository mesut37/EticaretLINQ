<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Kategori.ascx.cs" Inherits="UserControls_Kategori" %>
<div class="Block_item resimliYanMenu">
    <div class="Block_Title"><span>Kategoriler</span></div>
    <div class="Block_Text">
        <div class="lfMenu">
            <ul class="lfMenuUl">

                <asp:Repeater runat="server" ID="rptKategoriler" OnItemDataBound="rptKategoriler_ItemDataBound">
                    <ItemTemplate>
                        <li class='lfMenuitem leftMenuitem0'><a target='_self' href="/kategori/<%#Eval("ID")%>/<%#Tools.UrlSeo(Eval("KategoriAdi").ToString().ToLower()) %>"><%#Eval("KategoriAdi")%></a>
                            <div class="lfMenuAltContent">
                                <div class="altMenu_1">
                                    <div class="altMenu_Tittle"><%#Eval("KategoriAdi")%></div>
                                    <div class="altMenu_List">
                                        <ul class="columns">
                                            <asp:Repeater runat="server" ID="rptAltKategoriler">
                                                <ItemTemplate>
                                                    <li><a href="/kategori/<%#Eval("ID")%>/<%#Tools.UrlSeo(Eval("KategoriAdi").ToString().ToLower()) %>"><%#Eval("KategoriAdi")%></a></li>
                                                </ItemTemplate>
                                            </asp:Repeater>


                                        </ul>
                                    </div>
                                    <div class="altMenu_Resim">


                                        <asp:Repeater runat="server" ID="rptKategoriResimler">
                                            <ItemTemplate>
                                                <div class="altMenu_Resim_RowItem">
                                                    <a target='_self' href="/kategori/<%#Eval("ID")%>/<%#Tools.UrlSeo(Eval("KategoriAdi").ToString().ToLower()) %>" class="altMenuItemL"></a>
                                                    <div class="altMenuItemR">
                                                        <img src="/Dosyalar/Kategori/Mini/<%#Eval("Resim")%>" />
                                                    </div>
                                                    <div class="altMenuItemN"><%#Eval("KategoriAdi")%></div>
                                                </div>

                                            </ItemTemplate>
                                        </asp:Repeater>



                                    </div>

                                </div>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>




                <%--  <li class='lfMenuitem leftMenuitem7'><a target='_self' href='elektronik-121/index.html'>Elektronik</a>

                                </li>--%>
            </ul>
        </div>
    </div>
    <div class="Block_Alt">
    </div>
</div>
