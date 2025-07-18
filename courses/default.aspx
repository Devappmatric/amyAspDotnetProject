<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" CodeBehind="default.aspx.cs" Inherits="ProductivityPointGlobal.courses.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%#string.Format("<link rel=\"canonical\" href=\"{0}://{1}/courses/\" />", Request.Url.Scheme, Request.Url.Host) %>
    <style>
         .view {
            background: url('<%# ImagePath %>') #033654 no-repeat center center;
            background-size: 100% 100%;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
         .subPage  a{
            text-decoration:underline !important;
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
                            <h1 class="white fontShadow">Get the Skills to Power Up Your Workforce</h1>
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
                    <div class="col-md-12">
                        <p class="sectionHeadingSubPage text-left subSectionPadding" style="padding-top:40px;">Professional Development, Technical and Desktop Applications Courses in Classroom Live or Live Online Delivery Format</p>   
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                             <div class="col-md-8">
                                    <p>
                                        Whether you&#39;re an individual, small business, large corporation
                                        or municipality, we have training courses to fit your needs. Our
                                        passion is providing our clients with corporate training solutions.
                                    </p>
                                    <p class="sectionHeadingSubPage text-left subSectionPadding" style="padding-top:20px;"><a href="/professional-development.aspx">Professional Development</a></p>
                                    <p>
                                        Increase your expertise or keep your certifications current with
                                        our Professional Development courses. These classes
                                        accommodate administrative assistants to HR and IT
                                        professionals. Learn Project Management, Business Analysis,
                                        Leadership Skills, HR Compliance, Agile and Scrum, amongst
                                        other courses.
                                    </p>

                                </div>
                                <div class="col-md-4">
                                     <img style="width:90%" src="/images/bigstock-Attractive-Aged-Businesswoman-230285287.jpg" alt="Get the Skills to Power Up Your Workforce" />

                                </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <p class="sectionHeadingSubPage text-left subSectionPadding" style="padding-top:20px;"><a href="/technical-courses.aspx">Technical Courses</a></p>
                                <p>
                                    Sharpen your IT skills with our expert instructors, extensive hands-on lab exercises and state-of-the-art training centers.
Learn Cisco, CompTIA, ITIL, Microsoft, Red Hat Linux, VMware and more.
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                    <p class="sectionHeadingSubPage text-left subSectionPadding" style="padding-top:20px;"><a href="/desktop-applications.aspx">Desktop Applications</a></p>
                                <p>
                                    Master the most popular Desktop Applications, such as: Word, Excel, Access, PowerPoint, Outlook, Project, Adobe
Photoshop, SharePoint, SQL, Crystal Reports and more.
                                </p>
                                <p>
                                    Productivity Point works with internationally renowned partners so you can rest assured you are taking industry-
standard courses to sharpen your professional portfolio. While doing so you are perfecting your proficiencies and
making your company more profitable in the process.
                                </p>
                                <p>
                                    Our courses take between 1-5 days, so you get top-grade, expert instruction quickly. Learn amongst other professionals
in a lavish classroom environment or virtually in the convenience of your office or home, then return to your career
armed with up-to-the-minute knowledge.
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <p class="sectionHeadingSubPage text-left subSectionPadding" style="padding-top:20px;">Have a Question? Get in Touch and We Guarantee that We’ll Get Back to You</p>
                                <p>Contact a training center specialist at <a href="tel:844-238-8607">844-238-8607</a> to get answers to any questions you have about corporate training and event hosting services today.</p>
                            </div>
                        </div>
                    </div>

                    
                </div>                    
            </div>
        </div>
    </div>	      
</asp:Content>