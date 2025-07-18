<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="search-results.aspx.cs" Inherits="ProductivityPointGlobal.courses.SearchResults" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="robots" content="noindex, follow" />
        <%#string.Format("<link rel=\"canonical\" href=\"{0}://{1}/search/{2}\" />", Request.Url.Scheme, Request.Url.Host,SeoCourseName) %>
    <style>
      .data-pager{text-align:center;color:#f67a06;border:solid 1px}.data-pager a{color:#f67a06}.data-pager .current{font-weight:700}.custom-right-sidebar-div{border-left:1px solid #fd6803;min-height:200px;padding-left:34px;margin-top:72px}.custom-right-sidebar-div>p{text-align:left;font-size:14px;line-height:1.8}.custom-right-sidebar-div>.sidebar-heading{border-bottom:1px solid #fd6803;font-size:18px;font-weight:500;margin-top:20px}.custom-right-sidebar-div>p>ul>li{text-align:left}.catalog-box{height:150px;text-align:left;margin-top:10px;margin-bottom:10px;overflow:hidden}.catalog-inner-box{height:140px;margin:5px;padding:.5em 1em .5em;border:2px solid #e5e5e5;border-radius:2px;overflow:hidden}.catalog-inner-box:hover{box-shadow:0 2px 6px 0 rgba(0,0,0,.4)}.catalog-inner-box>.catalog-heading{color:#fd6803;line-height:1.2;margin-bottom:0!important}.catalog-inner-box>.catalog-description{font-size:16px;height:20px;overflow:hidden;line-height:1.29}p{text-align:left;font-size:15px;line-height:1.5}ul{margin-top:0!important}ul>li{font-family:HelveticaNeueLTStd;color:#4c4c4c;font-size:14px;line-height:1.8}.custom-search-box{width:100%;margin:20px;box-shadow:0 2px 6px 0 rgba(0,0,0,.4);border:1px solid #efefef;line-height:2}.custom-search-box:focus{border:1px solid #efefef;outline-color:#fff}.no-outline:focus{outline-color:#fff}
    </style>
    <style>
        input[type=text]{width:100%;border:1px solid #e5e5e5;border-radius:4px;margin:8px 0;outline:0;padding:8px;box-sizing:border-box;transition:.3s}.inputWithIcon input[type=text]{padding-right:40px}.inputWithIcon{position:relative;margin:15px}.inputWithIcon img{position:absolute;right:20px;top:12px;height:30px;color:#aaa;transition:.3s}input[type=text]:focus{box-shadow:0 2px 6px 0 rgba(0,0,0,.4)}.catalog-heading>span{font-size:18px;font-weight:500;color:#fd6803}.search-margin-top{margin-top:50px}@media screen and (max-width:768px){.catalog-heading>span{font-size:17px}.custom-right-sidebar-div{border-left:unset;padding-left:20px}.search-margin-top{margin-top:148px}}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid subPage">
        <div class="row">
            <div class="container" style="width:100%;">
                <div class="row padding20T">
                    
                </div>
            </div>
        </div>
    </div>
    <%--<uc:Search ID="ucSearch" runat="server" />--%>

    <div class="container-fluid bgWhite subPage padding75B">

        <div class="row">
            <div class="container" style="width:100%;">
                <div class="row">
                    <div class="col-lg-8 col-md-6 col-sm-6 col-xs-12">
                        <div class="row search-margin-top">

                            <div class="col-md-offset-1 col-md-10 col-md-offset-1">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="inputWithIcon">
                                          <input type="text" onkeyup="keyup(event)" id="searchText" placeholder="Search ">
                                            <img onclick="searchButtonClicked()" style="margin-top:8px;" src="/images/cities_site_images/Search_Icon_2.png" />
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                               <div>
                                   <div class="row">
                                       <div class="col-md-offset-1 col-md-10">
                                           <p style="margin-left:20px;font-size:20px;"> 
                                           <%=SearchCount %> Results Found For "<asp:Literal ID="ltrSeoCN" runat="server" Visible="true" />"
                                        </p>
                                       </div>
                                   </div>
                                   
                               </div>
                                
                                <asp:ListView runat="server" ID="lvCourses">
                                    <EmptyDataTemplate>
                                        <p class="text-center bold">Nothing is found. Please search again.</p>
                                    </EmptyDataTemplate>
                                  <%--  <LayoutTemplate>          
                                    </LayoutTemplate>--%>
                                    <ItemTemplate>
                                        <div class="col-md-offset-1 col-md-10 catalog-box">
                                                  
                                            <div class="catalog-inner-box">
                                            <a href='<%# String.Format("/course/{0}/", ((string)Eval("seoCourseName")).Replace(" ","-").ToLower()) %>'>
                                            <div style="height:82px;overflow:hidden">
                                                <p class="catalog-heading" style="margin-bottom:0px;margin-top:10px;"><span> <%# Eval("courseName") %></span> </p>
                                                <p style="font-size:16px;line-height:1.3;margin-bottom:0px;" class="catalog-description">
                                                    <%# Eval("courseShortDescription") %>
                                                </p>
                                        </div>
                                            <div class="row" style="height:50px;">
                                                <div style="text-align:center;vertical-align:middle" class="col-sm-6">
                                                    <p style="margin-top:10px;font-size:17px;"><i><%# Eval("level1") %></i></p>
                                                </div>
                                                <div class="col-sm-6" style="position:absolute;bottom:6px;right:20px;">
                                                      <asp:Image class="pull-right" ID="image1" runat="server" Visible='<%#Eval("deliveryFormats").ToString().Contains("Live Online") %>' data-toggle="tooltip" title="Live Online"  ImageUrl='/images/cities_site_images/Live_Online.png' Height="30px" style="padding:4px;" />
                                                      <asp:Image class="pull-right" ID="image2" runat="server" Visible='<%#Eval("deliveryFormats").ToString().Contains("Classroom Live") %>'  title="Classroom Live"  ImageUrl='/images/cities_site_images/Classroom_Icon.png' Height="28px" />
                                                      <asp:Image class="pull-right" ID="image3" runat="server" Visible='<%#Eval("deliveryFormats").ToString().Contains("Classroom Virtual") %>'  title="Classroom Virtual"  ImageUrl='/images/cities_site_images/Classroom_Virtual.png' Height="28px" />
                                                      <asp:Image class="pull-right" ID="image4" runat="server" Visible='<%#Eval("deliveryFormats").ToString().Contains("On Demand") %>'  title="On Demand"  ImageUrl='/images/cities_site_images/On_Demand.png' Height="28px" />
                                                </div>
                                            </div>
                                        </a>    
                                        </div>
                                                 
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <%--<asp:Literal ID="ltrSeoCN" runat="server" Visible="false" />--%><%--'<%#Request.UserHostAddress %>'--%>
                        <asp:Literal ID="ltrUserIP" runat="server" Visible="false" />
                       <%-- <asp:SqlDataSource ID="sqlCourses" runat="server" ConnectionString='<%$ ConnectionStrings:SQLConnectionProd %>'
                            SelectCommand="dbo.sitesearch_s" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter Name="keyword" Type="String" ControlID="ltrSeoCN" PropertyName="Text" />
                                <asp:ControlParameter Name="userIP" Type="String" ControlID="ltrUserIP" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>--%>

                    </div>

                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 ">
                         <div class="custom-right-sidebar-div">
                            <p class="sidebar-heading">
                                Live Online Training
                            </p>
                            <p>
                                Live Online Training is changing the training industry. Blending the best from traditional face-to-face instructor-led training with the latest in conferencing technology,  
                                <ul>
                                    <li> Delivering live training to multiple locations at one time</li>
                                    <li>100% live, instructor led training in a classroom setting without excess travel. </li>
                                    <li>Dramatically reduced class cancellation rate.</li>
                                </ul>
                            </p>
                            <p class="sidebar-heading">
                                Classroom Virtual Training
                            </p>  
                             <p>
                                 Prefer to have a dedicated classroom for your virtual experience?  Attend live, hands-on training via remote instructor from one of Productivity Point’s multiple locations.
                                 <ul>
                                     <li>Course Curriculum tailored to your specifications and displaying your organization's branding.</li>
                                     <li>On-Line course evaluations provided for your review.</li>
                                     <li>Post-Assessments to ensure your learners have fully comprehended the course content.</li>
                                 </ul>
                             </p>
                             <p class="sidebar-heading">
                                Classroom Live Training
                            </p>
                            <ul>
                                <li>
                                    Get in-person, hands-on instruction with live lab exercises taught by subject matter experts who deliver authorized and industry-leading content.
                                </li>
                                <li>
                                    With classrooms in almost every major U.S. city, Productivity Point has something for users of every level, so you can earn the most popular industry certifications. You get hands-on learning experience with live lab exercises taught by experienced instructors. 
                                </li>
                                <li>
                                    We proudly advocate our learning services to be hosted by the best-qualified trainers in terms of technical knowledge and teaching skills
                                </li>
                            </ul>
                             <p class="sidebar-heading">
                                Private Group Training
                            </p>
                             <p>
                                 Your private group classroom experience will not only take place in the location of your choice (including any of our training centers), but you will enjoy the following amenities:
                             </p>
                             <ul>
                                 <li>
                                     Instructor Consult to get to know your instructor and convey your customized requirements
                                 </li>
                                 <li>
                                     Course Curriculum tailored to your specifications and displaying your organization's branding
                                 </li>
                                 <li>
                                     On-Line course evaluations provided for your review
                                 </li>
                                 <li>
                                     Post-Assessments to ensure your learners have fully comprehended the course content
                                 </li>
                             </ul>
                            <p class="sidebar-heading">
                                On-Demand Learning
                            </p>                            
                            <p>
                                On-Demand is an IT training solution designed around your schedule, budget, and learning needs. Combining high-quality video, reading, and knowledge checks in a self-paced format, On-Demand helps you build skills as your schedule allows—all at once or five minutes at a time. 
                            </p>
                             <p>With On-Demand, you learn at your own pace and in the convenience of your own space, with Learn at your own pace</p>
                             <ul>
                                 <li>Personal industry leading trainers and instructors right on your own desktop.</li>
                                 <li>Acquire leverage to better career opportunities.</li>
                                 <li>Learn the latest information technology.</li>
                                 <li>Increase your earning potential</li>
                                 <li>Get Certified</li>
                             </ul>
                             <p style="font-size:18px;margin-top:14px;">Try Before You Buy</p>
                            <p>
                                If you would like to experience OnDemand before you purchase, send an
                                email to:
                                <a href="mailto:ondemand@productivitypointls.com">ondemand@productivitypointls.com</a> 
                                to receive your Course Demo Code
                            </p>
                        </div>
                    </div>
                    
                </div>                    
            </div>
        </div>
    </div>	
    <script>
        var input = document.getElementById("searchText"); function keyup(e) { 13 === e.keyCode && (e.preventDefault(), searchButtonClicked()) } function searchButtonClicked() { var e = document.getElementById("searchText").value; "" != e && (window.location.href = "/search/" + e) } input.addEventListener("keyup", function (e) { 13 === e.keyCode && (e.preventDefault(), searchButtonClicked()) });
    </script>
</asp:Content>