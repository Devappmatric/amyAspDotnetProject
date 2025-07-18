<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="delivery-methods.aspx.cs" Inherits="ProductivityPointGlobal.DeliveryMethods" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%#string.Format("<link rel=\"canonical\" href=\"{0}://{1}/delivery-methods.aspx\" />", Request.Url.Scheme, Request.Url.Host) %>
     <style>
         @media screen and (max-width: 572px) {
             .padding200T {
                padding-top:200px !important;
                font-family:sans-serif !important;
                font-weight:300 !important;
            } 

              h1{
                   font-family:sans-serif !important;
                font-weight:300 !important;
             }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow">Productivity Point Learning Solutions Delivery Methods</h1>
                            <%--<h2 class="white fontShadow">Productivity Point can accelerate your learning by providing quality curriculum, instructors and resources at just the right time. We can create custom learning paths for you—or a group of learners—that include Pre and Post Assessments, Instructor Consults, Prep-tests, Certifications, and Customized Curriculum.</h2>--%>
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
                        <p  class="subSectionPadding font18">Productivity Point can accelerate your learning by providing quality curriculum, instructors and resources at just the right time. We can create custom learning paths for you—or a group of learners—that include Pre and Post Assessments, Instructor Consults, Prep-tests, Certifications, and Customized Curriculum.</p>
                        <p class="sectionHeadingSubPage text-left subSectionPadding">Public Classroom Training</p>   
                        <div>
                            <div class="paddingRightImageContainer">
                                <img src="/images/delivery_methods1.jpg" alt="PPLS Delivery Methods" />
                            </div>                                                
                            <p>Our comprehensive solutions include instructor-led training for Technical Courses, popular Desktop Applications and Professional Development Skills. 
                                Our extensive catalog of courses has something for everyone, from basic users of business applications to IT professionals. Productivity Point also develops courses and tailors 
                                training to your specific needs.
                            <br/><br/>
                            Learners get hands-on learning experience with live lab exercises taught by experienced instructors. In fact, all of Productivity Point's instructors must pass our 
                                rigorous Instructor Certification course(s). We proudly advocate our learning services to be hosted by the best-qualified trainers in terms of technical 
                                knowledge and teaching skills.</p>
                            <div class="clearfix"></div>
                        </div>                        
                        
                        <p class="sectionHeadingSubPage text-left subSectionPadding">Private Group or Individual Classroom Training</p>   
                        <p>Your private group classroom experience will not only take place in the location of your choice (including 
                            any of our training centers), but you will enjoy the following amenities to ensure the quality of your 
                            classroom learning experience exceeds your expectations.</p>
                        <ul>
                            <li><p>Pre-Assessments to determine the precise levels of your learners</p></li>
                            <li><p>Instructor Consult to get to know your instructor and convey your customized requirements</p></li>
                            <li><p>Course Curriculum tailored to your specifications and displaying your organization's branding</p></li>
                            <li><p>On-Line course evaluations provided for your review</p></li>
                            <li><p>Post-Assessments to ensure your learners have fully comprehended</p></li>
                        </ul>
                        
                        <p class="sectionHeadingSubPage text-left subSectionPadding">Live Virtual Training</p> 
                        <p>Virtual Training is changing the training industry. Blending the best from traditional face-to-face 
                            instructor-led training with the latest in conferencing technology, Virtual Training allows Productivity Point to 
                            deliver live training to multiple locations at one time. Our Clients many times prefer this format, 
                            as Virtual Training offers them 100% live, instructor led training in a classroom setting without 
                            excess travel. In addition, because we are able to combine enrollments from multiple locations 
                            in the same class, we've been able to dramatically reduce our class cancellation rate.</p>
                        
                        <p class="sectionHeadingSubPage text-left subSectionPadding">Self-Paced Training</p> 
                        <p>We have an extensive e-Learning offering, with over 1,300 courses available, which includes Productivity Point's 
                            Office Productivity Library, Computer Professional Library, and Business & Management Skills Library. 
                            Contact us for more information at advisor@productivitypoint.com.</p>
                        <ol>
                            <li><p>Self-Paced, Self-Study: Anytime learning delivered right to your desktop.</p></li>
                            <li><p>Instructor-Assisted: Web-based learning with instructor-monitored online classrooms.</p></li>
                        </ol>
                    </div>

                    <uc:Partners runat="server" />
                    
                </div>                    
            </div>
        </div>
    </div>
</asp:Content>



