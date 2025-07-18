<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="classbylocation.aspx.cs" Inherits="ProductivityPointGlobal.courses.ClassByLocation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pageMainHeader"><h1 class="Orange">Class Schedule</h1></div>
    <div id="courseBG" class="pageTopBoxContainer">

        <div class="pageLColumnClassByLocation">
            <div class="pageLHeaderBox">
                <asp:FormView ID="ctlCourseDetails" DefaultMode="ReadOnly" RenderOuterTable="false" runat="server">
                    <ItemTemplate>
                        <%--<h1 class="White"><%# Eval("venueName") %></h1>--%>
                        <h1 class="White">Productivity Point Learning Solutions Partner Facility</h1>
                        <br />                   
                        <p class="White" style="font-size: 16px;"><%# Eval("address1") %>, <%# Eval("address2") %>, <%# Eval("city") %> <%# Eval("state") %> <%# Eval("zip") %></p>                                                
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>

        <div class="pageRColumn">
        </div>

        <div class="clearFloat"></div>

        <div style="background-color: #FFF;">
            <div class="pageLColumnContent">
                <div class="pageLHeaderBoxCourseDetail">
                    <div class="secondaryHeaderBG">
                        <div style="float: left; padding: 10px 0 10px 10px; width: 180px;"><h2 class="Grey">Class</h2></div>
                        <div style="float: left; padding: 10px 0 10px 10px; width: 180px;"><h2 class="Grey">Date</h2></div>
                        <div style="float: left; padding: 10px 0 10px 10px; width: 160px;"><h2 class="Grey">Time</h2></div>
                        <div style="float: left; padding: 10px 0 10px 10px; width: 90px;"><h2 class="Grey">Register</h2></div>
                        <div style="clear: both;"></div>
                    </div>
                    <asp:Repeater ID="ctlClassSchedule" runat="server">
                        <ItemTemplate>
                            <div class="courseColumnContainer">
                                <asp:HiddenField ID="ctlClassID" Value='<%# Eval("id") %>' runat="server" />
                                <div style="float: left; padding: 18px 0 10px 10px; width: 180px;"><p class="Grey"><%# Eval("courseName") %></p></div>
                                <div style="float: left; padding: 18px 0 10px 10px; width: 180px;"><p class="Grey"><asp:Label ID="Label1" Text='<%#DateTime.Parse(Eval("startDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /> - <asp:Label ID="ctlEndDate" Text='<%#DateTime.Parse(Eval("endDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /></p></div>
                                <div style="float: left; padding: 18px 0 10px 10px; width: 160px;"><p class="Grey"><asp:Label ID="ctlLabel3" Text='<%#DateTime.Parse(Eval("startTime").ToString()).ToString("h:mm t.\\M.") %>' runat="server" /> - <asp:Label ID="ctlEndTime" Text='<%#DateTime.Parse(Eval("endTime").ToString()).ToString("h:mm t.\\M.") %>' runat="server" /></p></div>
                                <div style="float: left; padding: 10px 0 10px 10px; width: 90px;"><p class="Grey"><asp:Button ID="ctlRegister" Text="Register" CssClass="registerButton" OnClick="ctlRegister_Click" runat="server" /></p></div>
                                <div style="clear: both;"></div>
                            </div>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <div class="courseColumnContainerAlt">
                                <asp:HiddenField ID="ctlClassID" Value='<%# Eval("id") %>' runat="server" />
                                <div style="float: left; padding: 18px 0 10px 10px; width: 180px;"><p class="Grey"><%# Eval("courseName") %></p></div>
                                <div style="float: left; padding: 18px 0 10px 10px; width: 180px;"><p class="Grey"><asp:Label ID="Label1" Text='<%#DateTime.Parse(Eval("startDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /> - <asp:Label ID="ctlEndDate" Text='<%#DateTime.Parse(Eval("endDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /></p></div>
                                <div style="float: left; padding: 18px 0 10px 10px; width: 160px;"><p class="Grey"><asp:Label ID="ctlLabel3" Text='<%#DateTime.Parse(Eval("startTime").ToString()).ToString("h:mm t.\\M.") %>' runat="server" /> - <asp:Label ID="ctlEndTime" Text='<%#DateTime.Parse(Eval("endTime").ToString()).ToString("h:mm t.\\M.") %>' runat="server" /></p></div>
                                <div style="float: left; padding: 10px 0 10px 10px; width: 90px;"><p class="Grey"><asp:Button ID="ctlRegister" Text="Register" CssClass="registerButton" OnClick="ctlRegister_Click" runat="server" /></p></div>
                                <div style="clear: both;"></div>
                            </div>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <div class="clearFloat"></div>

                    <div class="pageToTop"><p class="Bold"><a class="scrollToTop" href="#">TOP &nbsp;<asp:Image ID="Image4" ImageUrl="~/App_Themes/Default/images/top_arrow.png" runat="server" /></a></p></div>
                </div>            
            </div>
            <div class="pageRColumnContent">
                <div class="pageRHeaderBox" id="courseBullets">
                    <h2 class="Grey">Contact Us Form</h2>                                        
                       <%--<uc:ContactForm runat="server" />--%>                    
                    <br />
                    <div class="hRule"></div>
                    <br />
                    <h2 class="Grey">Additional Information</h2>
                    <br />
                    <div class="hRule"></div>
                    <br />
                    <ul>
                        <li><asp:LinkButton ID="ctlDeliveryMethods" Text="Delivery Methods" runat="server" /></li>                                                
                        <li><asp:LinkButton ID="ctlCertifications" Text="Certifications" runat="server" /></li>
                        <li><asp:LinkButton ID="ctlCourseCatalog" Text="Course Catalog" runat="server" /></li>
                        <li><asp:LinkButton ID="ctlTrainingLocations" Text="Training Locations" runat="server" /></li>
                        <li><asp:LinkButton ID="ctlExplorePPG" Text="Explore PPG" runat="server" /></li>
                        <li><asp:LinkButton ID="ctlContacts" Text="Contacts" runat="server" /></li>
                    </ul>   
                    <br />
                    <div class="hRule"></div>
                    <br />                     
                    <h2 class="Grey">For more information, please contact us at:</h2>
                    <br />
                    <p>T 1-844-238-8607<br />
                        E <a href="mailto:info@productivitypoint.com">info@productivitypoint.com</a></p>
                </div>
            </div>      
            <div class="clearFloat"></div>
        </div>
    </div>    
</asp:Content>
