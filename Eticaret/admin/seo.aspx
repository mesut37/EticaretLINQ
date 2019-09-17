<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="seo.aspx.cs" Inherits="admin_seo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid primary-content">
        <!-- PRIMARY CONTENT HEADING -->
        <div class="primary-content-heading clearfix">
            <h2>Genel Seo Ayarları</h2>
            <ul class="breadcrumb pull-left">
                <li><i class="icon ion-home"></i><a href="default.aspx">Anasayfa</a></li>
                <li><a href="seo.aspx">Seo Ayarları</a></li>
            </ul>
            <!-- quick task modal -->

            <!-- end quick task modal -->
        </div>
        <asp:Button ID="Button1" Style="width: 120px;" class="btn btn-success" runat="server" Text="Kaydet" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:Panel runat="server" ID="pnlBasarili" Visible="false">
            <div class="alert alert-success fade in">
                <i class="icon ion-checkmark-circled"></i>
                <strong>Başarılı</strong>Kayıt başarılı bir şekilde düzenlendi...
            </div>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlHata" Visible="false">
            <div class="alert alert-danger fade in">
                <i class="icon ion-close-circled"></i>
                <strong>Hata!</strong> Bir hata oluştu lütfen daha sonra tekrar deneyin.
            </div>
        </asp:Panel>
        <div class="widget">
            <div class="widget-header clearfix">
                <h3><i class="icon ion-ios7-browsers"></i>
                    <span>Seo Ayarları</span>
                </h3>
                <div class="btn-group widget-header-toolbar">
                    <a href="#" class="btn btn-link btn-toggle-expand"><i class="icon ion-ios7-arrow-up"></i></a>
                    <a href="#" class="btn btn-link btn-remove"><i class="icon ion-ios7-close-empty"></i></a>
                </div>
            </div>
            <div class="widget-content">
                <ul class="nav nav-pills nav-pills-custom-minimal custom-minimal-bottom tabs-iconized" role="tablist">
                    <li class="active"><a href="#genel" role="tab" data-toggle="tab">Genel</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade active in" id="genel">
                        <div class="form-group">
                            <label for="text-input1">Title (Site Başlığı)</label>
                            <asp:TextBox ID="txtTitle" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Keywords (Anahtar Kelimeler)</label>
                            <asp:TextBox ID="txtKeywords" TextMode="MultiLine" Height="200" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="text-input1">Description (Açıklamalar)</label>
                            <asp:TextBox ID="txtDescription" TextMode="MultiLine" Height="200" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END CUSTOM MINIMAL -->
        <!-- CUSTOM COLORED -->
    </div>
</asp:Content>

