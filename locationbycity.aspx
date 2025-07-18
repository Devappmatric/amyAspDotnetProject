<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="locationbycity.aspx.cs" Inherits="ProductivityPointGlobal.Locationbycity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow"><asp:Label ID="ctlLocation" runat="server" /></h1>
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
                                <div>
                                    <p class="sectionHeadingSubPage text-left subSectionPadding"><%# Eval("courseName") %></p>
                                    <div class="clearfix"></div>
                                </div>                                
                                                        
                                <table class="table">
                                    <thead>
                                        <th>Category</th>
                                        <th>ID</th>
                                        <th>Duration</th>
                                        <th>Price</th>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            <%# Eval("cat2") %>
                                        </td>
                                        <td>
                                            <%# Eval("courseId") %>
                                        </td>
                                        <td>
                                            <%# Eval("duration") %> Day(s)
                                        </td>
                                        <td>$<%#decimal.Parse(Eval("price").ToString()).ToString("0,00.00") %></td>
                                    </tr>
                                    </tbody>
                                </table>
                                <asp:PlaceHolder runat="server" Visible="false">
                                <asp:HyperLink ID="ctlCourseOutline" Text="" ToolTip="Course Outline" NavigateUrl='<%# String.Format("~/courseoutlines/{0}.pdf", Server.HtmlEncode(Eval("courseOutline").ToString())) %>' CssClass="btn btn-primary" Target="_blank" runat="server" ><i class="fa fa-file-pdf-o"></i>&nbsp;&nbsp;Course Outline</asp:HyperLink>
                                </asp:PlaceHolder>
                            </ItemTemplate>
                        </asp:FormView>
                        
                        <p class="sectionHeadingSubPage text-left subSectionPadding">Locations</p>

                        <asp:Repeater ID="ctlClassSchedule" runat="server">
                            <HeaderTemplate>
                                <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Venue</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Register</th>
                                </tr>
                                </thead>
                                <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>        
                                <tr>                                    
                                    <td><asp:HiddenField ID="ctlClassID" Value='<%# Eval("id") %>' runat="server" />
                                        <asp:Label ID="ctlLabel0" Text='<%# Eval("address1") %>' runat="server" />, <asp:Label ID="Label2" Text='<%# Eval("address2") %>' runat="server" />
                                        <br />
                                        <asp:Label ID="Label3" Text='<%# Eval("city") %>' runat="server" />, <asp:Label ID="Label4" Text='<%# Eval("state") %>' runat="server" /> <asp:Label ID="Label5" Text='<%# Eval("zip") %>' runat="server" />
                                        <br/>      
                                    </td>
                                    <td><asp:Label ID="Label1" Text='<%#DateTime.Parse(Eval("startDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /> - <asp:Label ID="ctlEndDate" Text='<%#DateTime.Parse(Eval("endDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /></td>
                                    <td><asp:Label ID="ctlLabel3" Text='<%#DateTime.Parse(Eval("startTime").ToString()).ToString("h:mm t.\\M.") %>' runat="server" /> - <asp:Label ID="ctlEndTime" Text='<%#DateTime.Parse(Eval("endTime").ToString()).ToString("h:mm t.\\M.") %>' runat="server" /> <span class="label label-default"><%# Eval("timeZone") %></span></td>
                                    <td><i class="fa fa-plus-circle orange"></i> <asp:LinkButton ID="ctlRegister" Text="Register" CssClass="" OnClick="ctlRegister_Click" runat="server" /></td>
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