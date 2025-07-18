<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="partners.aspx.cs" Inherits="ProductivityPointGlobal.Partners" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%#string.Format("<link rel=\"canonical\" href=\"{0}://{1}/partners.aspx\" />", Request.Url.Scheme, Request.Url.Host) %>

    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T" >
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow">Productivity Point Learning Solutions Partners</h1>
                            <%--<h2 class="white fontShadow">Our partnership with Microsoft allows us to provide the quality and value of Microsoft Official Courseware along with the real-world expertise of our instructors. Our Microsoft Certified Trainers (MCT's) are experts who have the instructional skills and technical qualifications to deliver exceptional training and certification preparation.</h2>--%>
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
                        <p  class="subSectionPadding font18">Our partnerships with branded software vendors allows us to provide the quality and value along with the real-world expertise of our instructors. Our Certified Trainers are experts who have the instructional skills and technical qualifications to deliver exceptional training and certification preparation.</p>
                        <asp:Repeater ID="ctlPartners" runat="server">
                            <ItemTemplate>
                                <div>
                                    <p class="sectionHeadingSubPage text-left subSectionPadding"><asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>' /></p>   
                                    <div class="paddingRightImageContainer">
                                        <asp:Image ID="Image1" ImageUrl='<%# Eval("logo", "~/uploads/partners/{0}") %>' CssClass="" Width="272px" runat="server" />
                                    </div>
                                    <p><asp:Label ID="Label2" runat="server" Text='<%# Eval("description") %>' /></p>
                                    <div class="clearfix"></div>
                                </div>                                                                                                    
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <uc:Partners runat="server" />
                    
                </div>                    
            </div>
        </div>
    </div>	         
</asp:Content>


