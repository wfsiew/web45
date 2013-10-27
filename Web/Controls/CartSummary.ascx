<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="CartSummary.ascx.vb" Inherits="Web.CartSummary" %>

<div class="well well-sm pull-right">
    <b>Your cart:</b>
    <span id="csQuantity" runat="server"></span> item(s),
    <span id="csTotal" runat="server"></span>
    <a id="csLink" runat="server" class="btn btn-info">Checkout</a>
</div>