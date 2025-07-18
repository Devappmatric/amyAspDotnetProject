<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="coursedetail.aspx.cs" Inherits="ProductivityPointGlobal.courses.CourseDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrCanonical" runat="server" />

    <style type="text/css">
        .view{ background: url('<%# BannerPath %>');
               background-size: 100% auto; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover; }    
    </style>
    <style>
        .gradient{background-image:linear-gradient(rgba(0,0,0,.2),#fff)}.city-mainpage-heading{font-size:26px;margin-top:5px}.city-main-page-right-sidebar-div{min-height:200px;padding-left:30px;margin-top:34px}.city-main-page-right-sidebar-div>p{text-align:left;font-size:14px;line-height:1.8}.city-main-page-right-sidebar-div>.sidebar-heading{border-bottom:1px solid #fd6803;font-size:18px;font-weight:500}.city-main-page-right-sidebar-div>p>ul>li{text-align:left;font-size:14px;line-height:1.8}.catalog-box{height:150px;text-align:left;margin-top:10px;margin-bottom:10px;overflow:hidden}.catalog-inner-box{height:140px;width:300px;margin:5px;padding:.5em 1em .5em;border:1px solid #e5e5e5;border-radius:2px;overflow:hidden}.catalog-inner-box:hover{box-shadow:0 2px 6px 0 rgba(0,0,0,.4)}.catalog-inner-box>.catalog-heading{color:#f67a06;line-height:1.2;margin-bottom:0!important}.catalog-inner-box>.catalog-description{font-size:14px;height:23px;overflow:hidden;line-height:1.29}.city-view{background:url('<%# BannerPath %>') #033654;background-size:100% auto;-webkit-background-size:cover;-moz-background-size:cover;-o-background-size:cover;background-size:cover;height:372px}.section1RowSubpageCityPage{margin-bottom:100px;margin-top:10px;text-align:center}p{text-align:left;font-size:15px;line-height:1.5}.address-box{line-height:1.5px}.address-box>p{line-height:15px}.address-box>h3{margin-bottom:26px}.address-box>.address-header{font-size:24px}.address-box>.map-link{color:#00f;margin-top:40px;margin-bottom:40px}.map-link>a{font-size:15px}.map-link>a:hover{color:#00f;opacity:.8}.map-box{margin-top:26px}p{text-align:left;font-size:15px;line-height:1.5}ul>li{font-family:HelveticaNeueLTStd;color:#4c4c4c;font-size:14px;line-height:1.8}.section1RowSubpage{margin-top:0;margin-bottom:0}.section1RowSubpage>h1{margin-top:0;margin-bottom:0}.section1RowSubpageCityPage{margin-top:20px}.padding0T{padding:0}.breadcrumb-box{color:#fff;margin-top:30px;margin-left:10px;margin-bottom:0}.breadcrumb-link{color:#fff}.breadcrumb-link:hover{opacity:.8;color:#fff!important}.breadcrumb-active-link{color:#fff}.breadcrumb-active-link:hover{color:#fff;opacity:1}iframe{width:100%;height:300px}.contact-form{padding:30px;background-color:#87ceeb}.contact-form>.contact-form-box{padding:10px;background-color:#fff}.subPageInnerForm{-webkit-box-shadow:0 3px 10px 0 rgba(0,0,0,.45);-moz-box-shadow:0 3px 10px 0 rgba(0,0,0,.45);box-shadow:0 3px 10px 0 rgba(0,0,0,.45);margin:0}.inner-navigation{border-bottom:1px solid #fd6803;margin:10px;padding-top:20px;padding-bottom:5px}.inner-navigation>.row>.col-sm-2{text-align:center}.inner-navigation-link{font-size:18px;cursor:pointer;color:#23579d;font-weight:700}body{font-family:HelveticaNeueLTStd}.table>thead>tr>th{border-bottom:1px solid #ddd}th{text-align:center}td>p{text-align:center;color:#595959!important}thead>tr>td>p{font-family:HelveticaNeueLTStd;font-size:18px;color:#f67a06;margin-bottom:0}p{color:#595959}div{color:#595959}body{color:#595959}thead>tr{margin-bottom:0}.table>tbody>tr>td,.table>tbody>tr>th,.table>tfoot>tr>td,.table>tfoot>tr>th,.table>thead>tr>td,.table>thead>tr>th{border-top:1px solid #fd6803}
    </style>
    <style>
        .schedule-button{color:#fff!important;background-color:#4e587e;border-color:#fff;font-weight:700;font-size:16px;border-radius:30px}.course-header-width{width:636px}@media screen and (max-width:572px){.city-main-page-right-sidebar-div{border-left:unset;padding-left:0}.course-header-width{width:100%;padding-top:50px;font-size:31px!important}.section1RowSubpage>h1{margin-bottom:10px}}
    </style>
    <style>
         @media screen and (max-width: 572px) {
             .padding0T {
                padding-top:90px !important;
                font-family:sans-serif !important;
                font-weight:300 !important;
            } 

              h1{
                  font-family:sans-serif !important;
                font-weight:300 !important;
             }

              .section1RowSubpage {
                 margin-top:20px !important;
             }
        }
    </style>
    <style>
#exTab4 .nav-pills>li>a{border-radius:4px 4px 0 0;height:162px}#exTab4 .nav-pills>li{width:20%;margin-left:0}#exTab4 .nav-pills>li.active>a,.nav-pills>li.active>a:focus,.nav-pills>li.active>a:hover{color:#fff;background-color:#fff;border-bottom:2px solid #fd6803}#exTab3{padding:20px}#exTab3 .nav-pills>li>a{border-radius:4px 4px 0 0}#exTab3 .nav-pills>li{width:25%;margin-left:0}#exTab3 .tab-content{color:#fff;background-color:#fff;padding:5px 15px}.tab-image{height:80px}.nav-pills>li.active>a,.nav-pills>li.active>a:focus,.nav-pills>li.active>a:hover{color:#fff;background-color:#fff;border-bottom:2px solid #fd6803}.tab-image-inside{height:100px}.nav-pills>li{width:24%}.section1RowSubpageCityPage{margin-top:50px;margin-bottom:50px}.catalog-link-style{font-size:18px;padding:2px}.tab-inner-div{padding-left:20px;padding-right:40px;text-align:left}.tab-content>.tab-pane{margin-left:60px;padding-right:100px}.delivery-methods-header>.training-delivery-heading{margin-bottom:15px}ul{line-height:1.8}.table thead{font-family:HelveticaNeueLTStd}.table tr td{font-family:HelveticaNeueLTStd;font-size:18px}.table>thead>tr>td{font-family:HelveticaNeueLTStd;font-size:18px}p{color:#595959}div{color:#595959}body{color:#595959}
</style>
<style>
    #exTab4 .nav-pills>li.active>a,.nav-pills>li.active>a:focus,.nav-pills>li.active>a:hover{background-color:#eee !important}.nav-pills>li.active>a,.nav-pills>li.active>a:focus,.nav-pills>li.active>a:hover{background-color:#eee}.mobile-tab-image{background-color:#fd6803;border:1px solid #fd6803}@media screen and (max-width:992px){#exTab4 .nav-pills>li>a{height:30px;width:30px;padding:10px;border-radius:150px}#exTab4 .nav-pills>li{padding:10px}.training-delivery-method-box{margin-left:10px;margin-right:10px}.tab-content>.tab-pane{margin-left:10px;padding-right:10px}.custom-right-sidebar-div{border-left:unset;padding-left:0}}.gtr-box{margin-top:30px;color:#fd6803;text-align:right;font-family:HelveticaNeueLTStd;font-size:16px}@media screen and (max-width:572px){.gtr-box{margin-top:0}}
#exTab4 .nav-pills>li>a:hover{background-color:white;border-bottom: 2px solid #fd6803;}
 #exTab3 .nav-pills>li>a:hover{background-color:white;border-bottom: 2px solid #fd6803;}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   </style>
<style>
    .gtr-box{
        margin-top:30px;
    }
    .course-header-width{
        width:636px;
    }
    .course-header-second-width{
        font-size:32px;
    }

     @media screen and (max-width: 572px)  {
         .course-header-width {
            width:100%;
            padding-top:50px;
            font-size:31px !important;
        } 

         .padding110T{
             padding-top:110px !important;
         }

         h1{
              font-family:sans-serif !important;
            font-weight:300 !important;
         }

         .course-header-second-width{
             font-size:28px !important;
         }
    }
     #schedule-area .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
         border-top: 1px solid #ddd; 
    }

     .training-delivery-heading {
        font-size: 28px;
        font-weight: 500;
    }
</style>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="HeadingDiv" class="container-fluid city-view subPage" runat="server">
        <div class="row" id="banner-area">
            <p class="breadcrumb-box hidden-sm hidden-xs">
                <a style="font-size:11px"  class="breadcrumb-link" href="/">Home</a> >
                <a style="font-size:11px"  class="breadcrumb-link"  href="/<%=Cat1.Replace(" ","-").ToLower()%>.aspx"><%=Cat1 %></a> >
                <%if (CatalogTopic != null)
                        { %>
                    <a style="font-size:11px"  class="breadcrumb-link" href="/topic/<%=CatalogTopic.Replace(" ", "-").ToLower()%>/<%=Cat1.Replace(" ", "-").ToLower()%>"><%=CatalogTopic %></a> >
                <%}
                else
                { %>
                    <a style="font-size:11px"  class="breadcrumb-link" href="/brand/<%=CatalogBrand.Replace(" ", "-").ToLower()%>/<%=Cat1.Replace(" ", "-").ToLower()%>"><%=CatalogBrand %></a> >
                <%} %>
                <a style="font-size:11px"  class="breadcrumb-active-link"><%=CourseName %> </a>
            </p>
            <div class="" style="height:276px;margin-left:10px;">
                <div class=" padding0T" style="padding-top:38px;padding-bottom:30px;">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12 h">  
                        <div class="section1RowSubpage">
                           
                             <h1 style="font-size:35px;line-height:1.3;" class="white fontShadow course-header-width"><%=CourseName %> </h1>
                            <p style="font-size:20px !important;margin-top:12px;margin-bottom:22px; width:600px;" class="white fontShadow idden-sm hidden-xs"><%=CourseSubtitle==null?"  ":CourseSubtitle %></p>
                            <a href="#" onclick="smoothScroll(document.getElementById('schedule-area'))" class="btn schedule-button">View Schedule</a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-5 col-sm-6 col-xs-12 margin20T responsiveCol">
                        <%--<uc:ContactForm runat="server" />--%>
                    </div>
                    <div class="col-lg-4 col-md-5 col-sm-6 col-xs-12 margin20T responsiveCol">
                        <%--<uc:ContactForm runat="server" />--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%--<div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow"><asp:Literal ID="ltrH1" runat="server" /> <br /> Course Details</h1>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-5 col-sm-6 col-xs-12 margin20T responsiveCol">
                    </div>
                </div>
            </div>
        </div>
    </div>  --%>  
    
<%--    <uc:Search ID="ucSearch" runat="server" />--%>

     <div class="container-fluid bgWhite padding75B">
        <div class="row">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="inner-navigation">
                            <div class="row">
                                <div class="col-sm-2">
                                    <a onclick="smoothScroll(document.getElementById('pricing-container'))"  class="inner-navigation-link">Pricing</a>
                                </div>
                                <div class="col-sm-2">
                                    <a onclick="smoothScroll(document.getElementById('link-objectives'))"  class="inner-navigation-link">Objectives</a>
                                </div>
                                <div class="col-sm-2">
                                    <a onclick="smoothScroll(document.getElementById('link-outline'))"  class="inner-navigation-link">Outline</a>
                                </div>
                                <div class="col-sm-2">
                                    <a onclick="smoothScroll(document.getElementById('link-prerequisites'))"  class="inner-navigation-link">Prerequisites</a>
                                </div>
                                <div class="col-sm-2">
                                    <a onclick="smoothScroll(document.getElementById('link-certifications'))"  class="inner-navigation-link">Certifications</a>
                                </div>
                                <div class="col-sm-2">
                                    <a onclick="smoothScroll(document.getElementById('link-followons'))" class="inner-navigation-link">Follow-Ons</a>
                                </div>
                            </div>
                        </div>
                         <div>
                             <h2 class="city-mainpage-heading text-center" style="padding-top:20px;line-height:1.4">
                                 <span  style="font-size:25px;padding-top:20px;margin-bottom:0px;font-family: HelveticaNeueLTStd;">
                                     <%=CourseName %>
                                 </span><br />
                                 <span style="font-size:23px;margin-top:0px;font-family: HelveticaNeueLTStd;" >
                                     Course Overview
                                 </span>
                             </h2>
                        </div>
                        <div>
                            <p>
                                 <%=CheckEmptyData(CourseDescription) %>
                            </p>
                        </div>
                        <div class="row" style="padding-top:20px;">
                            <div class="col-md-12">
                                <asp:FormView ID="ctlCourseDetails" DefaultMode="ReadOnly" RenderOuterTable="false" runat="server">
                                <ItemTemplate>                                
                                <div id="pricing-container" style="width:100%;overflow:auto">
                                    <table class="table" style="margin-bottom:0px;">
                                    <thead>
                                        <td ><p>Category</p></td>
                                        <td ><p>ID</p></td>
                                        <td ><p>Duration</p></td>
                                        <td ><p>Level</p></td>
                                        <td ><p>Price</p></td>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            <p ><%# Eval("cat2") %></p>
                                        </td>
                                        <td itemprop="courseCode">
                                            <p ><%# Eval("courseId") %></p>
                                        </td>
                                        <td>
                                            <p ><%# Eval("duration") %> Day(s)</p>
                                        </td>
                                        <td>
                                           <p> <%# Eval("level1") %></p>
                                        </td>
                                        <td>
                                           <p > $<%#decimal.Parse(Eval("price").ToString()).ToString("0,00.00") %></p>

                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                </div>
                                
                               <%-- <div style="text-align:center" id="link-schedule">
                                    <asp:HyperLink NavigateUrl='<%#string.Format("/course/{0}/class",SeoCourseName.Replace(" ","-").ToLower()) %>' CssClass="btn btn-warning" runat="server"><i class="fa fa-calendar"></i>  View Schedule</asp:HyperLink>
                                </div>--%>
                                <%--<asp:HyperLink NavigateUrl="./classes" CssClass="btn btn-warning" runat="server"><i class="fa fa-calendar"></i>  View Schedule</asp:HyperLink>--%>
<%--                                <asp:LinkButton Visible="false" ID="ctlViewSchedule" OnClick="ctlViewSchedule_Click" CssClass="btn btn-warning" runat="server" ><i class="fa fa-calendar"></i> View Schedule</asp:LinkButton>--%>

                            </ItemTemplate>
                        </asp:FormView>
                            </div>
                        </div>

                        <div class="row" id="link-objectives"  style="padding-top:0px;">
                             <div class="col-md-12">
                                <p class="city-mainpage-heading ">Objectives </p>
                                <p><%=CheckEmptyData(CourseObjectives) %></p>
                            </div>
                        </div>
                        <div class="row" id="link-outline"  style="padding-top:20px;">
                            <div class="col-md-12">
                                <h2 class="city-mainpage-heading" style="line-height:1.3">
                                    <span style="font-family:HelveticaNeueLTStd;"><%=CourseName %></span><br />
                                    <span style="margin-top:0px;font-size:24px;font-family:HelveticaNeueLTStd;">Course Outline</span>
                                </h2>
                               
                                <div class="row"> 
                                    <div class="col-md-6">
                                            <p><%=GetOutlineFirstPart() %></p>
                                        </div>
                                        <div class="col-md-6">
                                            <p><%=GetOutlineSecondPart() %></p>
                                        </div>
    <%--                                <p><%=CheckEmptyData(CourseDetails) %></p>--%>
                                </div>
                            </div>
                        </div>
                        <div>
                            <a style="" onclick="smoothScroll(document.getElementById('banner-area'))" class="inner-navigation-link">TOP <i style="font-size:26px;" class="fa fa-caret-up"></i> </a>
                        </div>
                        <%--<div class="row" id="link-prerequisites" style="padding-top:20px;">
                            <div class="col-md-12">
                                <p class="city-mainpage-heading "> Prerequisites </p>
                                <div class="row">
                                    <div class="col-md-12">
                                        <p style="margin-left:5px;">
                                            <%=CheckEmptyData(CoursePrerequisites) %>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                        <div id="link-schedule" style="text-align:left;margin-top:20px;">
                            <a href="#" onclick="smoothScroll(document.getElementById('schedule-area'))" class="btn btn-warning"><i class="fa fa-calendar"></i> View Schedule</a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                        <div class="city-main-page-right-sidebar-div" style="margin-bottom:30px;">
                           <div class="frostBg padding30 subPageInnerForm">
                                <p class="font24 text-center">Questions?</p>
    

                                <div class="form-group">
                                    <label for="name">Name *</label>
                                    <asp:TextBox ID="tbName" CssClass="form-control" placeholder="Name" runat="server" MaxLength="40" data-validation="required" data-validation-error-msg="Name is required" data-validation-error-msg-container="#f2Required" />
<%--                                    <input type="text" class="form-control" id="name" placeholder="Name">--%>
                                  </div>
                                  <div class="form-group">
                                    <label for="exampleInputEmail1">Email Address *</label>
                                      <asp:TextBox ID="tbEmail" CssClass="form-control" placeholder="Email Address" MaxLength="40" runat="server" data-validation="email" data-validation-error-msg="Email address is required" data-validation-error-msg-container="#f3Required"/>
<%--                                    <input type="email" class="form-control" id="email" placeholder="Email Address">--%>
                                  </div>
                                   <div class="form-group">
                                    <label for="company">Company</label>
                                       <asp:TextBox ID="tbCompany" CssClass="form-control" placeholder="Company (Optional)" runat="server" />
<%--                                    <input type="text" class="form-control" id="company" placeholder="Company (Optional)">--%>
                                  </div>
                                 <div class="form-group">
                                    <label for="company">Phone</label>
                                     <asp:TextBox ID="tbPhone" CssClass="form-control" placeholder="Phone" runat="server" MaxLength="20" data-validation="required" data-validation-error-msg="Phone number is required" data-validation-error-msg-container="#f4Required"/>
<%--                                    <input type="text" class="form-control" id="phone" placeholder="Phone (Optional)">--%>
                                  </div>
                               <div class="form-group">            
                                    <asp:Label runat="server" AssociatedControlID="ddlGroupSize" Text="Group Size *"/> <span id="f1Required"></span>
                                  
                                   <asp:DropDownList ID="ddlGroupSize" CssClass="form-control" runat="server" data-validation="required" data-validation-error-msg="Group size required" data-validation-error-msg-container="#f1Required">
                                        <asp:ListItem Value="" Text="Please select one" Selected="True" disabled/>
                                        <asp:ListItem Value="1" Text="1"/>
                                        <asp:ListItem Value="2" Text="2"/>
                                        <asp:ListItem Value="3" Text="3"/>
                                        <asp:ListItem Value="4" Text="4"/>
                                        <asp:ListItem Value="5+" Text="5+"/>
                                    </asp:DropDownList>
                                </div>
                               <div class="form-group">
                                    <label for="company">Comments</label>
                                     <asp:TextBox ID="tbComment" TextMode="MultiLine" CssClass="form-control" placeholder="Comments" runat="server" />
                                  </div>
                                <%--<div class="form-group">
                                    <label for="company">Group Size</label>
                                    <select class="form-control">
                                        <option>Please Select One</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5+">5+</option>
                                    </select>
                                  </div>--%>
                                <div class="form-group padding20T">
                                    <asp:Button ID="btnSubmitHomeForm" CssClass="btn btn-lg btn-block btn-success"  OnClick="btnSubmitHomeForm_OnClick" runat="server"  Text="SUBMIT" />
                                </div>
                            </div>
                            
                        </div>
                        <div style="margin-top:20px;" class="city-main-page-right-sidebar-div">
                            <h2 id="link-certifications" class="sidebar-heading">Related Certifications</h2>
                            <p><%=CheckEmptyData(RelatedCertifications) %></p>
                            <h2 style="margin-top:20px;"  id="link-prerequisites" class="sidebar-heading">Prerequisites</h2>
                            <p>
                               <%=CheckEmptyData(CoursePrerequisites) %>
                            </p>
                            <h2 style="margin-top:20px;" id="link-followons" class="sidebar-heading">Follow-on Course(s)</h2>
                            <div style="font-size:14px;">
                                <%foreach(var item in GetCourseLinks(NextLevel))
                                    {%>
                                        <a target="_blank" href="/course/<%=GetSEOCourseFromCourse(item).Replace(" ","-").ToLower() %>"><%=item %></a><div class="custom-link-margin-height"></div>
                                    <%} %>
                            </div>
                            
                            <h2 style="margin-top:20px;" class="sidebar-heading">Related Courses</h2>
                            <div style="font-size:14px;">
                                <%foreach(var item in GetCourseLinks(RelatedCourses))
                                    {%>
                                        <a target="_blank" href="/course/<%=GetSEOCourseFromCourse(item).Replace(" ","-").ToLower() %>"><%=item %></a><div class="custom-link-margin-height"></div>
                                    <%} %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             
        </div>
    </div>

    <div class="container-fluid bgWhite subPage padding75B container" id="schedule-area">
    <div class="row">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-sm-6 col-xs-12"> 
                    <asp:FormView ID="FormView1" DefaultMode="ReadOnly" RenderOuterTable="false" runat="server">
                        <ItemTemplate>                                
                            <div style="display:none">
                                <p style="font-size:22px;line-height:1.3" class="sectionHeadingSubPage text-left subSectionPadding"><asp:Literal ID="ltrName" runat="server" Text='<%# Eval("courseName") %>' /></p>
                                <div class="clearfix"></div>
                            </div>                                
                             <div style="width:100%;overflow:auto">
                                 <table style="margin-top:20px;" class="table">
                                <thead>
                                    <td>Category</td>
                                    <td>ID</td>
                                    <td>Duration</td>
                                    <td>Level</td>
                                    <td>Price</td>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <%# Eval("cat2") %>
                                    </td>
                                    <td>
                                       <asp:Literal ID="ltrCourseId" runat="server" Text='<%# Eval("courseId") %>' />
                                    </td>
                                    <td>
                                        <%# Eval("duration") %> Day(s)
                                    </td>
                                    <td>
                                        <%# Eval("level1") %> 
                                    </td>
                                    <td>$<%#decimal.Parse(Eval("price").ToString()).ToString("0,00.00") %></td>
                                </tr>
                                </tbody>
                            </table>
                             </div>                        
                            
                            <asp:PlaceHolder runat="server" Visible="false">
                            <asp:HyperLink ID="ctlCourseOutline" Text="" ToolTip="Course Outline" NavigateUrl='<%# String.Format("~/courseoutlines/{0}.pdf", Server.HtmlEncode(Eval("courseOutline").ToString())) %>' CssClass="btn btn-primary" Target="_blank" runat="server" ><i class="fa fa-file-pdf-o"></i>&nbsp;&nbsp;Course Outline</asp:HyperLink>

                            </asp:PlaceHolder>
                        </ItemTemplate>
                    </asp:FormView>
                   <div class="row">
                        <div class="col-md-8" id="schedule-heading-area" style="text-align:left" >
                            <p style="padding-top:25px;font-size:23px;line-height:1.3" class="sectionHeadingSubPage text-left subSectionPadding">
                                <%=CourseName %><p />
                            <p style="padding-top:1px;font-size:22px;line-height:1.3"> Class Schedule</p>
                            <p style="padding-top:1px;font-size:20px;line-height:1.3;font-style:italic"> <%=ScheduleNotes %></p>

                        </div>
                         <div  class="col-md-3 gtr-box">
                              <img style="height:80px;" src="/images/site/GTR_New.png" />
                            <%--<span class="label label-primary"> GTR</span><br />
                            <p style="margin-top:4px;text-align:right;color:#337ab7;font-weight:600;"><span style="font-size:16px;">Guaranteed to Run</span></p>--%>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-9">

                        </div>
                       
                    </div>
                   <%-- <table style="width:100%">
                        <tr>
                            <td style="width:70%;text-align:left" >  <p style="padding-top:25px;font-size:23px;line-height:1.3" class="sectionHeadingSubPage text-left subSectionPadding">
                                <%=CourseName %><p /><p style="padding-top:1px;font-size:22px;line-height:1.3"> Training Schedule</p></td>
                            <td style="color:#FD6803;width:40%;text-align:right;font-family:HelveticaNeueLTStd;font-size:16px">&nbsp;<br /> </td>    
                        </tr>
                        <tr>
                            <td width="70%"> </td>
                            <td style="color:#FD6803;text-align:right;font-family:HelveticaNeueLTStd;font-size:16px">
                                <div class="row">
                                    <div  class="col-md-9">
                                        <span class="label label-primary"> GTR</span><br />
                                        <p style="margin-top:4px;text-align:right;color:#337ab7;font-weight:600;"><span style="font-size:17px;">Guaranteed to Run</span></p>
                                    </div>
                                    <div class="col-md-3">
                                        
                                    </div>
                                </div> 
                            </td>    
                        </tr>
                    </table>--%>
                    

                    <div id="Liveonline" runat="server">
                        <div >
                            <p style="font-size:22px;line-height:1.3;padding-top:0px;" class="sectionHeadingSubPage text-left subSectionPadding"> Live Online</p>
                            <div class="clearfix"></div>
                        </div> 
                        <asp:Repeater ID="ctlLiveOnlineClassSchedule" OnItemDataBound="ctlLiveOnlineClassSchedule_OnItemDataBound" runat="server">
                            <HeaderTemplate>                    
                                <table class="table table-hover">
                                <thead>
                                <tr>
                                    <td class="col-lg-3 col-md-3 col-sm-3 col-xs-4">Location</td>
                                    <td class="col-lg-1 col-md-1 col-sm-1 hidden-xs"></td>
                                    <td class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Date</td>
                                    <td class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Time</td>
                                    <td class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Register</td>
                                </tr>
                                </thead>
                                <tbody>                      
                            </HeaderTemplate>
                            <ItemTemplate>        
                                <tr>                                    
                                    <td style="font-family:HelveticaLTStdRoman;font-size:13px" ><asp:HiddenField ID="ctlClassID" Value='<%# Eval("id") %>' runat="server" />
                                        <asp:Label ID="ctlLabel0" Text='<%# Eval("city") %>' runat="server" /><asp:Label ID="ctlLabel01" Text='<%# (string.IsNullOrEmpty(Eval("state").ToString()) ? "" : Eval("state").ToString().Insert(0, " - ")) %>' runat="server" />

                                    </td>
                                    <td  style="font-family:HelveticaLTStdRoman;font-size:13px" class="hidden-xs"><asp:Label ID="lblGTR" CssClass="label label-primary" ToolTip='<%# Eval("Gtr") %>' Text="" runat="server"/><asp:Image style="height:20px;" id="ctlGTRIcon" runat="server" src="/images/site/checkmark.PNG" /></td>
                                    <td  style="font-family:HelveticaLTStdRoman;font-size:13px">
                                        <asp:Label ID="Label1" Text='<%#DateTime.Parse(Eval("startDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /> - <asp:Label ID="ctlEndDate" Text='<%#DateTime.Parse(Eval("endDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /></td>
                                    <td style="font-family:HelveticaLTStdRoman;font-size:13px">
                                        <asp:Label ID="ctlLabel3" Text='<%#DateTime.Parse(Eval("startTime").ToString()).ToString("h:mm tt") %>' runat="server" /> 
                                        - 
                                        <asp:Label ID="ctlEndTime" Text='<%#DateTime.Parse(Eval("endTime").ToString()).ToString("h:mm tt") %>' runat="server" /> 
                                        <asp:Label Text='<%# Eval("timeZone") %>' runat="server"></asp:Label>
<%--                                        <span   style="font-family:HelveticaLTStdRoman;font-size:13px;font-weight:normal"></span></td>--%>
                                    <td style="font-family:HelveticaLTStdRoman;font-size:13px"><i class="fa fa-plus-circle orange hidden-xs"></i> <asp:LinkButton ID="ctlLiveOnlineRegister" Text="Register" CssClass="" OnClick="ctlLiveOnlineRegister_Click" runat="server" /></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                </table>                  
                                        
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>

                     <div id="ClassroomLive" runat="server">
                        <div >
                            <p style="font-size:22px;line-height:1.3;padding-top:32px;" class="sectionHeadingSubPage text-left subSectionPadding"> Classroom Live</p>
                            <div class="clearfix"></div>
                        </div> 
                        <asp:Repeater ID="ctlClassroomLiveClassSchedule" OnItemDataBound="ctlClassSchedule_OnItemDataBound" runat="server">
                            <HeaderTemplate>                    
                                <table class="table table-hover">
                                <thead>
                                <tr>
                                    <td class="col-lg-3 col-md-3 col-sm-3 col-xs-4">Location</td>
                                    <td class="col-lg-1 col-md-1 col-sm-1 hidden-xs"></td>
                                    <td class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Date</td>
                                    <td class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Time</td>
                                    <td class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Register</td>
                                </tr>
                                </thead>
                                <tbody>                      
                            </HeaderTemplate>
                            <ItemTemplate>        
                                <tr>                                    
                                    <td style="font-family:HelveticaLTStdRoman;font-size:13px" ><asp:HiddenField ID="ctlClassID" Value='<%# Eval("id") %>' runat="server" />
                                        <asp:Label ID="ctlLabel0" Text='<%# Eval("city") %>' runat="server" /><asp:Label ID="ctlLabel01" Text='<%# (string.IsNullOrEmpty(Eval("state").ToString()) ? "" : Eval("state").ToString().Insert(0, ", ")) %>' runat="server" />

                                    </td>
                                    <td  style="font-family:HelveticaLTStdRoman;font-size:13px" class="hidden-xs"><asp:Label ID="lblGTR" CssClass="label label-primary" ToolTip='<%# Eval("Gtr") %>' Text="" runat="server"/><asp:Image style="height:20px;" id="ctlGTRIcon" runat="server" src="/images/site/checkmark.PNG" /></td>
                                    <td  style="font-family:HelveticaLTStdRoman;font-size:13px">
                                        <asp:Label ID="Label1" Text='<%#DateTime.Parse(Eval("startDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /> - <asp:Label ID="ctlEndDate" Text='<%#DateTime.Parse(Eval("endDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /></td>
                                    <td style="font-family:HelveticaLTStdRoman;font-size:13px">
                                        <asp:Label ID="ctlLabel3" Text='<%#DateTime.Parse(Eval("startTime").ToString()).ToString("h:mm tt") %>' runat="server" />
                                        -
                                        <asp:Label ID="ctlEndTime" Text='<%#DateTime.Parse(Eval("endTime").ToString()).ToString("h:mm tt") %>' runat="server" /> 
                                        <asp:Label Text='<%# Eval("timeZone") %>' runat="server"></asp:Label>
                                    <td style="font-family:HelveticaLTStdRoman;font-size:13px"><i class="fa fa-plus-circle orange hidden-xs"></i> <asp:LinkButton ID="ctlRegister" Text="Register" CssClass="" OnClick="ctlClassroomLiveRegister_Click" runat="server" /></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                </table>                  
                                        
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>

                    <div id="ClassroomVirtual" runat="server">
                        <div >
                            <p style="font-size:22px;line-height:1.3;padding-top:32px;" class="sectionHeadingSubPage text-left subSectionPadding"> Classroom Virtual</p>
                            <div class="clearfix"></div>
                        </div> 
                        <asp:Repeater ID="ctlClassroomVirtualClassSchedule" OnItemDataBound="ctlClassroomVirtualSchedule_OnItemDataBound" runat="server">
                            <HeaderTemplate>                    
                                <table class="table table-hover">
                                <thead>
                                <tr>
                                    <td class="col-lg-3 col-md-3 col-sm-3 col-xs-4">Location</td>
<%--                                    <td></td>--%>
                                    <td class="col-lg-1 col-md-1 col-sm-1 hidden-xs"></td>
                                    <td class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Date</td>
                                    <td class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Time</td>
                                    <td class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Register</td>
                                </tr>
                                </thead>
                                <tbody>                      
                            </HeaderTemplate>
                            <ItemTemplate>        
                                <tr>                                    
                                    <td style="font-family:HelveticaLTStdRoman;font-size:13px" >
                                       <asp:UpdatePanel ID="upDropDown" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:DropDownList 
                                                    AutoPostBack="true" 
                                                    OnSelectedIndexChanged="drpLocationDropDown_SelectedIndexChanged" 
                                                    DataTextField="CityState" 
                                                    DataValueField="id" 
                                                    ID="drpLocationDropDown" 
                                                    runat="server" 
                                                    CssClass="form-control">
                                                </asp:DropDownList>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="drpLocationDropDown" EventName="SelectedIndexChanged" />
                                            </Triggers>
                                        </asp:UpdatePanel>

                                    </td>
<%--                                    <td  style="font-family:HelveticaLTStdRoman;font-size:13px" class="hidden-xs"><asp:Label ID="lblGTR" CssClass="label label-primary" ToolTip='' Text="" runat="server"/><asp:Image style="height:20px;" id="ctlGTRIcon" runat="server" src="/images/site/checkmark.PNG" /></td>--%>

                                    <td  style="font-family:HelveticaLTStdRoman;font-size:13px;vertical-align:middle" class="hidden-xs">
                                        <asp:Image Visible="false" style="height:20px;" ID="ctlGTRIcon" runat="server" src="/images/site/checkmark.PNG" />
                                    </td>
                                    <td  style="font-family:HelveticaLTStdRoman;font-size:13px;vertical-align:middle">
                                        <asp:Label ID="ctlStartDate" Text='<%#DateTime.Parse(Eval("startDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /> - <asp:Label ID="ctlEndDate" Text='<%#DateTime.Parse(Eval("endDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /></td>
                                    <td style="font-family:HelveticaLTStdRoman;font-size:13px;vertical-align:middle"><asp:Label ID="ctlStartTime" Text='<%#DateTime.Parse(Eval("startTime").ToString()).ToString("h:mm tt") %>' runat="server" /> - <asp:Label ID="ctlEndTime" Text='<%#DateTime.Parse(Eval("endTime").ToString()).ToString("h:mm tt") %>' runat="server" /> 
                                        <span   style="font-family:HelveticaLTStdRoman;font-size:12px;font-weight:normal"></span></td>
                                    <td style="font-family:HelveticaLTStdRoman;font-size:13px;vertical-align:middle"><i class="fa fa-plus-circle orange hidden-xs"></i> <asp:LinkButton ID="ctlRegister" Text="Register" CssClass="" OnClick="ctlClassroomVirtualRegister_Click" runat="server" /></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                </table>                  
                                        
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                       
                    <div>
                            <a style="" onclick="smoothScroll(document.getElementById('schedule-heading-area'))" class="inner-navigation-link">TOP <i style="font-size:26px;" class="fa fa-caret-up"></i> </a>
                        </div>
                     <div style="margin-top:20px;">
                            <a style="" href="/course/<%=SeoCourseName.Replace(" ","-") %>" class="inner-navigation-link"> Back to Course Overview </a>
                        </div>
                    <%--<asp:Repeater ID="ctlClassSchedule" OnItemDataBound="ctlClassSchedule_OnItemDataBound" runat="server">
                        <HeaderTemplate>                    
                            <table class="table table-hover" style="margin-top:5px;">
                            <thead>
                            <tr>
                                <th class="col-lg-3 col-md-3 col-sm-3 col-xs-4">Location</th>
                                <th class="col-lg-1 col-md-1 col-sm-1 hidden-xs"></th>
                                <th class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Date</th>
                                <th class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Time</th>
                                <th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Register</th>
                            </tr>
                            </thead>
                            <tbody>                      
                        </HeaderTemplate>
                        <ItemTemplate>        
                            <tr>                                    

                                <td style="font-family:HelveticaLTStdRoman;font-size:13px" ><asp:HiddenField ID="ctlClassID" Value='<%# Eval("id") %>' runat="server" />
                                   <%# Eval("city") %>,<%# Eval("state") %>
                                </td>
                                <td  style="font-family:HelveticaLTStdRoman;font-size:13px" class="hidden-xs"><asp:Label ID="lblGTR" CssClass="label label-primary" ToolTip='<%# Eval("Gtr") %>' Text="GTR" runat="server"/></td>
                                <td  style="font-family:HelveticaLTStdRoman;font-size:13px">
                                    <asp:Label ID="Label1" Text='<%#DateTime.Parse(Eval("startDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /> - <asp:Label ID="ctlEndDate" Text='<%#DateTime.Parse(Eval("endDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /></td>
                                <td style="font-family:HelveticaLTStdRoman;font-size:13px"><asp:Label ID="ctlLabel3" Text='<%#DateTime.Parse(Eval("startTime").ToString()).ToString("h:mm tt") %>' runat="server" /> - <asp:Label ID="ctlEndTime" Text='<%#DateTime.Parse(Eval("endTime").ToString()).ToString("h:mm tt") %>' runat="server" /> 
                                    <span   style="font-family:HelveticaLTStdRoman;font-size:12px;font-weight:normal"><%# Eval("timeZone") %></span></td>
                                <td style="font-family:HelveticaLTStdRoman;font-size:13px"><i class="fa fa-plus-circle orange hidden-xs"></i> <asp:LinkButton ID="ctlRegister" Text="Register" CssClass="" OnClick="ctlRegister_Click" runat="server" /></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                            </table>                  
                                        
                        </FooterTemplate>
                    </asp:Repeater>--%>   
                </div>

               <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                        <div class="custom-right-sidebar-div" style="margin-top:24px;">
                            <h2  class="sidebar-heading">
                                <%=CourseName %>
                            </h2>
                            <p style="font-weight:500;font-size:18px">Course Overview</p>
                            <p>
                                <%=CheckEmptyData(CourseDescription) %>
                            </p>
                            <h2 class="sidebar-heading" style="margin-top:26px;">
                                <%=CourseName %>
                            </h2>
                            <h4 style="font-weight:500;font-size:18px">Course Objectives</h4>
                            
                            <div style="font-size:14px;line-height:1.8">
                                <%=CheckEmptyData(CourseObjective) %>
                            </div>
                    </div>
                   <%--<div style="margin-top:20px;" class="city-main-page-right-sidebar-div">
                            <p id="link-certifications" class="sidebar-heading">Related Certifications</p>
                            <p><%=CheckEmptyData(RelatedCertifications) %></p>
                            <p style="margin-top:20px;" id="link-followons" class="sidebar-heading">Follow-on Course(s)</p>
                            <p>
                                <%foreach(var item in GetCourseLinks(NextLevel))
                                    {%>
                                        <a target="_blank" href="/course/<%=GetSEOCourseFromCourse(item).Replace(" ","-") %>"><%=item %></a><br />
                                    <%} %>
                            </p>
                            <p style="margin-top:20px;" class="sidebar-heading">Related Courses</p>
                            <p>
                                <%foreach(var item in GetCourseLinks(RelatedCourses))
                                    {%>
                                        <a target="_blank" href="/course/<%=GetSEOCourseFromCourse(item).Replace(" ","-") %>"><%=item %></a><br />
                                    <%} %>
                            </p>
                        </div>--%>
                    
            </div>                    
            </div>
        </div>
    </div>
   
     <div class="row" style="margin-top:40px;">
            <div class="col-md-12">
                <div class="training-delivery-method-box" >
                    <p style="text-align:center" class="training-delivery-heading">
                        Training Delivery Methods
                    </p>
                    <div class="row">
                            <div class="col-md-1"></div>
                        <div class="col-md-10 training-delivery-content" style="margin-top:18px;">
                            <p style="font-size:20px;">
                                    With Productivity Point, you will have a spectrum of delivery methods to choose from...
                        when where and how you like it. Whether it's in a classroom or online, we have a
                        delivery option to meets your needs.
                            </p>
                                
                        </div>
                        <div class="col-md-1">

                        </div>
                    </div>
                    <div id="exTab4">	
                        <div style="text-align:center">
                            <ul  class="nav nav-pills">
                            <li class="active" style="margin-left:0px;">
                                <a class="hidden-sm hidden-xs" href="#11b" data-toggle="tab">
                                    <img class="tab-image" src="/images/cities_site_images/Classroom_Icon.png" />
                                    <p style="font-size:20px;">Classroom Live</p>
                                </a>
                                <a class="hidden-md hidden-lg mobile-tab-image"  href="#11b" data-toggle="tab">

                                </a>
			                </li>
			                <li>
                                <a class="hidden-sm hidden-xs" href="#12b" data-toggle="tab">
                                    <img class="tab-image"  src="/images/cities_site_images/Remote_Icon.png" />
                                    <p style="font-size:20px;">Classroom Virtual</p>
			                    </a>
                                <a class="hidden-md hidden-lg mobile-tab-image"  href="#12b" data-toggle="tab">

                                </a>
			                </li>
			                <li>
                                <a class="hidden-sm hidden-xs" href="#13b" data-toggle="tab">
                                     <img style="padding-top:12px;" class="tab-image" src="/images/cities_site_images/Live_Online.png" />
                                    <p style="font-size:20px;">Live Online</p>
			                    </a>
                                <a class="hidden-md hidden-lg mobile-tab-image"  href="#13b" data-toggle="tab">

                                </a>
			                </li>
  		                    <li>
                              <a class="hidden-sm hidden-xs" href="#14b" data-toggle="tab">
                                  <img class="tab-image" style="margin-top:6px;" src="/images/cities_site_images/Private_Groups_New.png" />
                                    <p style="font-size:20px;">Private Group </p>
                              </a>
                              <a class="hidden-md hidden-lg mobile-tab-image"  href="#14b" data-toggle="tab">

                              </a>
			                </li>
                      	    <li>
                              <a class="hidden-sm hidden-xs" href="#15b" data-toggle="tab">
                                   <img class="tab-image" src="/images/cities_site_images/On_Demand.png" />
                                    <p style="font-size:20px;">On Demand</p>
                              </a>
                              <a class="hidden-md hidden-lg mobile-tab-image"  href="#15b" data-toggle="tab">

                              </a>
			                </li>                
		                </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>
         <div class="tab-content clearfix container">
			                <div class="tab-pane active" id="11b">
                                <div class="row delivery-method-box" id="classroom-live-training">
                                    <div class="col-md-12">
                                        <div class="row" >
                                            <div class="col-md-1 delivery-methods-image">
                                                <img class="tab-image" src="/images/cities_site_images/Classroom_Icon.png" />
                                            </div>
                                            <div style="padding-left:40px;" class="col-md-11 delivery-methods-header">
                                                <p style="padding-left:0px;font-size:20px;" class="training-delivery-heading">Classroom Live Training</p>
                                                <p style="padding-left:7px;" class="delivery-method-description">
                                                    Get in-person, hands-on instruction with live lab exercises taught by subject matter
                                                    experts who deliver authorized and industry-leading content.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row"  id="delivery-method-description">
                                            <div class="col-md-12 ">
                                               <p class="delivery-method-description"> With classrooms in almost every major U.S. city, Productivity Point has something for
                                                users of every level, so you can earn the most popular industry certifications. You get
                                                hands-on learning experience with live lab exercises taught by experienced instructors. We proudly advocate
                                                our learning services to be hosted by the best-qualified trainers in terms of technical knowledge and teaching
                                                skills.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
				            </div>
				            <div class="tab-pane" id="12b">
                                 <div class="row delivery-method-box" id="classsroom-virtual-training">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-1 delivery-methods-image">
                                                <img class="tab-image" src="/images/cities_site_images/Remote_Icon.png" />
                                            </div>
                                            <div style="padding-left:40px;" class="col-md-11 delivery-methods-header">
                                                <p style="padding-left:0px;font-size:20px;" class="training-delivery-heading">Classroom Virtual Training</p>
                                                <p style="padding-left:7px;" class="delivery-method-description">
                                                    Prefer to have a dedicated classroom for your virtual experience? Attend live, hands-
                                                    on training via remote instructor from one of Productivity Point’s multiple locations.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 ">
                                                <p class="delivery-method-description">Enjoy a focused and professional training environment, including all technical
                                                equipment provided along with administrative and technical support at your fingertips. With over 150
                                                locations to choose from, review our course catalog or contact your personal Productivity Point Account
                                                Manager to see if the course you have in mind is delivered at one of our dedicated virtual classrooms in
                                                your area.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
				            </div>
                           
                            <div class="tab-pane" id="13b">
                                 <div class="row delivery-method-box" id="live-online-training">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-1 delivery-methods-image">
                                                <img style="margin-left:20px;" class="tab-image"  src="/images/cities_site_images/Live_Online.png" />
                                            </div>
                                            <div style="padding-left:40px;" class="col-md-11 delivery-methods-header">
                                                <p style="padding-left:0px;font-size:20px;" class="training-delivery-heading">Live Online Training</p>
                                                <p style="padding-left:7px;" class="delivery-method-description">
                                                    Blend the best from traditional face-to-face instructor-led training with 
                                                    the latest in conferencing technology.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 delivery-method-description">
                                                <ul style="margin-top:10px !important;">
                                                    <li>Delivering live training to multiple locations at one time</li>
                                                    <li>100% live, instructor led training in a classroom setting without excess travel.</li>
                                                    <li>Dramatically reduced class cancellation rate.</li>
                                                </ul>  
                                            </div>
                                        </div>
                                    </div>
                                </div>
				            </div>
                            <div class="tab-pane" id="14b">
                                 <div class="row delivery-method-box" id="private-group-training">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-1 delivery-methods-image">
                                                <img style="margin-left:20px;" class="tab-image" src="/images/cities_site_images/Private_Groups_New.png" />
                                            </div>
                                            <div style="padding-left:40px;" class="col-md-11 delivery-methods-header">
                                                <p style="padding-left:0px;font-size:20px;" class="training-delivery-heading">Private Group Training</p>
                                                <p style="padding-left:7px;" class="delivery-method-description">
                                                    Your private group classroom experience will not only take place in the location of your
                                                    choice (including any of our training centers), but you will enjoy the following amenities:
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 delivery-method-description">
                                                <ul style="margin-top:10px !important;">
                                                    <li>
                                                        Instructor Consult to get to know your instructor and convey your customized requirements
                                                    </li>
                                                    <li>
                                                        Course Curriculum tailored to your specifications and displaying your organization's branding
                                                    </li>
                                                    <li>
                                                        On-Line course evaluations provided for your review
                                                    </li>
                                                    <li>
                                                        Post-Assessments to ensure your learners have fully comprehended
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
				            </div>
                             <div class="tab-pane" id="15b">
                                 <div class="row delivery-method-box" id="on-demand-learning">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-1 delivery-methods-image">
                                                <img class="tab-image" src="/images/cities_site_images/On_Demand.png" />
                                            </div>
                                            <div style="padding-left:50px;" class="col-md-11 delivery-methods-header">
                                                <p style="padding-left:0px;font-size:20px;" class="training-delivery-heading">On-Demand Learning</p>
                                                <p style="padding-left:7px;" class="delivery-method-description">
                                                    On-Demand is an IT training solution designed around your schedule, budget, and
                                                    learning needs.  Combining high-quality video, reading, and knowledge checks in a self-paced
                                                    format, On-Demand helps you build skills as your schedule allows—all at once or
                                                    five minutes at a time.<br />
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 delivery-method-description">
                                                <p>With On-Demand, you learn at your own pace and in the convenience of your own space.</p>
                                                <p>With Learn at your own pace…</p>
                                                <ul style="margin-top:10px !important;line-height:1.8">
                                                    <li>
                                                        Personal industry leading trainers and instructors right on your own desktop.
                                                    </li>
                                                    <li>
                                                        Acquire leverage to better career opportunities.
                                                    </li>
                                                    <li>
                                                        Learn the latest information technology.
                                                    </li>
                                                    <li>
                                                        Increase your earning potential
                                                    </li>
                                                    <li>
                                                        Get Certified
                                                    </li>
                                                </ul>
                                                  Try Before You Buy…<br />
    
                                                If you would like to experience On-Demand before you purchase, send an email to: <a href="mailto:ondemand@productivitypointls.com"> ondemand@productivitypointls.com</a>
                                                to receive your Course Demo Code.
                                            </div>
                                        </div>
                                    </div>
                                </div>
				            </div>
			            </div> 

</div>

    <%--<div class="container-fluid bgWhite subPage padding75B">
        <div class="row">
            <div class="container" itemscope itemtype="http://schema.org/Course">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                        
                        <asp:FormView ID="ctlCourseDetails" DefaultMode="ReadOnly" RenderOuterTable="false" runat="server">
                            <ItemTemplate>                                
                                <div>
                                    <p class="sectionHeadingSubPage text-left subSectionPadding" itemprop="name"><asp:Literal ID="ltrName" runat="server" Text='<%# Eval("courseName") %>' /></p>   

                                <asp:LinkButton Visible="false" ID="ctlViewSchedule" OnClick="ctlViewSchedule_Click" CssClass="btn btn-warning" runat="server" ><i class="fa fa-calendar"></i>  View Schedule</asp:LinkButton>
                                <asp:PlaceHolder runat="server" Visible="false">
                                <asp:HyperLink ID="ctlCourseOutline" Text="" ToolTip="Course Outline" NavigateUrl='<%# String.Format("~/courseoutlines/{0}.pdf", Server.HtmlEncode(Eval("courseOutline").ToString())) %>' CssClass="btn btn-primary" Target="_blank" runat="server" ><i class="fa fa-file-pdf-o"></i>  Course Outline</asp:HyperLink>

                                </asp:PlaceHolder>
                            </ItemTemplate>
                        </asp:FormView>  
                        
                        <asp:FormView ID="ctlCourseDescription" DefaultMode="ReadOnly" runat="server">
                            <ItemTemplate>                    
                                <p class="sectionHeadingSubPage text-left subSectionPadding">Description</p>
                                <p itemprop="description"><%# CheckEmptyData(Eval("courseDescription").ToString()) %></p>
                    
                                <p class="sectionHeadingSubPage text-left subSectionPadding">Objectives</p>                                        
                                <p itemprop="description"><%# CheckEmptyData(Eval("courseObjectives").ToString()) %></p>
                    
                                <p class="sectionHeadingSubPage text-left subSectionPadding">Prerequisites</p>                                        
                                <p itemprop="coursePrerequisites"><%# CheckEmptyData(Eval("coursePrerequisites").ToString()) %></p>
                    
                                <p class="sectionHeadingSubPage text-left subSectionPadding">Outline</p>                                        
                                <p itemprop="description"><%# CheckEmptyData(Eval("courseDetail").ToString()) %></p>                       
                            </ItemTemplate>
                        </asp:FormView>                                                                                               
                    </div>

                    
                </div>                    
            </div>
        </div>
    </div>--%>	
      <script>
window.smoothScroll = function(target) {
    var scrollContainer = target;
    do { //find scroll container
        scrollContainer = scrollContainer.parentNode;
        if (!scrollContainer) return;
        scrollContainer.scrollTop += 1;
    } while (scrollContainer.scrollTop == 0);
    
    var targetY = 0;
    do { //find the top of target relatively to the container
        if (target == scrollContainer) break;
        targetY += target.offsetTop;
    } while (target = target.offsetParent);
    targetY -=100;
    scroll = function(c, a, b, i) {
        i++; if (i > 30) return;
        c.scrollTop = a + (b - a) / 30 * i;
        setTimeout(function(){ scroll(c, a, b, i); }, 20);
    }
    // start scrolling
    scroll(scrollContainer, scrollContainer.scrollTop, targetY, 0);
}
    </script>
</asp:Content>