using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class kategoriler : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var kategoriler = from u in db.ETICARET_Kategoris.OrderBy(m => m.Sira)
                              select u;

            rptKategoriler.DataSource = kategoriler;
            rptKategoriler.DataBind();

        }
    }
    public string ustKategori(string ID)
    {
        if (ID == "0")
        {
            return "Ana Kategori";

        }
        else
        {
            var ustKategori = db.ETICARET_Kategoris.Where(m => m.ID == Convert.ToInt32(ID)).FirstOrDefault();
            if (ustKategori != null)
            {
                return ustKategori.KategoriAdi;
            }
            else
            {
                return "Bilinmiyor";
            }
            
        }
    }
    public void kategoriSil(int katID)
    { 
    
    }
    protected void rptKategoriler_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "sil")
        {
            var kategoriSil = db.ETICARET_Kategoris.Where(m => m.ID == Convert.ToInt32(e.CommandArgument.ToString())).FirstOrDefault();
            db.ETICARET_Kategoris.DeleteOnSubmit(kategoriSil);
            db.SubmitChanges();

            var urunleriSil = from u in db.ETICARET_Urunlers.Where(m => m.KatID == Convert.ToInt32(e.CommandArgument.ToString())) select u;
            db.ETICARET_Urunlers.DeleteAllOnSubmit(urunleriSil);
            db.SubmitChanges();

           
            Response.Redirect("kategoriler.aspx");
        }
        else
            if (e.CommandName == "duzenle")
            {

                Response.Redirect("kategoriduzenle.aspx?ID="+e.CommandArgument.ToString());
            }

    }
}