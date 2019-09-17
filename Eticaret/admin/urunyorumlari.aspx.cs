using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_urunyorumlari : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["ID"] != null)
            {
                int ID = Convert.ToInt32(Request.QueryString["ID"]);
                var Yorumlar = from u in db.ETICARET_Yorumlars.Where(m => m.UrunID == ID)
                               join a in db.ETICARET_Uyelers
                               on u.UyeID equals a.ID
                               select new
                               {
                                   u.ID,
                                   u.Yorum,
                                   a.Ad,
                                   a.Soyad,
                                   a.Telefon,
                                   a.Email,
                                   uyeID = a.ID,
                                   u.EklenmeTarihi,

                               };

                rptYorumlar.DataSource = Yorumlar;
                rptYorumlar.DataBind();
            }
            else
            {
                var Yorumlar = from u in db.ETICARET_Yorumlars
                               join a in db.ETICARET_Uyelers
                               on u.UyeID equals a.ID
                               select new
                               {
                                   u.ID,
                                   u.Yorum,
                                   a.Ad,
                                   a.Soyad,
                                   a.Telefon,
                                   a.Email,
                                   uyeID = a.ID,
                                   u.EklenmeTarihi,
                               };

                rptYorumlar.DataSource = Yorumlar;
                rptYorumlar.DataBind();
            }
          
        }
    }
    public string yorumKisalt(string yorum)
    {
        if (yorum.Length > 100)
        {
            yorum = yorum.Substring(0, 100);
            return yorum +"...";
        }
        else
        {

            return yorum;
        }
    }
    protected void rptYorumlar_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "sil")
        {
            var yorumSil = db.ETICARET_Yorumlars.Where(m => m.ID == Convert.ToInt32(e.CommandArgument.ToString())).FirstOrDefault();
            db.ETICARET_Yorumlars.DeleteOnSubmit(yorumSil);
            db.SubmitChanges();

            if (Request.QueryString["ID"] != null)
            {
                int ID = Convert.ToInt32(Request.QueryString["ID"]);
                Response.Redirect("urunyorumlari.aspx?ID="+ID);
            }
            else
            {
                Response.Redirect("urunyorumlari.aspx");
            }
           
        }

    }
}