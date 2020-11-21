<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="cake_description.aspx.cs" Inherits="Cake_shop_Project.user.cake_description" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <asp:Repeater ID="cake" runat="server">
        <HeaderTemplate>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="row">
                <div class="col">
                    <img width="250px" height="250px" src="../Images/<%#Eval("cake_image")%>" alt="" />
                </div>
                <div class="col">
                    <h2>
                        <p>Cake name: <%#Eval("cake_name")%></p>
                        <br>
                        <p>Cake Description: <%#Eval("cake_description")%></p>
                        <br>
                        <p>Cake Price: $<%#Eval("cake_price")%></p>
                        <br>
                        <p>Available: <%#Eval("cake_quantity")%></p>
                        <br>
                    </h2>
                </div>
            </div>
        </ItemTemplate>
        <FooterTemplate>
        </FooterTemplate>
    </asp:Repeater>
    <br />
    <table>
        <tr>
            <td>
                <asp:Label ID="InputLable" runat="server" Text="Input quantity:"></asp:Label></td>
            <td>
                <asp:TextBox ID="quantity" runat="server" CssClass="input100" Text="1" onkeydown="return (!(event.keyCode>=65 && event.keyCode<=90 ) && event.keyCode!=32);"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="AddToCart" runat="server" Text="Add to cart" OnClick="AddToCart_Click" CssClass="btn btn-dark" Height="54px" Width="167px" /></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="MSG" runat="server" ForeColor="Red" Font-Bold="true" Font-Italic="true" Font-Size="Large" Text=""></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
