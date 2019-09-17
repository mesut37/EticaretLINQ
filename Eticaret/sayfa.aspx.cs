using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sayfa : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    Constant cons = new Constant();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (RouteData.Values["ID"] != null)
            {
                int ID = Convert.ToInt32(RouteData.Values["ID"]);
                var sayfa = db.ETICARET_Sayfalars.Where(m => m.ID == ID).FirstOrDefault();
                ltrBaslik.Text = sayfa.Baslik;
                ltrDetay.Text = sayfa.Detay;

                Page.Title = sayfa.Title + " " + cons.title;
                Page.MetaDescription = sayfa.Description + " " + cons.description;
                Page.MetaKeywords = sayfa.Keywords + " " + cons.keywords;
            }
            else
            {
                Response.Redirect("/anasayfa");
            }
        }
    }
}