Public Class Repository
    Private Context As New EFDbContext

    Public ReadOnly Property Products() As IEnumerable(Of Product)
        Get
            Return Context.Products
        End Get
    End Property
End Class