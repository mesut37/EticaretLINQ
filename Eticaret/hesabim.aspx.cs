using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class hesabim : System.Web.UI.Page
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
                    txtAd.Text = uye.Ad;
                    txtSoyad.Text = uye.Soyad;
                    txtEmail.Text = uye.Email;
                    txtTel.Text = uye.Telefon;
                    chkKampanya.Checked = (uye.Kampanya == 1) ? true : false;
                    txtSifre.Attributes.Add("value", uye.Sifre);

                    Page.Title = " Hesabım" + " " + cons.title;
                    Page.MetaDescription = " Hesabım" + " " + cons.description;
                    Page.MetaKeywords = " Hesabım" + cons.keywords + " " + " Hesabım";
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
        int cns, kampanya;
        cns = (rdErkek.Checked) ? 1 : 0;
        kampanya = (chkKampanya.Checked) ? 1 : 0;

        var uyeGuncelle = db.ETICARET_Uyelers.Where(m => m.ID == Convert.ToInt32(Session["UyeID"])).FirstOrDefault();
        uyeGuncelle.Ad = txtAd.Text;
        uyeGuncelle.Soyad = txtSoyad.Text;
        uyeGuncelle.Email = txtEmail.Text;
        uyeGuncelle.Cinsiyet = cns;
        uyeGuncelle.Telefon = txtTel.Text;
        uyeGuncelle.Sifre = txtSifre.Text;
        uyeGuncelle.Kampanya = kampanya;
        db.SubmitChanges();

    }
}