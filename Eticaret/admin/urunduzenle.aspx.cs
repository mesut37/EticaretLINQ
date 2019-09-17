using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_urunduzenle : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    public void altKategoriGetir(string kategoriAdi, int ID)
    {
        var altkategori = from u in db.ETICARET_Kategoris.Where(m => m.AltID == ID)
                          select u;


        foreach (var item2 in altkategori)
        {
            drpKategoriler.Items.Add(new ListItem(kategoriAdi + " > " + item2.KategoriAdi, item2.ID.ToString()));

            altKategoriGetir(item2.KategoriAdi, item2.ID);
        }

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "../ckfinder/";
        _FileBrowser.SetupCKEditor(txtDetay);

        if (!Page.IsPostBack)
        {

            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            var urun = db.ETICARET_Urunlers.Where(m => m.ID == ID).FirstOrDefault();
            txtAlisFiyat.Text = Math.Round(Convert.ToDecimal(urun.AlisFiyat), 2).ToString();
            txtDescription.Text = urun.Description;
            txtDetay.Text = urun.Detay;
            txtIndirimliFiyat.Text = Math.Round(Convert.ToDecimal(urun.IndirimliFiyat), 2).ToString();
            txtKArgoAgirlik.Text = urun.KargoAgirlik;
            txtKdv.Text = urun.Kdv.ToString();
            txtKeywords.Text = urun.Keywords;
            txtOdeme.Text = urun.OdemeSecenekleri;
            txtSira.Text = urun.Sira;
            txtStok.Text = urun.Stok.ToString();
            txtStokKodu.Text = urun.StokKodu;
            txtTitle.Text = urun.Title;
            txtUrunAdi.Text = urun.UrunAdi;
            imgUrun.ImageUrl = "../Dosyalar/Urun/Mini/" + urun.Resim;
            chkDurum.Checked = (urun.Durum == 1) ? true : false;
            chkFirsat.Checked = (urun.Firsat == 1) ? true : false;
            chkVitrin.Checked = (urun.Vitrin == 1) ? true : false;
            chkYeni.Checked = (urun.Yeni == 1) ? true : false;


            var markalar = from u in db.ETICARET_Markalars
                           select u;
            drpMarkalar.DataSource = markalar;
            drpMarkalar.DataValueField = "ID";
            drpMarkalar.DataTextField = "MarkaAdi";
            drpMarkalar.DataBind();
            drpMarkalar.Items.Insert(0, new ListItem("- Marka Seçilmemiş -", "0"));

            var kategoriler = from u in db.ETICARET_Kategoris.Where(m => m.AltID == 0)
                              select u;

            var cokluResimler = from u in db.ETICARET_UrunResimleris.Where(m => m.UrunID == urun.ID)
                                select u;
            rptCokluResimler.DataSource = cokluResimler;
            rptCokluResimler.DataBind();

            int resimAdet = cokluResimler.Count();
            divcokluResimler.Visible = (resimAdet <= 0) ? false : true;


            foreach (var item in kategoriler)
            {
                drpKategoriler.Items.Add(new ListItem(item.KategoriAdi, item.ID.ToString()));
                altKategoriGetir(item.KategoriAdi, item.ID);
            }

            drpKategoriler.Items.Insert(0, new ListItem("- Ana Kategori -", "0"));
            drpKategoriler.SelectedValue = urun.KatID.ToString();
            drpMarkalar.SelectedValue = urun.MarkaID.ToString();

        }
    }
    protected void btnDuzenle_Click(object sender, EventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            var urunGuncelle = db.ETICARET_Urunlers.Where(m => m.ID == ID).FirstOrDefault();

            int durum, yeni, firsat, vitrin;
            durum = (chkDurum.Checked) ? 1 : 0;
            yeni = (chkYeni.Checked) ? 1 : 0;
            firsat = (chkFirsat.Checked) ? 1 : 0;
            vitrin = (chkVitrin.Checked) ? 1 : 0;


            string dosyaAdi;
            if (fuUrun.HasFile)
            {
                string filenameadd = DateTime.Now.ToString().Replace(" ", "_").Replace(":", "_").Replace(".", "_").Replace("/", "_");
                string uzanti = Path.GetExtension(fuUrun.FileName);
                dosyaAdi = filenameadd + uzanti;
                fuUrun.PostedFile.SaveAs(Server.MapPath("~/Dosyalar/Urun/") + dosyaAdi);

                System.Drawing.Image imgResim = null;
                System.Drawing.Image imgOrijinalResim = System.Drawing.Image.FromFile(Server.MapPath("~/Dosyalar/Urun/" + dosyaAdi));
                imgResim = resimboyutlandir.FixedSize(imgOrijinalResim, 250, 250);
                imgResim.Save(Server.MapPath("~/Dosyalar/Urun/Mini/" + dosyaAdi));
                imgResim.Dispose();
            }
            else
            {
                dosyaAdi = urunGuncelle.Resim;
            }

            urunGuncelle.UrunAdi = txtUrunAdi.Text;
            urunGuncelle.Sira = txtSira.Text;
            urunGuncelle.AlisFiyat = decimal.Parse(txtAlisFiyat.Text);
            urunGuncelle.Description = txtDescription.Text;
            urunGuncelle.Detay = txtDetay.Text;
            urunGuncelle.IndirimliFiyat = decimal.Parse(txtIndirimliFiyat.Text);
            urunGuncelle.KargoAgirlik = txtKArgoAgirlik.Text;
            urunGuncelle.Kdv = int.Parse(txtKdv.Text);
            urunGuncelle.Keywords = txtKeywords.Text;
            urunGuncelle.MarkaID = int.Parse(drpMarkalar.SelectedValue);
            urunGuncelle.OdemeSecenekleri = txtOdeme.Text;
            urunGuncelle.KatID = int.Parse(drpKategoriler.SelectedValue);
            urunGuncelle.Resim = dosyaAdi;
            urunGuncelle.StokKodu = txtStokKodu.Text;
            urunGuncelle.Stok = int.Parse(txtStok.Text);
            urunGuncelle.Title = txtTitle.Text;
            urunGuncelle.Durum = durum;
            urunGuncelle.Yeni = yeni;
            urunGuncelle.Firsat = firsat;
            urunGuncelle.Vitrin = vitrin;

            db.SubmitChanges();

            pnlHata.Visible = false;
            pnlBasarili.Visible = true;

             HttpFileCollection hfc = Request.Files;
             for (int i = 0; i < hfc.Count; i++)
             {
                 HttpPostedFile files = hfc[i];
                 if (files.ContentLength > 0)
                 {

                     string benzersiz2 = "";
                     benzersiz2 += DateTime.Now.Day.ToString() + i;
                     benzersiz2 += DateTime.Now.Month.ToString() + i;
                     benzersiz2 += DateTime.Now.Second.ToString() + i;
                     benzersiz2 += DateTime.Now.Millisecond.ToString() + i;
                     benzersiz2 += DateTime.Now.Year.ToString() + i;
                     benzersiz2 += DateTime.Now.Minute.ToString() + i;
                     benzersiz2 += DateTime.Now.Hour.ToString();
                     files.SaveAs(Server.MapPath("~/Dosyalar/CokluResim/") + System.IO.Path.GetFileName(benzersiz2 + fileupload.FileName));


                     System.Drawing.Image imgResim = null;
                     System.Drawing.Image imgOrijinalResim = System.Drawing.Image.FromFile(Server.MapPath("~/Dosyalar/CokluResim/" + benzersiz2 + fileupload.FileName));
                     imgResim = resimboyutlandir.FixedSize(imgOrijinalResim, 350, 310);
                     imgResim.Save(Server.MapPath("~/Dosyalar/CokluResim/Mini/" + benzersiz2 + fileupload.FileName));
                     imgResim.Dispose();


                     ETICARET_UrunResimleri resimleriEkle = new ETICARET_UrunResimleri()
                     {
                         Resim = benzersiz2 + fileupload.FileName,
                         UrunID = ID,
                     };

                     db.ETICARET_UrunResimleris.InsertOnSubmit(resimleriEkle);
                     db.SubmitChanges();
                 }
             }

            Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='2; url=urunler.aspx'/>"));
        }
        catch (Exception)
        {
            pnlHata.Visible = true;
            pnlBasarili.Visible = false;
        }
    }
    protected void btnYeni_Click(object sender, EventArgs e)
    {
        Response.Redirect("urunekle.aspx");
    }
    protected void btnClose_Click(object sender, EventArgs e)
    {

    }
    protected void rptCokluResimler_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "sil")
        {
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            var cokluResimsil = db.ETICARET_UrunResimleris.Where(m => m.ID == Convert.ToInt32(e.CommandArgument.ToString())).FirstOrDefault();
            db.ETICARET_UrunResimleris.DeleteOnSubmit(cokluResimsil);
            db.SubmitChanges();
            

            Response.Redirect("urunduzenle.aspx?ID=" + ID);
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        int ID = Convert.ToInt32(Request.QueryString["ID"]);

        var tumResimleriSil = from u in db.ETICARET_UrunResimleris.Where(m => m.UrunID == ID) select u;
        db.ETICARET_UrunResimleris.DeleteAllOnSubmit(tumResimleriSil);
        db.SubmitChanges();

        Response.Redirect("urunduzenle.aspx?ID=" + ID);
    }
}