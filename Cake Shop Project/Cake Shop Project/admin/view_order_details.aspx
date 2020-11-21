<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="view_order_details.aspx.cs" Inherits="Cake_shop_Project.admin.css.view_order_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <div>
        <asp:Repeater ID="details" runat="server">
            <HeaderTemplate>
                <h3>Details for order.</h3>
                <table border="1" style="width: 1000px; text-align: center">
                    <tr style="background: gray">
                        <td>Cake Image</td>
                        <td>Name</td>
                        <td>Unit Price</td>
                        <td>Quantity</td>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <img src="../images/<%#Eval("cake_image")%>" width="150px" height="150px" /></td>
                    <td><%#Eval("cake_name")%></td>
                    <td>$<%#Eval("cake_price")%></td>
                    <td><%#Eval("cake_quantity")%></td>
                </tr>

            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <asp:Label ID="total" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
