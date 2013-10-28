Imports System.Web.Routing

Public Class Admin
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public ReadOnly Property OrdersUrl() As String
        Get
            Return generateURL("admin_orders")
        End Get
    End Property
    Public ReadOnly Property ProductsUrl() As String
        Get
            Return generateURL("admin_products")
        End Get
    End Property

    Private Function generateURL(routeName As String) As String
        Return RouteTable.Routes.GetVirtualPath(
        Nothing,
        routeName,
        Nothing).VirtualPath
    End Function
End Class