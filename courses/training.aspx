<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="training.aspx.cs" Inherits="ProductivityPointGlobal.courses.Training" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">          
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow">Course Details</h1>
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
                        
                        <asp:FormView ID="ctlCourseDetails" DefaultMode="ReadOnly" RenderOuterTable="false" runat="server">
                            <ItemTemplate>
								<asp:HiddenField ID="ctlCourseId" Value='<%# Eval("courseId") %>' runat="server" />
                                <asp:HiddenField ID="ctlCat2" Value='<%# Eval("cat2") %>' runat="server" />                                            
                                <p class="sectionHeadingSubPage text-left subSectionPadding"><%# Eval("cat4CityPage") %> Classes in <%# CheckCityField(Eval("city").ToString()) %><%# CheckStateField(Eval("state").ToString().Trim()) %></p>                                                                                    
                                <p><%# Eval("courseShortDescription") %></p>     
                            </ItemTemplate>
                        </asp:FormView>  
                        
                        <asp:FormView ID="ctlCourseDescription" DefaultMode="ReadOnly" runat="server">
                            <ItemTemplate>
                                <asp:HiddenField ID="ctlCityPageId" Value='<%# Eval("courseId") %>' runat="server" />                    
                                <p class="sectionHeadingSubPage text-left subSectionPadding">Course Description</p>                                        
                                <p><asp:Literal ID="lblCourseDescription" runat="server" Text='<%# CheckEmptyData(Eval("courseLongDescription").ToString()) %>' /></p>
                                <br />
                                <p class="sectionHeadingSubPage text-left subSectionPadding"><%# CheckCityField(Eval("city").ToString()) %><%# CheckStateField(Eval("state").ToString().Trim()) %> <%# Eval("cat4CityPage") %> Training & Courses</p>                                                            
                            </ItemTemplate>
                        </asp:FormView>
                    
                        <asp:Repeater ID="ctlCoursesGrid" runat="server">                
                            <HeaderTemplate>
                                <table class="table table-hover">
                                <thead>
                                <th>Course</th>
                                <th>Location</th>
                                </thead>
                                <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>  
                                <asp:HiddenField ID="ctlClassID" Value='<%# Eval("id") %>' runat="server" />                               
                                <tr>
                                    <td><asp:LinkButton ID="LinkButton2" PostBackUrl='<%#"/City/" + Eval("seoCity") + "/" + ((string)Eval("courseId")).Trim().Replace(" ", "-") %>' Text='<%# Eval("courseName") %>' CssClass="textLink" runat="server"/></td>
                                    <td><asp:LinkButton ID="LinkButton1" PostBackUrl='<%#"/City/" + Eval("seoCity") + "/" + ((string)Eval("courseId")).Trim().Replace(" ", "-") %>' CssClass="textLink" runat="server"><%# CheckCityField(Eval("city").ToString().Trim()) %> <%# CheckStateField(Eval("state").ToString().Trim()) %></asp:LinkButton></td>
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