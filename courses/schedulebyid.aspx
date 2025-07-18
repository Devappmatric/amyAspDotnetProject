<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="schedulebyid.aspx.cs" Inherits="ProductivityPointGlobal.courses.Schedulebyid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrCanonical" runat="server"></asp:Literal>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow">
                                <asp:Literal ID="ltrH1" runat="server"></asp:Literal>
                                - Class Schedule</h1>
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
                                    <p class="sectionHeadingSubPage text-left subSectionPadding"><asp:Literal ID="ltrName" runat="server" Text='<%# Eval("courseName") %>' /></p>   
                                    <%--                                    <div class="paddingRightImageContainer">                                        
                                        <asp:FormView ID="ctlCourseImage" DefaultMode="ReadOnly" RenderOuterTable="false" runat="server">
                                            <ItemTemplate>
                                                <asp:Image ID="ctlCourseLogo" ImageUrl='<%# Eval("img_url", "~/uploads/courses/{0}") %>' CssClass="img-responsive img-thumbnail" AlternateText='<%# Eval("courseName") %>' ToolTip='<%# Eval("courseName") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:FormView>   
                                    </div>--%>

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

                        <%--<p class="sectionHeadingSubPage text-left subSectionPadding">Locations</p>--%>
                    <table style="width:100%">
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                               <tr>
                                   
                                    <td style="width:60%;text-align:left" >  <p class="sectionHeadingSubPage text-left subSectionPadding">Class Schedule</p></td>
                                    
                                    <td style="color:#f67a06;width:40%;text-align:right;font-family:HelveticaNeueBold"> Guaranteed to Run <span class="label label-primary"> GTR</span></td>
                                    
                                </tr>
                    </table>

                        <asp:Repeater ID="ctlClassSchedule" OnItemDataBound="ctlClassSchedule_OnItemDataBound" runat="server">
                            <HeaderTemplate>                    
                                <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th class="col-lg-3 col-md-3 col-sm-3 col-xs-4">Location</th>
                                    <th class="col-lg-1 col-md-1 col-sm-1 hidden-xs"><%--Guaranteed To Run--%></th>
                                    <th class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Date</th>
                                    <th class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Time</th>
                                    <th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Register</th>
                                </tr>
                                </thead>
                                <tbody>                      
                            </HeaderTemplate>
                            <ItemTemplate>        
                                <tr>                                    
                                    <td><asp:HiddenField ID="ctlClassID" Value='<%# Eval("id") %>' runat="server" /><asp:Label ID="ctlLabel0" Text='<%# Eval("city") %>' runat="server" /><asp:Label ID="ctlLabel01" Text='<%# (string.IsNullOrEmpty(Eval("state").ToString()) ? "" : Eval("state").ToString().Insert(0, " - ")) %>' runat="server" /></td>
                                    <td class="hidden-xs"><asp:Label ID="lblGTR" CssClass="label label-primary" ToolTip='<%# Eval("Gtr") %>' Text="GTR" runat="server"/></td>
                                    <td><asp:Label ID="Label1" Text='<%#DateTime.Parse(Eval("startDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /> - <asp:Label ID="ctlEndDate" Text='<%#DateTime.Parse(Eval("endDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /></td>
                                    <td><asp:Label ID="ctlLabel3" Text='<%#DateTime.Parse(Eval("startTime").ToString()).ToString("h:mm t.\\M.") %>' runat="server" /> - <asp:Label ID="ctlEndTime" Text='<%#DateTime.Parse(Eval("endTime").ToString()).ToString("h:mm t.\\M.") %>' runat="server" /> <span  style="font-family:HelveticaLTStdRoman;font-size:12px;font-weight:normal"><%# Eval("timeZone") %></span></td>
                                    <td><i class="fa fa-plus-circle orange hidden-xs"></i> <asp:LinkButton ID="ctlRegister" Text="Register" CssClass="" OnClick="ctlRegister_Click" runat="server" /></td>
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