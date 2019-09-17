using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Carousel : System.Web.UI.UserControl
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var firsatUrunleri = from u in db.ETICARET_Urunlers.Where(m => m.Firsat == 1 & m.Durum == 1)
                                 select u;
            rptFirsat.DataSource = firsatUrunleri;
            rptFirsat.DataBind();
        }
    }
    public string kdvDahil(decimal fiyat, int kdv)
    {
        decimal toplamTutar = fiyat + Convert.ToDecimal((fiyat * kdv) / 100);
        return string.Format("{0:c}", toplamTutar);
    }
}