<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Listing.aspx.vb" Inherits="Web.Listing"
    MasterPageFile="~/Pages/Store.Master" %>

<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="Web" %>
<%@ Import Namespace="PagedList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="bodyContent" runat="server">
    <ul class="list-group">
        <asp:Repeater ID="Rpt1" runat="server" ItemType="Web.Product" SelectMethod="GetProducts">
            <ItemTemplate>
                <li class="list-group-item">
                    <h3><%# Item.Name%></h3>
                    <%# Item.Description%>
                    <h4><%# Item.Price.ToString("c")%></h4>
                    <button name="add" type="submit" value="<%# Item.ProductID%>" class="btn btn-success">Add to Cart</button>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>

    <div class="pull-right">
        <ul class="pagination">
            <% For i As Integer = 1 To MaxPage%>
            <% Dim path As String =
                   RouteTable.Routes.GetVirtualPath(Nothing, Nothing, _
                                                    New RouteValueDictionary() From {
                                                        {"page", i}}).VirtualPath%>
            <% If i = CurrentPage Then%>
            <li class="active">
                <span><%= i%> <span class="sr-only">(current)</span></span>
            </li>
            <% Else%>
            <li>
                <a href="<%= path%>"><%= i %></a>
            </li>
            <% End If%>
            <% Next%>
        </ul>
    </div>
</asp:Content>
