<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="special-savings.aspx.cs" Inherits="ProductivityPointGlobal.SpecialSavings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .view {
            background: url(/images/Agile_and_Scrum.gif) #033654 no-repeat center center fixed; 
        }
        .subPage  a{
            text-decoration:underline !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-12">
                        <div class="section1RowSubpage" style="margin-bottom:64px;text-align:center">
                            <h1 class="white fontShadow" style="font-weight:700 !important">Special Savings for <asp:Literal ID="litText0" runat="server"/></h1>
                        </div>
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
                    <div class="col-lg-12">
                        <p style="padding-top:20px;" class="sectionHeadingSubPage text-left subSectionPadding"><asp:Literal ID="litCompanyName" runat="server"/></p>
                        <p>Productivity Point, in collaboration with <asp:Literal ID="litText1" runat="server"/>, is excited to welcome all <asp:Literal ID="litText2" runat="server"/> employees to our Corporate Training Open Enrollment Training Courses.</p>
                        <p>Individual <asp:Literal ID="litText3" runat="server"/> employees will enjoy a <span class="bold">10%</span> savings off each purchase for any <a href="https://www.productivitypointls.com/courses/">Productivity Point Open Enrollment Course</a>, using the following Offer Code: <span class="bold"><asp:Literal ID="litCoupon1" runat="server"/></span></p>
                        <p>Three or more employees of <asp:Literal ID="litText4" runat="server"/> who register together for the same course will receive a <span class="bold">20%</span> savings** off each purchase for any Productivity Point Open Enrollment Course using the following Offer Code: <span class="bold"><asp:Literal ID="litCoupon2" runat="server"/></span></p>
                        <p>To utilize these special savings, please follow these steps:</p>
                        <p class="margin5L">&bull; Once you have selected your course, register <a href="/cart/login.aspx">online</a> (you will be prompted to enter your offer code)</p>
                        <p>
                            <b>Productivity Point</b> provides over 500 fast tracked IT and Professional Certified training courses to fit your
needs so you can get back to growing your profitability. Located in beautiful Fort Lauderdale/Sunrise and
120 other national classrooms.
                        </p>
                        <p>** Productivity Point is committed to our partnership with <asp:Literal ID="litText5" runat="server"/>, therefore we have enabled your teams to lock in reduced rates on multiple enrollments.  If 3 or more <asp:Literal ID="litText6" runat="server"/> employees register separately for the same class, Productivity Point will update your savings to a 20% discount.</p>
                        <p class="italic">All Open Enrollment courses may also be customized and held on-site for private groups of 5 or more. On-site or in-house private group training classes are available and subject to separate terms and group pricing.</p>
                        <p class="sectionHeadingSubPage text-center"><a  href="https://www.productivitypointls.com/courses/">Click here for information on our Open Enrollment training courses</a></p>                                                                   
                    </div>
                    <%--<uc:Partners runat="server" />--%>
                </div>                    
            </div>
        </div>
    </div>	      
</asp:Content>