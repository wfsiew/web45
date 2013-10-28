Imports System.Data.Entity

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