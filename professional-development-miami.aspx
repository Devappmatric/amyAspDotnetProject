<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="professional-development-miami.aspx.cs" Inherits="ProductivityPointGlobal.ProfessionalDevelopmentMiami" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow">Professional Development Courses in Miami, FL</h1>
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
                            <p class="sectionHeadingSubPage text-left subSectionPadding">Take your career and earning-power to the next level with Skills in Business Analysis, Leadership, Project Management and More</p>
                            <div class="paddingRightImageContainer">
                                <img src="/images/professional_development1.jpg" alt="Public Classroom Training" />
                            </div>
                            <p>Enhance your professional credentials and stay up-to-date with your current certifications. Productivity Point Learning Solutions offers courses for everyone from an Administrative Assistant to HR and IT Professionals.
                                <br/><br/>
                                You’ll train in a lavish corporate environment and get the skills training you need in a matter of days. Then, return to workplace armed with new knowledge, ready for success!
                            </p>
                            <div class="clearfix"></div>
                        </div>
                                                                    
                        <p class="sectionHeadingSubPage text-left subSectionPadding">We offer a wide variety of Professional Development Courses, including:</p>
                                                
                        <ul>                            
                            <li><p class="bold"><a href="/Training/Business-Analysis/Miami-FL">Business Analysis</a></p></li>
                            <li><p class="bold"><a href="/Training/Business-Writing-&amp;-Business-English/Miami-FL">Business Writing & Business English</a></p></li>
                            <li><p class="bold"><a href="/Training/Communication-Skills/Miami-FL">Communication Skills</a></p></li>
                            <li><p class="bold"><a href="/Training/Conflict-&amp;-Stress-Management/Miami-FL">Conflict & Stress Management</a></p></li>
                            <li><p class="bold"><a href="/Training/Customer-Service-Skills/Miami-FL">Customer Service</a></p></li>
                            <li><p class="bold"><a href="/Training/Employee-Professional-Development/Miami-FL">Employee Professional Development</a></p></li>
                            <li><p class="bold"><a href="/Training/Finance-&amp;-Accounting/Miami-FL">Finance & Accounting</a></p></li>
                            <li><p class="bold"><a href="/Training/Human-Resources/Miami-FL">Human Resources</a></p></li>
                            <li><p class="bold"><a href="/Training/Management-&amp;-Leadership/Miami-FL">Management & Leadership</a></p></li>                            
                            <li><p class="bold"><a href="/Training/Presentation-Skills/Miami-FL">Presentation Skills</a></p></li>
                            <li><p class="bold"><a href="/Training/Project-Management/Miami-FL">Project Management</a></p></li>
                            <li><p class="bold"><a href="/Training/Sales-&amp;-Negotiation-Skills/Miami-FL">Sales & Negotiation Skills</a></p></li>
                            <li><p class="bold"><a href="/Training/Team-Building/Miami-FL">Team Building</a></p></li>
                            <li><p class="bold"><a href="/Training/Time-Management-&amp;-Meetings/Miami-FL">Time Management & Meetings</a></p></li>
                        </ul>
                        <p class="sectionHeadingSubPage text-left subSectionPadding">Have a Question? Get in Touch and We Guarantee that We’ll Get Back to You</p>   
                        <p>Contact a training center specialist at <a href="tel:1-844-238-8607">1-844-238-8607</a> to get answers to any questions you have about corporate training and event hosting services today.</p>
                    </div>

                    <uc:Partners runat="server" />
                    
                </div>                    
            </div>
        </div>
    </div>	     
</asp:Content>
