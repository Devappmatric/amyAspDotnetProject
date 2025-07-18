<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="large-companies.aspx.cs" Inherits="ProductivityPointGlobal.LargeCompanies" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pageMainHeader">
        <h1 class="Orange">Midsize &amp; Large Companies</h1>
    </div>
    <div class="pageTopBoxContainer">
        <div class="pageLColumn">
            <div class="pageLHeaderBox"><p class="White"><span style="font-size: 18px; font-weight: bold;">Increase Productivity – Employees who have been properly trained get up to speed faster, use more time-saving features, and work with others better.</span> By giving your employees real, hands-on experience through labs that incorporate real workplace scenarios, our courses prepare them to implement new tools and techniques immediately.</p></div>
        </div>
        <div class="pageRColumn">
            <div class="pageRHeaderBox"><asp:Image ID="Image1" ImageUrl="~/App_Themes/Default/images/large_companies_thumb.jpg" runat="server" /></div>
        </div>
        <div class="clearFloat"></div>
        <div style="background-color: #FFF;">
            <div class="page2ColumnL" style="min-height: 576px;">
                <div class="pageLHeaderBox">
                    <h2 class="Grey">Productivity Point Information</h2>
                    <ul>
                        <li>Corporate Sales</li>
                    </ul>     
                    <p>1-888-928-0444<br />
                        <a href="mailto:corp@productivitypoint.com">corp@productivitypoint.com</a></p>
                    <br />
                    <ul>
                        <li>Productivity Point Course Advisor</li>
                    </ul>     
                    <p>1-888-928-0444<br />
                        <a href="mailto:advisor@productivitypoint.com">advisor@productivitypoint.com</a></p>                    
                </div>
            </div>
            <div class="page2ColumnR">
                <div class="pageLHeaderBox" style="min-height: 516px;">
                    <h2 class="Grey">Productivity Point Support</h2>
                    <ul>
                        <li>Instructor Questions</li>
                    </ul>     
                    <p>1-888-928-0444<br />
                        <a href="mailto:instructor@productivitypoint.com">instructor@productivitypoint.com</a></p>     
                    <br /> 
                    <ul>
                        <li>Live Virtual Training (LVT)</li>
                    </ul>     
                    <p>1-888-928-0444<br />
                        <a href="mailto:tech@productivitypoint.com">tech@productivitypoint.com</a></p>      
                    <br />
                    <ul>
                        <li>Customer Service</li>
                    </ul>     
                    <p>1-888-928-0444<br />
                        <a href="mailto:support@productivitypoint.com">support@productivitypoint.com</a></p>      
                </div>
            </div>
            <div class="pageRColumnContentSmall">                
                <h2 class="Grey">Contact Us Form</h2>                                        
                    <%--<uc:ContactForm runat="server" />--%>                    
                <br />
                <div class="hRule"></div>
                <br />      
                <h2 class="Grey">Corporate Headquarters</h2> 
                <br />          
                    <uc:Address runat="server" />                                                                    
            </div>
            <div class="clearFloat"></div>
            <br />
        </div>
    </div>
</asp:Content>
