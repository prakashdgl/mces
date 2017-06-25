using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
        { Response.Redirect("~/Student/ques.aspx"); }
    }

    SqlConnection con;
    SqlCommand com;
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (Authenticate(TextBox1.Text, TextBox2.Text))
        {
            FormsAuthentication.RedirectFromLoginPage(TextBox1.Text, false);
        }
        else
        {
            Response.Write("<script>alert(\"Wrong UserID or Pass\");</script>");
            
        }
    }

    private bool Authenticate(string p1, string p2)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
        com = new SqlCommand("select id, pass from users where id=@a COLLATE sql_latin1_general_cp1_cs_as AND pass=@b COLLATE sql_latin1_general_cp1_cs_as", con);
        con.Open();
        com.Parameters.AddWithValue("@a", p1);
        com.Parameters.AddWithValue("@b", p2);
        string RetUser = (string)com.ExecuteScalar();

        if (RetUser != null)
        {
            Session["user"] = p1;
            return true;
        }
        return false;
    }
}