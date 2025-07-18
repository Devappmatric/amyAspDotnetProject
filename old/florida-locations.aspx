<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="florida-locations.aspx.cs" Inherits="ProductivityPointGlobal.FloridaLocations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow">Florida Locations</h1>
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
                        <p class="sectionHeadingSubPage text-left subSectionPadding">Certified Corporate Training in the Heart of Miami & Fort Lauderdale</p>                                                                        
                        <p>Join Productivity Point Learning Solutions for hands-on, instructor led professional courses. Train with experts and learn amongst other professionals – fast. Each course takes between 1-5 days (individual or group training) so you can get back to growing your business.</p>
                                                
                        <div class="row subSectionPadding">                            
                            <div class="col-md-6 col-md-push-6">
                                <p class="sectionHeadingSubPage text-left">Miami</p>
                                <p>Located 15 minutes from Miami International Airport and situated close to restaurants and hotels, this location is both high end and convenient. This Training Center is equipped with large and more intimate presentation rooms, and an expansive atrium dining area featuring a magnificent fountain with natural lighting and live plants. It is an ideal space for an upscale conference, training or meeting space.</p>                                
                            </div>
                            <div class="col-md-6 col-md-pull-6"><img src="/images/miami.jpg" class="img-responsive paddingRightImageContainer" alt="Miami"/></div>
                        </div>
                        
                        <div class="row subSectionPadding">
                            <div class="col-lg-4 padding10B"><a class="btn btn-block btn-success" href="/technical-courses-miami.aspx">Technical Courses</a></div>
                            <div class="col-lg-4 padding10B"><a class="btn btn-block btn-success" href="/desktop-applications-miami.aspx">Desktop Applications</a></div>
                            <div class="col-lg-4 padding10B"><a class="btn btn-block btn-success" href="/professional-development-miami.aspx">Professional Development</a></div>
                        </div>

                        <div class="row subSectionPadding">
                            <div class="col-md-6 col-md-push-6">
                                <p class="sectionHeadingSubPage text-left">Fort Lauderdale</p>
                                <p>Our Fort Lauderdale location, located in the suburb of Sunrise, is situated in a professional corporate office, minutes away from the Fort Lauderdale-Hollywood International Airport. The Fort Lauderdale location provides an intimate setting, while fully equipped with the latest technology and presentation equipment. It is also convenient, just a short ride away from the famous Sawgrass Shopping Mall, hotels and restaurants.</p>
                            </div>
                            <div class="col-md-6 col-md-pull-6"><img src="/images/florida_locations1.jpg" class="img-responsive paddingRightImageContainer" alt="Fort Lauderdale"/></div>
                        </div>
                        
                        <div class="row subSectionPadding">
                            <div class="col-lg-4 padding10B"><a class="btn btn-block btn-success" href="/technical-courses-fort-lauderdale.aspx">Technical Courses</a></div>
                            <div class="col-lg-4 padding10B"><a class="btn btn-block btn-success" href="/desktop-applications-fort-lauderdale.aspx">Desktop Applications</a></div>
                            <div class="col-lg-4 padding10B"><a class="btn btn-block btn-success" href="/professional-development-fort-lauderdale.aspx">Professional Development</a></div>
                        </div>

                        <p class="sectionHeadingSubPage text-left subSectionPadding">Features</p>
                        <p>Our two locations in Miami and Fort Lauderdale/Sunrise are beautiful corporate spaces. Catered training sessions and complimentary parking create an upscale conference center atmosphere. Both locations are equipped with large and more intimate presentation spaces, break-out rooms, plush seating and a dining area. Enjoy high end computers, hi-speed internet, and projection units. These venues are conveniently located on major transit routes, close to restaurants, hotels and airports. </p>

                        <p class="sectionHeadingSubPage text-left subSectionPadding">Delivery Methods</p>
                        <p>Productivity Point Learning Solutions can accelerate your learning by providing quality curriculum, instructors and resources at just the right time. We deliver live instructor-led training to a wide geographical area enabling our clients to experience unsurpassed training solutions nationally. Our formats of delivery are public “Instructor-on-premises” classroom training, private group or individual classroom training, live virtual training, or self-paced training.</p>

                        <a href="event-hosting.aspx"><p class="sectionHeadingSubPage text-left subSectionPadding">Event Hosting</p></a>
                        <p>Enjoy a high-end educational environment and let Productivity Point support your corporate training sessions, meetings, conferences and computer labs with the highest standard of customer service and the latest technology available. In the case of event hosting, Productivity Point Learning Solutions provides accessible resources to ensure your event is a success. Enjoy software setup, on-site IT and administrative support, a dedicated events manager and breakfast, snacks and dining options in our upscale dining areas. You focus on your business success while Productivity Point Learning Solutions handles all your corporate training logistics. <a href="event-hosting.aspx">Click here to learn more.</a></p>

                        <p class="sectionHeadingSubPage text-left subSectionPadding">Have a Question? Get in Touch and We Guarantee that We’ll Get Back to You</p>
                        <p>Contact a training center specialist at <a  href="tel:1-844-238-8607">1-844-238-8607</a> to get answers to any questions you have about corporate training and event hosting services today.</p>

                        <p class="sectionHeadingSubPage text-left subSectionPadding">Looking for Courses Offered Outside of Florida? Learn More about our National Classrooms. <a href="/national-locations.aspx">Click here for more information.</a></p>
                    </div>

                    <uc:Partners runat="server" />
                    
                </div>                    
            </div>
        </div>
    </div>    
</asp:Content>
