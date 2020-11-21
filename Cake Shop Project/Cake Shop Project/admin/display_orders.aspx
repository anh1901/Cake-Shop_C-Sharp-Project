<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="display_orders.aspx.cs" Inherits="Cake_shop_Project.admin.display_orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <asp:Repeater ID="orders" runat="server">
        <HeaderTemplate>
            <h2>User's orders</h2>
            <br>
            <table border="1" style="width:1000px; text-align:center">
                <tr style="background:gray">
                    <td>Username</td>
                    <td>Address</td>
                    <td>Phone</td>
                    <td>View details</td>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                    <td><%#Eval("username")%></td>
                    <td><%#Eval("address")%></td>
                    <td><%#Eval("phone")%></td>
                    <td><a href="view_order_details.aspx?id=<%#Eval("id")%>">View details</a></td>
                </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
