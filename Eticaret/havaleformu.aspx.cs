using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class havaleformu : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (RouteData.Values["ID"] != null)
            {
                int ID = Convert.ToInt32(RouteData.Values["ID"]);
                if (Session["UyeID"] != null)
                {
                    var siparisGetir = db.ETICARET_Siparis.Where(m => m.ID == ID & m.UyeID==Convert.ToInt32(Session["UyeID"])).FirstOrDefault();
                    ltrHavaleBilgi.Text = string.Format("{0:c}",siparisGetir.Tutar)+" Tutarındaki siparişiniz için havale/Eft işlemini yaptı iseniz formu doldurunuz..";
                    hesabimGoruntule.Visible = true;
                }
                else
                {
                    var siparisGetir = db.ETICARET_Siparis.Where(m => m.ID == ID & m.IP == Request.ServerVariables["REMOTE_ADDR"]).FirstOrDefault();
                    ltrHavaleBilgi.Text = string.Format("{0:c}", siparisGetir.Tutar) + " Tutarındaki siparişiniz için havale/Eft işlemini yaptı iseniz formu doldurunuz..";
                    hesabimGoruntule.Visible = false;
                }
            }
            else
            {
                Response.Redirect("/anasayfa");
            }

        }
    }
    protected void btnGonder_Click(object sender, EventArgs e)
    {
        try
        {
            ETICARET_HavaleBildirim havale = new ETICARET_HavaleBildirim() 
            {
                SiparisID = Convert.ToInt32(RouteData.Values["ID"]),
                Tutar=txtTutar.Text,
                Notunuz=txtNot.Text,
                EklenmeTarihi=DateTime.Now.ToString(),
            };
            lblMesaj.Text = "Havale bildiriminiz başarıyla kayıt edilmiştir.";
            db.ETICARET_HavaleBildirims.InsertOnSubmit(havale);
            db.SubmitChanges();
            basarili.Visible = true;
            basarisiz.Visible = false;
        }
        catch (Exception)
        {

            basarili.Visible = false;
            basarisiz.Visible = true;
        }
    }
}