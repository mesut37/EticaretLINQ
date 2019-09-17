using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_seo : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var seoGetir = db.ETICARET_Seos.FirstOrDefault();
            txtTitle.Text = seoGetir.Title;
            txtDescription.Text = seoGetir.Description;
            txtKeywords.Text = seoGetir.Keywords;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            var seoGuncelle = db.ETICARET_Seos.FirstOrDefault();
            seoGuncelle.Title = txtTitle.Text;
            seoGuncelle.Description = txtDescription.Text;
            seoGuncelle.Keywords = txtKeywords.Text;

            db.SubmitChanges();
            pnlBasarili.Visible = true;
            pnlHata.Visible = false;
            Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='2; url=seo.aspx'/>"));

        }
        catch (Exception)
        {

            pnlHata.Visible = true;
            pnlBasarili.Visible = false;
        }
    }
}