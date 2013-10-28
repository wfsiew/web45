Imports System.Web.ModelBinding

Public Class Orders
    Inherits System.Web.UI.Page

    Private repo As New Repository

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Dim dispatchID As Integer
            If Integer.TryParse(Request.Form("dispatch"), dispatchID) Then
                Dim myOrder As Order = repo.Orders.Where(Function(o) o.OrderId = dispatchID).FirstOrDefault()
                If myOrder IsNot Nothing Then
                    myOrder.Dispatched = True
                    repo.SaveOrder(myOrder)
                End If
            End If
        End If
    End Sub

    Public Function Total(orderLines As IEnumerable(Of OrderLine)) As Decimal
        Dim olTotal As Decimal = 0
        For Each ol As OrderLine In orderLines
            olTotal += ol.Product.Price * ol.Quantity
        Next
        Return olTotal
    End Function

    Public Function GetOrders(<Control> showDispatched As Boolean) As IEnumerable(Of Order)
        If showDispatched Then
            Return repo.Orders

        Else
            Return repo.Orders.Where(Function(o) Not o.Dispatched)
        End If
    End Function

    Public Function Countlines(orderLines) As String
        Return orderLines.Count.ToString
    End Function
End Class