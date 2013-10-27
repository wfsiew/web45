Imports PagedList

Public Class Listing
    Inherits System.Web.UI.Page

    Private repo As New Repository
    Private pageSize As Integer = 1

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Function GetProducts() As IEnumerable(Of Product)
        Dim l As IEnumerable(Of Product) = FilterProducts().OrderBy(Function(p) p.ProductID)
        Return l.ToPagedList(CurrentPage, pageSize)
    End Function

    Protected ReadOnly Property CurrentPage() As Integer
        Get
            Dim page As Integer = GetPageFromRequest()
            Return If(page > MaxPage, MaxPage, page)
        End Get
    End Property

    Protected ReadOnly Property MaxPage() As Integer
        Get
            Dim prodCount As Integer = FilterProducts().Count()
            Return CInt(Math.Truncate(Math.Ceiling(CDec(prodCount) / pageSize)))
        End Get
    End Property

    Private Function GetPageFromRequest() As Integer
        Dim page As Integer
        Dim reqValue As String = RouteData.Values("page")
        If String.IsNullOrEmpty(reqValue) Then
            reqValue = Request.QueryString("page")
        End If
        Return If(reqValue IsNot Nothing AndAlso Integer.TryParse(reqValue, page), page, 1)
    End Function

    Private Function FilterProducts() As IEnumerable(Of Product)
        Dim products As IEnumerable(Of Product) = repo.Products
        Dim currentCategory As String = If(DirectCast(RouteData.Values("category"), String), _
                                           Request.QueryString("category"))

        If String.IsNullOrEmpty(currentCategory) Then
            Return products

        Else
            Return products.Where(Function(p) p.Category = currentCategory)
        End If
    End Function
End Class