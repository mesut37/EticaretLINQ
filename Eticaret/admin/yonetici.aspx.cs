using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_yonetici : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var yoneticiGetir = db.ETICARET_Giris.FirstOrDefault();
            txtKullaniciAdi.Text = yoneticiGetir.KullaniciAdi;
            txtSifre.Attributes.Add("value", yoneticiGetir.Sifre);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
             var yoneticiGuncelle = db.ETICARET_Giris.FirstOrDefault();
             yoneticiGuncelle.KullaniciAdi = txtKullaniciAdi.Text;
             yoneticiGuncelle.Sifre = txtSifre.Text;
             db.SubmitChanges();
             pnlBasarili.Visible = true;
             pnlHata.Visible = false;
             Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='2; url=yonetici.aspx'/>"));


        }
        catch (Exception)
        {
            pnlBasarili.Visible = false;
            pnlHata.Visible = true;
        }
    }
}