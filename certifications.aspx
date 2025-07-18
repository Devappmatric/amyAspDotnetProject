<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="certifications.aspx.cs" Inherits="ProductivityPointGlobal.Certifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pageMainHeader">
        <h1 class="Orange">Certifications</h1>
    </div>
    <div class="pageTopBoxContainer">
        <div class="pageLColumn">
            <div class="pageLHeaderBox">
                <div style="padding: 25px 0px 0px 0px;"><p class="White"><span style="font-size: 18px; font-weight: bold;">Add value to your portfolio through industry-recognized IT and Business Skills Certifications.</span></p></div>
            </div>
        </div>
        <div class="pageRColumn">
            <div class="pageRHeaderBox"><asp:Image ImageUrl="~/App_Themes/Default/images/certifications_thumb.jpg" runat="server" /></div>
        </div>
        <div class="clearFloat"></div>
        <div style="background-color: #FFF;">
            <div class="page2ColumnL">
                <div class="pageLHeaderBox" style="min-height: 394px;">
                    <h2 class="Grey">IT Certifications</h2>
                    <ul>
                        <li>Blackberry</li>
                        <li>Cisco</li>
                        <li>CompTIA</li>
                        <li>IBM</li>
                        <li>ITIL</li>
                        <li>Microsoft</li>
                        <li>Oracle</li>
                        <li>Red Hat Linux</li>
                        <li>VMware</li>
                    </ul>                    
                </div>
            </div>
            <div class="page2ColumnR" style="min-height: 454px;">
                <div class="pageLHeaderBox">
                    <h2 class="Grey">Professional Development</h2>
                    <ul>
                        <li>PMP (Project Management)</li>
                        <li>IIBA (Business Analyst)</li>
                        <li>CompTIA</li>
                        <li>Agile</li>
                        <li>Scrum</li>
                    </ul>                    
                </div>
            </div>
            <div class="pageRColumnContentSmall">                
                <h2 class="Grey">Contact Us Form</h2>                                        
                    <%--<uc:ContactForm runat="server" />--%>
                <br />
                <div class="hRule"></div>
                <br />
                <h2 class="Grey">For more information, please contact us at:</h2>
                <br />
                <p>
                    T 1-888-928-0444<br />
                    E <a href="mailto:info@productivitypoint.com">info@productivitypoint.com</a>
                </p>    
                <br />            
            </div>
            <div class="clearFloat"></div>
            <div class="pageFooterNote"><p>Productivity Point Learning Solutions offers Cisco Authorized Training through their partnership with Global Knowledge, an authorized Cisco Learning partner.</p></div>
        </div>
    </div>
</asp:Content>