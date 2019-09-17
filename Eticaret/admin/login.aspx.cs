using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_login : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["login"] != null)
            {
                Response.Redirect("default.aspx");
            }
            else
            {
                txtKullaniciAdi.Text = "";
                txtSifre.Text = "";
            }
          
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            var loginkontrol = db.ETICARET_Giris.Where(m => m.KullaniciAdi == txtKullaniciAdi.Text && m.Sifre == txtSifre.Text).FirstOrDefault();
            if (loginkontrol != null)
            {
                Session["login"] = loginkontrol.KullaniciAdi;
                pnlBasarili.Visible = true;
                pnlHata.Visible = false;
                Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='2; url=default.aspx'/>"));
            }
            else
            {
                pnlBasarili.Visible = false;
                pnlHata.Visible = true;
            }
        }
        catch (Exception)
        {
            pnlBasarili.Visible = false;
            pnlHata.Visible = true;
        }
    }
}