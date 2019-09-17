using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class odeme : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                double toplam, siparistutar, kdvtutar;
            if (RouteData.Values["payment"] != null && Session["payment"] != null)
            {
                if (RouteData.Values["payment"].ToString() == Session["payment"].ToString())
                {
                    if (Session["UyeID"] != null)
                    {
                        
                        var siparisOzeti = from u in db.ETICARET_Sepets.Where(m => m.UyeID == Convert.ToInt32(Session["UyeID"]))
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

                        rptSiparisOzeti.DataSource = siparisOzeti;
                        rptSiparisOzeti.DataBind();

                        var kargo = db.ETICARET_Kargos.Where(m => m.ID == Convert.ToInt32(Session["Kargo"])).FirstOrDefault();
                        ltrKargo.Text = string.Format("{0:c}", kargo.Fiyat);

                        toplam = siparisOzeti.Sum(m => Convert.ToDouble(m.Adet * (m.IndirimliFiyat + (m.IndirimliFiyat / 100 * Convert.ToInt32(m.Kdv)))));
                        toplam += Convert.ToDouble(kargo.Fiyat);
                        ltrToplam.Text = string.Format("{0:c}", toplam.ToString());


                        siparistutar = siparisOzeti.Sum(m => Convert.ToDouble(m.Adet * (m.IndirimliFiyat)));
                        ltrSiparisTutari.Text = string.Format("{0:c}", siparistutar.ToString());

                        kdvtutar = siparisOzeti.Sum(m => Convert.ToDouble(m.Adet * (m.IndirimliFiyat / 100 * Convert.ToInt32(m.Kdv))));
                        ltrKdvTutar.Text = string.Format("{0:c}", kdvtutar.ToString());


                    }
                    else
                    {
                        var siparisOzeti = from u in db.ETICARET_Sepets.Where(m => m.IP == Request.ServerVariables["REMOTE_ADDR"])
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

                        rptSiparisOzeti.DataSource = siparisOzeti;
                        rptSiparisOzeti.DataBind();

                        var kargo = db.ETICARET_Kargos.Where(m => m.ID == Convert.ToInt32(Session["Kargo"])).FirstOrDefault();
                        ltrKargo.Text = string.Format("{0:c}", kargo.Fiyat);

                        toplam = siparisOzeti.Sum(m => Convert.ToDouble(m.Adet * (m.IndirimliFiyat + (m.IndirimliFiyat / 100 * Convert.ToInt32(m.Kdv)))));
                        toplam += Convert.ToDouble(kargo.Fiyat);
                        ltrToplam.Text = string.Format("{0:c}", toplam.ToString());


                        siparistutar = siparisOzeti.Sum(m => Convert.ToDouble(m.Adet * (m.IndirimliFiyat)));
                        ltrSiparisTutari.Text = string.Format("{0:c}", siparistutar.ToString());

                        kdvtutar = siparisOzeti.Sum(m => Convert.ToDouble(m.Adet * (m.IndirimliFiyat / 100 * Convert.ToInt32(m.Kdv))));
                        ltrKdvTutar.Text = string.Format("{0:c}", kdvtutar.ToString());
                    }

                    var bankalar = from u in db.ETICARET_BankaHesaps select u;
                    foreach (var item in bankalar)
                    {
                        rdlBankalar.Items.Add(new ListItem(" " + item.Banka + " " + item.SubeAdi + " Şubesi Şube Kodu: " + item.SubeKodu + " Hesap No: " + item.HesapNo + " İBAN " + item.IBAN, item.ID.ToString()));
                    }
                    rdlBankalar.SelectedIndex = 0;

                }
                else
                {
                    Response.Redirect("/anasayfa");
                }
            }
            else
            {
                Response.Redirect("/anasayfa");
            }
            }
            catch (Exception)
            {
                Response.Redirect("/anasayfa");
            }
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



    protected void btnKrediKarti_Click(object sender, EventArgs e)
    {

    }
    protected void btnHavale_Click(object sender, EventArgs e)
    {

        try
        {
            
            if (Session["UyeID"] != null)
            {
                siparisEkle(Session["AdSoyad"].ToString(), Session["Telefon"].ToString(), Session["Il"].ToString(), Session["Ilce"].ToString(), Session["Adres"].ToString(), Session["PostaKodu"].ToString(), Session["KullaniciTip"].ToString(), Session["faturaIsim"].ToString(), Session["TC"].ToString(), Convert.ToInt32(Session["UyeID"]), null, DateTime.Now, 0, "Onay Bekliyor", Convert.ToInt32(Session["Kargo"]), decimal.Parse(ltrToplam.Text), "Havale / EFT", Convert.ToInt32(rdlBankalar.SelectedValue));
                var zamanGetir = db.ETICARET_Siparis.OrderByDescending(m => m.ID).FirstOrDefault();
                var sepetGetir = from u in db.ETICARET_Sepets.Where(m => m.UyeID == Convert.ToInt32(Session["UyeID"])) select u;
                foreach (var item in sepetGetir)
                {
                    ETICARET_SepetSipari ekle = new ETICARET_SepetSipari()
                    {
                        Adet = item.Adet,
                        EklenmeTarihi =zamanGetir.EklenmeTarihi,
                        UrunID = item.UrunID,
                        UyeID = item.UyeID
                    };
                    db.ETICARET_SepetSiparis.InsertOnSubmit(ekle);
                    db.SubmitChanges();

                    var stokGuncelle = db.ETICARET_Urunlers.Where(m => m.ID == item.UrunID).FirstOrDefault();
                    stokGuncelle.Stok = stokGuncelle.Stok - item.Adet;
                    db.SubmitChanges();
                }
                var sepetSil = from u in db.ETICARET_Sepets.Where(m => m.UyeID == Convert.ToInt32(Session["UyeID"])) select u;
                db.ETICARET_Sepets.DeleteAllOnSubmit(sepetSil);
                db.SubmitChanges();
            }
            else
            {
                siparisEkle(Session["AdSoyad"].ToString(), Session["Telefon"].ToString(), Session["Il"].ToString(), Session["Ilce"].ToString(), Session["Adres"].ToString(), Session["PostaKodu"].ToString(), Session["KullaniciTip"].ToString(), Session["faturaIsim"].ToString(), Session["TC"].ToString(), 0, Request.ServerVariables["REMOTE_ADDR"], DateTime.Now, 0, "Onay Bekliyor", Convert.ToInt32(Session["Kargo"]), decimal.Parse(ltrToplam.Text), "Havale / EFT", Convert.ToInt32(rdlBankalar.SelectedValue));
                var zamanGetir = db.ETICARET_Siparis.OrderByDescending(m => m.ID).FirstOrDefault();
                var sepetGetir = from u in db.ETICARET_Sepets.Where(m => m.IP == Request.ServerVariables["REMOTE_ADDR"]) select u;
                foreach (var item in sepetGetir)
                {
                    ETICARET_SepetSipari ekle = new ETICARET_SepetSipari()
                    {
                        Adet = item.Adet,
                        EklenmeTarihi = zamanGetir.EklenmeTarihi,
                        UrunID = item.UrunID,
                        IP = Request.ServerVariables["REMOTE_ADDR"]
                    };
                    db.ETICARET_SepetSiparis.InsertOnSubmit(ekle);
                    db.SubmitChanges();

                    var stokGuncelle = db.ETICARET_Urunlers.Where(m => m.ID == item.UrunID).FirstOrDefault();
                    stokGuncelle.Stok = stokGuncelle.Stok - item.Adet;
                    db.SubmitChanges();
                }
                var sepetSil = from u in db.ETICARET_Sepets.Where(m => m.IP == Request.ServerVariables["REMOTE_ADDR"]) select u;
                db.ETICARET_Sepets.DeleteAllOnSubmit(sepetSil);
                db.SubmitChanges();
            }
            Session["OdemeSekli"] = "Havale / EFT";
            Session["Tutar"] = ltrToplam.Text;
            Response.Redirect("/siparistamamla");
        }
        catch (Exception)
        {


        }
    }
    protected void btnKapida_Click(object sender, EventArgs e)
    {
        try
        {
          
            if (Session["UyeID"] != null)
            {
                siparisEkle(Session["AdSoyad"].ToString(), Session["Telefon"].ToString(), Session["Il"].ToString(), Session["Ilce"].ToString(), Session["Adres"].ToString(), Session["PostaKodu"].ToString(), Session["KullaniciTip"].ToString(), Session["faturaIsim"].ToString(), Session["TC"].ToString(), Convert.ToInt32(Session["UyeID"]), null, DateTime.Now, 0, "Onay Bekliyor", Convert.ToInt32(Session["Kargo"]), decimal.Parse(ltrToplam.Text), "Kapıda Ödeme", 0);
                var zamanGetir = db.ETICARET_Siparis.OrderByDescending(m => m.ID).FirstOrDefault();
                var sepetGetir = from u in db.ETICARET_Sepets.Where(m => m.UyeID == Convert.ToInt32(Session["UyeID"])) select u;
                foreach (var item in sepetGetir)
                {
                    ETICARET_SepetSipari ekle = new ETICARET_SepetSipari()
                    {
                        Adet = item.Adet,
                        EklenmeTarihi = zamanGetir.EklenmeTarihi,
                        UrunID = item.UrunID,
                        UyeID = item.UyeID
                    };
                    db.ETICARET_SepetSiparis.InsertOnSubmit(ekle);
                    db.SubmitChanges();

                    var stokGuncelle = db.ETICARET_Urunlers.Where(m => m.ID == item.UrunID).FirstOrDefault();
                    stokGuncelle.Stok = stokGuncelle.Stok - item.Adet;
                    db.SubmitChanges();
                }
                var sepetSil = from u in db.ETICARET_Sepets.Where(m => m.UyeID == Convert.ToInt32(Session["UyeID"])) select u;
                db.ETICARET_Sepets.DeleteAllOnSubmit(sepetSil);
                db.SubmitChanges();
            }
            else
            {
                siparisEkle(Session["AdSoyad"].ToString(), Session["Telefon"].ToString(), Session["Il"].ToString(), Session["Ilce"].ToString(), Session["Adres"].ToString(), Session["PostaKodu"].ToString(), Session["KullaniciTip"].ToString(), Session["faturaIsim"].ToString(), Session["TC"].ToString(), 0, Request.ServerVariables["REMOTE_ADDR"], DateTime.Now, 0, "Onay Bekliyor", Convert.ToInt32(Session["Kargo"]), decimal.Parse(ltrToplam.Text), "Kapıda Ödeme", 0);
                var zamanGetir = db.ETICARET_Siparis.OrderByDescending(m => m.ID).FirstOrDefault();
                var sepetGetir = from u in db.ETICARET_Sepets.Where(m => m.IP == Request.ServerVariables["REMOTE_ADDR"]) select u;
                foreach (var item in sepetGetir)
                {
                    ETICARET_SepetSipari ekle = new ETICARET_SepetSipari()
                    {
                        Adet = item.Adet,
                        EklenmeTarihi = zamanGetir.EklenmeTarihi,
                        UrunID = item.UrunID,
                        IP = Request.ServerVariables["REMOTE_ADDR"]
                    };
                    db.ETICARET_SepetSiparis.InsertOnSubmit(ekle);
                    db.SubmitChanges();

                    var stokGuncelle = db.ETICARET_Urunlers.Where(m => m.ID == item.UrunID).FirstOrDefault();
                    stokGuncelle.Stok = stokGuncelle.Stok - item.Adet;
                    db.SubmitChanges();
                }
                var sepetSil = from u in db.ETICARET_Sepets.Where(m => m.IP == Request.ServerVariables["REMOTE_ADDR"]) select u;
                db.ETICARET_Sepets.DeleteAllOnSubmit(sepetSil);
                db.SubmitChanges();
            }
            Session["OdemeSekli"] = "Kapıda Ödeme";
            Session["Tutar"] = ltrToplam.Text;
            Response.Redirect("/siparistamamla");
        }
        catch (Exception)
        {


        }
    }
    public void siparisEkle(string adSoyad, string telefon, string sehir, string ilce, string adres, string postaKodu, string tip, string faturaIsim, string tc, int uyeId, string ip, DateTime eklenme, int onay, string durum, int kargo, decimal tutar, string odemeSekli, int bankaHesap)
    {
        ETICARET_Sipari sEkle = new ETICARET_Sipari()
        {
            AdSoyad = adSoyad,
            Telefon = telefon,
            Sehir = sehir,
            Ilce = ilce,
            Adres = adres,
            PostaKodu = postaKodu,
            Tip = tip,
            FaturaIsim = faturaIsim,
            TC = tc,
            UyeID = uyeId,
            IP = ip,
            EklenmeTarihi = eklenme.ToString(),
            Onay = onay,
            Durum = durum,
            Kargo = kargo,
            Tutar = tutar,
            OdemeSekli = odemeSekli,
            BankaHesap = bankaHesap,
        };
        db.ETICARET_Siparis.InsertOnSubmit(sEkle);
        db.SubmitChanges();
    }
}