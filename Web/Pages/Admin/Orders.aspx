<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Orders.aspx.vb" Inherits="Web.Orders"
    MasterPageFile="~/Pages/Admin/Admin.Master" EnableViewState="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="table table-condensed table-hover table-responsive table-striped">
        <thead>
            <tr class="well">
                <th>Name</th>
                <th>City</th>
                <th>Items</th>
                <th>Total</th>
                <th></th>
            </tr>
        </thead>
        <asp:Repeater ID="Rpt1" runat="server" SelectMethod="GetOrders" ItemType="Web.Order">
            <ItemTemplate>
                <tr>
                    <td><%#: Item.Name %></td>
                    <td><%#: Item.City %></td>
                    <td><%# Item.OrderLines.Sum(Function(ol) ol.Quantity)%></td>
                    <td><%# Total(Item.OrderLines).ToString("C") %> </td>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolder1" Visible="<%# Not Item.Dispatched%>" runat="server">
                            <button type="submit" name="dispatch" value="<%# Item.OrderId %>" class="btn btn-success">Dispatch</button>
                        </asp:PlaceHolder>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>

    <asp:CheckBox ID="showDispatched" runat="server" Checked="false" AutoPostBack="true" /> Show Dispatched Orders?
</asp:Content>
