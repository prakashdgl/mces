<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="adminGV.aspx.cs" Inherits="Admin_adminGV" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td width="15%"><strong>Select Topic:  </strong></td>
            <td width="30%">
                <asp:DropDownList DataSourceID="SqlDataSource1" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataTextField="name" AutoPostBack="true" Width="80%" ID="DropDownList1" runat="server">
                  
                </asp:DropDownList></td>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CS %>"  ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [cat]"></asp:SqlDataSource>
            <td width="60%">

                <asp:Label ID="Label1" Visible="false" runat="server" Text="Delete By ID:"></asp:Label>
                <asp:TextBox ID="TextBox1" Visible="false"  runat="server"></asp:TextBox><asp:Button Visible="false" OnClick="Button1_Click" ID="Button1" runat="server" Text="Delete" /><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Wrong Id" ControlToValidate="TextBox1" ValidationExpression="^[1-9]{1}\d{0,2}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
    </table>

    <asp:GridView Width="100%" ID="GridView1" ShowFooter="true" AutoGenerateColumns="false" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" ShowHeaderWhenEmpty="true" CellSpacing="1" GridLines="None"  OnRowCommand="GridView1_RowCommand">
        <Columns>

            <asp:TemplateField HeaderText="Id" >
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("IDD") %>'>  </asp:Label>
                </ItemTemplate>
                <FooterStyle HorizontalAlign="Right" />
                <FooterTemplate>

                    <asp:Button ID="Button2" runat="server" CommandName="Add" Text="Add" />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Ques">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ques") %>'>  </asp:Label>
                </ItemTemplate>
                <FooterStyle HorizontalAlign="Right" />
                <FooterTemplate>

                    <asp:TextBox ID="t1" Visible="false" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Option1">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("option1") %>'>  </asp:Label>
                </ItemTemplate>
                <FooterStyle HorizontalAlign="Right" />
                <FooterTemplate>

                    <asp:TextBox ID="t2" runat="server" Visible="false"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Option2">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("option2") %>'>  </asp:Label>
                </ItemTemplate>
                <FooterStyle HorizontalAlign="Right" />
                <FooterTemplate>

                    <asp:TextBox ID="t3" runat="server" Visible="false"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Option3">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("option3") %>'>  </asp:Label>
                </ItemTemplate>
                <FooterStyle HorizontalAlign="Right" />
                <FooterTemplate>

                    <asp:TextBox ID="t4" Visible="false" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Option4">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("option4") %>'>  </asp:Label>
                </ItemTemplate>
                <FooterStyle HorizontalAlign="Right" />
                <FooterTemplate>

                    <asp:TextBox ID="t5" Visible="false" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Ans">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("correctans") %>'>  </asp:Label>
                </ItemTemplate>
                <FooterStyle HorizontalAlign="Right" />
                <FooterTemplate>

                    <asp:DropDownList ID="ddl2" Visible="false" runat="server">
                        <asp:ListItem Text="Option1" Value="option1"></asp:ListItem>
                        <asp:ListItem Text="Option2" Value="option2"></asp:ListItem>
                        <asp:ListItem Text="Option3" Value="option3"></asp:ListItem>
                        <asp:ListItem Text="Option4" Value="option4"></asp:ListItem>
                    </asp:DropDownList>
                </FooterTemplate>
                
            </asp:TemplateField>
            
            

        </Columns>
      <EmptyDataTemplate>
            No Records
           <asp:Button ID="Button2" runat="server" CommandName="Add" Text="Add" />
                
        </EmptyDataTemplate>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />



    </asp:GridView>

</asp:Content>

