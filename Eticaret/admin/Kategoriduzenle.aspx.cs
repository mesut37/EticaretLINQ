using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Kategoriduzenle : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "ckfinder/";
        _FileBrowser.SetupCKEditor(txtDetay);
        if (!Page.IsPostBack)
        {

            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            var kategoriGetir = db.ETICARET_Kategoris.Where(m => m.ID == ID).FirstOrDefault();

            var kategoriler = from u in db.ETICARET_Kategoris.Where(m => m.AltID == 0)
                              select u;

            foreach (var item in kategoriler)
            {
                drpKategoriler.Items.Add(new ListItem(item.KategoriAdi, item.ID.ToString()));
                altKategoriGetir(item.KategoriAdi, item.ID);
            }

            drpKategoriler.Items.Insert(0, new ListItem("- Ana Kategori -", "0"));
            drpKategoriler.SelectedValue = kategoriGetir.AltID.ToString();


            txtKategoriAdi.Text = kategoriGetir.KategoriAdi;
            txtTitle.Text = kategoriGetir.Title;
            txtDescription.Text = kategoriGetir.Description;
            txtKeywords.Text = kategoriGetir.Keywords;
            txtSira.Text = kategoriGetir.Sira;
            txtDetay.Text = kategoriGetir.Detay;
            imgKategori.ImageUrl = "../Dosyalar/Kategori/Mini/" + kategoriGetir.Resim;

            chkResimVitrin.Checked = (Convert.ToInt32(kategoriGetir.ResimVitrin) == 1) ? true : false;
            chkAltmenu.Checked = (Convert.ToInt32(kategoriGetir.Alt) == 1) ? true : false;
            chkDurum.Checked = (Convert.ToInt32(kategoriGetir.Durum) == 1) ? true : false;


        }
    }
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            var kategoriGuncelle = db.ETICARET_Kategoris.Where(m => m.ID == ID).FirstOrDefault();

            int resimvitrin, altmenu, durum;
            resimvitrin = (chkResimVitrin.Checked) ? 1 : 0;
            altmenu = (chkAltmenu.Checked) ? 1 : 0;
            durum = (chkDurum.Checked) ? 1 : 0;

            string dosyaAdi;
            if (fuKategori.HasFile)
            {
                string filenameadd = DateTime.Now.ToString().Replace(" ", "_").Replace(":", "_").Replace(".", "_").Replace("/", "_");
                string uzanti = Path.GetExtension(fuKategori.FileName);
                dosyaAdi = filenameadd + uzanti;
                fuKategori.PostedFile.SaveAs(Server.MapPath("~/Dosyalar/Kategori/") + dosyaAdi);

                System.Drawing.Image imgResim = null;
                System.Drawing.Image imgOrijinalResim = System.Drawing.Image.FromFile(Server.MapPath("~/Dosyalar/Kategori/" + dosyaAdi));
                imgResim = resimboyutlandir.FixedSize(imgOrijinalResim, 290, 290);
                imgResim.Save(Server.MapPath("~/Dosyalar/Kategori/Mini/" + dosyaAdi));
                imgResim.Dispose();
            }
            else
            {
                dosyaAdi = kategoriGuncelle.Resim;
            }

            kategoriGuncelle.KategoriAdi = txtKategoriAdi.Text;
            kategoriGuncelle.Detay = txtDetay.Text;
            kategoriGuncelle.Title = txtTitle.Text;
            kategoriGuncelle.Description = txtDescription.Text;
            kategoriGuncelle.Keywords = txtKeywords.Text;
            kategoriGuncelle.Resim = dosyaAdi;
            kategoriGuncelle.Durum = durum;
            kategoriGuncelle.ResimVitrin = resimvitrin;
            kategoriGuncelle.Alt = altmenu;
            kategoriGuncelle.AltID = Convert.ToInt32(drpKategoriler.SelectedValue);
            kategoriGuncelle.Sira = txtSira.Text;

            db.SubmitChanges();



            pnlHata.Visible = false;
            pnlBasarili.Visible = true;
            Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='2; url=kategoriler.aspx'/>"));

        }
        catch (Exception)
        {
            pnlHata.Visible = true;
            pnlBasarili.Visible = false;
        }


    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("kategoriekle.aspx");
    }
}