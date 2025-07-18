<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="about-ppls.aspx.cs" Inherits="ProductivityPointGlobal.AboutPpg" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%#string.Format("<link rel=\"canonical\" href=\"{0}://{1}/about-ppls.aspx\" />", Request.Url.Scheme, Request.Url.Host) %>
    <link href="https://fonts.cdnfonts.com/css/abadi-mt-std" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>       
    <style>
        .about-page {
            font-family: 'Montserrat';
        }

        .about-page-img{
            width:100%;
        }

        .zero-margin{
            margin-left:0px !important;
            margin-right:0px !important;
        }

        .zero-padding{
            padding-left:0px !important;
            padding-right:0px !important;
        }

        .top-heading{
            font-size:22px;
            font-weight:700;
            text-align:center;
            margin-bottom:15px;
        }

        .first-division {
            background-color:#EDDBC9;
            margin-top:20px;
            font-family: 'Abadi MT Std', sans-serif;

        }

        .first-division .first-text{
               color:#ADA9A9;
               font-size:27px;
        }

        .first-division .second-text{
               color:#F1995D;
               font-size:32px;
        }

        .first-division .text-area{
                margin-top: 116px;
                text-align: right;
                padding-right: 160px !important;
        }

        .first-division img{
            width:100%;
            height:382px;
        }

        .second-division{
            margin-top:20px;
        }

        .second-division .col-md-12 >b{
            font:15px;   
        }
        .second-division .col-md-12 >p{
            font:15px;
        }
    </style>
    <style>
        @media (min-width: 1200px){
            .about-page {
                 width: 940px; 
            }
        }
        .third-division{
            background-color:#D1CFCD;
            margin-top:30px;
        }

        .third-division h2{
            font-weight:700;
            font-size:15px;
        }

        .third-division .text-content{
            font-size:13.5px;
        }

        .fourth-division{
            background-color:#EDDBC9;
            margin-top:30px;
        }

        .fourth-division .col-md-4{
            padding:20px !important;
        }

        .content-item-heading{
            font-size:15px;
            font-weight:700;
        }

        .content-item-content{
            font-size:13.5px;
        }

        .fifth-division{
            background-color:#D5D5D5;
            margin-top:30px;
        }

        .fifth-division .content-area{
            padding:20px !important;
        }

        .sixth-division{
            background-color:#EACCCC;
            margin-top:30px;
        }
        .sixth-division .content-area{
            padding-left:20px !important;
            padding-right:20px !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container about-page" style="margin-top:180px;">
        <div class="row">
            <div class="col-md-12">
                <div class="top-heading" style="font-size: 24px;">
                    The Productivity Point Difference
                </div>
            </div>
        </div>
        

        <div class="row fourth-division zero-margin">
    <div class="col-md-6" style="padding-top: 30px;padding-left: 30px;">
        <b style="font-size:16px;">Who is Productivity Point?</b>
        <p style="line-height: 22px;    margin-top: 4px;">
            Productivity Point is led by a team of individuals with world-class experience in professional development skills and leading-edge technologies. These established professionals collaborate to drive Productivity Point's business forward through entrepreneurial innovation, strategic partnerships, brand management and sales growth.
        </p>
    </div>
    <div class="col-md-6" style="padding:0px;">
        <video style="width:100%" src="videos/about_productivity.mp4" autoplay muted loop playsinline/>
    </div>
</div>

        <div class="row third-division zero-margin">
            <div class="col-md-6 zero-padding">
                <img class="about-page-img" src="images/about-page/EPP_Man%20teaching%20with%20Flow%20Chart.jpg" />
            </div>
            <div class="col-md-6 zero-padding">
                <div style="padding:20px;">
                    <h2>
                        What is Our Adult Learning Methodology and Approach to Training Services?
                    </h2>
                <div class="text-content">
                    <p>
                        In the learning environment, our instructors 
assume the four principles of the andragogy 
theory:
                    </p>
                    <ul>
                        <li>Adults prefer to learn from doing / experiences.</li>
                        <li>They’re interested in learning something that has immediate relevance.</li>
                        <li>They prefer a hands-on approach to learning.</li>
                        <li>They prefer to solve actual problems.</li>
                    </ul>
                </div>
                </div>
                
            </div>
        </div>

        <div class="row fourth-division zero-margin">
            <div class="col-md-4 zero-padding">
                <h2 class="content-item-heading">What is Our Training Delivery Strategy?</h2>
                <p class="content-item-content">
                    To achieve a high work 
performance culture, we 
provide interactive training 
and development 
programs designed 
specifically to instill, build, 
and change attitudes 
and/or behaviors towards 
several organizational 
functions.

                </p>
            </div>
            <div class="col-md-8 zero-padding">
                <img  class="about-page-img" src="images/about-page/EPP_shallow-focus-photo-of-woman-using-smartphone-3803219.jpg" />
            </div>
        </div>

        <div class="row fifth-division zero-margin">
            <div class="col-md-6 zero-padding">
                <img class="about-page-img" src="images/about-page/EPP_Depositphotos_21956067_xl-2015.jpg" />
            </div>
             <div class="col-md-6 zero-padding content-area">
                 <h2 class="content-item-heading">What are our Best Practices When Working with Our Clients?</h2>
                <p class="content-item-content"> 
                    We tap into the most contemporary thinking 
and best practices on topics that are proven to 
positively influence individual and 
organizational performance. 
                </p>
                 <p class="content-item-content"> 
                    Our professional development instructors
utilize the most compelling and impactful 
methods to teach business skills like 
emotional intelligence, communication, 
collaboration, and leadership.
                </p>
            </div>
        </div>

        <div class="row sixth-division zero-margin">
            <div class="col-md-7 zero-padding content-area">
                <h2 class="content-item-heading">What is Our Training Methodology?</h2>
                <p>
                    We deliver technical and professional development
trainings that simulate real-world scenarios and give 
learners a chance to hear actionable feedback based 
on their responses.
                </p>
                <p>
                    Productivity Point's combination of technology and 
professional skills training enables us to place a focused 
emphasis on the diversified business needs of our 
clients.
                </p>

            </div>
            <div class="col-md-5 zero-padding">
                <img class="about-page-img" src="images/about-page/EPP_woman-in-white-blazer-using-macbook-pro-4458412.jpg" />
            </div>
        </div>
    </div>               
</asp:Content>

