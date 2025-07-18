<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="coursebrandmainpage.aspx.cs" Inherits="ProductivityPointGlobal.courses.coursesmainpage" %>

<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%#string.Format("<link rel=\"canonical\" href=\"{0}://{1}/brand/{2}/{3}\" />", Request.Url.Scheme, Request.Url.Host,BrandName.ToLower().Replace(" ","-"),CourseType.ToLower().Replace(" ","-")) %>
    <style>
       .gradient{background-image:linear-gradient(rgba(0,0,0,.2),#fff)}.city-mainpage-heading{font-size:26px;margin-top:5px}.city-main-page-right-sidebar-div{border-left:1px solid #fd6803;min-height:200px;padding-left:30px;margin-top:34px}.city-main-page-right-sidebar-div>p{text-align:left;font-size:14px;line-height:1.8}.city-main-page-right-sidebar-div>.sidebar-heading{border-bottom:1px solid #fd6803;font-size:18px;font-weight:500}.city-main-page-right-sidebar-div>p>ul>li{text-align:left;font-size:14px;line-height:1.8}.catalog-box{height:155px;text-align:left;margin-top:10px;margin-bottom:10px;overflow:hidden}.catalog-inner-box{height:149px;width:300px;margin:5px;padding:.5em 1em .5em;border:1px solid #e5e5e5;border-radius:2px;overflow:hidden}.catalog-inner-box:hover{box-shadow:0 2px 6px 0 rgba(0,0,0,.4)}.catalog-inner-box>.catalog-heading{color:#f67a06;line-height:1.2;margin-bottom:0!important}.catalog-inner-box>.catalog-description{font-size:14px;height:23px;overflow:hidden;line-height:1.29}.city-view{background-size:100% auto;-webkit-background-size:cover;-moz-background-size:cover;-o-background-size:cover;background-size:cover}.section1RowSubpageCityPage{margin-bottom:100px;margin-top:10px;text-align:center}p{text-align:left;font-size:15px;line-height:1.5}.address-box{line-height:1.5px}.address-box>p{line-height:15px}.address-box>h3{margin-bottom:26px}.address-box>.address-header{font-size:24px}.address-box>.map-link{color:#00f;margin-top:40px;margin-bottom:40px}.map-link>a{font-size:15px}.map-link>a:hover{color:#00f;opacity:.8}.map-box{margin-top:26px}p{text-align:left;font-size:15px;line-height:1.5}ul>li{font-family:HelveticaNeueLTStd;color:#4c4c4c;font-size:14px;line-height:1.8}.section1RowSubpage{margin-top:25px;margin-bottom:51px}.section1RowSubpage>h1{margin-top:0;margin-bottom:0}.section1RowSubpageCityPage{margin-top:20px}.padding0T{padding:0}.breadcrumb-box{color:#fff;margin-top:30px;margin-left:10px;margin-bottom:0}.breadcrumb-link{color:#fff}.breadcrumb-link:hover{opacity:.8;color:#fff!important}.breadcrumb-active-link{color:#fff}.breadcrumb-active-link:hover{color:#fff;opacity:1}iframe{width:100%;height:300px}
    </style>    
    <style>
        .brandmain-training-and-certification{
            font-size:35px !important
        }
         @media screen and (max-width: 572px) {
             .city-main-page-right-sidebar-div {
                border-left: unset;
                padding-left: 0px;
            } 
             .padding100T{
                 padding-top:100px !important;
             }

             .brandMain{
                 font-size:40px;
                 line-height:55px;
             }

             .brandmain-training-and-certification{
                 font-size:28px !important;
             }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="HeadingDiv" class="container-fluid city-view subPage" runat="server">
        <div class="row">
            <p class="breadcrumb-box">
                <a style="font-size:11px"  class="breadcrumb-link" href="/">Home</a> >
                <a style="font-size:11px"  class="breadcrumb-link"  href="/<%=FirstCharToUpper(CourseType.Split(' ')[0]).ToLower() %>-<%=FirstCharToUpper(CourseType.Split(' ')[1]).ToLower() %>.aspx"><%=FirstCharToUpper(CourseType.Split(' ')[0]) %> <%=FirstCharToUpper(CourseType.Split(' ')[1]) %></a> >
                <a style="font-size:11px"  class="breadcrumb-active-link"> <%=BrandName %> </a>
            </p>
            <div class="container">
                <div class="row padding0T padding100T" style="padding-top:60px;padding-bottom:30px;">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">  
                        <div class="section1RowSubpage">
                           
                             <h1 class="white fontShadow">
                                 <span class="brandMain"> <%=BrandName %> </span> <br />
                                 <span class="brandmain-training-and-certification">Training and Certifications</span>
                             </h1>
<%--                            <h1 style="font-size:35px !important" class="white fontShadow">Training and Certifications</h1>--%>
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
    
    <%--<uc:Search ID="ucSearch" runat="server" />--%>
<%--    <div style="height:50px;" class="gradient">

    </div>--%>
    <div class="container-fluid bgWhite padding75B">
        <div class="row">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12">
                        <div>
                              <h2 style="font-size:25px;padding-top:20px;font-family: HelveticaNeueLTStd;" class="city-mainpage-heading text-center subSectionPadding">
                                    <%=BrandName %> Training Overview
                              </h2>
                        </div>

                        <p  class="">
                            <%=CheckEmptyData(CourseBrandDescription) %>
                        </p>
                        <div>
                              <h2 style="font-size:25px;font-weight:500;padding-top:20px;font-family: HelveticaNeueLTStd;" class="city-mainpage-heading text-center subSectionPadding">
                                    <%=BrandName %> Courses
                              </h2>
                        </div>
                      <div>
                          <div class="row">
                              <asp:Repeater id="AvailableCourses" runat="server">
                               <ItemTemplate>
                                   <div class="col-md-6 catalog-box">
                                      <div class="catalog-inner-box">
                                          <a href="/course/<%#Eval("seoCourseName").ToString().ToLower().Replace(" ","-")%>">
                                              <div style="height:100px;overflow:hidden">
                                                  <p class="catalog-heading" style="margin-bottom:5px;line-height:1.3;font-size:12px;"><span style="font-size:16px;font-weight:500;color:#FD6803"> <%# Eval("courseName") %></span> </p>
                                                  <p style="font-size:12px;line-height:1.5;margin-bottom:0px;" class="catalog-description">
                                                      <%# Eval("courseShortDescription") %>
                                                  </p>
                                            </div>
                                              <div class="row" style="height:50px;">
                                                  <div style="text-align:center;vertical-align:middle;padding-top:0px;" class="col-sm-6">
                                                      <p style="margin-top:10px;font-size:13px;"><i><%# Eval("level1") %></i></p>
                                                  </div>
                                                  <div class="col-sm-6" style="padding-top:6px;">
                                                     <asp:Image class="pull-right" ID="image1" runat="server" Visible='<%#Eval("deliveryFormats").ToString().Contains("Live Online") %>' data-toggle="tooltip" title="Live Online"  ImageUrl='/images/cities_site_images/Live_Online.png' Height="23px" style="padding:3px;" />
                                                      <asp:Image class="pull-right" ID="image2" runat="server" Visible='<%#Eval("deliveryFormats").ToString().Contains("Classroom Live") %>'  title="Classroom Live"  ImageUrl='/images/cities_site_images/Classroom_Icon.png' Height="30px" />
                                                      <asp:Image class="pull-right" ID="image3" runat="server" Visible='<%#Eval("deliveryFormats").ToString().Contains("Classroom Virtual") %>'  title="Classroom Virtual"  ImageUrl='/images/cities_site_images/Classroom_Virtual.png' Height="30px" />
                                                      <asp:Image class="pull-right" ID="image4" runat="server" Visible='<%#Eval("deliveryFormats").ToString().Contains("On Demand") %>'  title="On Demand"  ImageUrl='/images/cities_site_images/On_Demand.png' Height="30px" />
                                                  </div>
                                                </div>
                                           </a>
                                      </div>
                                  </div>
                            </ItemTemplate>
                            </asp:Repeater>
                          </div>
                      </div>
                        <div class="row" style="margin-top:50px;">
                            
                            
                        </div>
                    </div>
                   <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                        <div class="city-main-page-right-sidebar-div">
                            <h2 class="sidebar-heading">
                                Classroom Live Training
                            </h2>
                            <p>
                                <i>
                                    Get in-person, hands-on instruction with live lab exercises taught by subject
                                    matter experts who deliver authorized and industry-leading content.
                                </i>
                            </p>
                            <p>
                                With classrooms in almost every major
                                U.S. city, Productivity Point has something
                                for users of every level, so you can earn
                                the most popular industry certifications.
                                You get hands-on learning experience with
                                live lab exercises taught by experienced
                                instructors.
                            </p>
                            <p>
                                We proudly advocate our learning services
                                to be hosted by the best-qualified trainers
                                in terms of technical knowledge and
                                teaching skills.
                            </p>
                            <h2 class="sidebar-heading">Classroom Virtual Training</h2>
                            <p>
                                Prefer to have a dedicated classroom for
                                your virtual experience? Attend live,
                                hands-on training via remote instructor
                                from one of Productivity Point’s multiple
                                locations.
                            </p>
                            <ul>
                                <li>
                                    Course Curriculum tailored to your specifications and displaying your organization's branding.
                                </li>
                                <li>
                                    On-Line course evaluations provided for your review.
                                </li>
                                <li>
                                    Post-Assessments to ensure your learners have fully comprehended the course content
                                </li>
                            </ul>
                            <h2 class="sidebar-heading">Private Group Training</h2>
                            <p>
                                Your private group classroom experience
                                will not only take place in the location of
                                your choice (including any of our training
                                centers), but you will enjoy the following
                                amenities:
                            </p>
                            <ul>
                                <li>
                                    Instructor Consult to get to know your instructor and convey your customized requirements
                                </li>
                                <li>
                                    Course Curriculum tailored to your specifications and displaying your organization's branding.
                                </li>
                                <li>
                                    On-Line course evaluations provided for your review.
                                </li>
                                <li>
                                    Post-Assessments to ensure your learners have fully comprehended the course content.
                                </li>
                            </ul>
                            <h2 class="sidebar-heading">Live Online Training</h2>
                            <p>
                                Live Online Training is changing the
                                training industry. Blending the best from
                                traditional face-to-face instructor-led
                                training with the latest in conferencing
                                technology, 
                            </p>
                            <ul>
                                <li>
                                    Delivering live training to multiple locations at one time.
                                </li>
                                <li>
                                    100% live, instructor led training in a classroom setting without excess travel. 
                                </li>
                                <li>
                                    Dramatically reduced class cancellation rate.
                                </li>
                            </ul>
                            <h2 class="sidebar-heading">On-Demand Learning</h2>
                            <p>
                                On-Demand is an IT training solution
                                designed around your schedule, budget,
                                and learning needs. Combining highquality video, reading, and knowledge
                                checks in a self-paced format, On-Demand
                                helps you build skills as your schedule
                                allows—all at once or five minutes at a time.
                            </p>
                            <p>
                                With On-Demand, you learn at your own
                                pace and in the convenience of your own
                                space, with a personal instructor right on
                                your own desktop.
                            </p>
                            <ul>
                                <li>Learn the latest information technology.</li>
                                <li>Increase your earning potential</li>
                                <li>Get Certified</li>
                            </ul>
                            <p style="font-size:18px;margin-top:14px;">Try Before You Buy</p>
                            <p>
                                If you would like to experience OnDemand before you purchase, send an
                                email to:
                                <a href="mailto:ondemand@productivitypointls.com">ondemand@productivitypointls.com</a>
                                to receive your Course Demo Code
                            </p>
                        </div>
                    </div>       
                </div>    
                
            </div>
        </div>
    </div>        
</asp:Content>



