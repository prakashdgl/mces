<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }

    
    protected void Application_Error(Object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs
        //Response.Write("<b>");
        //Response.Write("Oops! Looks like an error occurred!!</b><hr />");
        //Response.Write(Server.GetLastError().Message.ToString());
        //Response.Write("<hr />" + Server.GetLastError().ToString());
        //Server.ClearError();
    } 
    void Session_Start(object sender, EventArgs e) 
    {
        var d = new Dictionary<int,string>();
        Session["res"]=d;
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the session state mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
