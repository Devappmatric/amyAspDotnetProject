<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="professional-services.aspx.cs" Inherits="ProductivityPointGlobal.ProfessionalServices" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%#string.Format("<link rel=\"canonical\" href=\"{0}://{1}/professional-services.aspx\" />", Request.Url.Scheme, Request.Url.Host) %>
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
                            <h1 class="white fontShadow">Productivity Point Learning Solutions Professional Services</h1>
                            <%--<h2 class="white fontShadow">Add value to your portfolio through industry-recognized IT and Business Skills Certifications.</h2>--%>
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
                         <h2 class="sectionHeadingSubPage text-left subSectionPadding">Add value to your portfolio through industry-recognized IT and Business Skills Certifications.</h2>
                        <div>
                            <h2 class="sectionHeadingSubPage text-left subSectionPadding">Performance Assessment</h2>   
                            <div class="paddingRightImageContainer">
                                <img src="/images/professional_services1.jpg" alt="Public Classroom Training" />
                            </div>
                            <p>Productivity Point's performance assessment methodology provides a foundation for your team to take their proficiency to the next level. Our approach offers a comprehensive assessment and measurement plan to identify, evaluate, and improve your employee's capabilites and potential in alignment with management's performance goals and objectives.</p>
                            <div class="clearfix"></div>
                        </div>
                                                
                        <h2 class="sectionHeadingSubPage text-left subSectionPadding">IT Oursourcing</h2>
                        <p>Locating qualified candidates to fill positions within your Information Technology Department is time-consuming, and it takes you away from managing your mission-critical projects. As your comprehensive resource for IT learning services, Productivity Point's outsourcing division offers you a total solution to assist you in fulfilling your technical staffing needs.</p>
                        
                        <h2 class="sectionHeadingSubPage text-left subSectionPadding">Project Management Services</h2>
                        <p>Productivity Point's team of certified Project Management professionals have years of real-world experience. We will enable our clients to successfully complete your most important projects on-time, within budget and with the highest level of quality. We provide a flexible combination of services, including a PMI Exam Preparation Training, as well as best-of-breed Project Management Consultants.</p>
                        
                        <h2 class="sectionHeadingSubPage text-left subSectionPadding">Software Development</h2>
                        <p>When you have an immediate need to move forward on the development of a new application or expansion of your customized software program, you may encounter a need for programming resources to support your project. We are able to meet your specific technology needs through our programming services with experts that are staffed on a project basis or as a full-time resource at your site. </p>
                    </div>

                    <uc:Partners runat="server" />
                    
                </div>                    
            </div>
        </div>
    </div>	  			                       
</asp:Content>


