using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_kargo : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var kargolar = from u in db.ETICARET_Kargos select u;
            rptKargolar.DataSource = kargolar;
            rptKargolar.DataBind();
        }
    }
    protected void rptKargolar_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "sil")
        {
            var kargoSil = db.ETICARET_Kargos.Where(m => m.ID == Convert.ToInt32(e.CommandArgument.ToString())).FirstOrDefault();
            db.ETICARET_Kargos.DeleteOnSubmit(kargoSil);
            db.SubmitChanges();

            Response.Redirect("kargo.aspx");
        }
        else
            if (e.CommandName == "duzenle")
            {

                Response.Redirect("kargoduzenle.aspx?ID=" + e.CommandArgument.ToString());
            }
    }
}