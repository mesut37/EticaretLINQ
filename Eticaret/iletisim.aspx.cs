using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class iletisim : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var iletisim = db.ETICARET_Ayarlars.FirstOrDefault();
            ltrAdres.Text = iletisim.Adres;
            ltrEmail.Text = iletisim.Email;
            ltrFax.Text = iletisim.Fax;
            ltrFirmaAdi.Text = iletisim.FirmaAdi;
            ltrTelefon.Text = iletisim.Telefon;
            ltrVergiNo.Text = iletisim.VergiNo;
            ltrYetkili.Text = iletisim.YetkiliKisi;
        }
    }
    protected void btnGonder_Click(object sender, EventArgs e)
    {
        //lblMesaj.Text = tool.MailGonder(txtAdSoyad.Text, "info@kastamonuplastik.com", "info@kastamonuplastik.com", "Kastamonu Plastik Web Sitesi", "iletişim formu", true, "bu mail size kastamonuplastik.com sitesinden gönderilmiştir<br/><br/> Gönderenin <br/><br/> Adı : '" + txtAdSoyad.Text + "' <br/><br/> E-mail : '" + txtEmail.Text + "'<br/><br/>Mesajı : '" + txtMesaj.Text + "'", "mail.kastamonuplastik.com", "info@kastamonuplastik.com", "K2525f");
        //txtAdSoyad.Text = "";
        //txtEmail.Text = "";
        //txtMesaj.Text = "";

        //Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='3; url=iletisim.aspx'/>"));
    }
}