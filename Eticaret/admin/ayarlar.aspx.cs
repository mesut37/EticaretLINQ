using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ayarlar : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var ayarlar = db.ETICARET_Ayarlars.FirstOrDefault();
            txtAdres.Text = ayarlar.Adres;
            txtEmail.Text = ayarlar.Email;
            txtEmailSifre.Attributes.Add("value", ayarlar.EmailSifre);
            txtFax.Text = ayarlar.Fax;
            txtFirmaAdi.Text = ayarlar.FirmaAdi;
            txtSunucuEmail.Text = ayarlar.SunucuEmail;
            txtTelefon.Text = ayarlar.Telefon;
            txtTelefon2.Text = ayarlar.Telefon2;
            txtVergiDairesi.Text = ayarlar.VergiDairesi;
            txtVergiNo.Text = ayarlar.VergiNo;
            txtWeb.Text = ayarlar.WebAdresi;
            txtYetkiliKisi.Text = ayarlar.YetkiliKisi;
            
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            var ayarGuncelle = db.ETICARET_Ayarlars.FirstOrDefault();
            ayarGuncelle.Adres = txtAdres.Text;
            ayarGuncelle.Email = txtEmail.Text;
            ayarGuncelle.EmailSifre = txtEmailSifre.Text;
            ayarGuncelle.Fax = txtFax.Text;
            ayarGuncelle.FirmaAdi = txtFirmaAdi.Text;
            ayarGuncelle.SunucuEmail = txtSunucuEmail.Text;
            ayarGuncelle.Telefon = txtTelefon.Text;
            ayarGuncelle.Telefon2 = txtTelefon2.Text;
            ayarGuncelle.VergiDairesi = txtVergiDairesi.Text;
            ayarGuncelle.VergiNo = txtVergiNo.Text;
            ayarGuncelle.WebAdresi = txtWeb.Text;
            ayarGuncelle.YetkiliKisi = txtYetkiliKisi.Text;
            db.SubmitChanges();
            pnlBasarili.Visible = true;
            pnlHata.Visible = false;
            Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='2; url=ayarlar.aspx'/>"));

            
        }
        catch (Exception)
        {
            pnlBasarili.Visible = false;
            pnlHata.Visible = true;
        }
    }
}