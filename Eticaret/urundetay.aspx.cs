using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class urundetay : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    Constant cons = new Constant();
    Tools tool = new Tools();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (RouteData.Values["ID"] != null)
            {
                try
                {
                    int ID = Convert.ToInt32(RouteData.Values["ID"]);
                    var urun = db.ETICARET_Urunlers.Where(m => m.ID == ID).FirstOrDefault();
                    var altkategori = db.ETICARET_Kategoris.Where(m => m.ID == urun.KatID).FirstOrDefault();
                    var ustkategori = db.ETICARET_Kategoris.Where(m => m.ID == altkategori.AltID).FirstOrDefault();

                    if (urun.Stok > 0)
                    {
                        //sepetGoster.Visible = true;
                        tukendi.Visible = false;
                    }
                    else
                    {
                        //sepetGoster.Visible = false;
                        tukendi.Visible = true;
                    }


                    if (urun.MarkaID != 0)
                    {
                        var marka = db.ETICARET_Markalars.Where(m => m.ID == urun.MarkaID).FirstOrDefault();
                        ltrMarka.Text = marka.MarkaAdi;
                    }
                    else
                    {
                        ltrMarka.Text = "Belirtilmemiş";
                    }

                    ltrAltKategori.Text = altkategori.KategoriAdi;
                    ltrUstKategori.Text = ustkategori.KategoriAdi;
                    ltrUrunAdi.Text = urun.UrunAdi;

                    var yorumlar = from u in db.ETICARET_Yorumlars.Where(m => m.UrunID == ID & m.Onay == 1)
                                   join a in db.ETICARET_Uyelers on u.UyeID equals a.ID
                                   select new
                                   {
                                       a.Ad,
                                       a.Soyad,
                                       u.EklenmeTarihi,
                                       u.ID,
                                       u.Onay,
                                       u.UrunID,
                                       u.UyeID,
                                       u.Yorum
                                   };
                    rptYorumlar.DataSource = yorumlar;
                    rptYorumlar.DataBind();


                    int yorumAdet = (from u in db.ETICARET_Yorumlars.Where(m => m.UrunID == urun.ID) select u).Count();
                    if (yorumAdet <= 0)
                    {
                        pnlIlkYorum.Visible = true;
                    }

                    if (Session["UyeID"] != null)
                    {
                        pnlYorumOn.Visible = true;
                        pnlYorumOf.Visible = false;
                    }
                    else
                    {
                        pnlYorumOf.Visible = true;
                        pnlYorumOn.Visible = false;
                    }


                    double indirimliFiyat = Convert.ToDouble(urun.IndirimliFiyat);
                    int alisFiyati = Convert.ToInt32(urun.AlisFiyat);
                    double indirimOrani = ((alisFiyati - indirimliFiyat) / alisFiyati) * 100;

                    ltrIndirim.Text = "% " + Math.Floor(indirimOrani);

                    decimal alisTutar = Convert.ToDecimal(urun.AlisFiyat) + Convert.ToDecimal((urun.AlisFiyat * urun.Kdv) / 100);
                    ltrAlisFiyati.Text = string.Format("{0:c}", alisTutar);


                    decimal fiyat = Convert.ToDecimal(urun.IndirimliFiyat) + Convert.ToDecimal((urun.IndirimliFiyat * urun.Kdv) / 100);
                    ltrFiyat.Text = string.Format("{0:c}", fiyat);

                    if (urun.IndirimliFiyat >= urun.AlisFiyat)
                    {
                        alisFiyatGoster.Visible = false;
                        ltrFiyatAdi.Text = "Fiyat";
                        divIndirimOrani.Visible = false;

                    }
                    else
                    {
                        alisFiyatGoster.Visible = true;
                        divIndirimOrani.Visible = true;
                        ltrFiyatAdi.Text = "İndirimli Fiyat";
                    }

                    ltrUrunDetay.Text = urun.Detay;
                    ltrOdemeSecenekleri.Text = urun.OdemeSecenekleri;

                    var cokluResimler = from u in db.ETICARET_UrunResimleris.Where(m => m.UrunID == urun.ID)
                                        select u;
                    rptCokluUrunler.DataSource = cokluResimler;
                    rptCokluUrunler.DataBind();

                    var benzerUrunler = (from u in db.ETICARET_Urunlers.Where(m => m.KatID == urun.KatID & m.ID != urun.ID)
                                         select u).Take(5).OrderBy(x => Guid.NewGuid());
                    rptBenzerUrunler.DataSource = benzerUrunler;
                    rptBenzerUrunler.DataBind();


                    Page.Title = urun.Title + " " + cons.title;
                    Page.MetaDescription = urun.Description + " " + cons.description;
                    Page.MetaKeywords = urun.Keywords + " " + cons.keywords;

                }
                catch (Exception)
                {

                }

            }
            else
            {
                Response.Redirect("/anasafa");
            }
        }
    }
    public string kdvDahil(decimal fiyat, int kdv)
    {
        decimal toplamTutar = fiyat + Convert.ToDecimal((fiyat * kdv) / 100);
        return string.Format("{0:c}", toplamTutar);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(RouteData.Values["ID"]);
            var urun = db.ETICARET_Urunlers.Where(m => m.ID == ID).FirstOrDefault();
            ETICARET_Yorumlar yorumYap = new ETICARET_Yorumlar()
            {

                EklenmeTarihi = DateTime.Now.ToString(),
                UrunID = urun.ID,
                UyeID = Convert.ToInt32(Session["UyeID"]),
                Yorum = txtYorum.Text,
                Onay = 0,
            };
            db.ETICARET_Yorumlars.InsertOnSubmit(yorumYap);
            db.SubmitChanges();
            basarili.Visible = true;
            basarisiz.Visible = false;

        }
        catch (Exception)
        {
            basarili.Visible = false;
            basarisiz.Visible = true;
        }
    }
    protected void lbkUyeGirisi_Click(object sender, EventArgs e)
    {
        Session["YorumSession"] = RouteData.Values["ID"];
        Response.Redirect("/uyegirisi");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        var urunGetir = db.ETICARET_Urunlers.Where(m => m.ID == Convert.ToInt32(RouteData.Values["ID"])).FirstOrDefault();

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
                //int adet;
                //if (urunGetir.Stok < Convert.ToInt32(drpAdet.SelectedValue))
                //{
                //    adet = Convert.ToInt32(urunGetir.Stok);
                //}
                //else
                //{
                //    adet = Convert.ToInt32(drpAdet.SelectedValue);
                //}
                ETICARET_Sepet sepeteEkle = new ETICARET_Sepet()
                    {
                        //Adet = adet,
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
                int adet;
                //if (urunGetir.Stok < Convert.ToInt32(drpAdet.SelectedValue))
                //{
                //    adet = Convert.ToInt32(urunGetir.Stok);
                //}
                //else
                //{
                //    adet = Convert.ToInt32(drpAdet.SelectedValue);
                //}
                ETICARET_Sepet sepeteEkle = new ETICARET_Sepet()
                {
                    //Adet = adet,
                    EklenmeTarihi = DateTime.Now.ToString(),
                    UrunID = urunGetir.ID,
                    IP = Request.ServerVariables["REMOTE_ADDR"],

                };
                db.ETICARET_Sepets.InsertOnSubmit(sepeteEkle);
                db.SubmitChanges();
            }
        }


        Response.Redirect("/sepet");

    }
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        //lblMesaj.Text = tool.MailGonder(txtAdSoyad.Text, "info@.com", "info@.com", "Kastamonu Plastik Web Sitesi", "iletişim formu", true, "bu mail size kastamonuplastik.com sitesinden gönderilmiştir<br/><br/> Gönderenin <br/><br/> Adı : '" + txtAdSoyad.Text + "' <br/><br/> E-mail : '" + txtEmail.Text + "'<br/><br/>Mesajı : '" + txtMesaj.Text + "'", "mail.kastamonuplastik.com", "info@.com", "");
        //txtAdSoyad.Text = "";
        //txtEmail.Text = "";
        //txtAdet.Text = "";
        //txtNot.Text = "";
        //txtTelefon.Text = "";
        //txtYorum.Text = "";

       
    }
}