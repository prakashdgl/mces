<%@ WebHandler Language="C#" Class="Handler" %>

using System.Web;
using System.Data.SqlClient;
using System.Configuration;

public class Handler : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string a = context.Request.QueryString["a"];
      
        if (str.checkSpace(a))
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ConnectionString);
            SqlCommand com = new SqlCommand("select id from users where id=@b;", con);
            com.Parameters.Add(new SqlParameter("@b", a));
            con.Open();
            SqlDataReader dr = com.ExecuteReader();
            if (dr.HasRows)
            {
                context.Response.Write("ID Not Available");
            }
            else
            {
                context.Response.Write("ID Available");
            }
            con.Close();
        }
        else
        {
            context.Response.Write("ID in Wrong Format");
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}