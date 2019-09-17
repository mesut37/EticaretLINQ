using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sayfalar : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var sayfalar = from u in db.ETICARET_Sayfalars.OrderBy(m=> m.Sira)
                           select u;

            rptSayfalar.DataSource = sayfalar;
            rptSayfalar.DataBind();

        }
    }
    protected void rptSayfalar_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "sil")
        {
            var sayfaSil = db.ETICARET_Sayfalars.Where(m => m.ID == Convert.ToInt32(e.CommandArgument.ToString())).FirstOrDefault();
            db.ETICARET_Sayfalars.DeleteOnSubmit(sayfaSil);
            db.SubmitChanges();

            Response.Redirect("sayfalar.aspx");
        }
        else
            if (e.CommandName == "duzenle")
            {

                Response.Redirect("sayfaduzenle.aspx?ID=" + e.CommandArgument.ToString());
            }
    }
}
