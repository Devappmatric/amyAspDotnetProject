<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="event-hosting.aspx.cs" Inherits="ProductivityPointGlobal.EventHosting" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%#string.Format("<link rel=\"canonical\" href=\"{0}://{1}/event-hosting.aspx\" />", Request.Url.Scheme, Request.Url.Host) %>
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
                                                       <h1 class="white fontShadow">Expert Event Hosting in<br/> 120 locations nationwide</h1>
                            <%--<h1 class="white fontShadow">Expert Event Hosting in<br/> Miami &amp; Fort Lauderdale, Florida</h1>--%>
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
                        <div>
                            <h2 class="sectionHeadingSubPage text-left subSectionPadding">Add a Touch of Class to your Next Event</h2>   
                            <div class="paddingRightImageContainer">
                                <img src="/images/event_hosting1.jpg" alt="Public Classroom Training" />
                            </div>
                            <p>Productivity Point Learning Solutions manages your corporate training events, conferences and meetings with expertise. With years of experience and feedback from our clients, we have perfected event management.
                            <br/><br/>
                            We understand that you want to focus on executing a seamless, memorable event. Our passion and expertise allows us to take the event planning burden off of your shoulders so you can concentrate on delivering excellence through your conference, meeting or training session. Maximize the impact of your event with the assistance of Productivity Point Learning Solutions.
                            <br/><br/>
                            Take the hassle out of logistical planning. We have all the necessary support systems in place to ensure your event runs smoothly.</p>
                            <div class="clearfix"></div>
                        </div>
                                                
                        <p class="sectionHeadingSubPage text-left subSectionPadding">Convenience</p>
                        <p>We have two high-end, centrally located corporate training centers near the Miami International Airport and the Fort Lauderdale-Hollywood International Airport. Enjoy complimentary parking for all of your guests. Support services available include a dedicated logistics coordinator, administrative assistance, telecommunications services and on-site technical setup. Our venues are fully equipped for either large or small corporate training sessions, with lounge and dining areas, professional computer labs, virtual labs, Pearson-Vue Testing Center, large white boards and projectors. Our locations also offer customized catering services with high quality catered breakfast, lunch or dinner, snacks, chilled water and beverages.</p>
                        
                        <p class="sectionHeadingSubPage text-left subSectionPadding">Expertise</p>
                        <p>The Productivity Point Learning Solutions team of event hosting professionals possess a passion for ensuring your high degree of customer satisfaction. We have run thousands of training sessions for clients across the globe, so rest assure every little detail has been thoroughly thought through. We offer everything from event planning to administrative services and technical support, to ensure that your event runs smoothly.</p>
                        
                        <p class="sectionHeadingSubPage text-left subSectionPadding">Comfort</p>
                        <p>Our event locations are beautiful and we take into consideration your every comfort, from cushy seating to a magnificent atrium space designed to engage and inspire.</p>
                        
                        <p class="sectionHeadingSubPage text-left subSectionPadding">Credibility</p>
                        <p>Productivity Point Learning Solutions partners with leading providers of Desktop Applications, Technology, and Professional Development. We are a Microsoft Certified Learning Partner, PMI® Registered Education Provider (REP), Endorsed Education Provider (EEP™) of the International Institute of Business Analysts (IIBA®), Red Hat Education Partner and VMware Professional Solution Provider.</p>
                        
                        <h2 class="sectionHeadingSubPage text-left subSectionPadding">2 Florida and 120 National Locations</h2>
                        <p>Train in style at our two premiere locations in Miami and Fort Lauderdale/Sunrise, Florida. If you’re not in Florida we have 120 other National locations. Contact us at <a href="tel:1-844-238-8607">1-844-238-8607</a> to learn more.</p>
                        
                        <p class="sectionHeadingSubPage text-left subSectionPadding">Have a Question? Get in Touch and We Guarantee that We’ll Get Back to You</p>
                        <p>Contact a training center specialist at <a href="tel:1-844-238-8607">1-844-238-8607</a> to get answers to any questions you have about corporate training and event hosting services today.</p>
                    </div>

                    <uc:Partners runat="server" />
                    
                </div>                    
            </div>
        </div>
    </div>	                      
</asp:Content>