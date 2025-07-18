<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="online-courses.aspx.cs" Inherits="ProductivityPointGlobal.OnlineCourses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%#string.Format("<link rel=\"canonical\" href=\"{0}://{1}/online-courses.aspx\" />", Request.Url.Scheme, Request.Url.Host) %>
    <style>
        .data-pager{text-align: center;
    color: #f67a06;
    border: solid 1px;}
        .data-pager a{color:#f67a06}
        .data-pager .current{font-weight:bold}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow">Productivity Point Learning Solutions <br /> Live Virtual Courses Catalog</h1>
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
                                                                    
                        <p class="sectionHeadingSubPage text-left subSectionPadding">We offer an array of 
                            Online Training Courses, such as:</p>
                            <%--<div class="paddingRightImageContainer">
                                <img src="/images/desktop_applications1.jpg" alt="Public Classroom Training" />
                            </div>--%>
                        <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <nav class="data-pager">
                                    <asp:DataPager runat="server" PageSize="20" PagedControlID="lvCourses">
                                        <Fields>
                                            <asp:NextPreviousPagerField
                                                FirstPageText="|<"
                                                PreviousPageText="<<"
                                                RenderDisabledButtonsAsLabels="true" RenderNonBreakingSpacesBetweenControls="true"
                                                ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false"
                                                ShowPreviousPageButton="true" />
                                            <asp:NumericPagerField ButtonCount="10" CurrentPageLabelCssClass="current"
                                                NextPreviousButtonCssClass="command" RenderNonBreakingSpacesBetweenControls="true" />
                                            <asp:NextPreviousPagerField
                                                LastPageText=">|"
                                                NextPageText=">>" RenderDisabledButtonsAsLabels="true"
                                                ShowFirstPageButton="false"
                                                ShowLastPageButton="true"
                                                ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                            <asp:TemplatePagerField>
                                                <PagerTemplate>
                                                    Displaying&nbsp;<strong><%# Container.StartRowIndex + 1 %></strong>&nbsp;to&nbsp;
                                    <strong><%# Container.StartRowIndex + Container.PageSize > Container.TotalRowCount? Container.TotalRowCount: Container.StartRowIndex + Container.PageSize%></strong>&nbsp;of&nbsp; <strong><%# Container.TotalRowCount%></strong>
                                                    Items Found.
                                                </PagerTemplate>
                                            </asp:TemplatePagerField>
                                        </Fields>
                                    </asp:DataPager>

                                </nav>
                                <asp:ListView runat="server" ID="lvCourses" DataSourceID="sqlCourses">
                                    <EmptyDataTemplate>
                                        <p class="text-center bold">Nothing is found. Please search again.</p>
                                    </EmptyDataTemplate>
                                    <LayoutTemplate>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Course Name</th>
                                                    <th>Fee / Length</th>
                                                    <th>Classes</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr runat="server" id="itemPlaceholder"></tr>
                                            </tbody>
                                        </table>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:HyperLink ID="ctlCourse" Text='<%# Eval("courseName") %>'
                                                    ToolTip='<%# Eval("courseName") %>'
                                                    NavigateUrl='<%# String.Format("~/course/{0}/", ((string)Eval("seoCourseName")).Replace(" ","-").ToLower()) %>'
                                                    runat="server" />
                                            </td>
                                            <td><%# Eval("price","{0:c}") %> / <%# Eval("duration") %> Day Course</td>
                                            <td>
                                                <asp:HyperLink ID="ctlClasses" Text="Online Classes"
                                                    ToolTip='<%#string.Format("{0} details", Eval("courseName")) %>'
                                                    NavigateUrl='<%# String.Format("~/course/{0}/classes/live-virtual-training", ((string)Eval("seoCourseName")).Replace(" ","-").ToLower()) %>'
                                                    runat="server" />

                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <nav class="data-pager">
                                    <asp:DataPager runat="server" PageSize="20" PagedControlID="lvCourses">
                                        <Fields>
                                            <asp:NextPreviousPagerField
                                                FirstPageText="|<"
                                                PreviousPageText="<<"
                                                RenderDisabledButtonsAsLabels="true" RenderNonBreakingSpacesBetweenControls="true"
                                                ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false"
                                                ShowPreviousPageButton="true" />
                                            <asp:NumericPagerField ButtonCount="10" CurrentPageLabelCssClass="current"
                                                NextPreviousButtonCssClass="command" RenderNonBreakingSpacesBetweenControls="true" />
                                            <asp:NextPreviousPagerField
                                                LastPageText=">|"
                                                NextPageText=">>" RenderDisabledButtonsAsLabels="true"
                                                ShowFirstPageButton="false"
                                                ShowLastPageButton="true"
                                                ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                            <asp:TemplatePagerField>
                                                <PagerTemplate>
                                                    Displaying&nbsp;<strong><%# Container.StartRowIndex + 1 %></strong>&nbsp;to&nbsp;
                                    <strong><%# Container.StartRowIndex + Container.PageSize > Container.TotalRowCount? Container.TotalRowCount: Container.StartRowIndex + Container.PageSize%></strong>&nbsp;of&nbsp; <strong><%# Container.TotalRowCount%></strong>
                                                    Items Found.
                                                </PagerTemplate>
                                            </asp:TemplatePagerField>
                                        </Fields>
                                    </asp:DataPager>

                                </nav>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:SqlDataSource ID="sqlCourses" runat="server" ConnectionString='<%$ ConnectionStrings:SQLConnectionProd %>'
                            SelectCommand="dbo.online_courses_s" SelectCommandType="StoredProcedure">
                        </asp:SqlDataSource>
                       
                        <%--<div>
                            <p class="sectionHeadingSubPage text-left subSectionPadding">Get the Skills Training and Certification to Advance Your Business & Your Employees in 2-5 Days</p>
                            <p>Having employees who are competent in Desktop Applications is essential for any company. To stay competitive, you need the ability to translate your ideas and data into documents so you can communicate your knowledge clearly and concisely.
                            <br/><br/>
                            Our Desktop Applications courses are specifically designed for busy professionals - each course is typically between 1-2 days of training. 
                            </p>
                            <div class="clearfix"></div>
                        </div>--%>
                        <p class="sectionHeadingSubPage text-left subSectionPadding">Have a Question? Get in Touch and We Guarantee that We’ll Get Back to You</p>   
                        <p>Contact a training center specialist at <a href="tel:1-844-238-8607">1-844-238-8607</a> to get answers to any questions you have about corporate training and event hosting services today.</p>
                    </div>

                    <uc:Partners runat="server" />
                    
                </div>                    
            </div>
        </div>
    </div>	        
</asp:Content>
