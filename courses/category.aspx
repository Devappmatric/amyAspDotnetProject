<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="ProductivityPointGlobal.courses.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <%#string.Format("<link rel=\"canonical\" href=\"{0}://{1}/courses/category.aspx\" />", Request.Url.Scheme, Request.Url.Host) %>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow"><asp:Label id="ctlTitle" runat="server" /> Catalog</h1>   
                            <%--<h2 class="white fontShadow">Our Catalog of Courses has something for everyone from a basic user to HR and IT Professionals.</h2>--%>
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
                    <div class="col-lg-8 col-md-6 col-sm-6 col-xs-12 padding80T">
                        <div class="padding10B"><h3>Our Catalog of Courses has something for everyone from a basic user to HR and IT Professionals.</h3></div>
                        <asp:Repeater ID="ctlCourses" runat="server">
                            <HeaderTemplate>                            
                                <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Course Name</th>
                                    <th>Fee / Length</th>
                                </tr>
                                </thead>
                                <tbody>                    
                            </HeaderTemplate>

                            <ItemTemplate>
                                <tr>
                                    <td><strong><asp:HyperLink ID="ctlCourse" Text='<%# Eval("courseName") %>' ToolTip='<%# Eval("seoCourseName") %>' Title='<%# Eval("seoCourseName") %>' NavigateUrl='<%# String.Format("~/Course/{0}/", Server.HtmlEncode(Eval("seoCourseName").ToString().Trim().Replace(" ","-"))) %>' runat="server" /></strong></td>
                                    <td><%# Eval("price","{0:c}") %> / <%# Eval("duration") %> Day Course</td>
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