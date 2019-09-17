using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ebulten : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var ebultenKayitlari = from u in db.ETICARET_EBultens select u;
            rptEBulten.DataSource = ebultenKayitlari;
            rptEBulten.DataBind();
        }
    }
  
    protected void rptEBulten_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "sil")
        {
            var ebultenSil = db.ETICARET_EBultens.Where(m => m.ID == Convert.ToInt32(e.CommandArgument.ToString())).FirstOrDefault();
            db.ETICARET_EBultens.DeleteOnSubmit(ebultenSil);
            db.SubmitChanges();

            Response.Redirect("ebulten.aspx");
        }
    }
}