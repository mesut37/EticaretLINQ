using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;
using System.Net.Mail;
using System.Net;
using System.Drawing;
using System.Drawing.Imaging;
using System.Text.RegularExpressions;

/// <summary>
/// Summary description for Tools
/// </summary>
public class Tools
{
    string donendeger = "";
    public Tools()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static class EncryptionHelper
    {
        private const string cryptoKey = "cryptoKey";
        private static readonly byte[] IV = new byte[8] { 240, 3, 45, 29, 0, 76, 173, 59 };
        public static string Encrypt(string s)
        {
            if (s == null || s.Length == 0) return string.Empty;

            string result = string.Empty;

            try
            {
                byte[] buffer = Encoding.ASCII.GetBytes(s);

                TripleDESCryptoServiceProvider des =
                    new TripleDESCryptoServiceProvider();

                MD5CryptoServiceProvider MD5 =
                    new MD5CryptoServiceProvider();

                des.Key =
                    MD5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(cryptoKey));

                des.IV = IV;
                result = Convert.ToBase64String(
                    des.CreateEncryptor().TransformFinalBlock(
                        buffer, 0, buffer.Length));
            }
            catch
            {
                throw;
            }

            return result;
        }
        public static string Decrypt(string s)
        {
            if (s == null || s.Length == 0) return string.Empty;

            string result = string.Empty;

            try
            {
                byte[] buffer = Convert.FromBase64String(s);

                TripleDESCryptoServiceProvider des =
                    new TripleDESCryptoServiceProvider();

                MD5CryptoServiceProvider MD5 =
                    new MD5CryptoServiceProvider();

                des.Key =
                    MD5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(cryptoKey));

                des.IV = IV;

                result = Encoding.ASCII.GetString(
                    des.CreateDecryptor().TransformFinalBlock(
                    buffer, 0, buffer.Length));
            }
            catch
            {
                throw;
            }

            return result;
        }
    }
    public string MailGonder(string GonderenAdSoyad, string GonderenEmail, string AliciEmail, string AliciAdSoyad, string konu,
                          bool HtmlFormat, string MailIcerigi, string SmtpSunucu, string GonderimiYapacakEmail, string GonderimiYapacakEmailSifresi,string ek)
    {
        try
        {
            MailAddress gonderen = new MailAddress(GonderenEmail, GonderenAdSoyad);
            MailAddress alan = new MailAddress(AliciEmail, AliciAdSoyad);
            MailMessage eposta = new MailMessage(gonderen, alan);
            eposta.IsBodyHtml = HtmlFormat;
            eposta.Subject = konu;
            eposta.Body = MailIcerigi;
            NetworkCredential auth = new NetworkCredential(GonderimiYapacakEmail, GonderimiYapacakEmailSifresi);
            Attachment attachFile = new Attachment(HttpContext.Current.Server.MapPath("~/uploads/" +ek));
            eposta.Attachments.Add(attachFile);
            SmtpClient SMTP = new SmtpClient();
            SMTP.Host = SmtpSunucu;
            SMTP.Port = 587;
            SMTP.UseDefaultCredentials = false;
            SMTP.Credentials = auth;
            SMTP.DeliveryMethod = SmtpDeliveryMethod.Network;
            SMTP.Send(eposta);

           
            donendeger = "Teşekkürler en kısa zamanda size ulaşacağız.";

        }
        catch(Exception ex)
        {
            donendeger = "Bir hata oluştu.Lütfen  daha sonra tekrar deneyiniz." + ex;

        }
        return donendeger;
    }

    public string sifremiUnuttum(string GonderenEmail, string AliciEmail, string AliciAdSoyad, string konu,
                         bool HtmlFormat, string MailIcerigi, string SmtpSunucu, string GonderimiYapacakEmail, string GonderimiYapacakEmailSifresi)
    {
        try
        {
            MailAddress gonderen = new MailAddress(GonderenEmail);
            MailAddress alan = new MailAddress(AliciEmail, AliciAdSoyad);
            MailMessage eposta = new MailMessage(gonderen, alan);
            eposta.IsBodyHtml = HtmlFormat;
            eposta.Subject = konu;
            eposta.Body = MailIcerigi;
            NetworkCredential auth = new NetworkCredential(GonderimiYapacakEmail, GonderimiYapacakEmailSifresi);

            SmtpClient SMTP = new SmtpClient();
            SMTP.Host = SmtpSunucu;
            SMTP.Port = 587;
            SMTP.UseDefaultCredentials = false;
            SMTP.Credentials = auth;
            SMTP.DeliveryMethod = SmtpDeliveryMethod.Network;
            SMTP.Send(eposta);


            donendeger = "Teşekkürler en kısa zamanda size ulaşacağız.";

        }
        catch (Exception ex)
        {
            donendeger = "Bir hata oluştu.Lütfen  daha sonra tekrar deneyiniz." + ex;

        }
        return donendeger;
    }
    public string EksizMailGonder(string GonderenAdSoyad, string GonderenEmail, string AliciEmail, string AliciAdSoyad, string konu,
                          bool HtmlFormat, string MailIcerigi, string SmtpSunucu, string GonderimiYapacakEmail, string GonderimiYapacakEmailSifresi)
    {
        try
        {
            MailAddress gonderen = new MailAddress(GonderenEmail, GonderenAdSoyad);
            MailAddress alan = new MailAddress(AliciEmail, AliciAdSoyad);
            MailMessage eposta = new MailMessage(gonderen, alan);
            eposta.IsBodyHtml = HtmlFormat;
            eposta.Subject = konu;
            eposta.Body = MailIcerigi;
            NetworkCredential auth = new NetworkCredential(GonderimiYapacakEmail, GonderimiYapacakEmailSifresi);
           
            SmtpClient SMTP = new SmtpClient();
            SMTP.Host = SmtpSunucu;
            SMTP.Port = 587;
            SMTP.UseDefaultCredentials = false;
            SMTP.Credentials = auth;
            SMTP.DeliveryMethod = SmtpDeliveryMethod.Network;
            SMTP.Send(eposta);


            donendeger = "Teşekkürler en kısa zamanda size ulaşacağız.";

        }
        catch (Exception ex)
        {
            donendeger = "Bir hata oluştu.Lütfen  daha sonra tekrar deneyiniz." + ex;

        }
        return donendeger;
    }
    
    public static void OranlaveKaydet(Bitmap resim, int genislik, int yukseklik, string kayitYol) // burada resim değişkeni dikkatinizi çektiği üzere Bitmap objesi yani metodumuza Bitmap göndereceğiz, dönüştürme ise istediğimiz dönüştürme oranı oluyor
    {
        Bitmap oranlanacak = resim;

        using (Bitmap Orjinal = resim)
        {
            Size yenidegerler = new Size(genislik, yukseklik);
            Bitmap yeniresim = new Bitmap(Orjinal, yenidegerler);
            oranlanacak = yeniresim;
        }

        ImageCodecInfo myImageCodecInfo = GetEncoderInfo("image/png");
        System.Drawing.Imaging.Encoder myEncoder = System.Drawing.Imaging.Encoder.Quality;
        EncoderParameters myEncoderParameters = new EncoderParameters(1);
        EncoderParameter myEncoderParameter = new EncoderParameter(myEncoder, 85L);
        myEncoderParameters.Param[0] = myEncoderParameter;
        oranlanacak.Save(kayitYol, myImageCodecInfo, myEncoderParameters);
    }
    private static ImageCodecInfo GetEncoderInfo(String mimeType)
    {
        int j;
        ImageCodecInfo[] encoders;
        encoders = ImageCodecInfo.GetImageEncoders();
        for (j = 0; j < encoders.Length; ++j)
        {
            if (encoders[j].MimeType == mimeType)
                return encoders[j];
        }
        return null;
    }
    public static void OrantiliKaydet(Bitmap resim, int genislik, string kayitYol)
    {
        Bitmap oranlanacak = resim;


        double ResimYukseklik = resim.Height;
        double ResimUzunluk = resim.Width;
        double sabit = genislik;
        double oran = 0;

        if (ResimUzunluk > sabit)
        {
            oran = ResimUzunluk / ResimYukseklik;
            ResimUzunluk = sabit;
            ResimYukseklik = sabit / oran;

        }

        Bitmap yeniresim = new Bitmap(oranlanacak, Convert.ToInt32(ResimUzunluk), Convert.ToInt32(ResimYukseklik));


        ImageCodecInfo myImageCodecInfo = GetEncoderInfo("image/jpeg");
        System.Drawing.Imaging.Encoder myEncoder = System.Drawing.Imaging.Encoder.Quality;
        EncoderParameters myEncoderParameters = new EncoderParameters(1);
        EncoderParameter myEncoderParameter = new EncoderParameter(myEncoder, 85L);
        myEncoderParameters.Param[0] = myEncoderParameter;
        yeniresim.Save(kayitYol, myImageCodecInfo, myEncoderParameters);
    }
    public static string ClearTag(string metin)
    {
        metin = Regex.Replace(metin, "<[^>]*>", string.Empty);
        metin = metin.Replace("<p>", "");
        metin = metin.Replace("</p>", "");
        return metin;
    }

    public static string UrlSeo(string Metin)
    {
        string deger = Metin;

        deger = deger.Replace("'", "");
        deger = deger.Replace("<", "");
        deger = deger.Replace(">", "");
        deger = deger.Replace("&", "");
        deger = deger.Replace("[", "");
        deger = deger.Replace("]", "");
        deger = deger.Replace("ı", "i");
        deger = deger.Replace("ö", "o");
        deger = deger.Replace("ü", "u");
        deger = deger.Replace("ç", "c");
        deger = deger.Replace("ş", "s");
        deger = deger.Replace("ğ", "g");
        deger = deger.Replace("İ", "i");
        deger = deger.Replace("Ö", "o");
        deger = deger.Replace("Ü", "u");
        deger = deger.Replace("Ç", "c");
        deger = deger.Replace("Ş", "s");
        deger = deger.Replace("Ğ", "g");
        deger = deger.Replace(" ", "_");
        deger = deger.Replace("-", "_");
        deger = deger.Replace("/", "_");
       
       



        return deger;
    }
}