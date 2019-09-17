using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class siparisdetay : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    public string havaleFormuLink = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (RouteData.Values["ID"] != null)
            {
                int ID = Convert.ToInt32(RouteData.Values["ID"]);
                if (Session["UyeID"] != null)
                {
                    var siparisGetir = db.ETICARET_Siparis.Where(m => m.ID == ID & m.UyeID == Convert.ToInt32(Session["UyeID"])).FirstOrDefault();
                    if (siparisGetir==null)
                    {
                        Response.Redirect("/anasayfa");
                        return;
                    }
                    var kargoGetir = db.ETICARET_Kargos.Where(m => m.ID == siparisGetir.Kargo).FirstOrDefault();
                    ltrAdres.Text = siparisGetir.Adres;
                    ltrAdSoyad.Text = siparisGetir.AdSoyad;
                    ltrDurum.Text = siparisGetir.Durum;
                    ltrEklenmeTarihi.Text = siparisGetir.EklenmeTarihi;
                    ltrFaturaIsim.Text = siparisGetir.FaturaIsim;
                    ltrIlce.Text = siparisGetir.Ilce;
                    ltrKargo.Text = kargoGetir.KargoAdi;
                    ltrOdemeSekli.Text = siparisGetir.OdemeSekli;
                    ltrOnay.Text = (siparisGetir.Onay == 1) ? "Onaylandı" : "Onaylanmadı";
                    ltrPostaKodu.Text = siparisGetir.PostaKodu;
                    ltrSehir.Text = siparisGetir.Sehir;
                    ltrTelefon.Text = siparisGetir.Telefon;
                    ltrTip.Text = siparisGetir.Tip;
                    ltrTutar.Text = string.Format("{0:c}", siparisGetir.Tutar);
                    if (siparisGetir.OdemeSekli == "Havale / EFT")
                    {
                        havaleBildirimDiv.Visible = true;
                        havaleFormuLink = "/havaleformu/" + siparisGetir.ID.ToString();
                    }
                    else
                    {
                        havaleBildirimDiv.Visible = false;
                    }

                    var sepetSiparisGetir = from s in db.ETICARET_SepetSiparis.Where(m => m.EklenmeTarihi == siparisGetir.EklenmeTarihi)
                                            join u in db.ETICARET_Urunlers on s.UrunID equals u.ID
                                            select new
                                            {
                                                s.ID,
                                                s.Adet,
                                                s.EklenmeTarihi,
                                                u.IndirimliFiyat,
                                                u.Kdv,
                                                u.UrunAdi,
                                                u.Resim,
                                                u.KatID
                                            };
                    rptUrunler.DataSource = sepetSiparisGetir;
                    rptUrunler.DataBind();

                    if (siparisGetir.OdemeSekli == "Havale / EFT")
                    {
                        var bankaGetir = db.ETICARET_BankaHesaps.Where(m => m.ID == siparisGetir.BankaHesap).FirstOrDefault();
                        bankaHesap.Visible = true;
                        ltrBankaHesap.Text = bankaGetir.Banka + " " + bankaGetir.SubeAdi + " Şubesi Şube Kodu : " + bankaGetir.SubeKodu + " Hesap No : " + bankaGetir.HesapNo + " İBAN : " + bankaGetir.IBAN;
                    }
                    else
                    {
                        bankaHesap.Visible = false;
                    }

                }
                else
                {
                    var siparisGetir = db.ETICARET_Siparis.Where(m => m.ID == ID & m.IP == Request.ServerVariables["REMOTE_ADDR"]).FirstOrDefault();
                    if (siparisGetir == null)
                    {
                        Response.Redirect("/anasayfa");
                        return;
                    }
                    var kargoGetir = db.ETICARET_Kargos.Where(m => m.ID == siparisGetir.Kargo).FirstOrDefault();
                    ltrAdres.Text = siparisGetir.Adres;
                    ltrAdSoyad.Text = siparisGetir.AdSoyad;
                    ltrDurum.Text = siparisGetir.Durum;
                    ltrEklenmeTarihi.Text = siparisGetir.EklenmeTarihi;
                    ltrFaturaIsim.Text = siparisGetir.FaturaIsim;
                    ltrIlce.Text = siparisGetir.Ilce;
                    ltrKargo.Text = kargoGetir.KargoAdi;
                    ltrOdemeSekli.Text = siparisGetir.OdemeSekli;
                    ltrOnay.Text = (siparisGetir.Onay == 1) ? "Onaylandı" : "Onaylanmadı";
                    ltrPostaKodu.Text = siparisGetir.PostaKodu;
                    ltrSehir.Text = siparisGetir.Sehir;
                    ltrTelefon.Text = siparisGetir.Telefon;
                    ltrTip.Text = siparisGetir.Tip;
                    ltrTutar.Text = string.Format("{0:c}", siparisGetir.Tutar);
                    hesabimGoruntule.Visible = false;
                    siparisDiv.Style.Add("width", "100%");
                    if (siparisGetir.OdemeSekli == "Havale / EFT")
                    {
                        havaleBildirimDiv.Visible = true;
                        havaleFormuLink = "/havaleformu/" + siparisGetir.ID.ToString();
                    }
                    else
                    {
                        havaleBildirimDiv.Visible = false;
                    }

                    var sepetSiparisGetir = from s in db.ETICARET_SepetSiparis.Where(m => m.EklenmeTarihi == siparisGetir.EklenmeTarihi)
                                            join u in db.ETICARET_Urunlers on s.UrunID equals u.ID
                                            select new
                                            {
                                                s.ID,
                                                s.Adet,
                                                s.EklenmeTarihi,
                                                u.IndirimliFiyat,
                                                u.Kdv,
                                                u.UrunAdi,
                                                u.Resim,
                                                u.KatID
                                            };
                    rptUrunler.DataSource = sepetSiparisGetir;
                    rptUrunler.DataBind();

                    if (siparisGetir.OdemeSekli == "Havale / EFT")
                    {
                        var bankaGetir = db.ETICARET_BankaHesaps.Where(m => m.ID == siparisGetir.BankaHesap).FirstOrDefault();
                        bankaHesap.Visible = true;
                        ltrBankaHesap.Text = bankaGetir.Banka + " " + bankaGetir.SubeAdi + " Şubesi Şube Kodu : " + bankaGetir.SubeKodu + " Hesap No : " + bankaGetir.HesapNo + " İBAN : " + bankaGetir.IBAN;
                    }
                    else
                    {
                        bankaHesap.Visible = false;
                    }
                }
            }
            else
            {
                Response.Redirect("/anasayfa");
            }
        }
    }
    public string kategoriGetir(int KatID)
    {
        var kategoriGetir = db.ETICARET_Kategoris.Where(m => m.ID == KatID).FirstOrDefault();
        return kategoriGetir.KategoriAdi;
    }
    public string toplamTutarGetir(decimal fiyat, int kdv)
    {
        decimal toplamTutar = fiyat + Convert.ToDecimal((fiyat * kdv) / 100);
        return string.Format("{0:c}", toplamTutar);
    }
}