using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.WebControls;

public partial class Admin_adminGV : System.Web.UI.Page
{
    DataTable dt; SqlDataAdapter da; SqlConnection con; SqlCommand com = new SqlCommand();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (!IsPostBack)
            DropDownList1.DataBound += (o, args) => DropDownList1.Items.Insert(0, " Select Category ");
    }

    void bindGV(string table_name)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
        com = new SqlCommand("select row_number() over(ORDER BY Id) AS IDD, Id, ques,option1,option2,option3,option4,correctans from  [dbo].["
                            + table_name + "] ORDER BY IDD", con);

        da = new SqlDataAdapter(com.CommandText, con);
        dt = new DataTable();
        da.Fill(dt);

        if (dt.Rows.Count == 0)
        {
            GridView1.DataSource = ReturnEmptyDataTable();
            GridView1.DataBind();
            GridView1.Rows[0].Visible = false;
        }
        else
        {
            ViewState["dt"] = dt;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }

    public DataTable ReturnEmptyDataTable()
    {
        var Idd = new DataColumn("Idd", typeof (int));

        var Id = new DataColumn("Id", typeof(int))
        {
            ReadOnly = true,
            Caption = "ID",
            AllowDBNull = false,
            Unique = true,
            AutoIncrement = true,
            AutoIncrementSeed = 1,
            AutoIncrementStep = 1
        };

        var ques = new DataColumn("ques", typeof(string));
        var option1 = new DataColumn("option1", typeof(string));
        var option2 = new DataColumn("option2", typeof(string));
        var option3 = new DataColumn("option3", typeof(string));
        var option4 = new DataColumn("option4", typeof(string));
        var correctans = new DataColumn("correctans", typeof(string));
        
        dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[] { Idd,Id, ques, option1, option2, option3, option4, correctans });
        DataRow dr = dt.NewRow();

        dt.Rows.Add(dr);
        return dt;
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string s = DropDownList1.SelectedValue;
        if (str.checkSpace(s))
        {
            ViewState["currentTable"] = s;

            bindGV(s);
            GridView1.Visible = true;
            Button1.Visible = true;
            Label1.Visible = true;
            TextBox1.Visible = true;
        }
        else
        {
            GridView1.Visible = false;
            Button1.Visible = false;
            Label1.Visible = false;
            TextBox1.Visible = false;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int i;
        if (DropDownList1.SelectedValue == (string)ViewState["currentTable"] && ViewState["dt"] != null)
        {
            try
            {
                if (RegularExpressionValidator1.IsValid)
                    if (Int32.TryParse(TextBox1.Text, out i) && i > 0 && i < 1000)
                    {
                        var dtt = (DataTable) ViewState["dt"];
                        var ii = (int) dtt.Rows[i - 1]["Id"];
                        con = new SqlConnection(ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
                        com = new SqlCommand("delete from [dbo].["
                                             + (string) ViewState["currentTable"] + "] Where Id=" + ii, con);
                        con.Open();
                        com.ExecuteNonQuery();
                        con.Close();
                        bindGV((string) ViewState["currentTable"]);
                    }
                    else
                    {

                    }
            }
            finally
            {
            }
            //catch (IndexOutOfRangeException){}
            //catch  { }
        }
        TextBox1.Text = "";

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Add")
        {
            GridView1.FooterRow.Cells[1].FindControl("t1").Visible = true;
            GridView1.FooterRow.Cells[2].FindControl("t2").Visible = true;
            GridView1.FooterRow.Cells[3].FindControl("t3").Visible = true;
            GridView1.FooterRow.Cells[4].FindControl("t4").Visible = true;
            GridView1.FooterRow.Cells[5].FindControl("t5").Visible = true;
            GridView1.FooterRow.Cells[6].FindControl("ddl2").Visible = true;

            var b = (Button)GridView1.FooterRow.Cells[0].FindControl("Button2");
            b.Text = "Insert";
            b.CommandName = "Insert";
        }
        else if (e.CommandName == "Insert")
        {
            if (DropDownList1.SelectedValue == (string)ViewState["currentTable"])
            {
                var t1 = (TextBox)GridView1.FooterRow.Cells[1].FindControl("t1");
                var t2 = (TextBox)GridView1.FooterRow.Cells[1].FindControl("t2");
                var t3 = (TextBox)GridView1.FooterRow.Cells[1].FindControl("t3");
                var t4 = (TextBox)GridView1.FooterRow.Cells[1].FindControl("t4");
                var t5 = (TextBox)GridView1.FooterRow.Cells[1].FindControl("t5");
                var ddl2 = (DropDownList)GridView1.FooterRow.Cells[1].FindControl("ddl2");

                // Althoug admin is going to add here but, XSS preventation should be performed 
                if (!string.IsNullOrWhiteSpace(t1.Text) && !string.IsNullOrWhiteSpace(t2.Text) && !string.IsNullOrWhiteSpace(t3.Text)
                    && !string.IsNullOrWhiteSpace(t4.Text) && !string.IsNullOrWhiteSpace(t5.Text))
                {
                    con = new SqlConnection(ConfigurationManager.ConnectionStrings["CS"].ConnectionString);

                    com = new SqlCommand("insert into [dbo].[" + (string)ViewState["currentTable"] + "] values(@a,@b,@c,@d,@e,@f)", con);
                    com.Parameters.Add("@a", SqlDbType.VarChar, 300).Value = t1.Text;
                    com.Parameters.Add("@b", SqlDbType.VarChar, 100).Value = t2.Text;
                    com.Parameters.Add("@c", SqlDbType.VarChar, 100).Value = t3.Text;
                    com.Parameters.Add("@d", SqlDbType.VarChar, 100).Value = t4.Text;
                    com.Parameters.Add("@e", SqlDbType.VarChar, 100).Value = t5.Text;
                    com.Parameters.Add("@f", SqlDbType.VarChar, 100).Value = ddl2.SelectedValue;
                    con.Open();

                    com.ExecuteNonQuery();
                    con.Close();
                    bindGV((string)ViewState["currentTable"]);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "aa", "alert(\"Questions or any options can not be blank\");", true);
                    //Response.Write("<script>alert(\"Questions or any options can not be blank\");</script>");
                }
            }
        }
        else
        {

        }
    }
}