using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class uyegirisi : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    Constant cons = new Constant();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Page.Title = "Üye Girişi" + " " + cons.title;
            Page.MetaDescription = "Üye Girişi" + " " + cons.description;
            Page.MetaKeywords = "Üye Girişi" + " " + cons.keywords;
        }
    }
    protected void btnGiris_Click(object sender, EventArgs e)
    {
        try
        {
            var uyeKontrol = db.ETICARET_Uyelers.Where(m => m.Email == txtEmail.Text & m.Sifre == txtSifre.Text).FirstOrDefault();
            if (uyeKontrol != null)
            {
                basarili.Visible = true;
                basarisiz.Visible = false;
                Session["UyeAdSoyad"] = uyeKontrol.Ad + " " + uyeKontrol.Soyad;
                Session["UyeID"] = uyeKontrol.ID;


                var ipSepetGetir = from u in db.ETICARET_Sepets.Where(m => m.IP == Request.ServerVariables["REMOTE_ADDR"])
                                   select u;
                List<ETICARET_Sepet> sepetList = new List<ETICARET_Sepet>();
                
                foreach (var item in ipSepetGetir)
                {

                      var sepetKontrol = db.ETICARET_Sepets.Where(m => m.UyeID == Convert.ToInt32(Session["UyeID"]) & m.UrunID == item.UrunID).FirstOrDefault();
                      if (sepetKontrol != null)
                      {

                      }
                      else
                      {
                          ETICARET_Sepet sepeteEkle = new ETICARET_Sepet()
                          {
                              Adet = item.Adet,
                              EklenmeTarihi = item.EklenmeTarihi,
                              UrunID = item.UrunID,
                              UyeID = Convert.ToInt32(Session["UyeID"])
                          };
                          sepetList.Add(sepeteEkle);
                      }
                   
                   
                }
                db.ETICARET_Sepets.InsertAllOnSubmit(sepetList);
               

                db.ETICARET_Sepets.DeleteAllOnSubmit(ipSepetGetir);
                db.SubmitChanges();

                if (Session["YorumSession"] != null)
                {
                    var urun=db.ETICARET_Urunlers.Where(m=> m.ID==Convert.ToInt32(Session["YorumSession"])).FirstOrDefault();
                    Response.Redirect("/urundetay/" + Convert.ToInt32(Session["YorumSession"])+"/"+urun.UrunAdi);
                    Session["YorumSession"] = null;
                    Session.Abandon();
                }
                else if (Session["uyeOlDevamet"] != null)
                {
                    Response.Redirect("/adressecimi");
                   
                }
                else
                {
                    Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='3; url=/anasayfa'/>"));
                }

               
              
               

                

            }
            else
            {
                basarili.Visible = false;
                basarisiz.Visible = true;
            }
        }
        catch (Exception)
        {
            basarili.Visible = false;
            basarisiz.Visible = true;
        }
    }
    protected void lnkUyeliksiz_Click(object sender, EventArgs e)
    {
        if (Session["uyeOlDevamet"] != null)
        {
            Response.Redirect("/adressecimi");
        }
        else
        {
            Response.Redirect("/anasafa");
        }
    }
}