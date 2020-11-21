<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="add_product.aspx.cs" Inherits="Cake_shop_Project.admin.add_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <h3>Add cake page</h3>
    <br>
    <table>
        <tr>
            <td>Produc Name</td>
            <td>
                <div class="wrap-input100 validate-input" data-validate="Product name is required">
                    <asp:TextBox ID="Name" runat="server" CssClass="input100"></asp:TextBox>
                    <span class="focus-input100"></span>
                </div>
            </td>
        </tr>
        <tr>
            <td>Produc Description</td>
            <td>
                <div class="wrap-input100 validate-input" data-validate="Description is required">
                    <asp:TextBox ID="Description" runat="server" CssClass="input100"></asp:TextBox>
                    <span class="focus-input100"></span>
                </div>
            </td>
        </tr>
        <tr>
            <td>Produc price($)</td>
            <td>
                <div class="wrap-input100 validate-input" data-validate="Product price is required">
                    <asp:TextBox ID="Price" runat="server" CssClass="input100" MaxLength="5" onkeydown="return (!(event.keyCode>=65 && event.keyCode<=90 ) && event.keyCode!=32);"></asp:TextBox>
                    <span class="focus-input100"></span>
                </div>
            </td>
        </tr>
        <tr>
            <td>Produc quantity</td>
            <td>
                <div class="wrap-input100 validate-input" data-validate="Product quantity is required">
                    <asp:TextBox ID="Quantity" runat="server" CssClass="input100" MaxLength="3" onkeydown="return (!(event.keyCode>=65 && event.keyCode<=90 ) && event.keyCode!=32);"></asp:TextBox>
                    <span class="focus-input100"></span>
                </div>
            </td>
        </tr>
        <tr>
            <td>Produc image</td>
            <td>
                <asp:FileUpload ID="Image" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="Upload" runat="server" Text="Upload" OnClick="Upload_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
