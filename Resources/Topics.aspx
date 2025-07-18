<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/default.Master" CodeBehind="Topics.aspx.cs" Inherits="ProductivityPointGlobal.Resources.Topics" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%#string.Format("<link rel=\"canonical\" href=\"{0}://{1}/about-ppls.aspx\" />", Request.Url.Scheme, Request.Url.Host) %>
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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container about-page" style="margin-top:180px;">
        <div class="row">
            <div class="col-md-12">
                <div class="top-heading">
                    Topics
                </div>
            </div>
        </div>
        <asp:Repeater ID="rptPosts" runat="server">
            <ItemTemplate>
                <div class="blog-post">
                    <div class="row">
                        <div class="col-md-4">
                            <img src='/uploads/posts/<%# Eval("cover_image_url") %>' alt='<%# Eval("title") %>' style="max-width:100%; height:auto;" />                        

                        </div>
                        <div class="col-md-8">
                            <h3><a href='/blog/<%# Eval("slug") %>'><%# Eval("title") %></a> </h3>
                            <p class="text-muted"><%# Eval("created_at", "{0:MMMM dd, yyyy}") %></p>
                            <p><%# Eval("description") %></p>
                             <a href='/blog/<%# Eval("slug") %>' style="text-decoration: underline !important;font-size:16px">Read More..</a>
                        </div>
                    </div> 
                </div>
                <hr />
            </ItemTemplate>
        </asp:Repeater>


    </div>               
</asp:Content>








