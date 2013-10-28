<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CartView.aspx.vb" Inherits="Web.CartView"
    MasterPageFile="~/Pages/Store.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="bodyContent" runat="server">
    <h2>Your Cart</h2>
    <table class="table table-condensed table-hover table-responsive table-striped">
        <thead>
            <tr class="well">
                <th>Quantity</th>
                <th>Item</th>
                <th>Price</th>
                <th>Subtotal</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="Rpt1" runat="server" ItemType="Web.CartLine" SelectMethod="GetCartLines" EnableViewState="false">
                <ItemTemplate>
                    <tr>
                        <td><%# Item.Quantity%></td>
                        <td><%# Item.Product.Name %></td>
                        <td><%# Item.Product.Price.ToString("c")%></td>
                        <td><%# ((Item.Quantity * Item.Product.Price).ToString("c"))%></td>
                        <td>
                            <button name="remove" type="submit" value="<%# Item.Product.ProductID%>" class="btn btn-danger">Remove</button>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="3"><span class="pull-right">Total:</span></td>
                <td><%= CartTotal.ToString("c")%></td>
                <td></td>
            </tr>
        </tfoot>
    </table>

    <a href="<%= ReturnUrl%>" class="btn btn-default">Continue shopping</a>
    <a href="<%= CheckoutUrl%>" class="btn btn-default">Checkout</a>
</asp:Content>
