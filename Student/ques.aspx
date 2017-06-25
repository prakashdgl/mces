<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ques.aspx.cs" Inherits="ques" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 191px;
        }
        .auto-style3 {
            width: 89px;
        }
        .auto-style4 {
            height: 36px;
        }
        .auto-style5 {
            width: 191px;
            height: 36px;
        }
        .auto-style6 {
            width: 89px;
            height: 36px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Button  OnClick="Button2_Click"   Width="90px"  Visible="false" ID="Button2" runat="server" Text="Admin Page"/>
    <asp:Button ID="logout" runat="server" Width="69px" Text="Logout" OnClick="logout_Click" />

    <table align="center" class="auto-style1">
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style5">
                <asp:DropDownList  ID="DropDownList1" DataSourceID="SqlDataSource1" DataTextField="name" runat="server" Height="27px" Width="173px"></asp:DropDownList>
                
            </td>
            <td class="auto-style6">
                <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" Text="Start" Width="69px" />
            </td>
            <td class="auto-style4"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\OES.mdf;Integrated Security=True"  ProviderName="System.Data.SqlClient" SelectCommand="SELECT name FROM [dbo].[cat] where no_of_ques>3" ></asp:SqlDataSource>
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>


</asp:Content>

