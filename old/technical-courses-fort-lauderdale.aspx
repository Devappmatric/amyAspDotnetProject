<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="technical-courses-fort-lauderdale.aspx.cs" Inherits="ProductivityPointGlobal.TechnicalCoursesFortLauderdale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow">Technical Courses in Fort Lauderdale, FL</h1>
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
                            <p class="sectionHeadingSubPage text-left subSectionPadding">Get the Technical Skills and Certifications That Will Take Your Career and Earning-Power to the Next Level</p>   
                            <div class="paddingRightImageContainer">
                                <img src="/images/technical_courses1.jpg" alt="Public Classroom Training" />
                            </div>
                            <p>To keep a business productive and prosperous, you need your IT Team to function seamlessly. They are at the heart of your internal communications, web presence, and more, so they need to be top-notch. Fortunately, Productivity Point Learning Solutions offers numerous technical certified instructor-led courses to improve your IT team's skills.
                                <br/><br/>
                                Since our technical training is specifically designed for busy professionals, our courses are typically between 2 and 5 days of training.</p>
                            <div class="clearfix"></div>
                        </div>
                                                                    
                        <p class="sectionHeadingSubPage text-left subSectionPadding">Choose from our diverse collection of Technical Courses, such as:</p>
                                                
                        <ul>                                                                                    
                            <li><p class="bold"><a href="/Training/CompTia/Fort-Lauderdale-FL">CompTia</a></p></li>
                            <li><p class="bold"><a href="/Training/Cyber-Security/Fort-Lauderdale-FL">Cyber Security</a></p></li>                            
                            <li><p class="bold"><a href="/Training/Microsoft-Exchange-Server/Fort-Lauderdale-FL">Microsoft Exchange Server</a></p></li>
                            <li><p class="bold"><a href="/Training/Microsoft-Project/Fort-Lauderdale-FL">Microsoft Project</a></p></li>
                            <li><p class="bold"><a href="/Training/Microsoft-SharePoint/Fort-Lauderdale-FL">Microsoft SharePoint</a></p></li>
                            <li><p class="bold"><a href="/Training/Microsoft-SQL-Server/Fort-Lauderdale-FL">Microsoft SQL Server</a></p></li>
                            <li><p class="bold"><a href="/Training/Microsoft-Visual-Studio-and-.NET/Fort-Lauderdale-FL">Microsoft Visual Studio</a></p></li>
                            <li><p class="bold"><a href="/Training/Microsoft-Windows-Client/Fort-Lauderdale-FL">Microsoft Windows Client</a></p></li>
                            <li><p class="bold"><a href="/Training/Microsoft-Windows-Server/Fort-Lauderdale-FL">Microsoft Windows Server</a></p></li>                                                                                    
                            <li><p class="bold"><a href="/Training/SAP-Crystal-Reports/Fort-Lauderdale-FL">SAP</a></p></li>
                            <li><p class="bold"><a href="/Training/Virtualization/Fort-Lauderdale-FL">Virtualization</a></p></li>                            
                            <li><p class="bold"><a href="/Training/Web-Design-&amp;-Development/Fort-Lauderdale-FL">Web Design & Development</a></p></li>
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
