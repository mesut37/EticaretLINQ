using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adresfatura : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    Constant cons = new Constant();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (RouteData.Values["Uye"] != null)
            {
                if (Convert.ToInt32(Session["UyeID"]) == Convert.ToInt32(RouteData.Values["Uye"]))
                {
                    var uye = db.ETICARET_Uyelers.Where(m => m.ID == Convert.ToInt32(Session["UyeID"])).FirstOrDefault();
                    drpIl.SelectedItem.Text = uye.Sehir;
                    txtIlce.Text = uye.Ilce;
                    txtPostaKodu.Text = uye.PostaKodu;
                    txtTc.Text = uye.TC;
                    txtAdres.Text = uye.Adres;

                    Page.Title = " Adres ve Fatura Bilgilerim" +" "+ cons.title;
                    Page.MetaDescription = " Adres ve Fatura Bilgilerim" + " " + cons.description;
                    Page.MetaKeywords = " Adres ve Fatura Bilgilerim" + " " + cons.keywords;
                }
                else
                {
                    Response.Redirect("/anasayfa");
                }

            }
            else
            {
                Response.Redirect("/anasayfa");
            }
        }
    }
    protected void btnKaydet_Click(object sender, EventArgs e)
    {
        var uyeGuncelle = db.ETICARET_Uyelers.Where(m => m.ID == Convert.ToInt32(Session["UyeID"])).FirstOrDefault();
        uyeGuncelle.Adres = txtAdres.Text;
        uyeGuncelle.Sehir = drpIl.SelectedItem.ToString();
        uyeGuncelle.Ilce = txtIlce.Text;
        uyeGuncelle.PostaKodu = txtPostaKodu.Text;
        uyeGuncelle.TC = txtTc.Text;
        db.SubmitChanges();

    }
}