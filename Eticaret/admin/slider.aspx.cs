using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_slider : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var slider = from u in db.ETICARET_Banners.OrderBy(m=> m.Sira)
                         select u;
            rptSlider.DataSource = slider;
            rptSlider.DataBind();
        }
    }
    protected void btnYeni_Click(object sender, EventArgs e)
    {
        Response.Redirect("sliderekle.aspx");
    }
    protected void rptSlider_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "sil")
        {
            var sliderSil = db.ETICARET_Banners.Where(m => m.ID == Convert.ToInt32(e.CommandArgument.ToString())).FirstOrDefault();
            db.ETICARET_Banners.DeleteOnSubmit(sliderSil);
            db.SubmitChanges();
            
            Response.Redirect("slider.aspx");
        }
           
    }
}