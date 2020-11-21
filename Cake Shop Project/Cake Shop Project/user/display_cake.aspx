<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="display_cake.aspx.cs" Inherits="Cake_shop_Project.user.display_cake" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <asp:Repeater ID="cakes" runat="server">
        <HeaderTemplate>
            <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li class="last"><a href="cake_description.aspx?id=<%#Eval("id")%>">
                <img width="200px" height="150px" src="../Images/<%#Eval("cake_image")%>" alt="" /></a>
                <div class="product-info">
                    <div class="product-desc">
                        <h3><%#Eval("cake_name") %></h3>
                        Cake description: <%#Eval("cake_description")%>
                        Cake price:<%#Eval("cake_price")%>
                        Available:<%#Eval("cake_quantity")%>
                    </div>
                </div>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
