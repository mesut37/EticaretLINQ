using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_siparisdetay : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    public string uyeLink = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            var siparisDetay = db.ETICARET_Siparis.Where(m => m.ID == ID).FirstOrDefault();
            var kargoGetir = db.ETICARET_Kargos.Where(m => m.ID == siparisDetay.Kargo).FirstOrDefault();
            txtAdres.Text = siparisDetay.Adres;
            txtAdSoyad.Text = siparisDetay.AdSoyad;
            txtFaturaIsim.Text = siparisDetay.FaturaIsim;
            txtIlce.Text = siparisDetay.Ilce;
            txtPostaKodu.Text = siparisDetay.PostaKodu;
            txtSehir.Text = siparisDetay.Sehir;
            txtSiparisDurumu.Text = siparisDetay.Durum;
            txtTc.Text = siparisDetay.TC;
            txtTelefon.Text = siparisDetay.Telefon;
            ltrKargo.Text = kargoGetir.KargoAdi;
            ltrKullaniciTip.Text = siparisDetay.Tip;
            ltrOdemeSekli.Text = siparisDetay.OdemeSekli;
            ltrSiparisTarihi.Text = siparisDetay.EklenmeTarihi;
            ltrTutar.Text = string.Format("{0:c}", siparisDetay.Tutar);

            if (siparisDetay.OdemeSekli=="Havale / EFT")
            {
                bankaHesap.Visible = true;
                var bankaGetir = db.ETICARET_BankaHesaps.Where(m => m.ID == siparisDetay.BankaHesap).First();
                ltrBankaHesap.Text = bankaGetir.Banka + " " + bankaGetir.SubeAdi + " Şubesi Şube Kodu : " + bankaGetir.SubeKodu + " Hesap No : " + bankaGetir.HesapNo + " İBAN : " + bankaGetir.IBAN;
            }

            var sepetSiparisGetir = from s in db.ETICARET_SepetSiparis.Where(m => m.EklenmeTarihi == siparisDetay.EklenmeTarihi)
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

            if (siparisDetay.UyeID != 0)
            {
                uyeVar.Visible = true;
                uyeYok.Visible = false;
                uyeLink = "uyedetay.aspx?ID=" + siparisDetay.UyeID;

            }
            else
            {
                uyeVar.Visible = false;
                uyeYok.Visible = true;
                ltrIp.Text = siparisDetay.IP;
            }



            if (siparisDetay.Onay == 1)
            {
                chkOnay.Checked = true;
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            int onay;
            onay = (chkOnay.Checked) ? 1 : 0;
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            var siparisDuzenle = db.ETICARET_Siparis.Where(m => m.ID == ID).FirstOrDefault();
            siparisDuzenle.Onay = onay;
            siparisDuzenle.Durum = txtSiparisDurumu.Text;

            db.SubmitChanges();
            pnlBasarili.Visible = true;
            pnlHata.Visible = false;
            Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='2; url=siparisler.aspx'/>"));
        }
        catch (Exception)
        {
            pnlBasarili.Visible = false;
            pnlHata.Visible = true;
        }
    }

}