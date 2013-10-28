<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Products.aspx.vb" Inherits="Web.Products"
    MasterPageFile="~/Pages/Admin/Admin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="ListView1" ItemType="Web.Product"
        SelectMethod="GetProducts" DataKeyNames="ProductID"
        UpdateMethod="UpdateProduct" DeleteMethod="DeleteProduct"
        InsertMethod="InsertProduct" InsertItemPosition="LastItem"
        EnableViewState="false" runat="server">
        <LayoutTemplate>
            <table class="table table-condensed table-hover table-responsive table-striped">
                <tr class="well">
                    <th>Name</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th></th>
                </tr>
                <tr runat="server" id="itemPlaceholder"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Item.Name %></td>
                <td class="description"><span>
                    <%# Item.Description %></span></td>
                <td><%# Item.Category %></td>
                <td><%# Item.Price.ToString("c") %></td>
                <td>
                    <asp:Button ID="Button1" CommandName="Edit" Text="Edit" runat="server" CssClass="btn btn-default" />
                    <asp:Button ID="Button2" CommandName="Delete" Text="Delete" runat="server" CssClass="btn btn-danger" />
                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <tr>
                <td>
                    <input name="name" value="<%# Item.Name %>" class="form-control" />
                    <input type="hidden" name="ProductID" value="<%# Item.ProductID%>" />
                </td>
                <td>
                    <input name="description" value="<%# Item.Description %>" class="form-control" />
                </td>
                <td>
                    <input name="category" value="<%# Item.Category %>" class="form-control" />
                </td>
                <td>
                    <input name="price" value="<%# Item.Price %>" class="form-control" />
                </td>
                <td>
                    <asp:Button ID="Button3" CommandName="Update" Text="Update" runat="server" CssClass="btn btn-default" />
                    <asp:Button ID="Button4" CommandName="Cancel" Text="Cancel" runat="server" CssClass="btn btn-warning" />
                </td>
            </tr>
        </EditItemTemplate>
        <InsertItemTemplate>
            <tr>
                <td>
                    <input name="name" class="form-control" />
                    <input type="hidden" name="ProductID" value="0" />
                </td>
                <td>
                    <input name="description" class="form-control" />
                </td>
                <td>
                    <input name="category" class="form-control" />
                </td>
                <td>
                    <input name="price" class="form-control" />
                </td>
                <td>
                    <asp:Button ID="Button5" CommandName="Insert" Text="Add" runat="server" CssClass="btn btn-default" />
                </td>
            </tr>
        </InsertItemTemplate>
    </asp:ListView>
</asp:Content>
