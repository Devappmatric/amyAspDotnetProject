<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/default.master" CodeBehind="professional-development.aspx.cs" Inherits="ProductivityPointGlobal.professional_development" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <%#string.Format("<link rel=\"canonical\" href=\"{0}://{1}/professional-development.aspx\" />", Request.Url.Scheme, Request.Url.Host) %>
<style>
   ul.course-list li{padding:8px;line-height:1.42857143;vertical-align:top;border-top:1px solid #ddd}.city-view{background:url('<%# ImagePath %>') #033654 no-repeat center center;background-size:100% 100%;-webkit-background-size:cover;-moz-background-size:cover;-o-background-size:cover;background-size:cover}.breadcrumb-box{color:#fff;margin-top:30px;margin-left:10px;margin-bottom:0}.padding0T{padding:0}.section1RowSubpageCityPage{margin-bottom:120px;margin-top:10px;text-align:center}.breadcrumb-link{color:#fff}.breadcrumb-link:hover{opacity:.8;color:#fff!important}.breadcrumb-active-link{color:#fff}.breadcrumb-active-link:hover{color:#fff;opacity:1}.training-delivery-method-box{background-color:#fff;padding-top:34px;padding-bottom:34px;margin-top:20px;margin-left:120px;margin-right:120px;}.training-delivery-method-box>.training-delivery-heading{text-align:center}.training-delivery-heading{font-size:28px;font-weight:500}.training-delivery-method-box>.training-delivery-content>p{font-size:24px;padding-bottom:20px}.training-delivery-method-box>.training-delivery-heading>h2{text-align:center}.training-delivery-image-box{text-align:center;font-size:24px;font-weight:600}.training-delivery-image-box>img{height:100px;margin-bottom:20px}.training-delivery-image-box>p{text-align:center}.delivery-methods-image>img{height:80px}.delivery-methods-header>h1{margin-top:34px}.delivery-method-description{font-size:16px}.delivery-method-box{margin-top:0}div{color:#4c4c4c;font-size:16px}.training-delivery-image-box>img:hover{transform:scaleX(1.2) scaleY(1.2)}
</style>
    <style>
    #exTab4 .nav-pills>li>a{border-radius:4px 4px 0 0;height:162px}#exTab4 .nav-pills>li{width:20%;margin-left:0}#exTab4 .nav-pills>li.active>a,.nav-pills>li.active>a:focus,.nav-pills>li.active>a:hover{color:#fff;background-color:#fff;border-bottom:2px solid #fd6803}#exTab3{padding:20px}#exTab3 .nav-pills>li>a{border-radius:4px 4px 0 0}#exTab3 .nav-pills>li{width:25%;margin-left:0}#exTab3 .tab-content{color:#fff;background-color:#fff;padding:5px 15px}.tab-image{height:80px}.nav-pills>li.active>a,.nav-pills>li.active>a:focus,.nav-pills>li.active>a:hover{color:#fff;background-color:#fff;border-bottom:2px solid #fd6803}.tab-image-inside{height:100px}.nav-pills>li{width:24%}.section1RowSubpageCityPage{margin-top:50px;margin-bottom:50px}.catalog-link-style{font-size:18px;padding:2px}.tab-inner-div{padding-left:20px;padding-right:40px;text-align:left}.tab-content>.tab-pane{margin-left:60px;padding-right:100px}.delivery-methods-header>.training-delivery-heading{margin-bottom:15px}ul{line-height:1.8}
    </style>
     <style>
       #exTab4 .nav-pills>li.active>a,.nav-pills>li.active>a:focus,.nav-pills>li.active>a:hover{background-color:#eee !important}.nav-pills>li.active>a,.nav-pills>li.active>a:focus,.nav-pills>li.active>a:hover{background-color:#eee}.mobile-tab-image{background-color:#fd6803;border:1px solid #fd6803}#exTab3{margin-left:120px;margin-right:120px}.left-padding-topics{padding-left:100px}.left-padding-topics-description{padding-left:0;padding-right:0}@media screen and (max-width:768px){#exTab4 .nav-pills>li>a{height:30px;width:30px;padding:10px;border-radius:150px}#exTab4 .nav-pills>li{padding:10px}#exTab3{margin-left:20px;margin-right:20px}#exTab3 .nav-pills>li>a{height:30px;width:30px;padding:10px;border-radius:150px}#exTab3 .nav-pills>li{padding:10px}.training-delivery-method-box{margin-left:10px;margin-right:10px}.tab-content>.tab-pane{margin-left:10px;padding-right:10px}.custom-right-sidebar-div{border-left:unset;padding-left:0}.left-padding-topics{padding-left:20px}.left-padding-topics-description{padding-left:20px;padding-right:20px}.mobile-padding-heading-top{padding-top:50px}}
        #exTab4 .nav-pills>li>a:hover{background-color:white;border-bottom: 2px solid #fd6803;}
         #exTab3 .nav-pills>li>a:hover{background-color:white;border-bottom: 2px solid #fd6803;}
         .catalog-main-page-heading{
             font-size:45px;
         }
         .catalog-main-page-sub-heading{
             font-size:36px;
         }
         .right-padding-topics{
             padding-right:100px;
         }
         h3{
             font-family:HelveticaNeueLTStd;
         }
         @media screen and (max-width: 572px)  {
             .catalog-main-page-heading{
                 font-size:40px;
             }
             .catalog-main-page-sub-heading{
                 font-size:30px;
             }

             .section1RowSubpageCityPage{
                 margin-top:100px;
                 font-family:sans-serif !important;
                 font-weight:300 !important;
             }

             .catalog-main-page-heading{
                  font-family:sans-serif !important;
                  font-weight:300 !important;
              }

              .catalog-main-page-sub-heading{
                  font-family:sans-serif !important;
                  font-weight:300 !important;
              }
        }

        @media (min-width: 700px){
            h1 {
                padding-top:60px;
            }
        }

                                                                                                                                                                                                                                                                                                                                                                                                                                                      </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container-fluid city-view subPage">
        <div class="row" style="margin-top:44px;">
             <p  class="breadcrumb-box hidden-xs">
                <a style="font-size:11px" class="breadcrumb-link" href="/">Home</a> >
                <a style="font-size:11px"  class="breadcrumb-active-link">Professional Development</a>
            </p>
            <div class="container">
                <div class="row padding0T">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="section1RowSubpageCityPage" style="height:175px">
                            <p>
                                <h1 class="white fontShadow mobile-padding-heading-top">
                                    <span class="catalog-main-page-heading" style="margin-top:0px;line-height:1.4">Leadership & Professional Development Training</span><br />
<%--                                    <span class="catalog-main-page-sub-heading" style="margin-top:0px;line-height:1.4">Training Course Catalog</span>--%>
                                </h1>                             
                            </p> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>   

     <div class="container-fluid bgWhite padding75B">
         <div class="row">
             <div class="container">
                 <div class="row">
                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                          <div>
                              <h2 style="font-size:25px;padding-top:25px;line-height:1.4;padding-bottom: 10px;margin-top:0px;" class="city-mainpage-heading text-center subSectionPadding">
                                   Build your professional development skills and expertise with  <br /> Productivity Point certified and industry-leading training courses
                              </h2>
                        </div>
                         <div class="row left-padding-topics right-padding-topics"  >
                             <div class="col-md-12">
                                 <p style="font-size:18px;">
                                    Productivity Point Learning Solutions provides professional development training and certification 
                                     programs designed to grow your skills and validate your ability to leverage the opportunities you
                                     set your sights on. Attend our professional development courses in a traditional live classroom,
                                     live online training setting or one of our Official On-Demand options, to learn on your own schedule,
                                     at your own pace, and in your own place.

                                 </p>
                                 
                             </div>
                         </div>
   
                         <div style="text-align: center; margin-top:40px;" >
                             <h2  style="padding-top:20px;padding-bottom: 10px;" class="city-mainpage-heading training-delivery-heading text-center subSectionPadding">
                                 Leadership & Professional Development Training Topics
                             </h2>
                         </div>
                        <div class="row left-padding-topics" style="margin-top:18px;">
                             <%
                                 var topicCount = Topics.Rows.Count;
                                 var firstRowTopic =(int) Math.Ceiling(((decimal)topicCount / 3));
                                 var secondRowTopic =2*firstRowTopic;
                                 %>
                             <div class="col-md-4">
                                 <%for (int i = 0; i < firstRowTopic; i++){
                                         var dataRow=Topics.Rows[i];
                                         var catalogTopics = dataRow["catalogTopic"].ToString();
                                         %>
                                    <div class="col-md-12 catalog-link-style">
                                      <a href="/topic/<%=catalogTopics.ToString().Replace(" ","-").ToLower() %>/professional-development-skills"><%=catalogTopics %></a>
                                 </div>
                                 <%} %>
                                 
                             </div>
                             <div class="col-md-4">
                                 <%for (int i = firstRowTopic; i < secondRowTopic; i++){
                                         var dataRow=Topics.Rows[i];
                                         var catalogTopics = dataRow["catalogTopic"].ToString();
                                         %>
                                    <div class="col-md-12 catalog-link-style">
                                      <a href="/topic/<%=catalogTopics.ToString().Replace(" ","-").ToLower() %>/professional-development-skills"><%=catalogTopics %></a>
                                 </div>
                                 <%} %>
                             </div>
                             <div class="col-md-4">
                                <%for (int i = secondRowTopic; i < topicCount; i++){
                                         var dataRow=Topics.Rows[i];
                                         var catalogTopics = dataRow["catalogTopic"].ToString();
                                         %>
                                    <div class="col-md-12 catalog-link-style">
                                      <a href="/topic/<%=catalogTopics.ToString().Replace(" ","-").ToLower() %>/professional-development-skills"><%=catalogTopics %></a>
                                 </div>
                                 <%} %>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
        </div>

         <div class="row" style="margin-top:40px;margin-bottom:30px;">
             <div class="col-md-12">
                 
                <div id="exTab3"  >	
                     <h2 style="text-align:center;margin-bottom:22px;" class="training-delivery-heading">
                        Value-Added Training Benefits
                    </h2>
                    <div style="text-align:center">
                        <ul  class="nav nav-pills">
                        <li class="active" style="margin-left:0px;">
                            <a class="hidden-sm hidden-xs"  href="#1b" data-toggle="tab">
                                <img class="tab-image" src="/images/courses_site_images/team.png" />
                                <p style="font-size:20px;margin-top:6px;">After-Class<br />Instructor Support</p>
                            </a>
                            <a class="hidden-md hidden-lg mobile-tab-image"  href="#1b" data-toggle="tab">

                                </a>
			            </li>
			            <li>
                            <a class="hidden-sm hidden-xs" href="#2b" data-toggle="tab">
                                 <img class="tab-image"  src="/images/courses_site_images/Customer_Service.PNG.png" />
                                <p style="font-size:20px;margin-top:6px;">Personalized Account<br />Management</p>
			                </a>
                            <a class="hidden-md hidden-lg mobile-tab-image"  href="#2b" data-toggle="tab">

                                </a>
			            </li>
			            <li>
                            <a class="hidden-sm hidden-xs" href="#3b" data-toggle="tab">
                                <img class="tab-image"  src="/images/courses_site_images/video_camera_icon.png" />
                                <p style="font-size:20px;margin-top:6px;">Class <br /> Recordings</p>
			                </a>
                            <a class="hidden-md hidden-lg mobile-tab-image"  href="#3b" data-toggle="tab">

                                </a>
			            </li>
  		                <li>
                          <a class="hidden-sm hidden-xs" href="#4b" data-toggle="tab">
                              <img class="tab-image" src="/images/courses_site_images/thumb_up_gesture_icon.png" />
                                <p style="font-size:20px;margin-top:6px;">Our 100% <br />Satisfaction Guarantee</p>
                          </a>
                              <a class="hidden-md hidden-lg mobile-tab-image"  href="#4b" data-toggle="tab">

                                </a>
			            </li>
                      	                    
		            </ul>
                    </div>
 
                </div>
                 <div style="margin-left:60px;margin-top:20px;" class="tab-content clearfix">
			            <div class="tab-pane active" id="1b">
                            <div class="row">
                                <div class="col-md-1">
                                    <img class="tab-image-inside" src="/images/courses_site_images/team.png" />
                                </div>
                                <div class="col-md-11 tab-inner-div">
                                     <h3 style="font-size:20px;padding-left:18px">After-Class Instructor Support</h3>
                                    <p style="padding-left:25px;">Get the security you need after class is finished.
                                    Productivity Point provides follow-up telephone and 
                                    email support on subjects covered during class for all technical 
                                    applications taught.  Just send a detailed email pertaining to your question 
                                    or issue to instructor@productivitypointls.com.  This service is available for 
                                    a period of one year from your class date.</p>
                                </div>
                            </div>
				        </div>
				        <div class="tab-pane" id="2b">
                             <div class="row">
                                <div class="col-md-1">
                                    <img class="tab-image-inside"  src="/images/courses_site_images/Customer_Service.PNG.png" />
                                </div>
                                <div class="col-md-11 tab-inner-div">
                                     <h3 style="font-size:20px;padding-left:18px">Personalized Account Management </h3>
                                   <p style="padding-left:25px;">Your very own Account Manager to ensure your learning experience goes smoothly.
                                    Productivity Point’s experienced account management team helps with training
                                    administration and class registration.  Plus, we offer comprehensive reporting 
                                    and centralized billing.</p>

                                </div>
                            </div>
				        </div>
                        <div class="tab-pane" id="3b">
                             <div class="row">
                                <div class="col-md-1">
                                     <img class="tab-image-inside"  src="/images/courses_site_images/video_camera_icon.png" />
                                </div>
                                <div  class="col-md-11 tab-inner-div">
                                     <h3 style="font-size:20px;padding-left:18px;">Class Recordings </h3>
                                   <p style="padding-left:25px;">All publicly scheduled Virtual Classroom Live courses delivered
                                    by Productivity Point are recorded. The recording includes any
                                    student questions or comments.  This allows the flexibility to
                                    review material after class, or step away as needed and revisit
                                    missed information later.  </p>
                                </div>
                            </div>
				        </div>
                        <div class="tab-pane" id="4b">
                             <div class="row">
                                    <div class="col-md-1">
                                        <img class="tab-image-inside" src="/images/courses_site_images/thumb_up_gesture_icon.png" />
                                    </div>
                                    <div class="col-md-11 tab-inner-div">
                                         <h3 style="font-size:20px;padding-left:18px;">Our 100% Satisfaction Guarantee </h3>
                                       <p style="padding-left:25px;">Productivity Point sets the bar high to meet your expectations. 
                                        We offer the best possible training experience for our class attendees. 
                                        If, upon completion of the first day of your class, you are not satisfied
                                        and wish to withdraw for this reason, contact your Account Manager immediately.
                                        This guarantee will only apply if
                                        you complete the first full day of class and have signed the class roster. 
                                        This may not apply to partner-delivered courses.</p>

                                    </div>
                                </div>
				        </div>
			        </div>
             </div>  
         </div>
          <div class="row">
            <div class="col-md-12">
                <div class="training-delivery-method-box">
                    <h2 style="text-align:center" class="training-delivery-heading">
                        Professional Development Training Delivery Methods
                    </h2>
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
                                                <h3 style="padding-left:0px;font-size:20px;" class="training-delivery-heading">Classroom Live Training</h3>
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
                                                <h3 style="padding-left:0px;font-size:20px;" class="training-delivery-heading">Classroom Virtual Training</h3>
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
                                                <h3 style="padding-left:0px;font-size:20px;" class="training-delivery-heading">Live Online Training</h3>
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
                                                <h3 style="padding-left:0px;font-size:20px;" class="training-delivery-heading">Private Group Training</h3>
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
                                                <h3 style="padding-left:0px;font-size:20px;" class="training-delivery-heading">On-Demand Learning</h3>
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

