using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_bankahesap : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var bankahesap = from u in db.ETICARET_BankaHesaps select u;
            rptBankaHesap.DataSource = bankahesap;
            rptBankaHesap.DataBind();
        }
    }
    protected void rptBankaHesap_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "sil")
        {
            var hesapSil = db.ETICARET_BankaHesaps.Where(m => m.ID == Convert.ToInt32(e.CommandArgument.ToString())).FirstOrDefault();
            db.ETICARET_BankaHesaps.DeleteOnSubmit(hesapSil);
            db.SubmitChanges();

            Response.Redirect("bankahesap.aspx");
        }
        else
            if (e.CommandName == "duzenle")
            {

                Response.Redirect("hesapduzenle.aspx?ID=" + e.CommandArgument.ToString());
            }
    }
}