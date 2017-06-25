using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class csharp : System.Web.UI.Page
{

    SqlConnection con= new SqlConnection(ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
    SqlCommand com; SqlDataAdapter da; DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Countdowns"] == null)
        {
            Session["Countdowns"] = new CountDown(TimeSpan.Parse("00:00:40"));
            (Session["Countdowns"] as CountDown).Start();
        }
        if (str.checkSpace((string)Session["ques"]))
        {
            if (!Page.IsPostBack)
            {
                string sss = (string)Session["ques"];

                com = new SqlCommand("select top 10 ques, option1, option2, option3, option4,correctans from [dbo].[" + (string)Session["ques"] + "] order by newid()", con);
                da = new SqlDataAdapter(com.CommandText, con);

                ///////////////////////////////////////////////////

                DataColumn Id = new DataColumn("Id", typeof(int));
                Id.ReadOnly = true;
                Id.Caption = "ID";
                Id.AllowDBNull = false;
                Id.Unique = true;
                Id.AutoIncrement = true;
                Id.AutoIncrementSeed = 1;
                Id.AutoIncrementStep = 1;

                DataColumn ques = new DataColumn("ques", typeof(string));
                DataColumn option1 = new DataColumn("option1", typeof(string));
                DataColumn option2 = new DataColumn("option2", typeof(string));
                DataColumn option3 = new DataColumn("option3", typeof(string));
                DataColumn option4 = new DataColumn("option4", typeof(string));
                DataColumn correctans = new DataColumn("correctans", typeof(string));

                dt = new DataTable("tabb");
                dt.Columns.AddRange(new DataColumn[] { Id, ques, option1, option2, option3, option4, correctans });

                da.Fill(dt);
                Session["datatable"] = dt;
                dt = ((DataTable)Session["datatable"]);
                GridView1.DataSource = Session["datatable"];
                GridView1.DataBind();
            }
        }
        else
        {
            Server.Transfer("ques.aspx");

        }
        Response.Cache.SetNoStore();
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
       
        dt = new DataTable();
        dt = ((DataTable)Session["datatable"]);
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.DataSource = Session["datatable"];
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();// row created->rowdatabound

    }


    protected string GetID(object ob)
    {
        return DataBinder.Eval(ob, "Id").ToString() + ".";
    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)//data bound
    {

        if (GridView1.PageIndex == GridView1.PageCount - 1)
        {
            if (e.Row.RowType == DataControlRowType.Pager)
            {
                Button b = (Button)(e.Row.FindControl("Button1"));

                b.Click += delegate { Session["Countdowns"] = null; Response.Redirect("csReport.aspx"); };
                b.Text = "Submit";
                b.CommandArgument = "";
                b.CommandName = "";
            }
        }

    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        int i = GridView1.PageIndex;

        Label l1 = (Label)GridView1.Rows[0].FindControl("Label1");
        RadioButtonList rbl = (RadioButtonList)GridView1.Rows[0].FindControl("RadioButtonList1");
        ((Dictionary<Int32, string>)Session["res"])[Int32.Parse(l1.Text.TrimEnd('.'))] = rbl.SelectedValue;

        try
        {
            Label l2 = (Label)GridView1.Rows[1].FindControl("Label1");
           
            RadioButtonList rbl2 = (RadioButtonList)GridView1.Rows[1].FindControl("RadioButtonList1");
            ((Dictionary<Int32, string>)Session["res"])[Int32.Parse(l2.Text.TrimEnd('.'))] = rbl2.SelectedValue;

            Label l3 = (Label)GridView1.Rows[2].FindControl("Label1");
            RadioButtonList rbl3 = (RadioButtonList)GridView1.Rows[2].FindControl("RadioButtonList1");
            ((Dictionary<Int32, string>)Session["res"])[Int32.Parse(l3.Text.TrimEnd('.'))] = rbl3.SelectedValue;
        }
        catch (ArgumentOutOfRangeException){ }
       
    }
        
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            RadioButtonList rbl = (RadioButtonList)e.Row.FindControl("RadioButtonList1");

            int i = e.Row.DataItemIndex;
            rbl.Items.Add(dt.Rows[i][2].ToString());
            rbl.Items.Add(dt.Rows[i][3].ToString());
            rbl.Items.Add(dt.Rows[i][4].ToString());
            rbl.Items.Add(dt.Rows[i][5].ToString());

        }
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        if (Session["Countdowns"] != null)
        {
            if(TimeSpan.Compare((Session["Countdowns"] as CountDown).TimeLeft,TimeSpan.Zero)>0)
            {Label3.Text = (Session["Countdowns"] as CountDown).TimeLeft.ToString();}
            else { Session["Countdowns"] = null; Response.Redirect("csReport.aspx"); }
        }
    }

    public class CountDown
    {
        public TimeSpan TimeLeft;
        System.Threading.Thread thread;
        public CountDown(TimeSpan original)
        {
            this.TimeLeft = original;
        }
        public void Start()
        {
            System.Threading.ThreadStart threadDelegate = delegate
            {
                while (true)
                {
                    System.Threading.Thread.Sleep(1000);
                    TimeLeft = TimeLeft.Subtract(TimeSpan.Parse("00:00:01"));
                }

            };
            thread  =new System.Threading.Thread(threadDelegate);
            thread.Start();
        }
    }
}