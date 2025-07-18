<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="locationbyclass.aspx.cs" Inherits="ProductivityPointGlobal.Locationbyclass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pageMainHeader"><h1 class="Orange"><asp:Label ID="ctlLocation" runat="server" /></h1></div>
    <div class="pageTopBoxContainer">
        <div class="pageLColumn">
            <div class="pageLHeaderBox">
                <div style="padding: 22px 0 0 0;"><p class="White"><span style="font-size: 18px; font-weight: bold;">Productivity Point delivers live instructor-led training to a wide geographical area allowing our clients to experience unsurpassed training solutions nationally.</span></p></div>
            </div>
        </div>
        <div class="pageRColumn">
            <div class="pageRHeaderBox"><asp:Image ImageUrl="~/App_Themes/Default/images/locations_thumb.jpg" runat="server" /></div>
        </div>
        <div class="clearFloat"></div>
        <div style="background-color: #FFF;">

            <div class="pageLColumnContent">
                <div class="pageLHeaderBox">
                    <asp:Repeater ID="ctlLocationsRpt" runat="server">
                        <HeaderTemplate>
                            <table class="locationsTable">
                        </HeaderTemplate>
                        <ItemTemplate>                            
                            <tr>                                
                                <td>
                                    <p><asp:HyperLink ID="ctlClassesByLocation" NavigateUrl='<%# String.Format("~/Class/{0}/", Server.HtmlEncode(Eval("venueId").ToString())) %>' runat="server" ><%# Eval("courseName") %></asp:HyperLink></p>
                                </td>
                                <td>
                                    <p><asp:HyperLink ID="HyperLink1" NavigateUrl='<%# String.Format("~/Class/{0}/", Server.HtmlEncode(Eval("venueId").ToString())) %>' runat="server" ><%# Eval("city") %>, <%# Eval("state") %></asp:HyperLink></p>
                                </td>                             
                            </tr>                                  
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>                      
                            <div class="pageToTop"><p class="Bold"><a class="scrollToTop" href="#">TOP &nbsp;<asp:Image ID="Image1" ImageUrl="~/App_Themes/Default/images/top_arrow.png" runat="server" /></a></p></div>
                            <br />
                        </FooterTemplate>
                    </asp:Repeater>
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
                        <li><asp:LinkButton ID="ctlExplorePPG" Text="Explore Productivity Point" runat="server" /></li>
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