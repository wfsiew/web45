Imports System.Web.Routing

Public Class RouteConfig
    Public Shared Sub RegisterRoutes(routes As RouteCollection)
        routes.MapPageRoute(Nothing, "list/{category}/{page}", "~/Pages/Listing.aspx")
        routes.MapPageRoute(Nothing, "list/{page}", "~/Pages/Listing.aspx")
        routes.MapPageRoute(Nothing, "", "~/Pages/Listing.aspx")
        routes.MapPageRoute(Nothing, "list", "~/Pages/Listing.aspx")
        routes.MapPageRoute("cart", "cart", "~/Pages/CartView.aspx")
        routes.MapPageRoute("checkout", "checkout", "~/Pages/Checkout.aspx")
        routes.MapPageRoute("admin_orders", "admin/orders", "~/Pages/Admin/Orders.aspx")
        routes.MapPageRoute("admin_products", "admin/products", "~/Pages/Admin/Products.aspx")
    End Sub
End Class