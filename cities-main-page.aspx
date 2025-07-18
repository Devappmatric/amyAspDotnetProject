<%@ Page Title="" Language="C#"  MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="cities-main-page.aspx.cs" Inherits="ProductivityPointGlobal.cities_main_page" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%#string.Format("<link rel=\"canonical\" href=\"{0}://{1}/city/{2}/state/{3}\" />", Request.Url.Scheme, Request.Url.Host,City.Replace(" ","-").ToLower(),State.Replace(" ","-").ToLower()) %>
    <style>
      .city-mainpage-heading{font-size:26px;margin-top:5px}.city-main-page-right-sidebar-div{border-left:1px solid #fd6803;min-height:200px;padding-left:30px;margin-top:27px}.city-main-page-right-sidebar-div>p{text-align:left;font-size:14px;line-height:1.8}.city-main-page-right-sidebar-div>.sidebar-heading{border-bottom:1px solid #fd6803;font-size:18px;font-weight:500;margin-top:20px}.city-main-page-right-sidebar-div>p>ul>li{text-align:left}.catalog-box{height:155px;text-align:left;margin-top:10px;margin-bottom:10px;overflow:hidden}.catalog-inner-box{height:149px;width:300px;margin:5px;padding:.5em 1em .5em;border:1px solid #e5e5e5;border-radius:2px;overflow:hidden}.catalog-inner-box:hover{box-shadow:0 2px 6px 0 rgba(0,0,0,.4)}.catalog-inner-box>.catalog-heading{color:#f67a06;line-height:1.2;margin-bottom:0!important}.catalog-inner-box>.catalog-description{font-size:14px;height:20px;overflow:hidden;line-height:1.29}.city-view{background:url(/images/City_State_Training_Catalog.jpg) #033654 no-repeat center center;background-size:100% 100%;-webkit-background-size:cover;-moz-background-size:cover;-o-background-size:cover;background-size:cover}p{text-align:left;font-size:15px;line-height:1.5}ul>li{font-family:HelveticaNeueLTStd;color:#4c4c4c;font-size:14px;line-height:1.8}.breadcrumb-box{color:#fff;margin-top:30px;margin-left:10px;margin-bottom:0}.padding0T{padding:0}.section1RowSubpageCityPage{margin-bottom:120px;margin-top:10px;text-align:center}.breadcrumb-link{color:#fff}.breadcrumb-link:hover{opacity:.8;color:#fff!important}.breadcrumb-active-link{color:#fff}.breadcrumb-active-link:hover{color:#fff;opacity:1}
    </style>   
    <style>
        .city-main-page-heading{
            font-size:39px;
        }
        @media screen and (max-width: 572px) {
             .city-main-page-right-sidebar-div {
                border-left: unset;
                padding-left: 0px;
            } 
             .mobile-padding-heading-top{
                 padding-top:108px;
             }
             .city-main-page-heading{
                font-size:26px;
            }

            .section1RowSubpageCityPage{
                padding-top:25px;
            }
        }

         @media screen and (min-width: 572px){
            .section1RowSubpageCityPage{
                padding-top:40px;
            }
        }

        
        @media screen and (min-width: 900px){
            .section1RowSubpageCityPage{
                padding-top:80px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid city-view subPage">
        <div class="row" style="margin-top:44px;">
             <p  class="breadcrumb-box hidden-sm hidden-xs">
                                <a style="font-size:11px" class="breadcrumb-link" href="/">Home</a> >
                                <a style="font-size:11px"  class="breadcrumb-link"  href="/city-courses.aspx">Cities</a> >
                                <a style="font-size:11px"  class="breadcrumb-active-link"><%=ClosestCity %>, <%=ClosestState %></a>
                            </p>
            <div class="container">
                <div class="row padding0T">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="section1RowSubpageCityPage" style="height:175px">
                           
                            <p>
                                <h1 style="margin-top:0px;line-height:1.4" class="white fontShadow mobile-padding-heading-top city-main-page-heading">
                                   <span>IT and Professional Development</span><br />
                                    <span>Training and Certifications – <%=ClosestCity %>, <%=ClosestState %></span>

                                </h1>                             
                            </p>
                            
                        </div>
                    </div>
                   
                </div>
            </div>
        </div>
    </div>    
    
    <%--<uc:Search ID="ucSearch" runat="server" />--%>

    <div class="container-fluid bgWhite padding75B">
        <div class="row">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12">
                        <div>
                              <h2 style="font-size:25px;padding-top:20px;font-family: HelveticaNeueLTStd;" class="city-mainpage-heading text-center subSectionPadding">
                                    IT & Professional Development Training in <%=ClosestCity %>, <%=ClosestState %>
                              </h2>
                        </div>

                        <p  class="">
                            Find IT & Professional training conveniently located in <%=ClosestCity %>, <%=ClosestState %>. Productivity Point provides a variety of
                            training options in <%=ClosestCity %> and surrounding areas of <%=StateFullName %>. Our technical training, desktop applications and
                            professional development skills courses are also available for onsite delivery at your company offices in the
                            <%=ClosestCity %> area, and are also offered virtually (live online).
                        </p>
                        <h3>
                            Select a Training Catalog below to view the course options in <%=ClosestCity %>, <%=ClosestState %>.
                        </h3>
                      <div>
                          <div class="row">
                              <asp:Repeater id="AvailableCourses" runat="server">
                               <ItemTemplate>
                                   <div class="col-md-6 catalog-box">
                                      <div class="catalog-inner-box">
                                          <a href="/city/<%=ClosestCity.ToString().Replace(" ","-").ToLower() %>/state/<%=ClosestState.ToString().Replace(" ","-").ToLower() %>/<%# Eval("courseName").ToString().ToLower().Replace(" ","-")%>">
                                              <p class="catalog-heading" style="margin-bottom:0px;"><span style="font-size:18px;font-weight:500;color:#FD6803" > <%# Eval("courseName") %></span> </p>
                                              <p style="font-size:14px;line-height:1.5;" class="catalog-description">
                                                  <%# Eval("catalogShortDescription") %>
                                              </p>
                                          </a>
                                      </div>
                                  </div>
                            </ItemTemplate>
                            </asp:Repeater>
                          </div>
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
<%--                    <uc:Partners runat="server" />--%>
                    
                </div>                    
            </div>
        </div>
    </div>        
</asp:Content>

