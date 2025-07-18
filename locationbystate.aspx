<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="locationbystate.aspx.cs" Inherits="ProductivityPointGlobal.Locationbystate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h1 class="page-header"><i class="fa fa-globe orange"></i> <asp:Label ID="ctlLocation" runat="server" /></h1>                            
        </div>
    </div>    
    
    <div class="row">
        <div class="col-md-9">
            <div class="col-md-4 padding10T">    
                <img src="/App_Themes/Default/images/locations_thumb.jpg" class="img-responsive img-thumbnail" alt="All Locations"/>                    
            </div>            
            <div class="col-md-8 padding10T">
                <h4>Productivity Point delivers live instructor-led training to a wide geographical area allowing our clients to experience unsurpassed training solutions nationally.</h4>
            </div>
                        
            <div class="col-md-12 padding20B padding20T">                           
                <asp:Repeater ID="ctlLocationsRpt" runat="server">
                    <HeaderTemplate>
                        <table class="table table-striped">
                    </HeaderTemplate>
                    <ItemTemplate>                            
                        <tr>
                            <td>                                
                                <asp:Label ID="ctlAddress1" runat="server" Text='<%# Eval("address1") %>' /> <asp:Label ID="ctlAddress2" runat="server" Text='<%# Eval("address2") %>' /><br />                                
                                <asp:Label ID="ctlCity" runat="server" Text='<%# Eval("city") %>' />, <asp:Label ID="ctlState" runat="server" Text='<%# Eval("state") %>' />&nbsp;<asp:Label ID="ctlZip" runat="server" Text='<%# Eval("zip") %>' />                                
                            </td>
                        </tr>                                  
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>                                                                      
                    </FooterTemplate>
                </asp:Repeater>
            </div>         
        </div>   
             
        <div class="col-md-3">                                                   
            <%--<uc:ContactForm runat="server" />--%>                    
            <h3>Additional Information</h3>            
            <div class="list-group">                                       
                <asp:LinkButton ID="ctlDeliveryMethods" CssClass="list-group-item" runat="server"><i class="fa fa-link orange"></i>&nbsp;&nbsp;Delivery Methods</asp:LinkButton>
                <asp:LinkButton ID="ctlCertifications" CssClass="list-group-item" runat="server"><i class="fa fa-link orange"></i>&nbsp;&nbsp;Certifications</asp:LinkButton>
                <asp:LinkButton ID="ctlCourseCatalog" CssClass="list-group-item" runat="server"><i class="fa fa-link orange"></i>&nbsp;&nbsp;Course Catalog</asp:LinkButton>                
                <asp:LinkButton ID="ctlExplorePPG" CssClass="list-group-item" runat="server"><i class="fa fa-link orange"></i>&nbsp;&nbsp;Explore Productivity Point</asp:LinkButton>
                <asp:LinkButton ID="ctlContacts" CssClass="list-group-item" runat="server"><i class="fa fa-link orange"></i>&nbsp;&nbsp;Contacts</asp:LinkButton>
            </div>               
            <h3>For more information, please contact us at:</h3>            
            <p>T 1-844-238-8607<br />
            E <a href="mailto:info@productivitypoint.com">info@productivitypoint.com</a></p>            
        </div>
    </div>			                       
</asp:Content>
