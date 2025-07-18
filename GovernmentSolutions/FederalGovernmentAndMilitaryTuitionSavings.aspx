<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/default.master" CodeBehind="FederalGovernmentAndMilitaryTuitionSavings.aspx.cs" Inherits="ProductivityPointGlobal.FederalGovernmentAndMilitaryTuitionSavings" %>

<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%#string.Format("<link rel=\"canonical\" href=\"{0}://{1}/FederalGovernmentAndMilitaryTuitionSavings.aspx\" />", Request.Url.Scheme, Request.Url.Host) %>
    <style>
       .city-mainpage-heading{font-size:26px;margin-top:5px}.city-main-page-right-sidebar-div{border-left:1px solid #fd6803;min-height:200px;padding-left:30px;margin-top:27px}.city-main-page-right-sidebar-div>p{text-align:left;font-size:14px;line-height:1.8}.city-main-page-right-sidebar-div>.sidebar-heading{border-bottom:1px solid #fd6803;font-size:18px;font-weight:500;margin-top:20px}.city-main-page-right-sidebar-div>p>ul>li{text-align:left}.catalog-box{height:150px;text-align:left;margin-top:10px;margin-bottom:10px;overflow:hidden}.catalog-inner-box{height:140px;width:300px;margin:5px;padding:.5em 1em .5em;border:1px solid #e5e5e5;border-radius:2px;overflow:hidden}.catalog-inner-box:hover{box-shadow:0 2px 6px 0 rgba(0,0,0,.4)}.catalog-inner-box>.catalog-heading{color:#f67a06;line-height:1.2;margin-bottom:0!important}.catalog-inner-box>.catalog-description{font-size:14px;height:20px;overflow:hidden;line-height:1.29}.city-view{background:url('/images/Government Solutions/Government Training_2.png') #033654 no-repeat center center;background-size:100% 100%;-webkit-background-size:cover;-moz-background-size:cover;-o-background-size:cover;background-size:cover}.section1RowSubpageCityPage{margin-bottom:120px;margin-top:0;text-align:center}.breadcrumb-box{color:#4c4c4c;margin-top:30px;margin-left:10px;margin-bottom:0}.padding0T{padding:0}p{text-align:left;font-size:15px;line-height:1.5}ul>li{font-family:HelveticaNeueLTStd;color:#4c4c4c;font-size:14px;line-height:1.8}.breadcrumb-link{color:#4c4c4c}.breadcrumb-link:hover{opacity:.8;color:#4c4c4c!important}.breadcrumb-active-link{color:#4c4c4c}.breadcrumb-active-link:hover{color:#4c4c4c;opacity:1} 
    </style> 
    <style>
       #dropIconMinus{display:none}.accordion-toggle{cursor:pointer}.accordion-content{display:none}span.table{padding:8px;line-height:1.42857143;vertical-align:top;border-top:1px solid #ddd;display:block}
    </style>   
    <style>
        @media screen and (max-width: 572px) {
             .city-main-page-right-sidebar-div {
                border-left: unset;
                padding-left: 20px;
            } 
             .mobile-padding-heading-top{
                 padding-top:80px;
             }
        }
        .catalog-heading >span{
            font-size:18px;
        }
        .catalog-description > a{
            font-size:15px;
        }
        .government-heading{
            text-align:center;
        }
        .government-heading > h1{
            font-size:38px;
            font-family:HelveticaNeueLTStd;
        }
        .government-heading > p{
            font-size:24px;
            text-align:center;
        }
        .government-heading-images{
            padding-top:30px;
            padding-bottom:30px;
        }
        .government-heading-images>.row>.col-md-2>h2{
            font-weight:500;
            font-size:20px;
            line-height:1.3;
            margin:0px;
        }
        .government-heading-images>.row>.col-md-2{
            text-align:center;
        }
        .government-heading-images>.row>.col-md-2>a>img{
            height:80px;
        }
        .government-main-page-image>h3{
            color:white;
            padding-left:20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid subPage mobile-padding-heading-top">
        <div class="row" style="margin-top:44px;">
             <p  class="breadcrumb-box">
                <a style="font-size:11px" class="breadcrumb-link" href="/">Home</a> >
                <a style="font-size:11px" class="breadcrumb-link" href="/GovernmentSolutions.aspx">Government</a> >
                <a style="font-size:11px"  class="breadcrumb-active-link" >Fed/Military</a>
            </p>
            <div class="container">
                <div class="row padding0T">
                     <div class="col-lg-2 col-md-2 col-sm-2"></div> 
                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                        <div class="government-heading">
                            <h1>Federal Government and Military Tuition Savings</h1>
                            <p>
                                We can help you meet and exceed your mission objectives by maximizing your savings 
                                with our robust IT and business skills training portfolio. 
                            </p>
                            
                        </div>
                        
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2"></div>  
                </div>
                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <div class="government-heading-images">
                                <div class="row">
                                    <div class="col-md-2">
                                        <a href="/GovernmentSolutions/DOD8570Certification.aspx">
                                           <img src="/images/Government Solutions/DOD_Directive_8140.png" />
                                        </a>
                                        <h2>DoD Directive<br /> 8140</h2>
                                        <small>(Replacement for 8570)</small>
                                    </div>
                                    <div class="col-md-2">
                                         <a href="#">
                                           <img src="/images/Government Solutions/GI_Bill_For_Armed_Forces.png" />
                                        </a>
                                        <h2>GI Bill for <br /> Armed Forces</h2>
                                    </div>
                                    <div class="col-md-2">
                                        <a href="#">
                                           <img src="/images/Government Solutions/Industry_Leading_Certifications.png" />
                                        </a>
                                        <h2>Industry-Leading<br /> Certifications</h2>
                                    </div>
                                    
                                    <div class="col-md-2">
                                         <a href="#">
                                           <img src="/images/Government Solutions/Government_Special_Savings.png" />
                                        </a>
                                        <h2>Government<br /> Special<br />Savings</h2>
                                    </div>
                                    <div class="col-md-2">
                                         <a href="#">
                                           <img src="/images/Government Solutions/Effortless_Procurement_Process.png" />
                                        </a>
                                        <h2>Effortless<br /> Procurement<br />Process</h2>
                                    </div>
                                    <div class="col-md-2">
                                         <a href="#">
                                           <img src="/images/Government Solutions/Delivery_Format_Options.png" />
                                        </a>
                                        <h2>Delivery Format<br /> Options</h2>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>    
    
    <uc:Search ID="ucSearch" runat="server" />

    <div class="container-fluid bgWhite padding75B">
        <div class="row">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2 col-md-2 col-sm-2"></div>
                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                         <div>
                              <h2 style="font-size:25px;padding-top:20px;" class="city-mainpage-heading text-center subSectionPadding">
                                    Gain the Skills Needed to Deliver Successful Project<br /> Outcomes, Utilizing Emerging Technologies 
                              </h2>
                        </div>
                         <p style="font-size:18px;" class="">
                            Whether you're an individual who wants to gain new skills or an agency setting up your agenda and tools needed to complete a project, you can expect the best mission-critical training solutions with Productivity Point.  Whether your team needs essential foundational skills, or they are ready to dive into advanced learning, we can help you develop, support and retain skilled professionals, to be ready and prepared for the next project. 
                        </p>
                        
                        
                    </div>
                     <div class="col-lg-2 col-md-2 col-sm-2"></div>                  
                </div>                    
            </div>
        </div>
    </div>        
</asp:Content>



