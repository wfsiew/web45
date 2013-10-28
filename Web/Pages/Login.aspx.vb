Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Dim name As String = Request.Form("name")
            Dim password As String = Request.Form("password")
            If name IsNot Nothing AndAlso password IsNot Nothing AndAlso
                FormsAuthentication.Authenticate(name, password) Then
                FormsAuthentication.SetAuthCookie(name, False)
                Response.Redirect(If(Request("ReturnUrl"), "/"))

            Else
                ModelState.AddModelError("fail", "Login failed. Please try again")
            End If
        End If
    End Sub

End Class