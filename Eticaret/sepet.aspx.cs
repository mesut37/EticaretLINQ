using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sepet : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            double toplam, siparistutar, kdvtutar;
            if (Session["UyeID"] != null)
            {

                var sepetAdet = (from u in db.ETICARET_Sepets.Where(m => m.UyeID == Convert.ToInt32(Session["UyeID"])) select u).Count();
                if (sepetAdet <= 0)
                {
                    ltrUrunYok.Text = "<h3 style='text-align:center;'>Hiç Ürün Yok..</h3></br>";
                    sepetGoruntule.Visible = false;
                }
                else
                {
                    sepetGoruntule.Visible = true;
                    var sepet = from u in db.ETICARET_Sepets.Where(m => m.UyeID == Convert.ToInt32(Session["UyeID"]))
                                join a in db.ETICARET_Urunlers
                                on u.UrunID equals a.ID
                                select new
                                {
                                    u.ID,
                                    u.Adet,
                                    u.UrunID,
                                    u.UyeID,
                                    a.AlisFiyat,
                                    a.IndirimliFiyat,
                                    a.Kdv,
                                    a.Resim,
                                    a.UrunAdi,

                                };

                    rptSepet.DataSource = sepet;
                    rptSepet.DataBind();



                    toplam = sepet.Sum(m => Convert.ToDouble(m.Adet * (m.IndirimliFiyat + (m.IndirimliFiyat / 100 * Convert.ToInt32(m.Kdv)))));
                    ltrToplam.Text = string.Format("{0:c}", toplam.ToString());


                    siparistutar = sepet.Sum(m => Convert.ToDouble(m.Adet * (m.IndirimliFiyat)));
                    ltrSiparisTutari.Text = string.Format("{0:c}", siparistutar.ToString());

                    kdvtutar = sepet.Sum(m => Convert.ToDouble(m.Adet * (m.IndirimliFiyat / 100 * Convert.ToInt32(m.Kdv))));
                    ltrKdvTutar.Text = string.Format("{0:c}", kdvtutar.ToString());

                }


            }
            else
            {
                var sepetAdet = (from u in db.ETICARET_Sepets.Where(m => m.IP == Request.ServerVariables["REMOTE_ADDR"]) select u).Count();
                if (sepetAdet <= 0)
                {
                    ltrUrunYok.Text = "<h3 style='text-align:center;'>Hiç Ürün Yok..</h3></br>";
                    sepetGoruntule.Visible = false;
                }
                else
                {
                    sepetGoruntule.Visible = true;
                    var sepet = from u in db.ETICARET_Sepets.Where(m => m.IP == Request.ServerVariables["REMOTE_ADDR"])
                                join a in db.ETICARET_Urunlers
                                on u.UrunID equals a.ID
                                select new
                                {
                                    u.ID,
                                    u.Adet,
                                    u.UrunID,
                                    u.UyeID,
                                    a.AlisFiyat,
                                    a.IndirimliFiyat,
                                    a.Kdv,
                                    a.Resim,
                                    a.UrunAdi,

                                };

                    rptSepet.DataSource = sepet;
                    rptSepet.DataBind();

                    toplam = sepet.Sum(m => Convert.ToDouble(m.Adet * (m.IndirimliFiyat + (m.IndirimliFiyat / 100 * Convert.ToInt32(m.Kdv)))));
                    ltrToplam.Text = string.Format("{0:c}", toplam.ToString());


                    siparistutar = sepet.Sum(m => Convert.ToDouble(m.Adet * (m.IndirimliFiyat)));
                    ltrSiparisTutari.Text = string.Format("{0:c}", siparistutar.ToString());

                    kdvtutar = sepet.Sum(m => Convert.ToDouble(m.Adet * (m.IndirimliFiyat / 100 * Convert.ToInt32(m.Kdv))));
                    ltrKdvTutar.Text = string.Format("{0:c}", kdvtutar.ToString());
                }



            }
            var urunler = (from u in db.ETICARET_Urunlers
                           select u).Take(5);
            rptKasaOnu.DataSource = urunler;
            rptKasaOnu.DataBind();
        }
    }
    public string fiyatGetir(decimal fiyat, int kdv)
    {
        decimal toplamTutar = fiyat + Convert.ToDecimal((fiyat * kdv) / 100);
        return string.Format("{0:c}", toplamTutar);
    }
    public string toplamFiyatGetir(decimal fiyat, int kdv, int adet)
    {
        decimal toplamTutar = fiyat + Convert.ToDecimal((fiyat * kdv) / 100);
        return string.Format("{0:c}", toplamTutar * adet);
    }
    protected void rptSepet_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "sil")
        {
            var sepetSil = db.ETICARET_Sepets.Where(m => m.ID == Convert.ToInt32(e.CommandArgument.ToString())).FirstOrDefault();
            db.ETICARET_Sepets.DeleteOnSubmit(sepetSil);
            db.SubmitChanges();
            Response.Redirect("/sepet");
        }
        else if (e.CommandName == "guncelle")
        {
            var sepetGuncelle = db.ETICARET_Sepets.Where(m => m.ID == Convert.ToInt32(e.CommandArgument.ToString())).FirstOrDefault();
            TextBox txtAdet = (TextBox)e.Item.FindControl("txtAdet");
            sepetGuncelle.Adet = Convert.ToInt32(txtAdet.Text);
            db.SubmitChanges();
            Response.Redirect("/sepet");

        }
    }

    protected void rptKasaOnu_ItemCommand(object source, RepeaterCommandEventArgs e)
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

    protected void btnTamamla_Click(object sender, EventArgs e)
    {
        if (Session["UyeID"] != null)
        {
            var sepetAdet = (from u in db.ETICARET_Sepets.Where(m => m.UyeID == Convert.ToInt32(Session["UyeID"])) select u).Count();
            if (sepetAdet <= 0)
            {
                Response.Redirect("/anasayfa");
            }
            else
            {
                Response.Redirect("/adressecimi");
            }
        }
        else
        {

            var sepetAdet = (from u in db.ETICARET_Sepets.Where(m => m.IP == Request.ServerVariables["REMOTE_ADDR"]) select u).Count();
            if (sepetAdet <= 0)
            {
                Response.Redirect("/anasayfa");
            }
            else
            {
                Session["uyeOlDevamet"] = Request.ServerVariables["REMOTE_ADDR"];
                Response.Redirect("/uyegirisi");
            }
        }
    }
}