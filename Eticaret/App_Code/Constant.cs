using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Constant
/// </summary>
public class Constant
{

    private string  _keywords, _description, _title = string.Empty;
    public string keywords { get { return _keywords; } }
    public string description { get { return _description; } }
    public string title { get { return _title; } }
    eticaretDataContext db = new eticaretDataContext();

    public Constant()
    {
        var seo = db.ETICARET_Seos.FirstOrDefault();
        _title = seo.Title;
        _description =seo.Description;
        _keywords = seo.Keywords;     

    }
}