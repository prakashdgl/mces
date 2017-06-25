<%@ Page Language="C#" EnableViewState="false" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link rel="stylesheet" href="~/Scripts/style.css" type="text/css" />
</head>
<body>

               <div id='mainhead'>
            <div id='inhead'>
               
                <h1>Multiple Choice Examination System</h1>
                <h3>Try&nbsp; it...</h3>

                <ul id='mainnav'>
                   <li ><a href="aboutme.aspx">ABOUT ME</a></li>
                    <li><a href="register.aspx">Register</a></li>
                </ul>

                 </div>
            <!-- end div inhead -->
        </div>
      <form id="form1" runat="server">
        <div class="content">
            <div id="login_table">
        <table>
            <tr valign="middle" style="height: 30px; color: lightskyblue; text-underline-position: below">
                <td colspan="2">
                    <h3><u>Login</u> </h3>
                </td>
            </tr>
            <tr>
                <td>User ID: </td>
                <td>
                    <asp:TextBox BackColor="#ccccff" ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td>
                    <asp:TextBox BackColor="#ccccff" type="password" ID="TextBox2" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="height: 40px" align="center" colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="Login" Width="110px" OnClick="Button1_Click" /></td>
            </tr>

        </table>
    </div>
         </div>
        </form>
    
      <div id="footer">
        <span>For every complex problem there is an answer that is clear, simple, and wrong. --H. L. Mencken</span>
    </div>
    <div id="me">
        <span> designed & developed by Sumit Maurya(theSumit67@gmail.com)</span>
    </div>
</body>
    <%--Developed by Sumit Maurya--%>
</html>
