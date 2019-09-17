using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_hesapduzenle : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            var banka = db.ETICARET_BankaHesaps.Where(m => m.ID == ID).FirstOrDefault();
            txtBanka.Text = banka.Banka;
            txtHesapNo.Text = banka.HesapNo;
            txtHesapTur.Text = banka.HesapTuru;
            txtIban.Text = banka.IBAN;
            txtSubeAdi.Text = banka.SubeAdi;
            txtSubeKodu.Text = banka.SubeKodu;
            
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
             int ID = Convert.ToInt32(Request.QueryString["ID"]);
        var bankaGuncelle = db.ETICARET_BankaHesaps.Where(m => m.ID == ID).FirstOrDefault();
        bankaGuncelle.Banka = txtBanka.Text;
        bankaGuncelle.HesapNo = txtHesapNo.Text;
        bankaGuncelle.HesapTuru = txtHesapTur.Text;
        bankaGuncelle.IBAN = txtIban.Text;
        bankaGuncelle.SubeAdi = txtSubeAdi.Text;
        bankaGuncelle.SubeKodu = txtSubeKodu.Text;

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