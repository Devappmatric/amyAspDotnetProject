<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="500.aspx.cs" Inherits="ProductivityPointGlobal.errorpages.Custom500Error" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/styles/bootstrap.min.css">
    <link rel="stylesheet" href="/styles/font-awesome.min.css">
    <link rel="stylesheet" href="/styles/errors.css" />
    <script src="/scripts/jquery-2.1.1.min.js"></script>
    <script src="/scripts/bootstrap.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="noMargin paddingT45">
                        <span class="redFont"><strong>Server Error.</strong></span></h1>
                    <div class="padding10T">
                        <p class="lightGreyFont">
                            Date And Time:
                            <asp:Literal ID="ctlDateTime" runat="server" />
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid greyBg">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 padding140TB">
                        <div class="pull-left hidden-xs">
                            <i class="fa fa-cogs font100 padding20R lightGreyFont"></i>
                        </div>
                        <h1 class="greyFont lineHeight18 noMargin"><strong>Don't Worry.</strong><br />
                            We are working on finalizing this webpage.</h1>
                        <h3><strong>Go to <a href="http://www.productivitypointls.com/">www.productivitypointls.com</a> to search our complete course listing.</strong></h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <br />
                    <p>
                        If you need further assistance or have any questions contact us at <a href="mailto:support@productivitypointls.com">support@productivitypointls.com</a>
                    </p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
