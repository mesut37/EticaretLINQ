using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sayfaekle : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected override void OnLoad(EventArgs e)
    {
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "../ckfinder/";
        _FileBrowser.SetupCKEditor(txtDetay);

        if (!Page.IsPostBack)
        {

        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        try
        {
            int durum, ust, alt;
            durum = (chkDurum.Checked) ? 1 : 0;
            ust = (chkUst.Checked) ? 1 : 0;
            alt = (chkAlt.Checked) ? 1 : 0;

            ETICARET_Sayfalar sayfaEkle = new ETICARET_Sayfalar()
            {
                Baslik = txtSayfaAdi.Text,
                Detay = txtDetay.Text,
                Title = txtTitile.Text,
                Description = txtDescription.Text,
                Keywords = txtKeywords.Text,
                Sira = txtSira.Text,
                Durum = durum,
                Alt=alt,
                Ust=ust,
            };
            db.ETICARET_Sayfalars.InsertOnSubmit(sayfaEkle);
            db.SubmitChanges();
            pnlBasarili.Visible = true;
            pnlHata.Visible = false;
            Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='2; url=sayfalar.aspx'/>"));


        }
        catch (Exception)
        {
            pnlBasarili.Visible = false;
            pnlHata.Visible = true;
        }
    }
}