using System;
using System.Web;
using System.Web.Security;


public partial class ques : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["Countdowns"] = null;
        Response.Cache.SetNoStore();
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if ((string)Session["user"] == "admin")
        { Button2.Visible = true; }
        else { Button2.Visible = false; }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string s = DropDownList1.SelectedValue;
        if (!String.IsNullOrWhiteSpace(s))
        {
            Session["ques"] = s;
            Response.Redirect("csharp.aspx");
        }
      }
    protected void logout_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Session.Abandon();
        FormsAuthentication.RedirectToLoginPage();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if ((string)Session["user"] == "admin")
        {
            Response.Redirect("../Admin/index.aspx");
        }
    }
}