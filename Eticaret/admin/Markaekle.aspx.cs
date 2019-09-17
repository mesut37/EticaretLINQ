using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Markaekle : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
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
                dosyaAdi = "resimyok.jpg";
            }

            ETICARET_Markalar Ekle = new ETICARET_Markalar()
           {
               MarkaAdi = txtMarkaAdi.Text,
               Sira = txtSira.Text,
               Resim = dosyaAdi,

           };


            db.ETICARET_Markalars.InsertOnSubmit(Ekle);
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