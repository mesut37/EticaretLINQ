using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Markaduzenle : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
             int ID = Convert.ToInt32(Request.QueryString["ID"]);
        var markaGetir = db.ETICARET_Markalars.Where(m => m.ID == ID).FirstOrDefault();


        txtMarkaAdi.Text = markaGetir.MarkaAdi;
        txtsira.Text = markaGetir.Sira.ToString();
        imgMarka.ImageUrl = "../Dosyalar/Marka/Mini/" + markaGetir.Resim;
        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            var markaGuncelle = db.ETICARET_Markalars.Where(m => m.ID == ID).FirstOrDefault();

           

            string dosyaAdi;
            if (fuMarka.HasFile)
            {
                string filenameadd = DateTime.Now.ToString().Replace(" ", "_").Replace(":", "_").Replace(".", "_").Replace("/", "_");
                string uzanti = Path.GetExtension(fuMarka.FileName);
                dosyaAdi = filenameadd + uzanti;
                fuMarka.PostedFile.SaveAs(Server.MapPath("~/Dosyalar/Marka/") + dosyaAdi);

                System.Drawing.Image imgResim = null;
                System.Drawing.Image imgOrijinalResim = System.Drawing.Image.FromFile(Server.MapPath("~/Dosyalar/Marka/" + dosyaAdi));
                imgResim = resimboyutlandir.FixedSize(imgOrijinalResim, 290, 290);
                imgResim.Save(Server.MapPath("~/Dosyalar/Marka/Mini/" + dosyaAdi));
                imgResim.Dispose();
            }
            else
            {
                dosyaAdi = markaGuncelle.Resim;
            }

            markaGuncelle.MarkaAdi = txtMarkaAdi.Text;
            markaGuncelle.Sira = txtsira.Text;
            markaGuncelle.Resim = dosyaAdi;
          

            db.SubmitChanges();


            pnlHata.Visible = false;
            pnlBasarili.Visible = true;
            Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='2; url=markalar.aspx'/>"));

        }
        catch (Exception)
        {
            pnlHata.Visible = true;
            pnlBasarili.Visible = false;
        }

    }
}