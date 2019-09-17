using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_uyedetay : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            var uye = db.ETICARET_Uyelers.Where(m => m.ID == ID).FirstOrDefault();
            txtAdres.Text = uye.Adres;
            txtAdSoyad.Text = uye.Ad + " " + uye.Soyad;
            txtCinsiyet.Text = (Convert.ToInt32(uye.Cinsiyet) == 1) ? "Erkek" : "Kadın";
            txtEklenme.Text = uye.EklenmeTarihi;
            txtEmail.Text = uye.Email;
            txtIlce.Text = uye.Ilce;
            txtSehir.Text = uye.Sehir;
            txtPostaKodu.Text = uye.PostaKodu;
            txtTc.Text = uye.TC;
            txtTelefon.Text = uye.Telefon;
            chkKampanya.Checked = (uye.Kampanya == 1) ? true : false;
            chkOnay.Checked = (uye.Onay == 1) ? true : false;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            int onay;
            onay = (chkOnay.Checked) ? 1 : 0;
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            var uyeGuncelle = db.ETICARET_Uyelers.Where(m => m.ID == ID).FirstOrDefault();
            uyeGuncelle.Onay = onay;
            db.SubmitChanges();

            db.SubmitChanges();
            pnlHata.Visible = false;
            pnlBasarili.Visible = true;
            Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='2; url=uyeler.aspx'/>"));

        }
        catch (Exception)
        {
            pnlHata.Visible = true;
            pnlBasarili.Visible = false;
        }
    }
}