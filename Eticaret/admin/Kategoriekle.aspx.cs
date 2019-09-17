using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Kategoriekle : System.Web.UI.Page
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
            int resimVitrin, altmenu, durum;
            resimVitrin = (chkResimVitrin.Checked) ? 1 : 0;
            altmenu = (chkAltMenu.Checked) ? 1 : 0;
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
                dosyaAdi = "resimyok.jpg";
            }

            ETICARET_Kategori Ekle = new ETICARET_Kategori()
           {
               KategoriAdi = txtKategoriAdi.Text,
               Title = txtTitle.Text,
               Description = txtDescription.Text,
               Keywords = txtKeywords.Text,
               Detay = txtDetay.Text,
               Durum = durum,
               ResimVitrin=resimVitrin,
               Alt = altmenu,
               AltID = Convert.ToInt32(drpKategoriler.SelectedValue),
               Sira = txtSira.Text,
               Resim=dosyaAdi,

           };


            db.ETICARET_Kategoris.InsertOnSubmit(Ekle);
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
}