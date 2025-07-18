<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="unsubscribe.aspx.cs" Inherits="ProductivityPointGlobal.Unsubscribe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow">Thank You</h1>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-5 col-sm-6 col-xs-12 margin20T responsiveCol">
                        <%--<uc:ContactForm runat="server" />--%>
                    </div>
                </div>
            </div>
        </div>
    </div>    
    
    <uc:Search ID="ucSearch" runat="server" />

    <div class="container-fluid bgWhite subPage padding75B">
        <div class="row">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-6 col-sm-6 col-xs-12">
                        <p class="sectionHeadingSubPage text-left subSectionPadding">You have been Unsubscribed</p>
                        <p>Per your request, you have been unsubscribed from our email list.</p>
                    </div>

                    <uc:Partners runat="server" />
                    
                </div>                    
            </div>
        </div>
    </div>	         
</asp:Content>
