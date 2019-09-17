using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Kategori : System.Web.UI.UserControl
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var kategoriler = from u in db.ETICARET_Kategoris.Where(m => m.AltID == 0 & m.Durum==1).OrderBy(m=> m.Sira)
                              select u;
            rptKategoriler.DataSource = kategoriler;
            rptKategoriler.DataBind();
        }
    }
    protected void rptKategoriler_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {


            Repeater rp = (Repeater)e.Item.FindControl("rptAltKategoriler");
            Repeater rp2 = (Repeater)e.Item.FindControl("rptKategoriResimler");
            int ID = int.Parse(DataBinder.Eval(e.Item.DataItem, "ID").ToString());
            var kategori = from u in db.ETICARET_Kategoris.Where(m => m.AltID == ID & m.Durum == 1).OrderBy(m=> m.Sira) select u;
            var kategoriResimler = from u in db.ETICARET_Kategoris.Where(m => m.AltID == ID & m.Durum == 1 & m.ResimVitrin==1).OrderBy(m=> m.Sira) select u;
            rp.DataSource = kategori;
            rp.DataBind();

            rp2.DataSource = kategoriResimler;
            rp2.DataBind();
        }
    }
}