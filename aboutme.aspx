<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aboutme.aspx.cs" Inherits="aboutme" %>

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
                <li><a href="index.aspx">Login</a></li>
                <li><a href="register.aspx">Register</a></li>
            </ul>

        </div>

    </div>
    <form id="form1" runat="server">
        <div class="content">
            <div id="about">
                <span>Hi! I am Sumit Maurya, pursuing MCA from IGNOU. Currently Learning C#, ASP.NET, SQL Server, HTML, JavaScript, CSS. Please Explore and rate this application. </span>
                <p>Future Updates---</p>
                <ol >
                    <li>Better Navigation, Design & Layout.</li>

                    <li>Role based Login(Membership).</li>
                    <li>Complete Frontend Configuration/Control.</li>
                    <li>Securtiy & Performance Enhancement.</li>
                    <li>Add/Remove new category for questions.</li>
                    <li>Add/Remove/View users (For Admin).</li>
                </ol>
            </div>
        </div>
    </form>
    <div id="footer">
        <span>For every complex problem there is an answer that is clear, simple, and wrong. --H. L. Mencken</span>
    </div>
    <div id="me">
        <span>designed & developed by Sumit Maurya(theSumit67@gmail.com)</span>
    </div>
</body>
<%--Developed by Sumit Maurya--%>
</html>
