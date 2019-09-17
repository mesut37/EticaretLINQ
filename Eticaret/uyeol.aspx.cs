using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class uyeol : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    Constant cons = new Constant();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Page.Title = "Üye Ol" + " " + cons.title;
            Page.MetaDescription = "Üye Ol" + " " + cons.description;
            Page.MetaKeywords = "Üye Ol" + " " + cons.keywords;
        }
    }
    protected void btnGonder_Click(object sender, EventArgs e)
    {
        try
        {

            var emailKontrol = db.ETICARET_Uyelers.Where(m => m.Email == txtEmail.Text).FirstOrDefault();
            if (emailKontrol != null)
            {
                basarisiz.Visible = false;
                basarili.Visible = false;
                emailvar.Visible = true;
            }
            else
            {
                int cns = (rdErkek.Checked) ? 1 : 0;
                int kmp = (chkKampanya.Checked) ? 1 : 0;

                {
                    ETICARET_Uyeler uyeEkle = new ETICARET_Uyeler()
                    {
                        Ad = txtAd.Text,
                        Cinsiyet = cns,
                        EklenmeTarihi = DateTime.Now.ToString(),
                        Email = txtEmail.Text,
                        Kampanya = kmp,
                        Onay = 0,
                        Sehir = drpIl.SelectedItem.ToString(),
                        Ilce = txtIlce.Text,
                        Sifre = txtSifre.Text,
                        Soyad = txtSoyad.Text,
                        Telefon = txtTelefon.Text,
                        Adres = txtAdres.Text,


                    };

                    db.ETICARET_Uyelers.InsertOnSubmit(uyeEkle);
                    db.SubmitChanges();
                    basarili.Visible = true;
                    basarisiz.Visible = false;

                    Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='4; url=/uyegirisi'/>"));

                };
            }
        }
        catch (Exception)
        {

            basarisiz.Visible = true;
            basarili.Visible = false;

        }
    }


}