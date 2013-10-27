<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="CategoryList.ascx.vb" Inherits="Web.CategoryList" %>

<ul class="nav nav-pills nav-stacked">
    <% If IsHomePath() Then%>
    <li class="active">
        <a href="<%= GetHomePath()%>">Home</a>
    </li>
    <% Else%>
    <li>
        <a href="<%= GetHomePath()%>">Home</a>
    </li>
    <% End If%>
    <% For Each cat As String In GetCategories()%>
    <% If cat = Page.RouteData.Values("category") Or cat = Request.QueryString("category") Then%>
    <li class="active">
        <a href="<%= GetCategoryPath(cat)%>"><%= cat%></a>
    </li>
    <% Else%>
    <li>
        <a href="<%= GetCategoryPath(cat)%>"><%= cat%></a>
    </li>
    <% end if %>
    <% Next%>
</ul>