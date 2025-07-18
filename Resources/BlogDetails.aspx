<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/default.Master" CodeBehind="BlogDetails.aspx.cs" Inherits="ProductivityPointGlobal.Resources.BlogDetails" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="canonical" href="<%= CanonicalURL %>" />

    <meta name="description" content="<%= MetaDescription %>" />
    <meta property="og:title" content="<%= Page.Title %>" />
    <meta property="og:description" content="<%= MetaDescription %>" />
    <meta property="og:url" content="<%= CanonicalURL %>" />
    <meta property="og:type" content="article" />
    <meta property="og:image" content="<%= MetaImage %>" />

    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="<%= Page.Title %>" />
    <meta name="twitter:description" content="<%= MetaDescription %>" />
    <meta name="twitter:image" content="<%= MetaImage %>" />

    <link href="https://fonts.cdnfonts.com/css/abadi-mt-std" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>       
    <style>
        .about-page {
            font-family: 'Montserrat';
        }

        .about-page-img{
            width:100%;
        }

        .zero-margin{
            margin-left:0px !important;
            margin-right:0px !important;
        }

        .zero-padding{
            padding-left:0px !important;
            padding-right:0px !important;
        }

        .top-heading{
            font-size:22px;
            font-weight:700;
            text-align:center;
            margin-bottom:15px;
        }

        .first-division {
            background-color:#EDDBC9;
            margin-top:20px;
            font-family: 'Abadi MT Std', sans-serif;

        }

        .first-division .first-text{
               color:#ADA9A9;
               font-size:27px;
        }

        .first-division .second-text{
               color:#F1995D;
               font-size:32px;
        }

        .first-division .text-area{
                margin-top: 116px;
                text-align: right;
                padding-right: 160px !important;
        }

        .first-division img{
            width:100%;
            height:382px;
        }

        .second-division{
            margin-top:20px;
        }

        .second-division .col-md-12 >b{
            font:15px;   
        }
        .second-division .col-md-12 >p{
            font:15px;
        }
    </style>
    <style>
        @media (min-width: 1200px){
            .about-page {
                 width: 940px; 
            }
        }
        .third-division{
            background-color:#D1CFCD;
            margin-top:30px;
        }

        .third-division h2{
            font-weight:700;
            font-size:15px;
        }

        .third-division .text-content{
            font-size:13.5px;
        }

        .fourth-division{
            background-color:#EDDBC9;
            margin-top:30px;
        }

        .fourth-division .col-md-4{
            padding:20px !important;
        }

        .content-item-heading{
            font-size:15px;
            font-weight:700;
        }

        .content-item-content{
            font-size:13.5px;
        }

        .fifth-division{
            background-color:#D5D5D5;
            margin-top:30px;
        }

        .fifth-division .content-area{
            padding:20px !important;
        }

        .sixth-division{
            background-color:#EACCCC;
            margin-top:30px;
        }
        .sixth-division .content-area{
            padding-left:20px !important;
            padding-right:20px !important;
        }

        .custom-image{
            width:50%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="margin-top:200px;">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <asp:Image ID="imgCover" runat="server" CssClass="img-responsive custom-image" />
                    <h1>
                        <asp:Literal ID="ltTitle" runat="server" />
                        <asp:Label ID="lblDraft" runat="server" Text="[Draft]" CssClass="label label-warning" Visible="false" />
                    </h1>

                    <p class="text-muted">
                        <asp:Literal ID="ltDate" runat="server" /> | 
                        Category: <asp:Literal ID="ltCategory" runat="server" />
                    </p>
                    <!-- AddToAny BEGIN -->
                    <div class="a2a_kit a2a_kit_size_32 a2a_default_style">
                        <a class="a2a_button_facebook"></a>
                        <a class="a2a_button_email"></a>
                        <a class="a2a_button_facebook_messenger"></a>
                        <a class="a2a_button_whatsapp"></a>
                        <a class="a2a_button_reddit"></a>
                        <a class="a2a_button_linkedin"></a>
                        <a class="a2a_button_google_gmail"></a>
                        <a class="a2a_dd" href="https://www.addtoany.com/share"></a>
                    </div>
                    <script defer src="https://static.addtoany.com/menu/page.js"></script>
                    <!-- AddToAny END -->

                    <hr />
                    <div style="text-align:justify">
                        <asp:Literal ID="ltContent" runat="server" />
                    </div>
                </div>
            </div>
        </div>               
</asp:Content>








