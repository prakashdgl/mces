using System;
using System.Activities.Statements;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_addNew : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
            Repeater1.DataSource = DBL.getCategory();
            Repeater1.DataBind();

        //if (ScriptManager1.AsyncPostBackSourceElementID.EndsWith("asasasasasa"))
        //{

        //}

    }

    protected void btnAddCat_OnClick(object sender, EventArgs e)
    {
        string hh="";
        if (!string.IsNullOrWhiteSpace(TextBox1.Text))
            hh = DBL.addNewCategory(TextBox1.Text);
       if (hh == "table exists")
       {
           Label1.Visible = true;
            Label1.ForeColor=Color.Red;
            Label1.Text = "This category already Exists in DB ";

        }
        if (hh == "column exists in category")
        {
            Label1.Visible = true;
            Label1.ForeColor = Color.Red;
            Label1.Text = "This category already Exists in cat Table Delete It first";
        }
        if (hh == "Successful")
        {
            Label1.Visible = true;
            Label1.ForeColor = Color.Green;
            Label1.Text = "Successfully added";
        }

    }
}
