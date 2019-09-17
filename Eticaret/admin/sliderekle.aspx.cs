using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_sliderekle : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {

            string link;
            if (txtLink.Text == "")
            {
                link = "#";
            }
            else
            {
                link = txtLink.Text;
            }

            string dosyaAdi;
            if (fuSlider.HasFile)
            {
                string filenameadd = DateTime.Now.ToString().Replace(" ", "_").Replace(":", "_").Replace(".", "_").Replace("/", "_");
                string uzanti = Path.GetExtension(fuSlider.FileName);
                dosyaAdi = filenameadd + uzanti;
                fuSlider.PostedFile.SaveAs(Server.MapPath("~/Dosyalar/Slider/") + dosyaAdi);

                System.Drawing.Image imgResim = null;
                System.Drawing.Image imgOrijinalResim = System.Drawing.Image.FromFile(Server.MapPath("~/Dosyalar/Slider/" + dosyaAdi));
                imgResim = resimboyutlandir.FixedSize(imgOrijinalResim, 1041, 492);
                imgResim.Save(Server.MapPath("~/Dosyalar/Slider/Mini/" + dosyaAdi));
                imgResim.Dispose();
            }
            else
            {
                dosyaAdi = "resimyok.jpg";
            }

            ETICARET_Banner ekle = new ETICARET_Banner()
            {
                
                Banner=dosyaAdi,
                Link=link,
                Sira=txtSira.Text,

            };

            db.ETICARET_Banners.InsertOnSubmit(ekle);
            db.SubmitChanges();
            pnlHata.Visible = false;
            pnlBasarili.Visible = true;
            Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='2; url=slider.aspx'/>"));
        }
        catch (Exception)
        {
            pnlHata.Visible = true;
            pnlBasarili.Visible = false;
        }
    }
}