<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ProductivityPointGlobal.Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>Login</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="/styles/bootstrap.min.css" />  
    <%#string.Format("<link rel=\"canonical\" href=\"{0}://{1}/cart/login.aspx\" />", Request.Url.Scheme, Request.Url.Host) %>

</head>
<body>
    <form id="form1" runat="server">
        <br/>
        <div class="container">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">CMS Login</h3>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label>Username</label>                                
                                <asp:TextBox ID="ctlUsernameNew" CssClass="form-control" placeholder="Username" runat="server" />
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <asp:TextBox ID="ctlPassword" CssClass="form-control" TextMode="Password" runat="server" />
                            </div>                            
                            <asp:Button ID="ctlAdminLogin" runat="server" Text="Login" OnClick="ctlAdminLogin_OnClick" CssClass="btn btn-primary btn-block" />
                            <br/>
                            <asp:Label ID="ctlError" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4"></div>
            </div>
        </div>        
    </form>
</body>
</html>
