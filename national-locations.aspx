<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="national-locations.aspx.cs" Inherits="ProductivityPointGlobal.NationalLocations" %>
<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%#string.Format("<link rel=\"canonical\" href=\"{0}://{1}/national-locations.aspx\" />", Request.Url.Scheme, Request.Url.Host) %>
    <style>
       #dropIconMinus{display:none}.accordion-toggle{cursor:pointer}.accordion-content{display:none}.subPage ul{margin:0}.accordion-content{margin-bottom:12px!important}
    </style> 
    <style>
      .city-mainpage-heading{font-size:26px;margin-top:5px}.city-main-page-right-sidebar-div{border-left:1px solid #fd6803;min-height:200px;padding-left:30px;margin-top:27px}.city-main-page-right-sidebar-div>p{text-align:left;font-size:14px;line-height:1.8}.city-main-page-right-sidebar-div>.sidebar-heading{border-bottom:1px solid #fd6803;font-size:18px;font-weight:500;margin-top:20px}.city-main-page-right-sidebar-div>p>ul>li{text-align:left}.catalog-box{height:150px;text-align:left;margin-top:10px;margin-bottom:10px;overflow:hidden}.catalog-inner-box{height:140px;width:300px;margin:5px;padding:.5em 1em .5em;border:1px solid #e5e5e5;border-radius:2px;overflow:hidden}.catalog-inner-box:hover{box-shadow:0 2px 6px 0 rgba(0,0,0,.4)}.catalog-inner-box>.catalog-heading{color:#f67a06;line-height:1.2;margin-bottom:0!important}.catalog-inner-box>.catalog-description{font-size:14px;height:20px;overflow:hidden;line-height:1.29}.city-view{background:url(/images/cities_site_images/Locations_By_State.jpg) #033654 no-repeat center center;background-size:100% 100%;-webkit-background-size:cover;-moz-background-size:cover;-o-background-size:cover;background-size:cover}.section1RowSubpageCityPage{margin-bottom:60px;margin-top:60px;text-align:center}.breadcrumb-box{color:#fff;margin-top:30px;margin-left:10px}.padding0T{padding:0}p{text-align:left;font-size:15px;line-height:1.5}ul>li{font-family:HelveticaNeueLTStd;color:#4c4c4c;font-size:14px;line-height:1.8}.section1RowSubpageCityPage{margin-top:20px}.breadcrumb-link{color:#fff}.breadcrumb-link:hover{opacity:.8;color:#fff!important}.breadcrumb-active-link{color:#fff}.breadcrumb-active-link:hover{color:#fff;opacity:1}
      
    </style> 
    <style>
       #dropIconMinus{display:none}.accordion-toggle{cursor:pointer}.accordion-content{display:none}span.table{padding:8px;line-height:1.42857143;vertical-align:top;border-top:1px solid #ddd;display:block}
    </style> 
    <style>
         @media screen and (max-width: 572px) {
             .city-main-page-right-sidebar-div {
                border-left: unset;
                padding-left: 20px;
            } 
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid city-view subPage">
        <div class="row" style="margin-top:44px;">
             <p class="breadcrumb-box">
                <a style="font-size:11px" class="breadcrumb-link" href="/">Home</a> >
                <a style="font-size:11px"  class="breadcrumb-active-link" >States</a>
            </p>
            <div class="container">
                <div class="row padding0T">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="section1RowSubpageCityPage" style="height:125px">
                            <p>
                                <h1 style="margin-top:100px;"><span style="font-size:39px;line-height:1.4;font-family:sans-serif" class="white fontShadow">North American Training Locations</span><br />
                                <span style="font-size:34px;margin-top:0px;line-height:1.4;font-style:italic;font-family:sans-serif" class="white fontShadow">By State</span></h1>
                            </p>
                            
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 margin20T responsiveCol">
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
                       <div>
                              <p style="font-size:25px;padding-top:20px;" class="city-mainpage-heading text-center subSectionPadding">
                                    Hands-On Learning to Stay Ahead in Your Evolving Industry
                              </p>
                        </div>
                        <p  class="">
                            Enjoy our “Classroom Live” or “Classroom Virtual” delivery locations to provide you with the convenience and flexibility you need. Whether it’s in a classroom or online from one of our private rooms,  Productivity Point has a training location to match your preferences. Our various delivery formats provide you with the convenience you require, so you can focus on gaining real-world, relevant skills in a professional environment.
                        </p>
                        <p>
                            Choose a state below to display the cities within that state, then view the course catalog available for that city.
                        </p>
                        <div id="accordion" style="margin-left:30px;margin-right:20px;margin-top:30px;">
                            <%foreach (var item in NationalLocationData)
                                {
                                    var stateName=item.Key.ToString();
                                    if (stateName.ToLower().StartsWith("live"))
                                    {
                                        break;
                                    }
                                %>
                                    <div class="accordion-toggle">                                    
                                        <span class="table noMargin">
                                            <i id="dropIconPlus" style="color:#FD6803" class="fa fa-plus-circle"></i>
                                            <i id="dropIconMinus" style="color:#FD6803" class="fa fa-minus-circle"></i>  
                                            <a ><%=stateName %>   </a>                      
                                        </span>
                                    </div> 
                                <ul class="accordion-content">
                                    <%
                                        DataTable tempTable = new DataTable();
                                        tempTable = item.ToList().OrderBy(i=>i.ItemArray[2]).CopyToDataTable();
                                        foreach (DataRow row in tempTable.Rows)
                                        {
                                            var closestCity = row["closestCity"].ToString();
                                            var closestState = row["closestState"].ToString();
                                            %>
                                            <li>
                                                 <a href="/city/<%=closestCity.Replace(" ","-").ToLower() %>/state/<%=closestState.Replace(" ","-").ToLower() %>"><%=closestCity %></a>
                                            </li>
                                               
                                       <% } %>
                                   
                                </ul>
                                <%} %>
                                            
                        </div>   
                    </div>

                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="padding-left:0px;">
                        <div class="city-main-page-right-sidebar-div">
                            <p class="sidebar-heading">
                                Classroom Live Training
                            </p>
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
                            <p class="sidebar-heading">Classroom Virtual Training</p>
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
                            <p class="sidebar-heading">Private Group Training</p>
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
                            <p class="sidebar-heading">Live Online Training</p>
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
                            <p class="sidebar-heading">On-Demand Learning</p>
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
