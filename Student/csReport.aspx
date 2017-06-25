<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="csReport.aspx.cs" Inherits="csReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <a href="ques.aspx" style="padding-left:40px; background-color:springgreen; font:bold 1em verdana;">Try Again </a>
    <asp:Button ID="logout" runat="server" Text="Logout" OnClick="logout_Click" />
        
        <asp:GridView CssClass="gv" ShowFooter="true" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="false" ID="GridView1" runat="server">
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                      
                        <asp:Label ID="Label5" runat="server" Text="Question"></asp:Label></th>
                        <th>
                            <asp:Label ID="Label6" runat="server" Text="Answer"></asp:Label></th><th>
                        <asp:Label ID="Label7" runat="server" Text="Yours"></asp:Label>  
                    </HeaderTemplate>
                   
                    <AlternatingItemTemplate>
                        <tr class="ggv" >
                            <td class="ques" width="50%" align="left" >
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("ques") %>'></asp:Label></td>
                            <td class="correct" width="35%" align="right">
                                <asp:Label ID="Label2" runat="server" Text='<%#CAns(Container.DataItem) %>'></asp:Label></td>
                            <td width="35%" class="userans" align="right">
                                <asp:Label ID="Label3" runat="server" Text='<%#ans(Container.DataItem) %>'></asp:Label></td>
                        </tr>
                    </AlternatingItemTemplate>
                 
                    <ItemTemplate>
                        <tr class="ggval" >
                            <td class="ques" width="50%" align="left" >
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("ques") %>'></asp:Label></td>
                            <td class="correct" width="35%" align="right">
                                <asp:Label ID="Label2" runat="server" Text='<%#CAns(Container.DataItem) %>'></asp:Label></td>
                            <td width="35%" class="userans" align="right">
                                <asp:Label ID="Label3" runat="server" Text='<%#ans(Container.DataItem) %>'></asp:Label></td>
                        </tr>


                    </ItemTemplate>
                    <FooterTemplate>
                 <tr><td colspan="3">
                        <strong id="span1">Correct Answers:<%# marks.ToString() %>            </strong>
                     </td></tr>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

