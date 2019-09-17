using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_siparisler : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var siparisler = from u in db.ETICARET_Siparis
                             select u;

            rptSiparisler.DataSource = siparisler;
            rptSiparisler.DataBind();

        }
    }
    protected void rptSiparisler_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "sil")
        {
            var siparisSil = db.ETICARET_Siparis.Where(m => m.ID == Convert.ToInt32(e.CommandArgument.ToString())).FirstOrDefault();
            db.ETICARET_Siparis.DeleteOnSubmit(siparisSil);
            db.SubmitChanges();

            Response.Redirect("siparisler.aspx");
        }
        

    }
    public string UyelikDurumu(int uyeID)
    {
         string sonuc="";
         if (uyeID != 0)
         {
             sonuc = "Üye";
         }
         else
         {
             sonuc = "Üye Değil";
         }
       
        return sonuc;
    }
}