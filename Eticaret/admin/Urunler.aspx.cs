using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Urunler : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var urunler = from u in db.ETICARET_Urunlers.OrderBy(m => m.Sira)
                          select u;
            rptUrunler.DataSource = urunler;
            rptUrunler.DataBind();
        }
    }
    public string kategoriGetir(int KatID)
    {
        var kategoriGetir = db.ETICARET_Kategoris.Where(m => m.ID == KatID).FirstOrDefault();
        if (kategoriGetir != null)
        {
            return kategoriGetir.KategoriAdi;

        }
        else
        {
            return "Null";
        }
        
    }
    public string toplamTutarGetir(decimal fiyat, int kdv)
    {
        decimal toplamTutar = fiyat + Convert.ToDecimal((fiyat * kdv) / 100);
        return string.Format("{0:c}", toplamTutar);
    }
    protected void rptUrunler_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "sil")
        {
            var urunSil = db.ETICARET_Urunlers.Where(m => m.ID == Convert.ToInt32(e.CommandArgument.ToString())).FirstOrDefault();
            db.ETICARET_Urunlers.DeleteOnSubmit(urunSil);
            db.SubmitChanges();

            

            var CokluResimSil = from u in db.ETICARET_UrunResimleris.Where(m => m.UrunID == Convert.ToInt32(e.CommandArgument.ToString())) select u;
            db.ETICARET_UrunResimleris.DeleteAllOnSubmit(CokluResimSil);
            db.SubmitChanges();
            Response.Redirect("urunler.aspx");
        }
        else
            if (e.CommandName == "duzenle")
            {

                Response.Redirect("urunduzenle.aspx?ID=" + e.CommandArgument.ToString());
            }
    }
    protected void btnYeni_Click(object sender, EventArgs e)
    {
        Response.Redirect("urunekle.aspx");
    }
}