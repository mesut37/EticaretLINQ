using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Uc_ucMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Url.LocalPath.ToLower().Contains("default"))
        {
            anasayfa.Attributes["class"] = "active";
        }
        else
            if (Request.Url.LocalPath.ToLower().Contains("sayfalar") || Request.Url.LocalPath.ToLower().Contains("sayfaekle"))
            {
                icerik.Attributes["class"] = "active";
            }
            else
                if (Request.Url.LocalPath.ToLower().Contains("kategoriler") || Request.Url.LocalPath.ToLower().Contains("kategoriekle") || Request.Url.LocalPath.ToLower().Contains("urunler") || Request.Url.LocalPath.ToLower().Contains("urunekle") || Request.Url.LocalPath.ToLower().Contains("markalar") || Request.Url.LocalPath.ToLower().Contains("markaekle"))
                {
                    urun.Attributes["class"] = "active";
                }
    }
}