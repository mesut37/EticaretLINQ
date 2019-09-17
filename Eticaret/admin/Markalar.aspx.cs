using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Markalar : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var markalar = from u in db.ETICARET_Markalars
                           select u;

            rptMarkalar.DataSource = markalar;
            rptMarkalar.DataBind();

        }
    }

    protected void rptMarkalar_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "sil")
        {
            var markaSil = db.ETICARET_Markalars.Where(m => m.ID == Convert.ToInt32(e.CommandArgument.ToString())).FirstOrDefault();
            db.ETICARET_Markalars.DeleteOnSubmit(markaSil);
            db.SubmitChanges();

            Response.Redirect("markalar.aspx");
        }
        else
            if (e.CommandName == "duzenle")
            {

                Response.Redirect("markaduzenle.aspx?ID=" + e.CommandArgument.ToString());
            }

    }
}