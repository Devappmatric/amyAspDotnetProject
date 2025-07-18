<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="ProductivityPointGlobal.ContactUs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%#string.Format("<link rel=\"canonical\" href=\"{0}://{1}/contact.aspx\" />", Request.Url.Scheme, Request.Url.Host) %>
    <style>
        @media (min-width: 320px){
            .padding20T {
                padding-top: 200px !important;
            }

            
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow">Contact Us</h1>
                            <%--<h2 class="white fontShadow">Productivity Point delivers live instructor-led training to a wide geographical area allowing our clients to experience unsurpassed training solutions nationally.</h2>--%>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-5 col-sm-6 col-xs-12 margin20T responsiveCol">
                        <uc:ContactForm runat="server" />
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
                        <p class="sectionHeadingSubPage text-left subSectionPadding">Productivity Point delivers live instructor-led training to a wide geographical area allowing our clients to experience unsurpassed training solutions nationally.</p>
                        <div class="row">                            
                            <div class="col-lg-6">                                
                                <p class="sectionHeadingSubPage text-left subSectionPadding">Productivity Point Information</p>
                                <p>
                                    <strong>Productivity Point Course Advisor</strong><br />
                                   1-844-238-8607<br />
                                    <a href="mailto:advisor@productivitypointls.com">advisor@productivitypointls.com</a>
                                </p>
                                <br/>

                                <p>
                                    <strong>Corporate Sales</strong><br />
                                    1-844-238-8607<br />
                                    <a href="mailto:corp@productivitypointls.com">corp@productivitypointls.com</a>
                                </p>
                                <br/>

                                <p>
                                    <strong>Government Sales</strong><br />
                                    1-844-238-8607<br />
                                    <a href="mailto:govt@productivitypointls.com">govt@productivitypointls.com</a>
                                </p>
                            </div>
                            <div class="col-lg-6">
                                <p class="sectionHeadingSubPage text-left subSectionPadding">Productivity Point Support</p>

                                <p>
                                    <strong>Instructor Questions</strong><br />
                                    1-844-238-8607<br />
                                    <a href="mailto:instructor@productivitypointls.com">instructor@productivitypointls.com</a>
                                </p>
                                <br/>

                                <p>
                                    <strong>Live Virtual Training (LVT)</strong><br />
                                    1-844-238-8607<br />
                                    <a href="mailto:tech@productivitypointls.com">tech@productivitypointls.com</a>
                                </p>
                                <br/>

                                <p>
                                    <strong>Customer Service</strong><br />
                                    1-844-238-8607<br />
                                    <a href="mailto:support@productivitypointls.com">support@productivitypointls.com</a>
                                </p>
                            </div>
                        </div>
                    </div>

                    <uc:Partners runat="server" />
                    
                </div>                    
            </div>
        </div>
    </div>	      
       
    <!-- Google Code for Track Conversion Page -->
    <script type="text/javascript">
        /* <![CDATA[ */
        var google_conversion_id = 1059358811;
        var google_conversion_language = "en_US";

        var google_conversion_format = "1";
        var google_conversion_color = "ffffff";
        var google_conversion_label = "4t-QCMeqbBDbkJL5Aw";
        var google_conversion_value = 1.000000;

        var google_remarketing_only = false;
        /* ]]> */
    </script>
    <script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
    </script>
    <noscript>
    <div style="display:inline;">
    <img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/1059358811/?value=1.000000&amp;label=4t-QCMeqbBDbkJL5Aw&amp;guid=ON&amp;script=0"/>
    </div>
    </noscript>

</asp:Content>


