using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_yorumdetay : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            int uyeID = Convert.ToInt32(Request.QueryString["uyeID"]);
            var yorumGetir = db.ETICARET_Yorumlars.Where(m => m.ID == ID).FirstOrDefault();
            var uyeGetir = db.ETICARET_Uyelers.Where(m => m.ID == uyeID).FirstOrDefault();
            var urunGetir = db.ETICARET_Urunlers.Where(m => m.ID == yorumGetir.UrunID).FirstOrDefault();

            txtAdSoyad.Text = uyeGetir.Ad + " " + uyeGetir.Soyad;
            txtEklenme.Text = yorumGetir.EklenmeTarihi;
            txtEmail.Text = uyeGetir.Email;
            txtTelefon.Text = uyeGetir.Telefon;
            txtUrunAdi.Text = urunGetir.UrunAdi;
            txtYorum.Text = yorumGetir.Yorum;
            chkOnay.Checked = (yorumGetir.Onay == 1) ? true : false;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            var yorumGuncelle = db.ETICARET_Yorumlars.Where(m => m.ID == ID).FirstOrDefault();

            int onay;
            onay = (chkOnay.Checked) ? 1 : 0;
            yorumGuncelle.Onay = onay;
            db.SubmitChanges();
            pnlBasarili.Visible = true;
            pnlHata.Visible = false;
            Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='2; url=urunyorumlari.aspx'/>"));
        }
        catch (Exception)
        {

            pnlBasarili.Visible = false;
            pnlHata.Visible = true;
        }
    }
}