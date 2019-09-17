using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sifremiunuttum : System.Web.UI.Page
{
    eticaretDataContext db = new eticaretDataContext();
    Tools tool = new Tools();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            
        }
    }
    protected void btnGonder_Click(object sender, EventArgs e)
    {
        try
        {
             var email = db.ETICARET_Uyelers.Where(m => m.Email == txtEmail.Text).FirstOrDefault();
        if (email != null)
        {
            string Code = Guid.NewGuid().ToString();
            Code = Code.Substring(0, 8);

            tool.sifremiUnuttum("bilgi@eskayazilim.com", txtEmail.Text, email.Ad + " " + email.Soyad, "E-mail Şifre Değişikliği", true, "Sayın : "+email.Ad+" "+email.Soyad+" Şifre değişikliğiniz tamamlanmıştır. Yeni şifreniz aşağıdadır.</br></br> Yeni Şifreniz : " + Code + " </br></br>Üye girişinizi yaptıktan sonra şifrenizi değiştiriniz. Üye girişi için <a href='http://localhost:50378/uyegirisi'>buraya</a> tıklayınız", "mail.eskayazilim.com", "bilgi@eskayazilim.com", "Kayra1881");
            basarili.Visible = true;
            basarisiz.Visible = false;
            emailyok.Visible = false;
            email.Sifre = Code;
            db.SubmitChanges();
            Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='2; url=/uyegirisi'/>"));
        }
        else
        {
            emailyok.Visible = true;
            basarili.Visible = false;
            basarisiz.Visible = false;
        }
        }
        catch (Exception)
        {

            basarisiz.Visible = true;
            basarili.Visible = false;
            emailyok.Visible = false;
        }
    }
}