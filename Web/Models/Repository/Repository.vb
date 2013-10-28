Imports System.Data.Entity
Imports System.Web.ModelBinding

Public Class Repository
    Private Context As New EFDbContext

    Public ReadOnly Property Products() As IEnumerable(Of Product)
        Get
            Return Context.Products
        End Get
    End Property

    Public ReadOnly Property Orders() As IEnumerable(Of Order)
        Get
            Return Context.Orders.Include(Function(o) o.OrderLines.Select(Function(ol) ol.Product))
        End Get
    End Property

    Public Sub SaveProduct(product As Product)
        If product.ProductID = 0 Then
            product = Context.Products.Add(product)

        Else
            Dim dbProduct As Product =
            context.Products.Find(product.ProductID)
            If dbProduct IsNot Nothing Then
                dbProduct.Name = product.Name
                dbProduct.Description = product.Description
                dbProduct.Price = product.Price
                dbProduct.Category = product.Category
            End If
        End If
        context.SaveChanges()
    End Sub

    Public Sub DeleteProduct(product As Product)
        Dim orders As IEnumerable(Of Order) = Context.Orders.
            Include(Function(o) o.OrderLines.
                        Select(Function(ol) ol.Product)).
                    Where(Function(o) o.OrderLines.AsEnumerable.Count(Function(ol) ol.Product.ProductID = product.ProductID) > 0
        ).ToArray()
        For Each order As Order In orders
            context.Orders.Remove(order)
        Next
        context.Products.Remove(product)
        context.SaveChanges()
    End Sub

    Public Sub SaveOrder(order As Order)
        If order.OrderId = 0 Then
            order = Context.Orders.Add(order)
            For Each line As OrderLine In order.OrderLines
                Context.Entry(line.Product).State = EntityState.Modified
            Next
        Else
            Dim dbOrder As Order = Context.Orders.Find(order.OrderId)
            If dbOrder IsNot Nothing Then
                dbOrder.Name = order.Name
                dbOrder.Line1 = order.Line1
                dbOrder.Line2 = order.Line2
                dbOrder.Line3 = order.Line3
                dbOrder.City = order.City
                dbOrder.State = order.State
                dbOrder.GiftWrap = order.GiftWrap
                dbOrder.Dispatched = order.Dispatched
            End If
        End If
        Context.SaveChanges()
    End Sub
End Class