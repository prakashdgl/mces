<%@ Page Title="a" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="csharp.aspx.cs" Inherits="csharp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>
           <asp:Timer ID="Timer1" OnTick="Timer1_Tick" Interval="1000" runat="server"></asp:Timer>
            <asp:Label ID="Label3" CssClass="redalert" runat="server" ></asp:Label>
           
       </ContentTemplate>
    </asp:UpdatePanel>
    <asp:GridView PageSize="3" AllowPaging="true" BorderColor="#ffffff" Width="100%" ID="GridView1" OnRowCreated="GridView1_RowCreated" OnRowDataBound="GridView1_RowDataBound" runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" AutoGenerateColumns="false" 
         ShowHeader="False" EnableViewState="true">
        <Columns>
            <asp:TemplateField HeaderStyle-BorderWidth="0" ControlStyle-BorderWidth="0">
                <HeaderTemplate>
                </HeaderTemplate>
                <ItemTemplate>
                    <table style="width: 80%" align="center" border="0">
                        <tr>
                            <td valign="top">
                                <asp:Label ID="Label1" runat="server" Text='<%#GetID(Container.DataItem)%>'></asp:Label>
                                <asp:Label ID="Label2" runat="server" Text='<%#Eval("ques") %>' /></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle ForeColor="Blue" BackColor="LightBlue" />
        <PagerSettings PageButtonCount="3" Position="Bottom" />
        <PagerTemplate>
            <asp:Button ID="Button1" CssClass="Buttonclass" OnClick="Button1_Click" PostBackUrl="~/Student/csharp.aspx" runat="server" Text="Next Page" CommandName="Page" CommandArgument="Next" />
        </PagerTemplate>
    </asp:GridView>

</asp:Content>

