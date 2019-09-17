using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_kargoekle : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            ETICARET_Kargo Ekle = new ETICARET_Kargo()
           {
               KargoAdi = txtKargoAdi.Text,
               Fiyat = decimal.Parse(txtFiyat.Text),

           };

            db.ETICARET_Kargos.InsertOnSubmit(Ekle);
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