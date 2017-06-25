using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
        { Response.Redirect("~/Student/ques.aspx"); }

    }

    SqlConnection con;
    SqlCommand com;
    int i;
    protected void Button1_Click(object sender, EventArgs e)
    {

        con = new SqlConnection(ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
        string user = TextBox1.Text;
        string pass = TextBox2.Text; int j;
        string email = TextBox3.Text;
        if (!String.IsNullOrWhiteSpace(user) && !string.IsNullOrWhiteSpace(pass) && !string.IsNullOrWhiteSpace(email))
        {
            com = new SqlCommand("select id from [dbo].[users] where id='" + user + "'", con);
            con.Open();
            SqlDataReader dr = com.ExecuteReader();
            if (dr.HasRows)
            {
                con.Close();
                Response.Write("<script>alert(\"UserID already exist\");</script>");
            }
            else
            {
                con.Close();
                com.CommandText = "insert into users values(@a,@b,@c)";
                con.Open();
                com.Parameters.Add(new SqlParameter("@a", user));
                com.Parameters.Add(new SqlParameter("@b", pass));
                com.Parameters.Add(new SqlParameter("@c", email));
                i = com.ExecuteNonQuery();
                con.Close();
            }
        }
        else
        {
            Response.Write("<script>alert(\"UserID or Password can not be blank\");</script>");
        }
        if (i == 1) { Response.Redirect("index.aspx"); }
        else { Label1.Text = "Reg Failed"; }
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
}