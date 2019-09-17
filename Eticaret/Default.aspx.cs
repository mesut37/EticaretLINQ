using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    Constant cons = new Constant();
    public List<ETICARET_Urunler> productList = new List<ETICARET_Urunler>();
    public List<ETICARET_Markalar> markaList = new List<ETICARET_Markalar>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

           
            

            var urunler = (from u in db.ETICARET_Urunlers.Where(m => m.Durum == 1 & m.Vitrin == 1).OrderBy(m => m.Sira) select u).ToList();


            CollectionPager1.DataSource = urunler;
            CollectionPager1.BindToControl = rptUrunler;
            rptUrunler.DataSource = CollectionPager1.DataSourcePaged;

            var slider = from u in db.ETICARET_Banners.OrderBy(m => m.Sira)
                         select u;
            rptSlider.DataSource = slider;
            rptSlider.DataBind();

            Page.Title = "Anasayfa" + " " + cons.title;
            Page.MetaDescription = cons.description;
            Page.MetaKeywords = cons.keywords;
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
}