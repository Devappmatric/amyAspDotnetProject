<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="desktop-applications-miami.aspx.cs" Inherits="ProductivityPointGlobal.DesktopApplicationsMiami" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow">Desktop Applications Courses in Miami, FL</h1>
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
                            <p class="sectionHeadingSubPage text-left subSectionPadding">Get the Skills Training and Certification to Advance Your Business & Your Employees in 2-5 Days</p>
                            <div class="paddingRightImageContainer">
                                <img src="/images/desktop_applications1.jpg" alt="Public Classroom Training" />
                            </div>
                            <p>Having employees who are competent in Desktop Applications is essential for any company. To stay competitive, you need the ability to translate your ideas and data into documents so you can communicate your knowledge clearly and concisely.
                                <br/><br/>
                                Our Desktop Applications courses are specifically designed for busy professionals - each course is typically between 1-2 days of training. 
                            </p>
                            <div class="clearfix"></div>
                        </div>
                                                                    
                        <p class="sectionHeadingSubPage text-left subSectionPadding">We offer an array of Desktop Applications Courses, such as:</p>
                                                
                        <ul>
                            <li><p class="bold"><a href="/Training/Microsoft-Access/Miami-FL">Access</a></p></li>
                            <li><p class="bold"><a href="/Training/Adobe/Miami-FL">Adobe</a></p></li>
                            <li><p class="bold"><a href="/Training/SAP-Crystal-Reports/Miami-FL">Crystal Reports</a></p></li>
                            <li><p class="bold"><a href="/Training/Excel/Miami-FL">Excel</a></p></li>
                            <li><p class="bold"><a href="/Training/FileMaker-Pro/Miami-FL">FileMaker Pro</a></p></li>
                            <li><p class="bold"><a href="/Training/Microsoft-OneNote/Miami-FL">OneNote</a></p></li>
                            <li><p class="bold"><a href="/Training/Microsoft-Outlook/Miami-FL">Outlook</a></p></li>
                            <li><p class="bold"><a href="/Training/Microsoft-PowerPoint/Miami-FL">PowerPoint</a></p></li>
                            <li><p class="bold"><a href="/Training/Microsoft-Project/Miami-FL">Microsoft Project</a></p></li>
                            <li><p class="bold"><a href="/Training/Publisher/Miami-FL">Publisher</a></p></li>
                            <li><p class="bold"><a href="/Training/Microsoft-SharePoint/Miami-FL">SharePoint</a></p></li>
                            <li><p class="bold"><a href="/Training/Microsoft-SQL-Server/Miami-FL">SQL Server</a></p></li>
                            <li><p class="bold"><a href="/Training/Microsoft-Visio/Miami-FL">Visio</a></p></li>
                            <li><p class="bold"><a href="/Training/Quickbooks/Miami-FL">Quickbooks</a></p></li>
                            <li><p class="bold"><a href="/Training/Microsoft-Windows-10/Miami-FL">Windows 10</a></p></li>
                            <li><p class="bold"><a href="/Training/Microsoft-Word/Miami-FL">Word</a></p></li>
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
