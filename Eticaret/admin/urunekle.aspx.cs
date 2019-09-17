using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_urunekle : System.Web.UI.Page
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
        _FileBrowser.BasePath = "ckfinder/";
        _FileBrowser.SetupCKEditor(txtDetay);

        if (!Page.IsPostBack)
        {

            var markalar = from u in db.ETICARET_Markalars
                           select u;
            drpMarkalar.DataSource = markalar;
            drpMarkalar.DataValueField = "ID";
            drpMarkalar.DataTextField = "MarkaAdi";
            drpMarkalar.DataBind();
            drpMarkalar.Items.Insert(0, new ListItem("- Marka Seçilmemiş -", "0"));

            var kategoriler = from u in db.ETICARET_Kategoris.Where(m => m.AltID == 0)
                              select u;

            foreach (var item in kategoriler)
            {
                drpKategoriler.Items.Add(new ListItem(item.KategoriAdi, item.ID.ToString()));
                altKategoriGetir(item.KategoriAdi, item.ID);
            }

            drpKategoriler.Items.Insert(0, new ListItem("- Ana Kategori -", "0"));

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
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
                dosyaAdi = "resimyok.jpg";
            }


            ETICARET_Urunler ekle = new ETICARET_Urunler()
            {
                UrunAdi = txtUrunAdi.Text,
                Sira = txtSira.Text,
                AlisFiyat = decimal.Parse(txtAlisFiyat.Text),
                Description = txtDescription.Text,
                Detay = txtDetay.Text,
                IndirimliFiyat = decimal.Parse(txtIndirimliFiyat.Text),
                KargoAgirlik = txtKArgoAgirlik.Text,
                Kdv = int.Parse(txtKdv.Text),
                Keywords = txtKeywords.Text,
                MarkaID = int.Parse(drpMarkalar.SelectedValue),
                OdemeSecenekleri = txtOdeme.Text,
                KatID = int.Parse(drpKategoriler.SelectedValue),
                Resim = dosyaAdi,
                StokKodu = txtStokKodu.Text,
                Stok = int.Parse(txtStok.Text),
                Title = txtTitle.Text,
                Durum = durum,
                Yeni = yeni,
                Firsat = firsat,
                Vitrin = vitrin,

            };
            db.ETICARET_Urunlers.InsertOnSubmit(ekle);
            db.SubmitChanges();
            pnlHata.Visible = false;
            pnlBasarili.Visible = true;

            var CokluUrun = db.ETICARET_Urunlers.OrderByDescending(m => m.ID).FirstOrDefault();


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
                    files.SaveAs(Server.MapPath("~/Dosyalar/CokluResim/") + System.IO.Path.GetFileName(benzersiz2 + fuUrun.FileName));


                    
                    System.Drawing.Image imgResim = null;
                    System.Drawing.Image imgOrijinalResim = System.Drawing.Image.FromFile(Server.MapPath("~/Dosyalar/CokluResim/" + benzersiz2 + fuUrun.FileName));
                    imgResim = resimboyutlandir.FixedSize(imgOrijinalResim, 350, 310);
                    imgResim.Save(Server.MapPath("~/Dosyalar/CokluResim/Mini/" + benzersiz2 + fuUrun.FileName));
                    imgResim.Dispose();


                    ETICARET_UrunResimleri resimleriEkle = new ETICARET_UrunResimleri()
                    {
                        Resim = benzersiz2 + fuUrun.FileName,
                        UrunID=CokluUrun.ID,
                    };

                    db.ETICARET_UrunResimleris.InsertOnSubmit(resimleriEkle);
                    db.SubmitChanges();
                }

                Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='2; url=urunler.aspx'/>"));

            }

        }
        catch (Exception)
        {
            pnlHata.Visible = true;
            pnlBasarili.Visible = false;
        }
    }

    protected void btnClose_Click(object sender, EventArgs e)
    {
        
    }

}