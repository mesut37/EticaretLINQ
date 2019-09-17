using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adressecimi : System.Web.UI.Page
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
                    Response.Redirect("/anasayfa");
                }
                else
                {

                }
                var uye = db.ETICARET_Uyelers.Where(m => m.ID == Convert.ToInt32(Session["UyeID"])).FirstOrDefault();
                txtAdres.Text = uye.Adres;
                txtAdSoyad.Text = uye.Ad + " " + uye.Soyad;
                txtFaturaIsim.Text = uye.Ad + " " + uye.Soyad;
                txtIlce.Text = uye.Ilce;
                txtPostaKodu.Text = uye.PostaKodu;
                txtTc.Text = uye.TC;
                txtTelefon.Text = uye.Telefon;
                drpIl.SelectedItem.Text = uye.Sehir.ToString();

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

                toplam = siparisOzeti.Sum(m => Convert.ToDouble(m.Adet * (m.IndirimliFiyat + (m.IndirimliFiyat / 100 * Convert.ToInt32(m.Kdv)))));
                ltrToplam.Text = string.Format("{0:c}", toplam.ToString());


                siparistutar = siparisOzeti.Sum(m => Convert.ToDouble(m.Adet * (m.IndirimliFiyat)));
                ltrSiparisTutari.Text = string.Format("{0:c}", siparistutar.ToString());

                kdvtutar = siparisOzeti.Sum(m => Convert.ToDouble(m.Adet * (m.IndirimliFiyat / 100 * Convert.ToInt32(m.Kdv))));
                ltrKdvTutar.Text = string.Format("{0:c}", kdvtutar.ToString());
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

                }

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

                toplam = siparisOzeti.Sum(m => Convert.ToDouble(m.Adet * (m.IndirimliFiyat + (m.IndirimliFiyat / 100 * Convert.ToInt32(m.Kdv)))));
                ltrToplam.Text = string.Format("{0:c}", toplam.ToString());


                siparistutar = siparisOzeti.Sum(m => Convert.ToDouble(m.Adet * (m.IndirimliFiyat)));
                ltrSiparisTutari.Text = string.Format("{0:c}", siparistutar.ToString());

                kdvtutar = siparisOzeti.Sum(m => Convert.ToDouble(m.Adet * (m.IndirimliFiyat / 100 * Convert.ToInt32(m.Kdv))));
                ltrKdvTutar.Text = string.Format("{0:c}", kdvtutar.ToString());
            }

            var kargolar = from u in db.ETICARET_Kargos select u;
            foreach (var item in kargolar)
            {
                drpKargo.Items.Add(new ListItem(item.KargoAdi + " >>> Fiyat " + string.Format("{0:c}", item.Fiyat), item.ID.ToString()));
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
    protected void btnDevam_Click(object sender, EventArgs e)
    {
        string kullaniciTip="";
        kullaniciTip=(rdBiryesel.Checked)?"Bireysel":"Kurumsal";


        Session["AdSoyad"] = txtAdSoyad.Text;
        Session["Telefon"] = txtTelefon.Text;
        Session["Kargo"] = drpKargo.SelectedValue;
        Session["Il"] = drpIl.SelectedItem.ToString();
        Session["Ilce"] = txtIlce.Text;
        Session["Adres"] = txtAdres.Text;
        Session["PostaKodu"] = txtPostaKodu.Text;
        Session["KullaniciTip"] = kullaniciTip;
        Session["faturaIsim"] = txtFaturaIsim.Text;
        Session["TC"] = txtTc.Text;

        string payment = Guid.NewGuid().ToString();
        Session["payment"] = payment;
        Response.Redirect("/odeme/" + payment);
    }
}