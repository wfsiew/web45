Imports System.Web.Routing

Public Class CategoryList
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Function GetCategories() As IEnumerable(Of String)
        Dim o As New Repository
        Return o.Products.Select(Function(p) p.Category).Distinct().OrderBy(Function(x) x)
    End Function

    Protected Function IsHomePath() As Boolean
        Dim b As Boolean = False
        Dim currentCategory As String = If(DirectCast(Page.RouteData.Values("category"), String), _
                                           Request.QueryString("category"))
        If String.IsNullOrEmpty(currentCategory) Then
            b = True
        End If

        Return b
    End Function

    Protected Function GetHomePath() As String
        Dim path As String = RouteTable.Routes.GetVirtualPath(Nothing, Nothing).VirtualPath
        Return path
    End Function

    Protected Function GetCategoryPath(category As String) As String
        Dim path As String = RouteTable.Routes.GetVirtualPath(Nothing, Nothing, _
                                                              New RouteValueDictionary() From {
                                                                  {"category", category},
                                                                  {"page", "1"}}).VirtualPath
        Return path
    End Function
End Class