using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_onayliuyeler : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var tumUyeler = from u in db.ETICARET_Uyelers.Where(m => m.Onay == 1) select u;
            rptUyeler.DataSource = tumUyeler;
            rptUyeler.DataBind();
        }
    }
    protected void rptUyeler_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "sil")
        {
            var uyeSil = db.ETICARET_Uyelers.Where(m => m.ID == Convert.ToInt32(e.CommandArgument.ToString())).FirstOrDefault();
            db.ETICARET_Uyelers.DeleteOnSubmit(uyeSil);
            db.SubmitChanges();

            Response.Redirect("uyeler.aspx");
        }
        else
            if (e.CommandName == "duzenle")
            {

                Response.Redirect("uyedetay.aspx?ID=" + e.CommandArgument.ToString());
            }
    }
}