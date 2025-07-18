<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="locationsfilteredByClass.aspx.cs" Inherits="ProductivityPointGlobal.Locationsfiltered" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(document).ready(function ($) {
        $('#accordion').find('.accordion-toggle').click(function () {
            //Expand or collapse this panel
            $(this).next().slideToggle('fast');
            //Hide the other panels
            $(".accordion-content").not($(this).next()).slideUp('fast');
        });
    });
</script>    
<style>
  .accordion-toggle {cursor: pointer;}
  .accordion-content {display: none;}  
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pageMainHeader"><h1 class="Orange"><asp:Label ID="ctlLocation" runat="server" /></h1></div>
    <div class="pageTopBoxContainer">
        <div class="pageLColumn">
            <div class="pageLHeaderBox">
                <div style="padding: 22px 0px 0px 0px;"><p class="White"><span style="font-size: 18px; font-weight: bold;">Productivity Point delivers live instructor-led training to a wide geographical area allowing our clients to experience unsurpassed training solutions nationally.</span></p></div>
            </div>
        </div>
        <div class="pageRColumn">
            <div class="pageRHeaderBox"><asp:Image ImageUrl="~/App_Themes/Default/images/locations_thumb.jpg" runat="server" /></div>
        </div>
        <div class="clearFloat"></div>
        <div style="background-color: #FFF;">

            <div class="pageLColumnContent">
                <div class="pageLHeaderBox">
                    <div id="accordion">
                    <asp:Repeater ID="masterRepeater" OnItemDataBound="masterRepeater_ItemDataBound" runat="server">
                        <ItemTemplate>                            
                            <div class="stateLocationContainer accordion-toggle">                                    
                                <div style="margin: 0px 0px 0px 10px;"><h2 class="DarkBlue"><asp:Label ID="ctlState" runat="server" Text='<%# Eval("stateName") %>' /></h2></div>                                
                            </div>                            
                        <asp:Repeater ID="detailRepeater" runat="server">
                            <HeaderTemplate>
                                <div class="accordion-content">        
                            </HeaderTemplate>
                            <ItemTemplate>   
                                
                                    <table class="courseDisplay">
                                        <tr>
                                            <td style="width: 80%"><p><asp:HyperLink ID="ctlCourse" NavigateUrl='<%# string.Format("~/ScheduleById/{0}/{1}", Eval("courseId"), Eval("seoCity")) %>' runat="server"><asp:Label ID="ctlCourseName" runat="server" Text='<%# Eval("courseName") %>' /></asp:HyperLink></p></td>
                                            <td style="width: 20%"><p><asp:Label ID="ctlCity" runat="server" Text='<%# Eval("city") %>' />, <asp:Label ID="ctlState" runat="server" Text='<%# Eval("state") %>' /></p></td>
                                        </tr>
                                    </table>                       
                                
                            </ItemTemplate> 
                            <FooterTemplate>
                                </div>         
                            </FooterTemplate>                                                                                                                       
                        </asp:Repeater>                            
                        </ItemTemplate>
                    </asp:Repeater>                
                    </div>
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
                    <p>T 1-888-928-0444<br />
                        E <a href="mailto:info@productivitypoint.com">info@productivitypoint.com</a></p>
                </div>
            </div>   
            <div class="clearFloat"></div>
        </div>
    </div>
</asp:Content>
