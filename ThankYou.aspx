<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="ProductivityPointGlobal.ThankYou" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow">Thank You</h1>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-5 col-sm-5 col-xs-12 margin20T responsiveCol">
                        <%--<uc:ContactForm runat="server" />--%>
                    </div>
                </div>
            </div>
        </div>
    </div>    

    <div class="container-fluid bgWhite subPage padding75B">
        <div class="row">
            <div class="container">
                <div class="row">                    
                    <div class="col-lg-8 col-md-6 col-sm-6 col-xs-12">
                        <%--Main Content--%>
                        <p class="sectionHeadingSubPage text-left subSectionPadding">Your Form Was Submitted</p>   
                        <div class="paddingRightImageContainer">
                            <img src="/images/request_info1.jpg" alt="Thank you" />
                        </div>                        
                        <p>Thank you for visiting <a href="default.aspx" class="orange bold">Productivity Point Learning Solutions</a> a national leader in Corporate Training.<br/><br/>
                            We look forward to connecting with you to discuss your corporate training needs.<br/><br/>
                            For immediate questions, give us a call at <a href="tel:9543763440" class="orange bold">844-238-8607 </a></p>
                        <br/>
                        <p>Stay Connected With Us!</p>
                        <asp:HyperLink ID="hlLinkedIn" CssClass="btn btn-success btnPadding" Text="LinkedIn" NavigateUrl="https://www.linkedin.com/company/productivity-point-global/about/" Target="_blank" runat="server" />                        
                        <%--End Main Content--%>
                    </div>
                    <uc:Partners runat="server" />                    
                </div>                    
            </div>
        </div>
    </div>
          
    <!-- Google Code for Lead Inquiry Conversion Page -->
    <script type="text/javascript">
    /* <![CDATA[ */
            var google_conversion_id = 856073820;
            var google_conversion_language = "en";
            var google_conversion_format = "3";
            var google_conversion_color = "ffffff";
            var google_conversion_label = "yYVWCKjymXEQ3MyamAM";
            var google_remarketing_only = false;
    /* ]]> */
        </script>
        <script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
        </script>
        <noscript>
            <div style="display:inline;">
                <img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/856073820/?label=yYVWCKjymXEQ3MyamAM&amp;guid=ON&amp;script=0"/>
            </div>
        </noscript>    
</asp:Content>
