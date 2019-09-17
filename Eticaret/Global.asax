<%@ Application Language="C#" %>

<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        RegisterRoutes(System.Web.Routing.RouteTable.Routes);
    }
    public static void RegisterRoutes(System.Web.Routing.RouteCollection routes)
    {

        routes.MapPageRoute("anasayfa", "anasayfa", "~/default.aspx");
        routes.MapPageRoute("sepet", "sepet", "~/sepet.aspx");
        routes.MapPageRoute("siparisler", "siparisler", "~/siparisler.aspx");
        routes.MapPageRoute("uyeol", "uyeol", "~/uyeol.aspx");
        routes.MapPageRoute("uyegirisi", "uyegirisi", "~/uyegirisi.aspx");
        routes.MapPageRoute("arama", "arama/{kelime}/", "~/arama.aspx");
        routes.MapPageRoute("yeniurunler", "yeniurunler", "~/yeniurunler.aspx");
        routes.MapPageRoute("firsaturunleri", "firsaturunleri", "~/firsaturunleri.aspx");
        routes.MapPageRoute("iletisim", "iletisim", "~/iletisim.aspx");
        routes.MapPageRoute("sifremiunuttum", "sifremiunuttum", "~/sifremiunuttum.aspx");
        routes.MapPageRoute("adressecimi", "adressecimi", "~/adressecimi.aspx");
        routes.MapPageRoute("havalebildirim", "havalebildirim", "~/havalebildirim.aspx");
        routes.MapPageRoute("hesabim", "hesabim/{Uye}/", "~/hesabim.aspx");
        routes.MapPageRoute("siparisdetay", "siparisdetay/{ID}/", "~/siparisdetay.aspx");
        routes.MapPageRoute("siparistamamla", "siparistamamla", "~/siparistamamla.aspx");
        routes.MapPageRoute("odeme", "odeme/{payment}/", "~/odeme.aspx");
        routes.MapPageRoute("adresfatura", "adresfatura/{Uye}/", "~/adresfatura.aspx");
        routes.MapPageRoute("havaleformu", "havaleformu/{ID}/", "~/havaleformu.aspx");
        routes.MapPageRoute("kategori", "kategori/{ID}/{KategoriAdi}", "~/kategori.aspx");
        routes.MapPageRoute("urundetay", "urundetay/{ID}/{UrunAdi}", "~/urundetay.aspx");
        routes.MapPageRoute("sayfa", "sayfa/{ID}/{Baslik}", "~/sayfa.aspx");
        routes.MapPageRoute("urunler", "urunler/{id}/{AltKategoriAdi}", "~/urunler.aspx");
        

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
