<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="consumers.aspx.cs" Inherits="ProductivityPointGlobal.Consumers" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pageMainHeader">
        <h1 class="Orange">Consumers</h1>
    </div>
    <div class="pageTopBoxContainerWhite">
        <div class="pageLColumn1Beige">
            <div class="pageLHeaderBox3ColumnLongText" style="text-align: center;">
                <div style="text-align: center;"><p class="Blue"><span style="font-size: 16px; font-weight: bold;">Productivity Point<br />Bundle</span></p></div>
                <div style="text-align: left; padding: 4px 0px 0px 0px;"><p class="Black" style="font-size: 11px; line-height: 16px;"><strong>As a Productivity Point Bundle Member, You may take any or all MS Office courses as many times as you like for a special discounted annual rate.</strong> Select some or all of the following courses in Versions 2007 or 2010: Access, Word, Excel, PowerPoint, Outlook. Contact us at 888-928-0444 or email <a class="DarkBlue font12" href="mailto:advisor@productivitypoint.com">advisor@productivitypoint.com</a></p></div>
            </div>
        </div>
        <div class="pageLColumn2Beige">
            <div class="pageLHeaderBox3ColumnLongText" style="text-align: center;">
                <div style="text-align: center;"><p class="Blue"><span style="font-size: 16px; font-weight: bold;">Complimentary<br /> Class Retake</span></p></div>
                <div style="text-align: left; padding: 4px 0px 0px 0px;"><p class="Black" style="font-size: 11px; line-height: 16px;">Enjoy the option or retaking any of our regularly scheduled public classes, for up to one year from the date of your original class.  Contact us at 888-928-0444 to schedule your class retake.</p></div>
            </div>
        </div>
        <div class="pageLColumn3Beige">
            <div class="pageLHeaderBox3ColumnLongText" style="text-align: center;">
                <div style="text-align: center;"><p class="Blue"><span style="font-size: 16px; font-weight: bold;">Follow-up<br />Instructor Support</span></p></div>
                <div style="text-align: left; padding: 4px 0px 0px 0px;"><p class="Black" style="font-size: 11px; line-height: 16px;">Relax – our team of talented instructors have your back! Don't hesitate to contact our instructors following your class with any questions or issues you may run into with your software application.  This is a complimentary service offered for up to one year from the date of your class.</p></div>
            </div>
        </div>
        <div class="pageRColumnBeige">
            <div class="pageLHeaderBox3ColumnLongText" style="text-align: center;">
                <div style="text-align: center;"><p class="Blue"><span style="font-size: 16px; font-weight: bold;">Our Classroom<br />Environment</span></p></div>
                <div style="text-align: left; padding: 4px 0px 0px 0px;"><p class="Black"style="font-size: 11px; font-weight: bold; line-height: 16px;">We understand the importance and value of a smaller group classroom environment.  Our Instructors have the ability to make you feel comfortable to express your questions.  And with their hands-on experience, our Instructors will provide you with real-world examples that will help you relate the subject matter to your own working environment.</p></div>
            </div>
        </div>
        <div class="clearFloat"></div>
        <div style="background-color: #FFF;">
            <div class="page2ColumnL" style="min-height: 576px;">
                <div class="pageLHeaderBox">
                    <h2 class="Grey">Productivity Point Information</h2>
                    <ul>
                        <li>Productivity Point Course Advisor</li>
                    </ul>     
                    <p>1-888-928-0444<br />
                        <a href="mailto:advisor@productivitypoint.com">advisor@productivitypoint.com</a></p>
                    <br />
                    <ul>
                        <li>Live Virtual Training (LVT)</li>
                    </ul>     
                    <p>1-888-928-0444<br />
                        <a href="mailto:tech@productivitypoint.com">tech@productivitypoint.com</a></p>                          
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
