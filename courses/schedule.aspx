<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="schedule.aspx.cs" Inherits="ProductivityPointGlobal.courses.Schedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrCanonical" runat="server"></asp:Literal>

    <style type="text/css">
        .view{ background: url('<%# BannerPath %>'); background-size: 100% auto; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;height:372px; }
    .training-delivery-method-box{background-color:#efefef;padding-top:34px;padding-bottom:34px;margin-top:20px}.custom-right-sidebar-div{border-left:1px solid #fd6803;min-height:200px;padding-left:30px;margin-top:22px}.custom-right-sidebar-div>p{text-align:left;font-size:14px;line-height:1.8}.custom-right-sidebar-div>.sidebar-heading{border-bottom:1px solid #fd6803;font-size:18px;font-weight:500;margin-bottom:5px;padding-bottom:7px;line-height:1.5}.custom-right-sidebar-div>p>ul>li{text-align:left}.training-delivery-method-box>.training-delivery-heading{text-align:center}.training-delivery-heading{font-size:32px;font-weight:500}.training-delivery-method-box>.training-delivery-content>p{font-size:24px;padding-bottom:20px}.training-delivery-method-box>.training-delivery-heading>h2{text-align:center}.training-delivery-image-box{text-align:center;font-size:24px;font-weight:600}.training-delivery-image-box>img{height:100px;margin-bottom:20px}.training-delivery-image-box>p{text-align:center}.delivery-methods-image>img{height:260px;max-width:100%}.delivery-methods-header>h1{margin-top:34px}.delivery-method-description{font-size:20px}.address-box{line-height:1.5px}.address-box>p{line-height:15px}.address-box>h3{margin-bottom:26px}.address-box>.address-header{font-size:24px}.address-box>.map-link{color:#00f;margin-top:40px;margin-bottom:40px}.map-link>a:hover{color:#00f;opacity:.8}.map-link>a{font-size:15px}.map-box{margin-top:2px}p{text-align:left;font-size:15px;line-height:1.5}.training-delivery-image-box>img:hover{transform:scaleX(1.2) scaleY(1.2)}.objective-break{margin:5px}ul>li{font-family:HelveticaNeueLTStd;color:#4c4c4c}div{font-family:HelveticaNeueLTStd;color:#4c4c4c}.section1RowSubpage{margin-top:0;margin-bottom:0}.section1RowSubpage>h1{font-size:40px;margin-top:8px;margin-bottom:0;line-height:1.0;}.delivery-method-box{margin-top:18px}.table thead{color:#fd6803!important}.breadcrumb-box{color:#fff;margin-top:30px;margin-left:10px;margin-bottom:0}.breadcrumb-link{color:#fff}.breadcrumb-link:hover{opacity:.8;color:#fff!important}.breadcrumb-active-link{color:#fff}.breadcrumb-active-link:hover{color:#fff;opacity:1}iframe{width:100%;height:316px}.subPage ul{margin:0}.table thead{font-family:HelveticaNeueLTStd}.table tr td{font-family:HelveticaNeueLTStd;font-size:18px}.table>thead>tr>td{font-family:HelveticaNeueLTStd;font-size:18px}p{color:#595959}div{color:#595959}body{color:#595959}
    .city-main-page-right-sidebar-div{min-height:200px;margin-top:26px}.city-main-page-right-sidebar-div>p{text-align:left;font-size:14px;line-height:1.8}.city-main-page-right-sidebar-div>.sidebar-heading{border-bottom:1px solid #fd6803;font-size:18px;font-weight:500}.city-main-page-right-sidebar-div>p>ul>li{text-align:left;font-size:14px;line-height:1.8}

        </style>
    <style>
        .gtr-box{padding-top:30px;color:#fd6803;text-align:right;font-family:HelveticaNeueLTStd;font-size:16px}.schedule-heading{font-size:35px;width:636px;line-height:1.3}@media screen and (max-width:572px){.custom-right-sidebar-div{border-left:unset;padding-left:0}.gtr-box{padding-top:0}.schedule-heading{font-size:31px!important;width:100%}.section1RowSubpage{margin-top:60px!important}}
    </style>
    <style>
        @media screen and (max-width: 572px) {
            .padding110T{
                margin-top:110px !important;
            }
            
            .section1RowSubpage{
                margin-top:40px !important ;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container-fluid view subPage">
    <div class="row" id="banner-area" style="margin-top:44px;">
             <p class="breadcrumb-box hidden-sm hidden-xs">
                <a style="font-size:11px"  class="breadcrumb-link" href="/">Home</a> >
                <a style="font-size:11px"  class="breadcrumb-link"  href="/city-courses.aspx">Catalog</a> >
                    <%if (SeoCity != null)
                        { %>
                        <a style="font-size:11px"  class="breadcrumb-link"  href="/city/<%=ClosestCity.Replace(" ","-").ToLower() %>/state/<%=ClosestState.Replace(" ","-").ToLower() %>"><%=ClosestCity %>, <%=ClosestState %></a> >
                    <%} %>
                    <a style="font-size:11px"  class="breadcrumb-link"  href="/city/<%=ClosestCity.Replace(" ","-").ToLower() %>/state/<%=ClosestState.Replace(" ","-").ToLower() %>/<%=CourseCategory.Replace(" ","-").ToLower() %>"><%=CourseCategory %></a> >
                <a style="font-size:11px"  class="breadcrumb-active-link"> <%=CourseName %> </a>
            </p>
            <div class="" style="height:276px;margin-left:10px;margin-top:20px;">
                <div class=" padding0T padding110T" style="padding-top:40px;padding-bottom:30px;">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                         <div class="section1RowSubpage">
                            <h1 style="line-height:1.0" class="white fontShadow schedule-heading"><asp:Literal ID="ltrH1" runat="server" /></h1>
                            <p style="font-size:35px;margin-top:10px;font-family:Candara;font-style:italic;margin-bottom:0px;"  class="white fontShadow schedule-heading"> <%=ClosestCity %>, <%=ClosestState %></p>
                            <p style="font-size:35px;font-family:Candara;font-style:italic" class="white fontShadow schedule-heading"> Class Schedule</p>
                            <p style="font-size:20px;font-family:Candara;font-style:italic" class="white fontShadow schedule-heading"> <%=ScheduleNotes %></p>
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
    
<uc:Search ID="ucSearch" runat="server" />

<div class="container-fluid bgWhite subPage padding75B">
    <div class="row">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-sm-6 col-xs-12">                         
                    <asp:FormView ID="ctlCourseDetails" DefaultMode="ReadOnly" RenderOuterTable="false" runat="server">
                        <ItemTemplate>                                
                            <div style="display:none">
                                <p style="font-size:22px;line-height:1.3" class="sectionHeadingSubPage text-left subSectionPadding"><asp:Literal ID="ltrName" runat="server" Text='<%# Eval("courseName") %>' /></p>
                                <div class="clearfix"></div>
                            </div>                                
                            
                            <div style="width:100%;overflow:auto;">
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
                        <div class="col-md-8" style="text-align:left" >
                            <h2 style="padding-top:25px;font-size:23px;line-height:1.3" class="sectionHeadingSubPage text-left subSectionPadding">
                                <%=CourseName %></h2><h2 style="padding-top:1px;font-size:22px;line-height:1.3"> <%=ClosestCity %>, <%=ClosestState %> Class Schedule</h2>

                        </div>
                       <div  class="col-md-3 gtr-box">
                          <img style="height:80px;" src="/images/site/GTR_New.png" />
                            <%--<span class="label label-primary"> GTR</span><br />
                            <p style="margin-top:4px;text-align:right;color:#337ab7;font-weight:600;"><span style="font-size:17px;">Guaranteed to Run</span></p>--%>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-9">

                        </div>
                        
                    </div>
                    <%--<table style="width:100%">
                        
                         <tr>
                            <td style="width:70%;text-align:left" >  
                                <p style="padding-top:25px;font-size:23px;line-height:1.3" class="sectionHeadingSubPage text-left subSectionPadding">
                                <%=CourseName %><p /><p style="padding-top:1px;font-size:22px;line-height:1.3"> <%=ClosestCity %>, <%=ClosestState %> Class Schedule</p>

                            </td>
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
                   
                    <asp:Repeater ID="ctlClassSchedule" OnItemDataBound="ctlClassSchedule_OnItemDataBound" runat="server">
                        <HeaderTemplate>                    
                            <table class="table table-hover" style="margin-top:5px;">
                            <thead>
                            <tr>
                                <td class="col-lg-3 col-md-3 col-sm-3 col-xs-4">Delivery Format</td>
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
                                   <%# Eval("deliveryFormat") %>
                                </td>
                                <td  style="font-family:HelveticaLTStdRoman;font-size:13px" class="hidden-xs"><asp:Label ID="lblGTR" CssClass="label label-primary" ToolTip='<%# Eval("Gtr") %>' Text="" runat="server"/><asp:Image style="height:20px;" id="ctlGTRIcon" runat="server" src="/images/site/checkmark.PNG" /></td>
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
                    </asp:Repeater>   
                    
                    <div class="row" style="margin-top:50px;">
                        <div class="col-md-6 address-box" >
                            <p style="margin-bottom:26px;font-size:25px;" class="address-header"><%=ClosestCity %> Training Center</p>
                            <p class="address-header"><i class="fa fa-map-marker"></i> Address</p><br />
                            <div class="row">
                                <div class="col-md-12">
                                    <%if (Address1 != null)
                                        {%><p style="margin-bottom:0px;"><%=Address1 %></p><br /><%} %>
                                    <%if (Address2 != null&&Address2!="")
                                        { %><p style="margin-bottom:0px;"><%=Address2 %></p><br /><%} %>
                                    <p><%=City %>, <%=State %> <%=Zip %></p>
                                    <div style="margin-top:20px;margin-bottom:36px;" class="map-link">
                                        <a target="_blank" href="<%=(MapLink==null||MapLink=="")?"#":MapLink%>">Map and Driving Directions</a>
                                    </div>
                                </div>
                            </div>
                            
                            <p style="margin-top:10px;"  class="address-header"><i class="fa fa-phone"></i> Call Us</p>
                            <p>US Toll Free 844-238-8607</p>
                             <div style="height:26px;">

                            </div>
                            <p class="address-header"><i class="fa fa-envelope"></i> Email Us</p><br />
                            <p> <a href="mailto:info@productivitypointls.com">info@productivitypointls.com</a></p>
                        </div>
                        <div class="col-md-6 map-box">
                            <%=MapEmbed %>
<%--                            <iframe width="100%" height="300" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d10645.219068414113!2d-122.2130983057816!3d37.51163118732459!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808fa2ecee0ca881%3A0x7accb03821a8109!2s2100%20Seaport%20Blvd%2C%20Redwood%20City%2C%20CA%2094063%2C%20USA!5e0!3m2!1sen!2snp!4v1595008317421!5m2!1sen!2snp" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>--%>
                        </div>
                    </div>
                </div>

               <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                        <div class="custom-right-sidebar-div">
                            <h2  class="sidebar-heading">
                                <%=CourseName %>
                            </h2>
                            <p style="font-weight:500;font-size:18px">Course Overview</p>
                            <p>
                                <%=CheckEmptyData(CourseDescription) %>
                            </p>
                            <h2  class="sidebar-heading" style="margin-top:26px;">
                                <%=CourseName %>
                            </h2>
                            <h4 style="font-weight:500;font-size:18px">Course Objectives</h4>
                            
                            <div style="font-size:14px;line-height:1.8">
                                <%=CourseObjective.Replace("·","•").Replace("•", "<div style='height:3px;'></div><span style='margin-top:20px;'>•</span>") %>
                            </div>
                            <div  class="city-main-page-right-sidebar-div">
                                <h2 id="link-certifications" class="sidebar-heading">Related Certifications</h2>
                                <p><%=CheckEmptyData(RelatedCertifications) %></p>
                                 <h2 class="sidebar-heading" style="margin-top:26px;">
                                    Course Prerequisites
                                </h2>
                                 <div style="font-size:14px;line-height:1.8">
                                    <%=CoursePrerequisites.Replace("·","•").Replace("•", "<div style='height:3px;'></div><span style='margin-top:20px;'>•</span>") %>
                                </div>
                                <h2 style="margin-top:20px;" id="link-followons" class="sidebar-heading">Follow-on Course(s)</h2>
                                <div style="font-size:14px;">
                                    <%foreach(var item in GetCourseLinks(NextLevel))
                                        {%>
                                            <a target="_blank" href="/course/<%=GetSEOCourseFromCourse(item).Replace(" ","-") %>"><%=item %></a><div class="custom-link-margin-height"></div>
                                        <%} %>
                                </div>
                                <h2 style="margin-top:20px;" class="sidebar-heading">Related Courses</h2>
                                <div style="font-size:14px;">
                                    <%foreach(var item in GetCourseLinks(RelatedCourses))
                                        {%>
                                            <a target="_blank" href="/course/<%=GetSEOCourseFromCourse(item).Replace(" ","-") %>"><%=item %></a> <div class="custom-link-margin-height"></div>
                                        <%} %>
                                </div>
                            </div>
                            
                           <%-- <p style="margin-top:6px;">
                                <a style="font-size:18px;" href="/course/<%=SeoCourseName.Replace(" ","-") %>" class="">Course Outline</a>
                            </p>--%>

                    </div>
                    
            </div>                    
            </div>
        </div>
    </div>
    <%--<div class="row">
                <div class="col-md-12">
                    <div class="training-delivery-method-box">
                        <p style="text-align:center" class="training-delivery-heading">
                            Training Delivery Methods
                        </p>
                        <div class="row">
                             <div class="col-md-1"></div>
                            <div class="col-md-10 training-delivery-content" style="margin-top:18px;">
                                <p style="font-size:22px;">
                                     With Productivity Point, you will have a spectrum of delivery methods to choose from...
                            when where and how you like it. Whether it's in a classroom or online, we have a
                            delivery option to meets your needs.
                                </p>
                                
                            </div>
                            <div class="col-md-1">

                            </div>
                        </div>
                       
                        <div class="row" style="margin-top:50px;">
                            <div class="col-md-1">

                            </div>
                            <div class=" col-md-2 col-sm-3 col-xs-4 training-delivery-image-box">
                                <img onclick="smoothScroll(document.getElementById('classroom-live-training'))" src="/images/cities_site_images/Classroom_Icon.png" />
                                <p>Classroom Live</p>
                            </div>
                            <div class=" col-md-2 col-sm-3 col-xs-4  training-delivery-image-box">
                                <img onclick="smoothScroll(document.getElementById('classsroom-virtual-training'))"  src="/images/cities_site_images/Remote_Icon.png" />
                                <p>Classroom Virtual</p>
                            </div>
                            <div class=" col-md-2 col-sm-3 col-xs-4 training-delivery-image-box">
                                <img onclick="smoothScroll(document.getElementById('live-online-training'))" src="/images/cities_site_images/Live_Online.png" />
                                <p>Live Online</p>
                            </div>
                             <div class=" col-md-2 col-sm-3 col-xs-4 training-delivery-image-box">
                                 <img onclick="smoothScroll(document.getElementById('private-group-training'))" src="/images/cities_site_images/Classroom_Icon.png" />
                                <p>Private Groups</p>
                            </div>
                             <div class=" col-md-2 col-sm-3 col-xs-4  training-delivery-image-box">
                                 <img onclick="smoothScroll(document.getElementById('on-demand-learning'))" src="/images/cities_site_images/On_Demand.png" />
                                <p>On Demand</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    <div class="container" style="margin-top:20px;">
        <div class="row delivery-method-box" id="classroom-live-training">
            <div class="col-md-12">
                <div class="row" >
                    <div class="col-md-3 delivery-methods-image">
                        <img src="/images/cities_site_images/training-development.png" />
                    </div>
                    <div class="col-md-9 delivery-methods-header">
                        <p class="training-delivery-heading">Classroom Live Training</p>
                        <div class="delivery-method-description">
                            Get in-person, hands-on instruction with live lab exercises taught by subject matter
                            experts who deliver authorized and industry-leading content.
                        </div>
                    </div>
                </div>
                <div class="row"  id="delivery-method-description">
                    <div class="col-md-12 delivery-method-description">
                        With classrooms in almost every major U.S. city, Productivity Point has something for
                        users of every level, so you can earn the most popular industry certifications. You get
                        hands-on learning experience with live lab exercises taught by experienced instructors. We proudly advocate
                        our learning services to be hosted by the best-qualified trainers in terms of technical knowledge and teaching
                        skills.
                    </div>
                </div>
            </div>
        </div>

        <div class="row delivery-method-box" id="classsroom-virtual-training">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-3 delivery-methods-image">
                    <img style="width:100%" src="/images/cities_site_images/Remote_Icon.png" />
                </div>
                <div class="col-md-9 delivery-methods-header">
                    <p class="training-delivery-heading">Classroom Virtual Training</p>
                    <div class="delivery-method-description">
                        Prefer to have a dedicated classroom for your virtual experience? Attend live, hands-
                        on training via remote instructor from one of Productivity Point’s multiple locations.
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 delivery-method-description">
                    Enjoy a focused and professional training environment, including all technical
                    equipment provided along with administrative and technical support at your fingertips. With over 150
                    locations to choose from, review our course catalog or contact your personal Productivity Point Account
                    Manager to see if the course you have in mind is delivered at one of our dedicated virtual classrooms in
                    your area.
                </div>
            </div>
        </div>
    </div>

        <div class="row delivery-method-box" id="live-online-training">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-3 delivery-methods-image">
                        <img style="height:170px;" src="/images/cities_site_images/Live_Online.png" />
                    </div>
                    <div class="col-md-9 delivery-methods-header">
                        <p class="training-delivery-heading">Live Online Training</p>
                        <div class="delivery-method-description">
                            Blend the best from traditional face-to-face instructor-led training with 
                            the latest in conferencing technology.
                        </div>
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

        <div class="row delivery-method-box" id="private-group-training">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-3 delivery-methods-image">
                        <img style="padding-top:50px;" src="/images/cities_site_images/Classroom_Icon.png" />
                    </div>
                    <div class="col-md-9 delivery-methods-header">
                        <p class="training-delivery-heading">Private Group Training</p>
                        <div class="delivery-method-description">
                            Your private group classroom experience will not only take place in the location of your
                            choice (including any of our training centers), but you will enjoy the following amenities:
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 delivery-method-description">
                        <ul style="margin-top:10px !important;">
                            <li>
                                Instructor Consult to get to know your instructor and convey your customized requirements
                            </li>
                            <li>
                                Course Curriculum tailored to your specifications and displaying your organization&#39;s branding
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

        <div class="row delivery-method-box" id="on-demand-learning">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-3 delivery-methods-image">
                        <img style="padding-top:80px;" src="/images/cities_site_images/On_Demand.png" />
                    </div>
                    <div class="col-md-9 delivery-methods-header">
                        <p class="training-delivery-heading">On-Demand Learning</p>
                        <div class="delivery-method-description">
                            On-Demand is an IT training solution designed around your schedule, budget, and
                            learning needs.
                        </div>
                        <div class="delivery-method-description" >
                            Combining high-quality video, reading, and knowledge checks in a self-paced
                            format, On-Demand helps you build skills as your schedule allows—all at once or

                            five minutes at a time.
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 delivery-method-description">
                        With On-Demand, you learn at your own pace and in the convenience of your own space.
                        With Learn at your own pace…
                        <ul style="margin-top:10px !important;">
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
                        </ul><br />
                        Try Before You Buy…<br />
    
                        If you would like to experience On-Demand before you purchase, send an email to: <a href="mailto:ondemand@productivitypointls.com"> ondemand@productivitypointls.com</a>
                        to receive your Course Demo Code.

                    </div>
                </div>
            </div>
        </div>
    </div>--%>
    
</div>
 <%--   <script>
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
    </script>--%>
</asp:Content>