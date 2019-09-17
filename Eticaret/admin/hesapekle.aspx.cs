using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_hesapekle : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            ETICARET_BankaHesap Ekle = new ETICARET_BankaHesap()
            {
               Banka=txtBanka.Text,
               HesapNo=txtHesapNo.Text,
               HesapTuru=txtHesapTur.Text,
               IBAN=txtIban.Text,
               SubeAdi=txtSubeAdi.Text,
               SubeKodu=txtSubeKodu.Text,

            };

            db.ETICARET_BankaHesaps.InsertOnSubmit(Ekle);
            db.SubmitChanges();
            pnlHata.Visible = false;
            pnlBasarili.Visible = true;
            Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='2; url=bankahesap.aspx'/>"));

        }
        catch (Exception)
        {
            pnlHata.Visible = true;
            pnlBasarili.Visible = false;
        }

    }
}