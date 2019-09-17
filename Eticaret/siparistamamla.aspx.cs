using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class siparistamamla : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            try
            {
                ltrAdSoyad.Text = Session["AdSoyad"].ToString();
                ltrOdemeSekli.Text = Session["OdemeSekli"].ToString();
                ltrTutar.Text = string.Format("{0:c}", Session["Tutar"]).ToString();
               
                var kargoGetir = db.ETICARET_Kargos.Where(m => m.ID == Convert.ToInt32(Session["Kargo"])).FirstOrDefault();
               
            }
            catch (Exception)
            {


            }
        }
    }
}