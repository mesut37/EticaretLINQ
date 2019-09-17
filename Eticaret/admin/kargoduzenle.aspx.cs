using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_kargoduzenle : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            var kargo = db.ETICARET_Kargos.Where(m => m.ID == ID).FirstOrDefault();
            txtFiyat.Text = Math.Round(Convert.ToDecimal(kargo.Fiyat), 2).ToString();
            txtKargoAdi.Text = kargo.KargoAdi;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            var kargoGuncelle = db.ETICARET_Kargos.Where(m => m.ID == ID).FirstOrDefault();
            kargoGuncelle.KargoAdi = txtKargoAdi.Text;
            kargoGuncelle.Fiyat = decimal.Parse(txtFiyat.Text);

            db.SubmitChanges();
            pnlHata.Visible = false;
            pnlBasarili.Visible = true;
            Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='2; url=kargo.aspx'/>"));
        }
        catch (Exception)
        {

            pnlHata.Visible = true;
            pnlBasarili.Visible = false;
        }
    }
}