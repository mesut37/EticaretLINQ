using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_UserMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lnkCikis_Click(object sender, EventArgs e)
    {
        Session["UyeID"] = null;
        Session["UyeAdSoyad"] = null;
        Session.Abandon();
        Response.Redirect("/anasayfa");
    }
}