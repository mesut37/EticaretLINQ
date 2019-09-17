using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_TopMenu : System.Web.UI.UserControl
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["UyeID"] != null)
            {
                var uye = db.ETICARET_Uyelers.Where(m => m.ID == Convert.ToInt32(Session["UyeID"])).FirstOrDefault();
                kullnici.Visible = true;
                ltrKullanici.Text = uye.Ad + " " + uye.Soyad;
                hesabim.Visible = true;
                //sepetim.Visible = true;
                //siparislerim.Visible = true;
                uyeol.Visible = false;
                uyegirisi.Visible = false;
                divMemberPanel.Visible = true;

               
            }
            
        }
    }
    protected void lnkCikis_Click(object sender, EventArgs e)
    {
        Session["UyeID"] = null;
        Session["UyeAdSoyad"] = null;
        Session.Abandon();
        Response.Redirect("/anasayfa");
    }
}