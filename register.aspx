<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="Scripts/jquery-1.7.1.min.js"></script>
    <script src="Scripts/JavaScript.js"></script>
    <style type="text/css">
        .auto-style1 {width: 200px;}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="login_table">

        <table>
            <tr valign="middle" style="height: 30px; color: darkred; text-underline-position: below">
                <td>
                    <h3><u>Register</u> </h3>
                </td>
                <td align="right">
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>User ID: </td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox1" onblur="doWork();" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator CssClass="validation" Display="Dynamic" ControlToValidate="TextBox1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Unique ID"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Password:</td>
                <td class="auto-style1">
                    <asp:TextBox type="password" ID="TextBox2" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator CssClass="validation" Display="Dynamic" ControlToValidate="TextBox2" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Password"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator Display="Dynamic" CssClass="validation" ControlToValidate="TextBox3" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Email"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator CssClass="validation" Display="Dynamic" ID="RegularExpressionValidator1" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="TextBox3" runat="server" ErrorMessage="Wrong E-mail"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td style="height: 40px" align="center" colspan="3">
                    <asp:Button ID="Button1" runat="server" Text="Create Account" Width="210px" OnClick="Button1_Click" /></td>
            </tr>

        </table>
    </div>

</asp:Content>

