<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="addNew.aspx.cs" Inherits="Admin_addNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="StyleAdmin.css" rel="stylesheet" />
    <script type="text/javascript">

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ClientIDMode="Static" ID="UPanel1" runat="server">
        <ContentTemplate>
           
            <strong>List of Topics in DataBase</strong><br />
            <table style="border: 2px black">
                <asp:Repeater ID="Repeater1" runat="server">

                    <HeaderTemplate>

                        <tr>
                            <td>
                                <asp:TextBox ID="t1" runat="server" Text="Name" BackColor="Black" ForeColor="White" Font-Bold="true" ReadOnly="true"></asp:TextBox></td>
                            <td>
                                <asp:TextBox ID="t2" runat="server" Text="Time Limit" BackColor="Black" ForeColor="White" Font-Bold="true" ReadOnly="true"></asp:TextBox></td>
                            <td>
                                <asp:TextBox ID="t3" runat="server" Text="Total Questions" BackColor="Black" ForeColor="White" Font-Bold="true" ReadOnly="true"></asp:TextBox></td>

                        </tr>

                    </HeaderTemplate>

                    <ItemTemplate>

                        <tr>
                            <td>
                                <asp:TextBox ID="t1" runat="server" Text='<%# Eval("name") %>' BackColor="Gray" ForeColor="White" Font-Bold="true" ReadOnly="true"></asp:TextBox></td>
                            <td>
                                <asp:TextBox ID="t2" runat="server" Text='<%# Eval("time") %>' BackColor="Gray" ForeColor="White" Font-Bold="true" ReadOnly="true"></asp:TextBox></td>
                            <td>
                                <asp:TextBox ID="t3" runat="server" Text='<%# Eval("no_of_ques") %>' BackColor="Gray" ForeColor="White" Font-Bold="true" ReadOnly="true"></asp:TextBox></td>
                        </tr>

                    </ItemTemplate>

                </asp:Repeater>
            </table>
            <br />
            <div id="footerdiv">
            <asp:Label ID="Label1" runat="server" Visible="False" Text=""></asp:Label><br />
            <strong>Add New Category:</strong>
            <asp:TextBox placeholder="minimum 4 chars" ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="btnAddCat" OnClick="btnAddCat_OnClick" runat="server" Text="Add" /><br />
            <asp:RegularExpressionValidator Display="Dynamic" ID="ReExValidator1" ValidationExpression="[a-zA-Z]{4,15}" ControlToValidate="TextBox1" runat="server" ErrorMessage="4-15 chars, Without Space"></asp:RegularExpressionValidator>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

