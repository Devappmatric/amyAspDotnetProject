<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="press-release.aspx.cs" Inherits="ProductivityPointGlobal.PressRelease" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pageMainHeader"><h1 class="Orange">Press Release</h1></div>
    <div class="pageTopBoxContainer">
        <div class="pageLColumn">
            <div class="pageLHeaderBox"><p class="White"><span style="font-size: 18px; font-weight: bold;">&nbsp;</span></p></div>
        </div>
        <div class="pageRColumn">
            <div class="pageRHeaderBox"><asp:Image ImageUrl="~/App_Themes/Default/images/press_release_thumb.jpg" runat="server" /></div>
        </div>
        <div class="clearFloat"></div>
        <div style="background-color: #FFF;">
            <div class="pageLColumnContent">
                <div class="pageLHeaderBox">
                    <h2 class="Grey">ExecuTrain of Florida is Now PRODUCTIVITY POINT LEARNING SOLUTIONS</h2>
                    <p>
                        FORT LAUDERDALE, FL – In October of 2010, ExecuTrain of Florida announces the end of its licensed relationship with ExecuTrain and the launch of its new operating brand, “Productivity Point Learning Solutions.” The new branding is designed to reflect an expansion of the Florida-based company's capabilities to a global scale. 
                        <br /><br />
                        "We have transformed our current organization into a business that connects closely with customers in a technology-rich marketplace," said Amy Spears, Chief Executive Officer. "Our new brand reflects who we are, the markets we serve and the innovation that differentiates us in our industry. We have expanded into new markets, acquired new capabilities, and leveraged our delivery strategies utilizing technologies that launched new industries -- all to ensure we make it easier, more convenient, and less costly for our clients to acquire, maintain and optimize their professional development skills."
                    </p>
                    <br />
                    <div class="hRule"></div>
                    <br />
                    <h2 class="Grey">About Productivity Point Learning Solutions</h2>
                    <p>Productivity Point Learning Solutions (previously ExecuTrain of Florida) evolved out of an initiative to increase our outreach both nationally and internationally.  Utilizing the highest standard in customer service combined with our subject matter experts and high-end training venues, Productivity Point has carved a niche by consistently expanding our corporate and government client base, originally hosted in the southeastern region of the US. 
                        <br /><br />
                        Productivity Point's combination of technology and professional skills training, IT outsourcing, and event hosting enables us to place a focused emphasis on the diversified business needs of our clients.
                        <br /><br />
                        By consistently setting quality as the benchmark of our value system, Productivity Point combines strategic partnerships and cutting edge technology with our determined efforts to branch out into other regions.  Utilizing a diversified approach, we have expanded our capabilities towards facilitating our expert-driven services globally. 
                        <br /><br />
                        Productivity Point Learning Solutions Headquarters<br />
                        1301 International Parkway, Suite 530<br />
                        Sunrise, Florida 33323<br />
                        954-838-7301<br />
                        <a href="http://www.productivitypoint.com">www.productivitypoint.com</a><br />
                        <a href="mailto:info@productivitypoint.com">info@productivitypoint.com</a></p>
                </div>            
            </div>
            <div class="pageRColumnContent">
                <div class="pageRHeaderBox">
                    <h2 class="Grey">Contact Us</h2>                                        
                       <%--<uc:ContactForm runat="server" />--%>                    
                    <br />
                    <div class="hRule"></div>
                    <br />
                    <h2 class="Grey">Media Contact</h2>
                    <br />
                    <p>Luis Martins<br />
                        T 1-954-838-7301<br />
                        E <a href="mailto:lmartins@productivitypoint.com">lmartins@productivitypoint.com</a></p>
                </div>
            </div>
            <div class="clearFloat"></div>
        </div>
    </div>
</asp:Content>