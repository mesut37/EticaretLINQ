using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sayfaduzenle : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "ckfinder/";
        _FileBrowser.SetupCKEditor(txtDetay);

        if (!IsPostBack)
        {
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            var sayfaGetir = db.ETICARET_Sayfalars.Where(m => m.ID == ID).FirstOrDefault();
            txtDescription.Text = sayfaGetir.Description;
            txtTitile.Text = sayfaGetir.Title;
            txtKeywords.Text = sayfaGetir.Keywords;
            txtSayfaAdi.Text = sayfaGetir.Baslik;
            txtSira.Text = sayfaGetir.Sira.ToString();
            txtDetay.Text = sayfaGetir.Detay;

            chkAlt.Checked = (sayfaGetir.Alt == 1) ? true : false;
            chkUst.Checked = (sayfaGetir.Ust == 1) ? true : false;
            chkDurum.Checked = (sayfaGetir.Durum == 1) ? true : false;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("sayfaekle.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            var sayfaGetir = db.ETICARET_Sayfalars.Where(m => m.ID == ID).FirstOrDefault();

            int durum, ust, alt;
            durum = (chkDurum.Checked) ? 1 : 0;
            ust = (chkUst.Checked) ? 1 : 0;
            alt = (chkAlt.Checked) ? 1 : 0;

            sayfaGetir.Alt = alt;
            sayfaGetir.Ust = ust;
            sayfaGetir.Durum = durum;
            sayfaGetir.Baslik = txtSayfaAdi.Text;
            sayfaGetir.Detay = txtDetay.Text;
            sayfaGetir.Sira = txtSira.Text;
            sayfaGetir.Title = txtTitile.Text;
            sayfaGetir.Description = txtDescription.Text;
            sayfaGetir.Keywords = txtKeywords.Text;
            sayfaGetir.Keywords = txtKeywords.Text;
            db.SubmitChanges();

            pnlHata.Visible = false;
            pnlBasarili.Visible = true;
            Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='2; url=sayfalar.aspx'/>"));
        }
        catch (Exception)
        {
            pnlBasarili.Visible = false;
            pnlHata.Visible = true;
        }
    }
}