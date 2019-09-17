using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Default : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int bekleyenSiparsiler = (from u in db.ETICARET_Siparis.Where(m => m.Onay == 0) select u).Count();
            ltrBekleyenSiparisler.Text = bekleyenSiparsiler.ToString();

            var siparisler = from u in db.ETICARET_Siparis select u;
            int siparisAdet = siparisler.Count();
            if (siparisAdet > 0)
            {
                double toplamGelir = siparisler.Sum(m => Convert.ToDouble(m.Tutar));
                ltrToplamGelir.Text = string.Format("{0:C}", toplamGelir).ToString();
            }
            else
            {
                ltrToplamGelir.Text = string.Format("{0:c}", 0);
            }


            int uyeSayisi = (from u in db.ETICARET_Uyelers select u).Count();
            ltrUyeSayisi.Text = uyeSayisi.ToString();

            var urunAdedi = (from u in db.ETICARET_Urunlers select u).Count();
            ltrToplamUrun.Text = urunAdedi.ToString();

            var sonUyeler = from u in db.ETICARET_Uyelers.OrderByDescending(m => m.ID).Take(5) select u;
            rptSonUyeler.DataSource = sonUyeler;
            rptSonUyeler.DataBind();

            var stoguBitenler = from u in db.ETICARET_Urunlers.Where(m => m.Stok <= 5) select u;
            rptStoguBitenler.DataSource = stoguBitenler;
            rptStoguBitenler.DataBind();

            var sonSiparisler = from u in db.ETICARET_Siparis.OrderByDescending(m => m.ID).Take(5)
                                select u;

            rptSiparisler.DataSource = sonSiparisler;
            rptSiparisler.DataBind();


        }
    }
    public string UyelikDurumu(int uyeID)
    {
        string sonuc = "";
        if (uyeID != 0)
        {
            sonuc = "Üye";
        }
        else
        {
            sonuc = "Üye Değil";
        }

        return sonuc;
    }
    public string katGetir(string katID)
    {
        var katGetir = db.ETICARET_Kategoris.Where(m => m.ID == Convert.ToInt32(katID)).FirstOrDefault();
        return katGetir.KategoriAdi;
    }
}