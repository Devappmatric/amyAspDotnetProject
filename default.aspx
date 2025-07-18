<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="ProductivityPointGlobal.DefaultPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">   
    <%#string.Format("<link rel=\"canonical\" href=\"{0}://{1}/\" />", Request.Url.Scheme, Request.Url.Host) %>

	<style type="text/css">
		.hero-links{ display: flex; flex-flow: row wrap; position: relative; margin-top: 8px; }

		.hero-links > a{ flex: 1; height: 360px; padding: 10px; flex-basis: 30%; text-decoration: none; z-index: 10; overflow: hidden; }
		.hero-links > a.bord-b{ border-bottom: 1px solid #fff; }
		.hero-links > a.bord-r{ border-right: 1px solid #fff; }
		.hero-links > a > h3{ color: #fff; text-align: center; }
		.hero-links > a > .details{ opacity: 0; color: #fff; transition: all ease-in-out .2s; }
		.hero-links > a > .details > p{ color: #fff; }

		.hero-links > .bg{ position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-size: cover; z-index: 1; transition: all ease-in-out .5s; }
		.hero-links > .bg.img1{ background-image: url("/images/home_hero/main_1.jpg"); }
		.hero-links > .bg.img2{ background-image: url("/images/home_hero/main_2.jpg"); }
		.hero-links > .bg.img3{ background-image: url("/images/home_hero/main_3.jpg"); }
		.hero-links > .bg.img4{ background-image: url("/images/home_hero/main_4.jpg"); }
		.hero-links > .bg.img5{ background-image: url("/images/home_hero/main_5.jpg"); }
		.hero-links > .bg.img6{ background-image: url("/images/home_hero/main_6.jpg"); }

		.hero-links > a:hover{ background: #033654; }
		.hero-links > a:hover > h3 { color: #F67A06; }
		.hero-links > a:hover > .details{ opacity: 1; color: #fff; }

		.hideo{ opacity: 0; }
		.showo{ opacity: 1;}

		@media screen and (max-width: 1200px){
			.blank{ height: 155px; }
		}

		@media screen and (max-width: 991px){
			.hero-links{ flex-flow: column; margin-top: 128px; }
			.hero-links > a{ background: #033654; border-bottom: 1px solid #fff; border-right: none; }
			.hero-links > a > h3 { color: #F67A06; }
			.hero-links > a > .details{ opacity: 1; color: #fff; }
			.hero-links > a.bord-r{ border-right: none; }
			.blank{ display: none; }
		}

		@media screen and (max-width: 767px) {
			.hero-links{ margin-top: 40px; }
		}
	</style>
    <link href="styles/newslider.css" rel="stylesheet" />
    <style>
        .carousel-caption{position:absolute;right:15%;top:30%;left:15%;z-index:10;padding-top:20px;padding-bottom:20px;color:#fff;text-align:center;text-shadow:0 1px 2px rgba(0,0,0,.6)}.carousel-caption>h3{color:#fff}.carousel-caption>p{color:#fff}.swiper-container{width:100%;height:100vh}body{margin-top:0;font-family:Candara!important}.first-slide{background:url('<%# HomeBannerOneImage %>') no-repeat center center;height:100%;width:100%;background-size:cover;background-repeat:no-repeat;position:absolute;left:0;right:0}.second-slide{background:url('<%# HomeBannerTwoImage %>') no-repeat center center;height:100%;width:100%;background-size:cover;background-repeat:no-repeat;position:absolute;left:0;right:0}.third-slide{background:url('<%# HomeBannerThreeImage %>') no-repeat center center;height:100%;width:100%;background-size:cover;background-repeat:no-repeat;position:absolute;left:0;right:0}.navWhite{background:0 0;background-color:rgba(0,0,0,.3)!important}.header-links>i{color:#fff!important}.navbar-default{background-color:unset!important}.navbar-default .navbar-nav>li>a{color:#fff!important}.header-links{color:#fff!important}.header-links>i{color:#fff!important}label[for=searchBtn] i{color:#fff!important}label[for=searchBtn] i:hover{color:#fff!important}.header-links>i{color:#fff!important}.header-links-mobile{color:#fff!important}@media screen and (max-width:992px){.navWhite{background:0 0;background-color:rgba(0,0,0,.8)!important}}.mobile-slider-header>.col-md-12>h2{font-size:36px;font-family:Candara}.mobile-slider-description>p{color:#fff;font-size:22px!important;font-family:Candara;font-weight:700}.mobile-slider-header-text{font-size:36px;color:unset;line-height:32px;font-family:Candara;font-weight:700}    
    </style>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link href="styles/owl.carousel.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
   
    <div >
        <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <div class="second-slide">
                    <div class="mobile-slider-header hidden-md hidden-lg" style="top:30%;">
                        <div class="col-md-12">
                            <h2>
                                <p class="mobile-slider-header-text montserrat-no-bold"> Desktop</p>
                                <p class="mobile-slider-header-text montserrat-no-bold">Applications</p>
                                <p class="mobile-slider-header-text montserrat-no-bold">Training Courses</p> 
                            </h2>
                        </div>
                    </div>
                    <div class="slider-content">  
                        <div class="row">
                               
                            <div class="col-md-4 ">
                                <div class="caraousel-item-box  first-caraousel-slide hidden-sm hidden-xs">
                                    <h2>
                                    <b>CERTIFIED TECHNICAL TRAINING</b>
                                </h2>
                                <p>
                                    Build Your Technical<br /> Expertise with Industry<br /> Leading Training Courses
                                </p>
                                </div>
                                      
                        </div>
                            <div class="col-md-4">
                                <div class="caraousel-item-box  caraousel-item-box-active second-caraousel-slide hidden-sm hidden-xs">
                                    <h2>
                                    <b> DESKTOP APPLICATIONS</b>

                                </h2>
                                <p>
                                    Boost your End-<br>User Skills with Live<br /> Online Training

                                </p>
                                </div>
                                     
                        </div>
                        <div class="col-md-4 ">
                            <div class="caraousel-item-box third-caraousel-slide hidden-sm hidden-xs">
                                <h2>
                                    <b> BUSINESS SKILLS</b>
                                </h2>
                                <p>
                                    Enhance Your <br />Professional <br /> Development Skills
                                </p>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="mobile-slider-description hidden-md hidden-lg">
                        <p>
                            Boost your End-User Skills <br>with Live Online Training

                        </p>
                    </div>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="first-slide">
                    <div class=" mobile-slider-header hidden-md hidden-lg" style="top:30%;">
                            <div class="col-md-12">
                                <h2>
                                    <p class="mobile-slider-header-text montserrat-no-bold">Authorized Technical</p>
                                    <p class="mobile-slider-header-text montserrat-no-bold">Training and</p>
                                    <p class="mobile-slider-header-text montserrat-no-bold">Certifications</p>
                                </h2>
                            </div>
                    </div>
                     <div class="slider-content">
                         <div class="row">
                               
                                 <div class="col-md-4 ">
                                     <div class="caraousel-item-box caraousel-item-box-active  first-caraousel-slide hidden-sm hidden-xs">
                                         <h2>
                                            <b>CERTIFIED TECHNICAL TRAINING</b>
                                        </h2>
                                        <p>
                                            Build Your Technical<br /> Expertise with Industry<br /> Leading Training Courses
                                        </p>
                                     </div>
                                      
                                </div>
                                 <div class="col-md-4">
                                     <div class="caraousel-item-box  second-caraousel-slide hidden-sm hidden-xs">
                                          <h2>
                                            <b>DESKTOP APPLICATIONS</b>

                                        </h2>
                                        <p>
                                            Boost your End-<br>User Skills with Live<br /> Online Training

                                        </p>
                                     </div>
                                     
                                </div>
                              <div class="col-md-4 ">
                                    <div class="caraousel-item-box third-caraousel-slide hidden-sm hidden-xs">
                                        <h2>
                                           <b> BUSINESS SKILLS</b>
                                        </h2>
                                        <p>
                                            Enhance Your <br />Professional <br /> Development Skills
                                        </p>
                                    </div>
                                </div>
                            </div>
                     
                    </div>
                    <div class="mobile-slider-description hidden-md hidden-lg">
                        <p>
                            Build Your Technical<br /> Expertise with Industry<br /> Leading Training Courses
                        </p>
                    </div>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="third-slide">
                     <div class=" mobile-slider-header hidden-md hidden-lg" style="top:30%;">
                            <div class="col-md-12">
                                 <h2>
                                    <p class="mobile-slider-header-text montserrat-no-bold">Professional</p>
                                    <p class="mobile-slider-header-text montserrat-no-bold">Development</p>
                                    <p class="mobile-slider-header-text montserrat-no-bold">Training Courses</p> 
                                </h2>
                            </div>
                    </div>
                    <div class="slider-content">
                         <div class="row">
                               
                                 <div class="col-md-4">
                                     <div class="caraousel-item-box  first-caraousel-slide hidden-sm hidden-xs">
                                         <h2>
                                            <b>CERTIFIED TECHNICAL TRAINING</b>
                                        </h2>
                                        <p>
                                            Build Your Technical<br /> Expertise with Industry<br /> Leading Training Courses
                                        </p>
                                     </div>
                                      
                                </div>
                                 <div class="col-md-4">
                                     <div class="caraousel-item-box  second-caraousel-slide hidden-sm hidden-xs">
                                          <h2>
                                            <b> DESKTOP APPLICATIONS</b>

                                        </h2>
                                        <p>
                                            Boost your End-<br>User Skills with Live<br /> Online Training

                                        </p>
                                     </div>
                                     
                                </div>
                              <div class="col-md-4 ">
                                    <div class="caraousel-item-box caraousel-item-box-active third-caraousel-slide hidden-sm hidden-xs">
                                        <h2>
                                           <b> BUSINESS SKILLS</b>
                                        </h2>
                                        <p>
                                            Enhance Your <br />Professional <br /> Development Skills
                                        </p>
                                    </div>
                                </div>
                            </div>
                     
                    </div>
                   <div class="mobile-slider-description hidden-md hidden-lg">
                        <p>
                            Enjoy our Live Online <br />Instructor Led Training
                        </p>
                    </div>
                </div>
            </div>

            <div class="slider-search-box hidden-md hidden-lg">
                 <div>
                    <div class="col-xs-12">
                        <div class="inputWithIcon" style="z-index:10000;">
                            <input class="form-control" style="height:40px;" type="text" onkeyup="keyup(event)" id="searchText" placeholder="Search ">
                            <img onclick="searchButtonClicked()" alt="Search" src="/images/cities_site_images/Search_Icon_2.png" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    <!-- If we need pagination -->
        <div style="text-align:center;">
            <div class="swiper-pagination hidden-md hidden-lg"></div>
        </div>
    

  <%-- <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>--%>

</div>
    
<div style="margin-top:30px;" class="container-fluid bgSilver hidden-md hidden-lg">
<%--    <uc:SearchHome ID="ucSearchHome" runat="server" />    --%>
</div>

    <div class="container-fluid sectionDividerTop"></div>
    
<div class="container-fluid">
    <div class="row altColBlue">
        <div class="col-lg-5 col-md-6 col-sm-6 hidden-xs section1ResponsiveImage">            
        </div>
        <div class="col-lg-1 hidden-md hidden-sm hidden-xs"></div>
        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 text-left">
            <a href="delivery-methods.aspx"><p class="sectionHeading text-left subSectionPadding whiteFontResponsive">Individual & Corporate Training</p></a>
            <p class="whiteFontResponsive">Whether you're an individual, small business, large corporation or
                municipality we have training courses to fit your needs. Providing
                our clients corporate training solutions is our passion. Productivity Point works
                with internationally renowned partners so you can rest assured you
                are taking industry standard courses and sharpening your skills
                portfolio.</p>
            <div class="section2"><asp:HyperLink ID="hlFindOutMore" CssClass="btn btn-success btnPadding" Text="Find out more" NavigateUrl="~/delivery-methods.aspx" runat="server" /></div>
        </div>
        <div class="col-lg-2 hidden-md hidden-sm hidden-xs"></div>
    </div>
</div>
   
    
   
<div class="container-fluid sectionDividerTop"></div>
    
<div class="container-fluid">
    <div class="row">        
        <div class="col-lg-2 hidden-md hidden-sm hidden-xs"></div>
        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 text-left">
            <a href="event-hosting.aspx"><p class="sectionHeading text-left subSectionPadding">Event Hosting & Planning<br class="hidden-md hidden-sm hidden-xs"/> Services</p></a>
            <p>Enjoy a high end educational environment and allow Productivity Point
                Learning Solutions to support your corporate training sessions, meetings,
                conferences and computer labs with the highest standard of customer
                service, catering and the latest technology available.</p>
            <div class="section2"><asp:HyperLink ID="HyperLink6" CssClass="btn btn-success btnPadding" Text="Find out more" NavigateUrl="~/event-hosting.aspx" runat="server" /></div>
        </div>
        <div class="col-lg-1 hidden-md hidden-sm hidden-xs"></div>
        <div class="col-lg-5 col-md-6 col-sm-6 hidden-xs section2ResponsiveImage">            
        </div>
    </div>
</div>

    
    <div class="container-fluid section4ResponsiveImage">
    <div class="container">
        <div class="row padding75B">
            <div class="col-lg-12 padding20B">
                <h1 class="sectionHeading text-center white fontShadow padding65T">The Productivity Point Learning Solutions Difference</h1>
                <br/>
                <p class="text-center white fontShadow">Productivity Point Learning Solutions has partnered with 120 national classrooms across the country to conveniently bring professional and technical training<br class="hidden-md hidden-sm hidden-xs"/>
                    services to you. We offer over 500 Technical, Desktop, Project Management and Professional Development courses to fit all of your corporate growth<br class="hidden-md hidden-sm hidden-xs"/>
                    needs. Over the course of 15 years we have worked with countless individuals, businesses and municipalities, learning what instruction style is the<br class="hidden-md hidden-sm hidden-xs"/>
                    most effective and how to execute seamless events. Thousands of successful trainees have attended Productivity Point Learning Solutions to enhance their<br class="hidden-md hidden-sm hidden-xs"/>
                    credentials and to sharpen their professional portfolios.</p>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="homeInfoBox">
                    <div class="text-center padding40T"><img src="/images/icon1.png" class="lazyload" alt="Technical and Professional Courses Offered"/></div>
                    <p class="sectionHeading text-center white fontShadow padding10T">500</p>                    
                    <p class="text-center white">Technical and Professional<br class="hidden-md hidden-sm hidden-xs"/>
                        Courses Offered</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="homeInfoBox">
                    <div class="text-center padding40T"><img src="/images/icon2.png" class="lazyload" alt="Technical and Professional Courses Offered"/></div>
                    <p class="sectionHeading text-center white fontShadow padding10T">120</p>
                    <p class="text-center white">National Classrooms Across<br class="hidden-md hidden-sm hidden-xs"/>
                        America and Abroad</p>
                </div>                
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="homeInfoBox">
                    <div class="text-center padding40T"><img src="/images/icon3.png" class="lazyload" alt="Technical and Professional Courses Offered"/></div>
                    <p class="sectionHeading text-center white fontShadow padding10T">30,000</p>                    
                    <p class="text-center white">Successful Students<br class="hidden-sm hidden-xs"/>&nbsp;&nbsp;</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="homeInfoBox">
                    <div class="text-center padding65T"><img src="/images/icon4.png" class="lazyload" alt="Technical and Professional Courses Offered"/></div>
                    <p class="sectionHeading text-center white fontShadow padding10T">15</p>
                    <p class="text-center white">Years of Service -<br class="hidden-md hidden-sm hidden-xs"/>
                        a Proven Track Record</p>
                </div>                
            </div>
        </div>
    </div>
</div>
    

    
<div class="container-fluid sectionDividerTop"></div>

    <div class="container">
    <div class="row">
        <div class="col-md-12 col-md-12 col-sm-12 col-xs-12">
                <p class="sectionHeading text-center subSectionPadding">Certified training designed to exceed your personal goals<br/>
                    as well as your Team's effectiveness and productivity</p>
            <p class="sectionSubHeading text-center">Help your staff succeed by providing them skilled instructors, extensive hands-on<br/>
                lab exercises and state-of-the-art corporate training venues.</p>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 text-center padding65T altCol">
            <a href="technical-courses.aspx"><img src="/images/home1.png" class="lazyload" alt="Technical Courses"/></a>
            <br/><br/>
            <a href="technical-courses.aspx"><p class="sectionSubHeading2">Technical Courses</p></a>
            <p>Add value to your portfolio with<br class="hidden-md hidden-sm hidden-xs"/>
                industry-recognized IT Skills training and certifications.<br class="hidden-md hidden-sm hidden-xs"/>
                Productivity Point offers official certified courses<br class="hidden-md hidden-sm hidden-xs"/>
                in: Cisco, CompTIA, ITIL, Microsoft,<br class="hidden-md hidden-sm hidden-xs"/>
                Oracle, Red Hat Linux, VMware, and more.</p>            
            <div class="section1Col1"><asp:HyperLink ID="hlechnicalCourses" CssClass="btn btn-success btnPadding" Text="More Info" NavigateUrl="~/technical-courses.aspx" runat="server" /></div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 text-center padding65T">
            <a href="desktop-applications.aspx"><img src="/images/home2.png" class="lazyload" alt="Desktop Applications"/></a>
            <br/><br/>
            <a href="desktop-applications.aspx"><p class="sectionSubHeading2">Desktop Applications</p></a>
            <p> Our desktop courses range from beginner to<br class="hidden-md hidden-sm hidden-xs"/>
                advanced .Choose from a variety of options,<br class="hidden-md hidden-sm hidden-xs"/>
                such as: Windows 365, Word, Excel, Access,  <br class="hidden-md hidden-sm hidden-xs"/>
                 PowerPoint,Outlook, Microsoft Project,<br class="hidden-md hidden-sm hidden-xs"/>
                 Adobe Photoshop, OneNote, SharePoint,<br class="hidden-md hidden-sm hidden-xs"/>
                 SQL, Crystal Reports and more.</p>
            <div class="section1Col2"><asp:HyperLink ID="hlDesktopApplications" CssClass="btn btn-success btnPadding" Text="More Info" NavigateUrl="~/desktop-applications.aspx" runat="server" /></div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 text-center padding65T altCol">
            <a href="professional-development.aspx"><img src="/images/home3.png" class="lazyload" alt="Professional Development"/></a>
            <br/><br/>
            <a href="professional-development.aspx"><p class="sectionSubHeading2">Professional Development</p></a>
            <p>Our array of Staff and Business Professional<br class="hidden-md hidden-sm hidden-xs"/>
                Development courses include: Business <br class="hidden-md hidden-sm hidden-xs"/>
                Analyst, Agile Project Management, PMP <br class="hidden-md hidden-sm hidden-xs"/>
                (Project Management), Certified Scrum <br class="hidden-md hidden-sm hidden-xs"/>
                Master Bootcamp, Critical Thinking, Team <br class="hidden-md hidden-sm hidden-xs"/>
                Building Skills and much more.</p>
            <div class="section1Col3"><asp:HyperLink ID="hlProfessionalDevelopment" CssClass="btn btn-success btnPadding" Text="More Info" NavigateUrl="~/professional-development.aspx" runat="server" /></div>
        </div>
    </div>   
</div>
    
<div class="container-fluid">
    <div class="row section3ResponsiveImage"></div>
</div>
        
</asp:Content>

<asp:Content ID="homeScripts" runat="server" ContentPlaceHolderID="bodyScripts">
<%--    <script src="https://unpkg.com/swiper/swiper-bundle.js"></script>--%>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

         <script src="/scripts/newslider.js"></script>
    <script>
        $('.first-caraousel-slide').on('click', function () {
            window.location.href = "/technical-courses.aspx";
        });
         $('.second-caraousel-slide').on('click', function () {
            window.location.href = "/desktop-applications.aspx";
         });
         $('.third-caraousel-slide').on('click', function () {
            window.location.href = "/professional-development.aspx";
        });
        $('#myCarousel').on('slide',function(){
            $('#myCarousel .active .carousel-caption').fadeOut();
        });

        $('#myCarousel').on('slid',function(){
            $('#myCarousel .active .carousel-caption').fadeIn();
        });
    

            </script>
	<script>
        document.onscroll = function () {
            $("#header-logo-homepage").attr("src", "/images/site/PPG_Solutions-01.svg");
            $("#header-logo-homepage").attr("style", "margin-top:-5px;");
        };
        (function () {
            isHomePage = true;
            document.getElementById("top-navigation-headers").style.height = "44";
            $("#header-logo-homepage").attr("src", "/images/homepage/new-logo.png");
            $("#header-logo-homepage").attr("style", "margin-top:10px;");
            $("#cart-image").attr("src", "/images/site/cart.png");
            $("#contact-image").attr("src", "/images/site/chat2.png");
            $("#searchIconImage").attr("src", "/images/site/search-icon-white.png");
			Array.prototype.slice.apply(document.querySelectorAll(".hero-links > a")).forEach(function(el){
				el.addEventListener("mouseover", function(){
					Array.prototype.slice.apply(document.querySelectorAll(".bg")).forEach(function(bg){
						bg.classList.add("hideo");
						bg.classList.remove("showo");
					});

					this.classList.forEach(function(cls){
						if(cls.indexOf("img") >= 0){
							document.querySelector(".bg." + cls).classList.remove("hideo");
							document.querySelector(".bg." + cls).classList.add("showo");
						}
					});
				});
			});
		})();
	</script>
    <script>
        var input = document.getElementById("searchText");
        input.addEventListener("keyup", function (event) {
          // Number 13 is the "Enter" key on the keyboard
          if (event.keyCode === 13) {
            // Cancel the default action, if needed
            event.preventDefault();
              searchButtonClicked();
          }
        });
        function keyup(event) {
             if (event.keyCode === 13) {
            // Cancel the default action, if needed
            event.preventDefault();
              searchButtonClicked();
          }
        }

        function searchButtonClicked(){
            var searchText = document.getElementById("searchText").value;
            if (searchText == "")
                return;
            window.location.href = "/search/" + searchText;
        }
    </script>
</asp:Content>