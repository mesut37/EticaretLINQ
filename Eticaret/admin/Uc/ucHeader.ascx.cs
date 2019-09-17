using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Uc_ucHeader : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["login"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }
    }
    protected void lnkCikis_Click(object sender, EventArgs e)
    {
        Session["login"] = null;
        Session.Abandon();
        Response.Redirect("login.aspx");
    }
}