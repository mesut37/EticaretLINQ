using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class kategori : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    Constant cons = new Constant();
    public List<ETICARET_Urunler> productList = new List<ETICARET_Urunler>();
    public List<ETICARET_Markalar> markaList = new List<ETICARET_Markalar>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (RouteData.Values["ID"] != null)
            {
                int ID = Convert.ToInt32(RouteData.Values["ID"]);
                var kategori = db.ETICARET_Kategoris.Where(m => m.ID == ID).FirstOrDefault();
                var urunlerilistele = from u in db.ETICARET_Urunlers.Where(m => m.KatID == ID & m.Durum == 1) select u;


                productList.AddRange(urunlerilistele.ToList());
                UrunListEkle(kategori.ID);

                ltrKategoriAdi.Text = kategori.KategoriAdi;
                ltrKategoriNav.Text = kategori.KategoriAdi;
                var altKategoriler = from u in db.ETICARET_Kategoris.Where(m => m.AltID == ID & m.Durum == 1)
                                     select u;
                rptAltKategoriler.DataSource = altKategoriler;
                rptAltKategoriler.DataBind();

                drpAltKategoriler.DataSource = altKategoriler;
                drpAltKategoriler.DataTextField = "KategoriAdi";
                drpAltKategoriler.DataValueField = "ID";
                drpAltKategoriler.DataBind();
                drpAltKategoriler.Items.Insert(0, new ListItem("Kategori Seçin", "0"));
                drpFiyataGoreListe.Items.Insert(0, new ListItem("Filtreleme Seçin", "0"));



                Page.Title = kategori.Title + " " + cons.title;
                Page.MetaDescription = kategori.Description + " " + cons.description;
                Page.MetaKeywords = kategori.Keywords + " " + cons.keywords;

            }
            else
            {
                Response.Redirect("/anasayfa");
            }
        }
    }
    public void UrunListEkle(int ID)
    {
        var kategori = from u in db.ETICARET_Kategoris.Where(m => m.AltID == ID) select u;

        foreach (var item in kategori)
        {
            var urunGetir = from u in db.ETICARET_Urunlers.Where(m => m.KatID == item.ID & m.Durum == 1) select u;

            productList.AddRange(urunGetir);
            UrunListEkle(item.ID);

            foreach (var item2 in productList)
            {

                var markaGetir = db.ETICARET_Markalars.Where(m => m.ID == item2.MarkaID).FirstOrDefault();
                if (markaGetir != null)
                {
                    int markaDongu = 0;
                    foreach (var item3 in markaList)
                    {

                        if (item3.MarkaAdi == markaGetir.MarkaAdi)
                        {
                            markaDongu = 1;
                        }
                    }
                    if (markaDongu == 0)
                    {
                        markaList.Add(markaGetir);
                    }
                }
            }
        }


        CollectionPager2.DataSource = productList.OrderBy(x => x.Sira).ToList();
        CollectionPager2.BindToControl = rptUrunler;
        rptUrunler.DataSource = CollectionPager2.DataSourcePaged;


        drpMarkalar.DataSource = markaList;
        drpMarkalar.DataTextField = "MarkaAdi";
        drpMarkalar.DataValueField = "ID";
        drpMarkalar.DataBind();
        drpMarkalar.Items.Insert(0, new ListItem("Marka Seçin", "0"));

        int urunAdet = productList.ToList().Count();
        if (urunAdet <= 0)
        {
            urunYok.Visible = true;
            urunGoster.Visible = false;
        }

    }
    public string kdvDahil(decimal fiyat, int kdv)
    {
        decimal toplamTutar = fiyat + Convert.ToDecimal((fiyat * kdv) / 100);
        return string.Format("{0:c}", toplamTutar);
    }
    public string alisFiyatGoster(decimal alisFiyat, decimal indirimliFiyat, int kdv)
    {
        if (alisFiyat <= indirimliFiyat)
        {
            return "";

        }
        else
        {
            decimal toplamTutar = alisFiyat + Convert.ToDecimal((alisFiyat * kdv) / 100);
            return string.Format("{0:c}", toplamTutar);

        }
    }
    public string yeniGoster(int yeni)
    {
        if (yeni == 1)
        {
            return string.Format("<div class='newIcon tip' title='Yeni Ürün' data-original-title='Yeni Ürün'>Yeni Ürün</div>");
        }
        else
        {
            return "";
        }
    }
    public string idirimHesapla(double indirimliFiyat, int alisFiyat)
    {

        double indirimOrani = ((alisFiyat - indirimliFiyat) / alisFiyat) * 100;

        if (Math.Floor(indirimOrani) <= 0)
        {
            return "";
        }
        else
        {
            return string.Format("<div class='discountIcon tip' title='İndirimli Ürün'> %" + Math.Floor(indirimOrani) + " </div>");
        }


    }
    public string tukendi(int stok)
    {
        if (stok <= 0)
        {
            return string.Format("<a href='#' class='TukendiIco'><span>Tükendi</span></a>");
        }
        else
        {
            return "";
        }
    }

    protected void rptUrunler_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "sepet")
        {
            var urunGetir = db.ETICARET_Urunlers.Where(m => m.ID == Convert.ToInt32(e.CommandArgument.ToString())).FirstOrDefault();

            if (Session["UyeID"] != null)
            {
                var sepetKontrol = db.ETICARET_Sepets.Where(m => m.UrunID == urunGetir.ID & m.UyeID == Convert.ToInt32(Session["UyeID"])).FirstOrDefault();
                if (sepetKontrol != null)
                {
                    sepetKontrol.Adet = sepetKontrol.Adet + 1;
                    db.SubmitChanges();
                }
                else
                {
                    ETICARET_Sepet sepeteEkle = new ETICARET_Sepet()
                    {
                        Adet = 1,
                        EklenmeTarihi = DateTime.Now.ToString(),
                        UrunID = urunGetir.ID,
                        UyeID = Convert.ToInt32(Session["UyeID"]),

                    };
                    db.ETICARET_Sepets.InsertOnSubmit(sepeteEkle);
                    db.SubmitChanges();
                }
            }
            else
            {
                var sepetKontrol = db.ETICARET_Sepets.Where(m => m.UrunID == urunGetir.ID & m.IP == Request.ServerVariables["REMOTE_ADDR"]).FirstOrDefault();
                if (sepetKontrol != null)
                {
                    sepetKontrol.Adet = sepetKontrol.Adet + 1;
                    db.SubmitChanges();
                }
                else
                {

                    ETICARET_Sepet sepeteEkle = new ETICARET_Sepet()
                    {
                        Adet = 1,
                        EklenmeTarihi = DateTime.Now.ToString(),
                        UrunID = urunGetir.ID,
                        IP = Request.ServerVariables["REMOTE_ADDR"],

                    };
                    db.ETICARET_Sepets.InsertOnSubmit(sepeteEkle);
                    db.SubmitChanges();
                }
            }


            Response.Redirect(HttpContext.Current.Request.RawUrl);
        }

    }
    protected void drpAltKategoriler_SelectedIndexChanged(object sender, EventArgs e)
    {
         var kategori = db.ETICARET_Kategoris.Where(m => m.ID == int.Parse(drpAltKategoriler.SelectedValue)).FirstOrDefault();
      
         Response.Redirect("/kategori/"+int.Parse(drpAltKategoriler.SelectedValue)+"/"+Tools.UrlSeo(kategori.KategoriAdi).ToLower());
      
        int ID = Convert.ToInt32(RouteData.Values["ID"]);
       
        var urunlerilistele = from u in db.ETICARET_Urunlers.Where(m => m.KatID == int.Parse(drpAltKategoriler.SelectedValue) & m.Durum == 1) select u;

        drpAltKategoriler.SelectedValue = ID.ToString();

        productList.AddRange(urunlerilistele);
        UrunListEkle(kategori.ID);
    }



    //Marka Filtrelemesi
    protected void drpMarkalar_SelectedIndexChanged1(object sender, EventArgs e)
    {
        int ID = Convert.ToInt32(RouteData.Values["ID"]);
        var kategori = db.ETICARET_Kategoris.Where(m => m.ID == ID).FirstOrDefault();
        var urunlerilistele = from u in db.ETICARET_Urunlers.Where(m => m.KatID == ID & m.MarkaID == int.Parse(drpMarkalar.SelectedValue) & m.Durum == 1) select u;

        productList.AddRange(urunlerilistele);
        markaUrunListEkle(kategori.ID);

        rptUrunler.DataSource = productList;
        rptUrunler.DataBind();


    }
    public void markaUrunListEkle(int ID)
    {
        var kategori = from u in db.ETICARET_Kategoris.Where(m => m.AltID == ID & m.Durum == 1) select u;

        foreach (var item in kategori)
        {
            var urunGetir = from u in db.ETICARET_Urunlers.Where(m => m.KatID == item.ID & m.MarkaID == int.Parse(drpMarkalar.SelectedValue) & m.Durum == 1) select u;

            productList.AddRange(urunGetir);
            markaUrunListEkle(item.ID);

        }
        rptUrunler.DataSource = productList;
        rptUrunler.DataBind();
    }





    //Fiyat Filtrelemesi
    protected void drpFiyataGoreListe_SelectedIndexChanged(object sender, EventArgs e)
    {
        int ID = Convert.ToInt32(RouteData.Values["ID"]);
        var kategori = db.ETICARET_Kategoris.Where(m => m.ID == ID).FirstOrDefault();
        var urunlerilistele = from u in db.ETICARET_Urunlers.Where(m => m.KatID == ID & m.Durum == 1) select u;
        productList.AddRange(urunlerilistele);

        if (drpFiyataGoreListe.SelectedValue == "asc")
        {
            filtrelemeListeEkle(kategori.ID, "asc");
        }
        else if (drpFiyataGoreListe.SelectedValue == "desc")
        {
            filtrelemeListeEkle(kategori.ID, "desc");
        }
    }
    public void filtrelemeListeEkle(int ID, string tip)
    {
        var kategori = from u in db.ETICARET_Kategoris.Where(m => m.AltID == ID & m.Durum == 1) select u;

        foreach (var item in kategori)
        {
            var urunGetir = from u in db.ETICARET_Urunlers.Where(m => m.KatID == item.ID & m.Durum == 1) select u;

            productList.AddRange(urunGetir);
            filtrelemeListeEkle(item.ID, tip);

            if (tip == "asc")
            {
                rptUrunler.DataSource = productList.OrderBy(x => x.IndirimliFiyat);
                rptUrunler.DataBind();
            }
            else if (tip == "desc")
            {
                rptUrunler.DataSource = productList.OrderByDescending(x => x.IndirimliFiyat);
                rptUrunler.DataBind();
            }
        }
    }
}

