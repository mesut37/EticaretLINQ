using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class siparisler : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["UyeID"] != null)
            {
                var siparisler = from u in db.ETICARET_Siparis.Where(m => m.UyeID == Convert.ToInt32(Session["UyeID"]))
                                 join k in db.ETICARET_Kargos on u.Kargo equals k.ID
                                 select new 
                                 {
                                    u.ID,
                                    u.Adres,
                                    u.AdSoyad,
                                    u.Durum,
                                    u.EklenmeTarihi,
                                    u.FaturaIsim,
                                    u.IP,
                                    u.OdemeSekli,
                                    u.Onay,
                                    u.Tutar,
                                    u.UyeID,
                                    k.KargoAdi,

                                 };
                rptSiparisler.DataSource = siparisler;
                rptSiparisler.DataBind();
                hesabimGoruntule.Visible = true;
                havaleBildirimDiv.Visible = false;
                
            }
            else
            {
                
                var siparisler = from u in db.ETICARET_Siparis.Where(m => m.IP == Request.ServerVariables["REMOTE_ADDR"])
                                 join k in db.ETICARET_Kargos on u.Kargo equals k.ID
                                 select new
                                 {
                                     u.ID,
                                     u.Adres,
                                     u.AdSoyad,
                                     u.Durum,
                                     u.EklenmeTarihi,
                                     u.FaturaIsim,
                                     u.IP,
                                     u.OdemeSekli,
                                     u.Onay,
                                     u.Tutar,
                                     u.UyeID,
                                     k.KargoAdi,

                                 };
                rptSiparisler.DataSource = siparisler;
                rptSiparisler.DataBind();
                hesabimGoruntule.Visible = false;
                siparisDiv.Style.Add("width","100%");
                havaleBildirimDiv.Visible = true;
            }
        }
    }
}