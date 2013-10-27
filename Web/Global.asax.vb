Imports System.Web.Routing

Public Class Global_asax
    Inherits HttpApplication

    Sub Application_Start(sender As Object, e As EventArgs)
        ' Fires when the application is started
        RouteConfig.RegisterRoutes(RouteTable.Routes)
    End Sub

    Private Sub Global_asax_AuthenticateRequest(sender As Object, e As EventArgs) Handles Me.AuthenticateRequest

    End Sub

    Private Sub Global_asax_BeginRequest(sender As Object, e As EventArgs) Handles Me.BeginRequest

    End Sub

    Private Sub Global_asax_Error(sender As Object, e As EventArgs) Handles Me.Error

    End Sub
End Class