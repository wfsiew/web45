<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="Web.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/bootstrap/css/slate/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/signin.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <form id="form1" runat="server" class="form-signin">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="SingleParagraph" CssClass="alert alert-danger" />
            <input name="name" class="form-control" placeholder="Name" autofocus />
            <input name="password" type="password" placeholder="Password" class="form-control" />

            <button type="submit" class="btn btn-lg btn-primary btn-block">Log In</button>
        </form>
    </div>
</body>
</html>
