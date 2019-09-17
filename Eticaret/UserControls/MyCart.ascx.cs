using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_MyCart : System.Web.UI.UserControl
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["UyeID"] != null)
            {
                int sepetAdet = (from u in db.ETICARET_Sepets.Where(m => m.UyeID == Convert.ToInt32(Session["UyeID"]))
                                 select u).Count();
                //ltrSepet.Text = sepetAdet.ToString();

            }
            else
            {
                int sepetAdet = (from u in db.ETICARET_Sepets.Where(m => m.IP == Request.ServerVariables["REMOTE_ADDR"])
                                 select u).Count();
                //ltrSepet.Text = sepetAdet.ToString();
            }
        }
    }
}