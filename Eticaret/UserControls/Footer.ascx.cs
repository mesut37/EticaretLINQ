using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Footer : System.Web.UI.UserControl
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var sayfalar = from u in db.ETICARET_Sayfalars.Where(m => m.Durum == 1 & m.Alt == 1) select u;
            var kategoriler = from u in db.ETICARET_Kategoris.Where(m => m.Durum == 1 & m.Alt == 1) select u;

            rptSayfalar.DataSource = sayfalar;
            rptSayfalar.DataBind();

            rptKategoriler.DataSource = kategoriler;
            rptKategoriler.DataBind();


            var ayarlar = db.ETICARET_Ayarlars.FirstOrDefault();
            ltrAdres.Text = ayarlar.Adres;
            ltrEmail.Text = ayarlar.Email;
            ltrFax.Text = ayarlar.Fax;
            ltrTelefon.Text = ayarlar.Telefon;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtEbulten.Text != "")
            {
                ETICARET_EBulten bulteneEkle = new ETICARET_EBulten()
                {
                    Email = txtEbulten.Text,
                    EklenmeTarihi = DateTime.Now.ToString(),
                };
                db.ETICARET_EBultens.InsertOnSubmit(bulteneEkle);
                db.SubmitChanges();
                lblMesaj.Text = "Ebültene başarıyla kaydoldunuz..";
            }


        }
        catch (Exception)
        {
            lblMesaj.Text = "Bir hata meydana geldi. Daha sonra tekrar deneyin..";
        }
    }
}