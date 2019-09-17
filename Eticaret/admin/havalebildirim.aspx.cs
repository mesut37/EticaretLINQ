using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_havalebildirim : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var havaleBildirimleri = from u in db.ETICARET_HavaleBildirims select u;
            rptHavaleBildirim.DataSource = havaleBildirimleri;
            rptHavaleBildirim.DataBind();
        }
    }
    protected void rptHavaleBildirim_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "sil")
        {
            var havaleBildirimSil = db.ETICARET_HavaleBildirims.Where(m => m.ID == Convert.ToInt32(e.CommandArgument.ToString())).FirstOrDefault();
            db.ETICARET_HavaleBildirims.DeleteOnSubmit(havaleBildirimSil);
            db.SubmitChanges();

            Response.Redirect("havalebildirim.aspx");
        }
      

    }
}