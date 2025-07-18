<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="home-results.aspx.cs" Inherits="ProductivityPointGlobal.courses.HomeResults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<asp:Literal runat="server" ID="ltrCanonical" />
<style type="text/css">
    .view{ background: url('<%# BannerPath %>') #033654 no-repeat center center fixed; background-size: 100% auto; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover; }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow"><asp:Literal runat="server" ID="ltrTitle" /><br /> Training Catalog</h1>
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

    <div class="container-fluid bgWhite subPage">
        <div class="row">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-6 col-sm-6 col-xs-12 padding80T">                            
                        <asp:Repeater ID="ctlCourses" runat="server">
                            <HeaderTemplate>                    
                                <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th class="col-lg-8">Course Name</th>
                                    <th class="col-lg-4">Fee / Length</th>
                                </tr>
                                </thead>
                                <tbody>                      
                            </HeaderTemplate>
                            <ItemTemplate>                    
                                <tr>
                                    <td><strong><asp:HyperLink ID="ctlCourse" Text='<%# Eval("courseName") %>' ToolTip='<%# Eval("courseName") %>' Title='<%# Eval("courseName") %>' NavigateUrl='<%# String.Format("~/course/{0}/", Eval("seoCourseName").ToString().ToLower().Replace(" ","-")) %>' runat="server" /></strong></td>
                                    <td><%# Eval("price","{0:c}") %> / <%# Eval("duration") %> Day Course</td>
                                    <%--<td><%# Eval("metaLocation") %></td>--%>
                                </tr>                    
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                </table>                                                           
                            </FooterTemplate>
                        </asp:Repeater>  
                    </div>

                    <uc:Partners runat="server" />
                    
                </div>                    
            </div>
        </div>
    </div>	         
</asp:Content>