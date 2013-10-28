Imports System.Web.ModelBinding

Public Class Products
    Inherits System.Web.UI.Page

    Private repo As New Repository

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Function GetProducts() As IEnumerable(Of Product)
        Return repo.Products
    End Function

    Public Sub UpdateProduct(productID As Integer)
        Dim myProduct As Product =
        repo.Products.Where(
        Function(p) p.ProductID = productID).FirstOrDefault()
        If myProduct IsNot Nothing AndAlso
        TryUpdateModel(
        myProduct, New FormValueProvider(
        ModelBindingExecutionContext)) Then
            repo.SaveProduct(myProduct)
        End If
    End Sub

    Public Sub DeleteProduct(productID As Integer)
        Dim myProduct As Product =
        repo.Products.Where(
        Function(p) p.ProductID = productID).FirstOrDefault()
        If myProduct IsNot Nothing Then
            repo.DeleteProduct(myProduct)
        End If
    End Sub

    Public Sub InsertProduct()
        Dim myProduct As New Product()
        If TryUpdateModel(myProduct, New FormValueProvider(
        ModelBindingExecutionContext)) Then
            repo.SaveProduct(myProduct)
        End If
    End Sub
End Class