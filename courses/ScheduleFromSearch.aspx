<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="ScheduleFromSearch.aspx.cs" Inherits="ProductivityPointGlobal.courses.ScheduleFromSearch" %>

<% @Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrCanonical" runat="server"></asp:Literal>

    <style type="text/css">
    .view{ background: url('<%# BannerPath %>') ; background-size: 100% auto; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;height:372px; }
    .custom-right-sidebar-div{border-left:1px solid #fd6803;min-height:200px;padding-left:30px;margin-top:22px}.custom-right-sidebar-div>p{text-align:left;font-size:14px;line-height:1.8}.custom-right-sidebar-div>.sidebar-heading{border-bottom:1px solid #fd6803;font-size:18px;font-weight:500;margin-bottom:5px;padding-bottom:7px;line-height:1.5}.custom-right-sidebar-div>p>ul>li{text-align:left}.training-delivery-method-box{background-color:#fff;padding-top:34px;padding-bottom:34px;margin-top:20px;margin-left:120px;margin-right:120px;}.training-delivery-method-box>.training-delivery-heading{text-align:center}.training-delivery-heading{font-size:28px;font-weight:500}.training-delivery-method-box>.training-delivery-content>p{font-size:24px;padding-bottom:20px}.training-delivery-method-box>.training-delivery-heading>h2{text-align:center}.training-delivery-image-box{text-align:center;font-size:24px;font-weight:600}.training-delivery-image-box>img{height:100px;margin-bottom:20px}.training-delivery-image-box>p{text-align:center}.delivery-methods-image>img{height:80px}.delivery-methods-header>h1{margin-top:34px}.delivery-method-description{font-size:16px}.delivery-method-box{margin-top:0}div{font-family:HelveticaNeueLTStd;color:#4c4c4c;font-size:16px}.training-delivery-image-box>img:hover{transform:scaleX(1.2) scaleY(1.2)}.address-box>p{line-height:15px}.address-box>h3{margin-bottom:26px}.address-box>.address-header{font-size:24px}.address-box>.map-link{color:#00f;margin-top:40px;margin-bottom:40px}.map-link>a:hover{color:#00f;opacity:.8}.map-link>a{font-size:15px}.map-box{margin-top:2px}p{text-align:left;font-size:15px;line-height:1.5}.training-delivery-image-box>img:hover{transform:scaleX(1.2) scaleY(1.2)}.objective-break{margin:5px}ul>li{font-family:HelveticaNeueLTStd;color:#4c4c4c}div{font-family:HelveticaNeueLTStd;color:#4c4c4c}.section1RowSubpage{margin-top:0;margin-bottom:0}.section1RowSubpage>h1{font-size:32px;margin-top:0;margin-bottom:0}.delivery-method-box{margin-top:18px}.table thead{color:#fd6803!important}.breadcrumb-box{color:#fff;margin-top:30px;margin-left:10px;margin-bottom:0}.breadcrumb-link{color:#fff}.breadcrumb-link:hover{opacity:.8;color:#fff!important}.breadcrumb-active-link{color:#fff}.breadcrumb-active-link:hover{color:#fff;opacity:1}iframe{width:100%;height:316px}.subPage ul{margin:0}
    .city-main-page-right-sidebar-div{min-height:200px;margin-top:26px}.city-main-page-right-sidebar-div>p{text-align:left;font-size:14px;line-height:1.8}.city-main-page-right-sidebar-div>.sidebar-heading{border-bottom:1px solid #fd6803;font-size:18px;font-weight:500}.city-main-page-right-sidebar-div>p>ul>li{text-align:left;font-size:14px;line-height:1.8}
    </style>
    <style>
    #exTab4 .nav-pills>li>a{border-radius:4px 4px 0 0;height:162px}#exTab4 .nav-pills>li{width:20%;margin-left:0}#exTab4 .nav-pills>li.active>a,.nav-pills>li.active>a:focus,.nav-pills>li.active>a:hover{color:#fff;background-color:#fff;border-bottom:2px solid #fd6803}#exTab3{padding:20px}#exTab3 .nav-pills>li>a{border-radius:4px 4px 0 0}#exTab3 .nav-pills>li{width:25%;margin-left:0}#exTab3 .tab-content{color:#fff;background-color:#fff;padding:5px 15px}.tab-image{height:80px}.nav-pills>li.active>a,.nav-pills>li.active>a:focus,.nav-pills>li.active>a:hover{color:#fff;background-color:#fff;border-bottom:2px solid #fd6803}.tab-image-inside{height:100px}.nav-pills>li{width:24%}.section1RowSubpageCityPage{margin-top:50px;margin-bottom:50px}.catalog-link-style{font-size:18px;padding:2px}.tab-inner-div{padding-left:20px;padding-right:40px;text-align:left}.tab-content>.tab-pane{margin-left:60px;padding-right:100px}.delivery-methods-header>.training-delivery-heading{margin-bottom:15px}ul{line-height:1.8}.table thead{font-family:HelveticaNeueLTStd}.table tr td{font-family:HelveticaNeueLTStd;font-size:18px}.table>thead>tr>td{font-family:HelveticaNeueLTStd;font-size:18px}p{color:#595959}div{color:#595959}body{color:#595959}
    </style>
    <style>
        #exTab4 .nav-pills>li.active>a,.nav-pills>li.active>a:focus,.nav-pills>li.active>a:hover{background-color:#eee !important}.nav-pills>li.active>a,.nav-pills>li.active>a:focus,.nav-pills>li.active>a:hover{background-color:#eee}.mobile-tab-image{background-color:#fd6803;border:1px solid #fd6803}@media screen and (max-width:992px){#exTab4 .nav-pills>li>a{height:30px;width:30px;padding:10px;border-radius:150px}#exTab4 .nav-pills>li{padding:10px}.training-delivery-method-box{margin-left:10px;margin-right:10px}.tab-content>.tab-pane{margin-left:10px;padding-right:10px}.custom-right-sidebar-div{border-left:unset;padding-left:0}}.gtr-box{margin-top:30px;color:#fd6803;text-align:right;font-family:HelveticaNeueLTStd;font-size:16px}@media screen and (max-width:572px){.gtr-box{margin-top:0}}
    #exTab4 .nav-pills>li>a:hover{background-color:white;border-bottom: 2px solid #fd6803;}
     #exTab3 .nav-pills>li>a:hover{background-color:white;border-bottom: 2px solid #fd6803;}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       </style>
    <style>
        .gtr-box{
            margin-top:30px;
        }
        .course-header-width{
            width:636px;
        }
        .course-header-second-width{
            font-size:32px;
        }

         @media screen and (max-width: 572px)  {
             .course-header-width {
                width:100%;
                padding-top:50px;
                font-size:31px !important;
            } 

             .padding110T{
                 padding-top:110px !important;
             }

             h1{
                  font-family:sans-serif !important;
                font-weight:300 !important;
             }

             .course-header-second-width{
                 font-size:28px !important;
             }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div id="HeadingDiv" class="container-fluid view subPage" runat="server">
        <div class="row" id="banner-area">
            <p class="breadcrumb-box hidden-sm hidden-xs">
                 <a style="font-size:11px"  class="breadcrumb-link" href="/">Home</a> >
                <a style="font-size:11px"  class="breadcrumb-link"  href="/<%=Cat1.Replace(" ","-").ToLower()%>.aspx"><%=Cat1 %></a> >
                <%if (CatalogTopic != null&&CatalogTopic!="")
                        { %>
                    <a style="font-size:11px"  class="breadcrumb-link" href="/topic/<%=CatalogTopic.Replace(" ", "-").ToLower()%>/<%=Cat1.Replace(" ", "-").ToLower()%>"><%=CatalogTopic %></a> >
                <%}
                else
                { %>
                    <a style="font-size:11px"  class="breadcrumb-link" href="/brand/<%=CatalogBrand.Replace(" ", "-").ToLower()%>/<%=Cat1.Replace(" ", "-").ToLower()%>"><%=CatalogBrand %></a> >
                <%} %>
                <a style="font-size:11px"  class="breadcrumb-link" href="/course/<%=SeoCourseName.Replace(" ","-") %>" ><%=CourseName %> </a> >
                <a style="font-size:11px"  class="breadcrumb-active-link">Schedule </a>
            </p>
            <div class="" style="height:276px;margin-left:10px;">
                <div class=" padding0T padding110T" style="padding-top:60px;padding-bottom:30px;">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">  
                       <div class="section1RowSubpage">
                        <h1 style="font-size:35px;line-height:1.3;" class="course-header-width white fontShadow"><%=CourseName %></h1>
                        <h1 style="line-height:1.3;margin-top:8px;font-style:italic;" class="course-header-second-width white fontShadow"> Class Schedule</h1>
                    </div>
                    </div>
                    <div class="col-lg-4 col-md-5 col-sm-6 col-xs-12 margin20T responsiveCol">
                        <%--<uc:ContactForm runat="server" />--%>
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
                    <asp:FormView ID="ctlCourseDetails" DefaultMode="ReadOnly" RenderOuterTable="false" runat="server">
                        <ItemTemplate>                                
                            <div style="display:none">
                                <p style="font-size:22px;line-height:1.3" class="sectionHeadingSubPage text-left subSectionPadding"><asp:Literal ID="ltrName" runat="server" Text='<%# Eval("courseName") %>' /></p>
                                <div class="clearfix"></div>
                            </div>                                
                             <div style="width:100%;overflow:auto">
                                 <table style="margin-top:20px;" class="table">
                                <thead>
                                    <td>Category</td>
                                    <td>ID</td>
                                    <td>Duration</td>
                                    <td>Level</td>
                                    <td>Price</td>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <%# Eval("cat2") %>
                                    </td>
                                    <td>
                                       <asp:Literal ID="ltrCourseId" runat="server" Text='<%# Eval("courseId") %>' />
                                    </td>
                                    <td>
                                        <%# Eval("duration") %> Day(s)
                                    </td>
                                    <td>
                                        <%# Eval("level1") %> 
                                    </td>
                                    <td>$<%#decimal.Parse(Eval("price").ToString()).ToString("0,00.00") %></td>
                                </tr>
                                </tbody>
                            </table>
                             </div>                        
                            
                            <asp:PlaceHolder runat="server" Visible="false">
                            <asp:HyperLink ID="ctlCourseOutline" Text="" ToolTip="Course Outline" NavigateUrl='<%# String.Format("~/courseoutlines/{0}.pdf", Server.HtmlEncode(Eval("courseOutline").ToString())) %>' CssClass="btn btn-primary" Target="_blank" runat="server" ><i class="fa fa-file-pdf-o"></i>&nbsp;&nbsp;Course Outline</asp:HyperLink>

                            </asp:PlaceHolder>
                        </ItemTemplate>
                    </asp:FormView>
                   <div class="row">
                        <div class="col-md-8" id="schedule-heading-area" style="text-align:left" >
                            <p style="padding-top:25px;font-size:23px;line-height:1.3" class="sectionHeadingSubPage text-left subSectionPadding">
                                <%=CourseName %><p />
                            <p style="padding-top:1px;font-size:22px;line-height:1.3"> Class Schedule</p>
                            <p style="padding-top:1px;font-size:20px;line-height:1.3;font-style:italic"> <%=ScheduleNotes %></p>

                        </div>
                         <div  class="col-md-3 gtr-box">
                              <img style="height:80px;" src="/images/site/GTR_New.png" />
                            <%--<span class="label label-primary"> GTR</span><br />
                            <p style="margin-top:4px;text-align:right;color:#337ab7;font-weight:600;"><span style="font-size:16px;">Guaranteed to Run</span></p>--%>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-9">

                        </div>
                       
                    </div>
                   <%-- <table style="width:100%">
                        <tr>
                            <td style="width:70%;text-align:left" >  <p style="padding-top:25px;font-size:23px;line-height:1.3" class="sectionHeadingSubPage text-left subSectionPadding">
                                <%=CourseName %><p /><p style="padding-top:1px;font-size:22px;line-height:1.3"> Training Schedule</p></td>
                            <td style="color:#FD6803;width:40%;text-align:right;font-family:HelveticaNeueLTStd;font-size:16px">&nbsp;<br /> </td>    
                        </tr>
                        <tr>
                            <td width="70%"> </td>
                            <td style="color:#FD6803;text-align:right;font-family:HelveticaNeueLTStd;font-size:16px">
                                <div class="row">
                                    <div  class="col-md-9">
                                        <span class="label label-primary"> GTR</span><br />
                                        <p style="margin-top:4px;text-align:right;color:#337ab7;font-weight:600;"><span style="font-size:17px;">Guaranteed to Run</span></p>
                                    </div>
                                    <div class="col-md-3">
                                        
                                    </div>
                                </div> 
                            </td>    
                        </tr>
                    </table>--%>
                    

                    <div id="Liveonline" runat="server">
                        <div >
                            <p style="font-size:22px;line-height:1.3;padding-top:0px;" class="sectionHeadingSubPage text-left subSectionPadding"> Live Online</p>
                            <div class="clearfix"></div>
                        </div> 
                        <asp:Repeater ID="ctlLiveOnlineClassSchedule" OnItemDataBound="ctlLiveOnlineClassSchedule_OnItemDataBound" runat="server">
                            <HeaderTemplate>                    
                                <table class="table table-hover">
                                <thead>
                                <tr>
                                    <td class="col-lg-3 col-md-3 col-sm-3 col-xs-4">Location</td>
                                    <td class="col-lg-1 col-md-1 col-sm-1 hidden-xs"></td>
                                    <td class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Date</td>
                                    <td class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Time</td>
                                    <td class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Register</td>
                                </tr>
                                </thead>
                                <tbody>                      
                            </HeaderTemplate>
                            <ItemTemplate>        
                                <tr>                                    
                                    <td style="font-family:HelveticaLTStdRoman;font-size:13px" ><asp:HiddenField ID="ctlClassID" Value='<%# Eval("id") %>' runat="server" />
                                        <asp:Label ID="ctlLabel0" Text='<%# Eval("city") %>' runat="server" /><asp:Label ID="ctlLabel01" Text='<%# (string.IsNullOrEmpty(Eval("state").ToString()) ? "" : Eval("state").ToString().Insert(0, " - ")) %>' runat="server" />

                                    </td>
                                    <td  style="font-family:HelveticaLTStdRoman;font-size:13px" class="hidden-xs"><asp:Label ID="lblGTR" CssClass="label label-primary" ToolTip='<%# Eval("Gtr") %>' Text="" runat="server"/><asp:Image style="height:20px;" id="ctlGTRIcon" runat="server" src="/images/site/checkmark.PNG" /></td>
                                    <td  style="font-family:HelveticaLTStdRoman;font-size:13px">
                                        <asp:Label ID="Label1" Text='<%#DateTime.Parse(Eval("startDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /> - <asp:Label ID="ctlEndDate" Text='<%#DateTime.Parse(Eval("endDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /></td>
                                    <td style="font-family:HelveticaLTStdRoman;font-size:13px">
                                        <asp:Label ID="ctlLabel3" Text='<%#DateTime.Parse(Eval("startTime").ToString()).ToString("h:mm tt") %>' runat="server" /> 
                                        - 
                                        <asp:Label ID="ctlEndTime" Text='<%#DateTime.Parse(Eval("endTime").ToString()).ToString("h:mm tt") %>' runat="server" /> 
                                        <asp:Label Text='<%# Eval("timeZone") %>' runat="server"></asp:Label>
<%--                                        <span   style="font-family:HelveticaLTStdRoman;font-size:13px;font-weight:normal"></span></td>--%>
                                    <td style="font-family:HelveticaLTStdRoman;font-size:13px"><i class="fa fa-plus-circle orange hidden-xs"></i> <asp:LinkButton ID="ctlLiveOnlineRegister" Text="Register" CssClass="" OnClick="ctlLiveOnlineRegister_Click" runat="server" /></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                </table>                  
                                        
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>

                     <div id="ClassroomLive" runat="server">
                        <div >
                            <p style="font-size:22px;line-height:1.3;padding-top:32px;" class="sectionHeadingSubPage text-left subSectionPadding"> Classroom Live</p>
                            <div class="clearfix"></div>
                        </div> 
                        <asp:Repeater ID="ctlClassroomLiveClassSchedule" OnItemDataBound="ctlClassSchedule_OnItemDataBound" runat="server">
                            <HeaderTemplate>                    
                                <table class="table table-hover">
                                <thead>
                                <tr>
                                    <td class="col-lg-3 col-md-3 col-sm-3 col-xs-4">Location</td>
                                    <td class="col-lg-1 col-md-1 col-sm-1 hidden-xs"></td>
                                    <td class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Date</td>
                                    <td class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Time</td>
                                    <td class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Register</td>
                                </tr>
                                </thead>
                                <tbody>                      
                            </HeaderTemplate>
                            <ItemTemplate>        
                                <tr>                                    
                                    <td style="font-family:HelveticaLTStdRoman;font-size:13px" ><asp:HiddenField ID="ctlClassID" Value='<%# Eval("id") %>' runat="server" />
                                        <asp:Label ID="ctlLabel0" Text='<%# Eval("city") %>' runat="server" /><asp:Label ID="ctlLabel01" Text='<%# (string.IsNullOrEmpty(Eval("state").ToString()) ? "" : Eval("state").ToString().Insert(0, ", ")) %>' runat="server" />

                                    </td>
                                    <td  style="font-family:HelveticaLTStdRoman;font-size:13px" class="hidden-xs"><asp:Label ID="lblGTR" CssClass="label label-primary" ToolTip='<%# Eval("Gtr") %>' Text="" runat="server"/><asp:Image style="height:20px;" id="ctlGTRIcon" runat="server" src="/images/site/checkmark.PNG" /></td>
                                    <td  style="font-family:HelveticaLTStdRoman;font-size:13px">
                                        <asp:Label ID="Label1" Text='<%#DateTime.Parse(Eval("startDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /> - <asp:Label ID="ctlEndDate" Text='<%#DateTime.Parse(Eval("endDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /></td>
                                    <td style="font-family:HelveticaLTStdRoman;font-size:13px">
                                        <asp:Label ID="ctlLabel3" Text='<%#DateTime.Parse(Eval("startTime").ToString()).ToString("h:mm tt") %>' runat="server" />
                                        -
                                        <asp:Label ID="ctlEndTime" Text='<%#DateTime.Parse(Eval("endTime").ToString()).ToString("h:mm tt") %>' runat="server" /> 
                                        <asp:Label Text='<%# Eval("timeZone") %>' runat="server"></asp:Label>
                                    <td style="font-family:HelveticaLTStdRoman;font-size:13px"><i class="fa fa-plus-circle orange hidden-xs"></i> <asp:LinkButton ID="ctlRegister" Text="Register" CssClass="" OnClick="ctlClassroomLiveRegister_Click" runat="server" /></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                </table>                  
                                        
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>

                    <div id="ClassroomVirtual" runat="server">
                        <div >
                            <p style="font-size:22px;line-height:1.3;padding-top:32px;" class="sectionHeadingSubPage text-left subSectionPadding"> Classroom Virtual</p>
                            <div class="clearfix"></div>
                        </div> 
                        <asp:Repeater ID="ctlClassroomVirtualClassSchedule" OnItemDataBound="ctlClassroomVirtualSchedule_OnItemDataBound" runat="server">
                            <HeaderTemplate>                    
                                <table class="table table-hover">
                                <thead>
                                <tr>
                                    <td class="col-lg-3 col-md-3 col-sm-3 col-xs-4">Location</td>
<%--                                    <td></td>--%>
                                    <td class="col-lg-1 col-md-1 col-sm-1 hidden-xs"></td>
                                    <td class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Date</td>
                                    <td class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Time</td>
                                    <td class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Register</td>
                                </tr>
                                </thead>
                                <tbody>                      
                            </HeaderTemplate>
                            <ItemTemplate>        
                                <tr>                                    
                                    <td style="font-family:HelveticaLTStdRoman;font-size:13px" >
                                       <asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="drpLocationDropDown_SelectedIndexChanged"   DataTextField="CityState" DataValueField="id" ID="drpLocationDropDown" runat="server" CssClass="form-control">
                                           
                                       </asp:DropDownList>


                                    </td>
<%--                                    <td  style="font-family:HelveticaLTStdRoman;font-size:13px" class="hidden-xs"><asp:Label ID="lblGTR" CssClass="label label-primary" ToolTip='' Text="" runat="server"/><asp:Image style="height:20px;" id="ctlGTRIcon" runat="server" src="/images/site/checkmark.PNG" /></td>--%>

                                    <td  style="font-family:HelveticaLTStdRoman;font-size:13px;vertical-align:middle" class="hidden-xs">
                                        <asp:Image Visible="false" style="height:20px;" ID="ctlGTRIcon" runat="server" src="/images/site/checkmark.PNG" />
                                    </td>
                                    <td  style="font-family:HelveticaLTStdRoman;font-size:13px;vertical-align:middle">
                                        <asp:Label ID="ctlStartDate" Text='<%#DateTime.Parse(Eval("startDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /> - <asp:Label ID="ctlEndDate" Text='<%#DateTime.Parse(Eval("endDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /></td>
                                    <td style="font-family:HelveticaLTStdRoman;font-size:13px;vertical-align:middle"><asp:Label ID="ctlStartTime" Text='<%#DateTime.Parse(Eval("startTime").ToString()).ToString("h:mm tt") %>' runat="server" /> - <asp:Label ID="ctlEndTime" Text='<%#DateTime.Parse(Eval("endTime").ToString()).ToString("h:mm tt") %>' runat="server" /> 
                                        <span   style="font-family:HelveticaLTStdRoman;font-size:12px;font-weight:normal"></span></td>
                                    <td style="font-family:HelveticaLTStdRoman;font-size:13px;vertical-align:middle"><i class="fa fa-plus-circle orange hidden-xs"></i> <asp:LinkButton ID="ctlRegister" Text="Register" CssClass="" OnClick="ctlClassroomVirtualRegister_Click" runat="server" /></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                </table>                  
                                        
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                       
                    <div>
                            <a style="" onclick="smoothScroll(document.getElementById('schedule-heading-area'))" class="inner-navigation-link">TOP <i style="font-size:26px;" class="fa fa-caret-up"></i> </a>
                        </div>
                     <div style="margin-top:20px;">
                            <a style="" href="/course/<%=SeoCourseName.Replace(" ","-") %>" class="inner-navigation-link"> Back to Course Overview </a>
                        </div>
                    <%--<asp:Repeater ID="ctlClassSchedule" OnItemDataBound="ctlClassSchedule_OnItemDataBound" runat="server">
                        <HeaderTemplate>                    
                            <table class="table table-hover" style="margin-top:5px;">
                            <thead>
                            <tr>
                                <th class="col-lg-3 col-md-3 col-sm-3 col-xs-4">Location</th>
                                <th class="col-lg-1 col-md-1 col-sm-1 hidden-xs"></th>
                                <th class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Date</th>
                                <th class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Time</th>
                                <th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Register</th>
                            </tr>
                            </thead>
                            <tbody>                      
                        </HeaderTemplate>
                        <ItemTemplate>        
                            <tr>                                    

                                <td style="font-family:HelveticaLTStdRoman;font-size:13px" ><asp:HiddenField ID="ctlClassID" Value='<%# Eval("id") %>' runat="server" />
                                   <%# Eval("city") %>,<%# Eval("state") %>
                                </td>
                                <td  style="font-family:HelveticaLTStdRoman;font-size:13px" class="hidden-xs"><asp:Label ID="lblGTR" CssClass="label label-primary" ToolTip='<%# Eval("Gtr") %>' Text="GTR" runat="server"/></td>
                                <td  style="font-family:HelveticaLTStdRoman;font-size:13px">
                                    <asp:Label ID="Label1" Text='<%#DateTime.Parse(Eval("startDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /> - <asp:Label ID="ctlEndDate" Text='<%#DateTime.Parse(Eval("endDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /></td>
                                <td style="font-family:HelveticaLTStdRoman;font-size:13px"><asp:Label ID="ctlLabel3" Text='<%#DateTime.Parse(Eval("startTime").ToString()).ToString("h:mm tt") %>' runat="server" /> - <asp:Label ID="ctlEndTime" Text='<%#DateTime.Parse(Eval("endTime").ToString()).ToString("h:mm tt") %>' runat="server" /> 
                                    <span   style="font-family:HelveticaLTStdRoman;font-size:12px;font-weight:normal"><%# Eval("timeZone") %></span></td>
                                <td style="font-family:HelveticaLTStdRoman;font-size:13px"><i class="fa fa-plus-circle orange hidden-xs"></i> <asp:LinkButton ID="ctlRegister" Text="Register" CssClass="" OnClick="ctlRegister_Click" runat="server" /></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                            </table>                  
                                        
                        </FooterTemplate>
                    </asp:Repeater>--%>   
                </div>

               <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                        <div class="custom-right-sidebar-div">
                            <h2  class="sidebar-heading">
                                <%=CourseName %>
                            </h2>
                            <p style="font-weight:500;font-size:18px">Course Overview</p>
                            <p>
                                <%=CheckEmptyData(CourseDescription) %>
                            </p>
                            <h2 class="sidebar-heading" style="margin-top:26px;">
                                <%=CourseName %>
                            </h2>
                            <h4 style="font-weight:500;font-size:18px">Course Objectives</h4>
                            
                            <div style="font-size:14px;line-height:1.8">
                                <%=CheckEmptyData(CourseObjective) %>
                            </div>
                            <div  class="city-main-page-right-sidebar-div">
                                <h2 id="link-certifications" class="sidebar-heading">Related Certifications</h2>
                                <p><%=CheckEmptyData(RelatedCertifications) %></p>
                                <h2 style="margin-top:20px;" id="link-followons" class="sidebar-heading">Follow-on Course(s)</h2>
                                <div style="font-size:14px;">
                                    <%foreach(var item in GetCourseLinks(NextLevel))
                                        {%>
                                            <a target="_blank" href="/course/<%=GetSEOCourseFromCourse(item).Replace(" ","-") %>"><%=item %></a><div class="custom-link-margin-height"></div>
                                            
                                        <%} %>
                                </div>
                                <h2 style="margin-top:20px;" class="sidebar-heading">Related Courses</h2>
                                <div style="font-size:14px;">
                                    <%foreach(var item in GetCourseLinks(RelatedCourses))
                                        {%>
                                            <a target="_blank" href="/course/<%=GetSEOCourseFromCourse(item).Replace(" ","-") %>"><%=item %></a><div class="custom-link-margin-height"></div>
                                            
                                        <%} %>
                                </div>
                            </div>
                    </div>
                   <%--<div style="margin-top:20px;" class="city-main-page-right-sidebar-div">
                            <p id="link-certifications" class="sidebar-heading">Related Certifications</p>
                            <p><%=CheckEmptyData(RelatedCertifications) %></p>
                            <p style="margin-top:20px;" id="link-followons" class="sidebar-heading">Follow-on Course(s)</p>
                            <p>
                                <%foreach(var item in GetCourseLinks(NextLevel))
                                    {%>
                                        <a target="_blank" href="/course/<%=GetSEOCourseFromCourse(item).Replace(" ","-") %>"><%=item %></a><br />
                                    <%} %>
                            </p>
                            <p style="margin-top:20px;" class="sidebar-heading">Related Courses</p>
                            <p>
                                <%foreach(var item in GetCourseLinks(RelatedCourses))
                                    {%>
                                        <a target="_blank" href="/course/<%=GetSEOCourseFromCourse(item).Replace(" ","-") %>"><%=item %></a><br />
                                    <%} %>
                            </p>
                        </div>--%>
                    
            </div>                    
            </div>
        </div>
    </div>
   
     <div class="row">
            <div class="col-md-12">
                <div class="training-delivery-method-box" >
                    <p style="text-align:center" class="training-delivery-heading">
                        Training Delivery Methods
                    </p>
                    <div class="row">
                            <div class="col-md-1"></div>
                        <div class="col-md-10 training-delivery-content" style="margin-top:18px;">
                            <p style="font-size:20px;">
                                    With Productivity Point, you will have a spectrum of delivery methods to choose from...
                        when where and how you like it. Whether it's in a classroom or online, we have a
                        delivery option to meets your needs.
                            </p>
                                
                        </div>
                        <div class="col-md-1">

                        </div>
                    </div>
                    <div id="exTab4">	
                        <div style="text-align:center">
                            <ul  class="nav nav-pills">
                            <li class="active" style="margin-left:0px;">
                                <a class="hidden-sm hidden-xs" href="#11b" data-toggle="tab">
                                    <img class="tab-image" src="/images/cities_site_images/Classroom_Icon.png" />
                                    <p style="font-size:20px;">Classroom Live</p>
                                </a>
                                <a class="hidden-md hidden-lg mobile-tab-image"  href="#11b" data-toggle="tab">

                                </a>
			                </li>
			                <li>
                                <a class="hidden-sm hidden-xs" href="#12b" data-toggle="tab">
                                    <img class="tab-image"  src="/images/cities_site_images/Remote_Icon.png" />
                                    <p style="font-size:20px;">Classroom Virtual</p>
			                    </a>
                                <a class="hidden-md hidden-lg mobile-tab-image"  href="#12b" data-toggle="tab">

                                </a>
			                </li>
			                <li>
                                <a class="hidden-sm hidden-xs" href="#13b" data-toggle="tab">
                                     <img style="padding-top:12px;" class="tab-image" src="/images/cities_site_images/Live_Online.png" />
                                    <p style="font-size:20px;">Live Online</p>
			                    </a>
                                <a class="hidden-md hidden-lg mobile-tab-image"  href="#13b" data-toggle="tab">

                                </a>
			                </li>
  		                    <li>
                              <a class="hidden-sm hidden-xs" href="#14b" data-toggle="tab">
                                  <img class="tab-image" style="margin-top:6px;" src="/images/cities_site_images/Private_Groups_New.png" />
                                    <p style="font-size:20px;">Private Group </p>
                              </a>
                              <a class="hidden-md hidden-lg mobile-tab-image"  href="#14b" data-toggle="tab">

                              </a>
			                </li>
                      	    <li>
                              <a class="hidden-sm hidden-xs" href="#15b" data-toggle="tab">
                                   <img class="tab-image" src="/images/cities_site_images/On_Demand.png" />
                                    <p style="font-size:20px;">On Demand</p>
                              </a>
                              <a class="hidden-md hidden-lg mobile-tab-image"  href="#15b" data-toggle="tab">

                              </a>
			                </li>                
		                </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>
         <div class="tab-content clearfix container">
			                <div class="tab-pane active" id="11b">
                                <div class="row delivery-method-box" id="classroom-live-training">
                                    <div class="col-md-12">
                                        <div class="row" >
                                            <div class="col-md-1 delivery-methods-image">
                                                <img class="tab-image" src="/images/cities_site_images/Classroom_Icon.png" />
                                            </div>
                                            <div style="padding-left:40px;" class="col-md-11 delivery-methods-header">
                                                <p style="padding-left:0px;font-size:20px;" class="training-delivery-heading">Classroom Live Training</p>
                                                <p style="padding-left:7px;" class="delivery-method-description">
                                                    Get in-person, hands-on instruction with live lab exercises taught by subject matter
                                                    experts who deliver authorized and industry-leading content.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row"  id="delivery-method-description">
                                            <div class="col-md-12 ">
                                               <p class="delivery-method-description"> With classrooms in almost every major U.S. city, Productivity Point has something for
                                                users of every level, so you can earn the most popular industry certifications. You get
                                                hands-on learning experience with live lab exercises taught by experienced instructors. We proudly advocate
                                                our learning services to be hosted by the best-qualified trainers in terms of technical knowledge and teaching
                                                skills.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
				            </div>
				            <div class="tab-pane" id="12b">
                                 <div class="row delivery-method-box" id="classsroom-virtual-training">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-1 delivery-methods-image">
                                                <img class="tab-image" src="/images/cities_site_images/Remote_Icon.png" />
                                            </div>
                                            <div style="padding-left:40px;" class="col-md-11 delivery-methods-header">
                                                <p style="padding-left:0px;font-size:20px;" class="training-delivery-heading">Classroom Virtual Training</p>
                                                <p style="padding-left:7px;" class="delivery-method-description">
                                                    Prefer to have a dedicated classroom for your virtual experience? Attend live, hands-
                                                    on training via remote instructor from one of Productivity Point’s multiple locations.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 ">
                                                <p class="delivery-method-description">Enjoy a focused and professional training environment, including all technical
                                                equipment provided along with administrative and technical support at your fingertips. With over 150
                                                locations to choose from, review our course catalog or contact your personal Productivity Point Account
                                                Manager to see if the course you have in mind is delivered at one of our dedicated virtual classrooms in
                                                your area.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
				            </div>
                           
                            <div class="tab-pane" id="13b">
                                 <div class="row delivery-method-box" id="live-online-training">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-1 delivery-methods-image">
                                                <img style="margin-left:20px;" class="tab-image"  src="/images/cities_site_images/Live_Online.png" />
                                            </div>
                                            <div style="padding-left:40px;" class="col-md-11 delivery-methods-header">
                                                <p style="padding-left:0px;font-size:20px;" class="training-delivery-heading">Live Online Training</p>
                                                <p style="padding-left:7px;" class="delivery-method-description">
                                                    Blend the best from traditional face-to-face instructor-led training with 
                                                    the latest in conferencing technology.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 delivery-method-description">
                                                <ul style="margin-top:10px !important;">
                                                    <li>Delivering live training to multiple locations at one time</li>
                                                    <li>100% live, instructor led training in a classroom setting without excess travel.</li>
                                                    <li>Dramatically reduced class cancellation rate.</li>
                                                </ul>  
                                            </div>
                                        </div>
                                    </div>
                                </div>
				            </div>
                            <div class="tab-pane" id="14b">
                                 <div class="row delivery-method-box" id="private-group-training">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-1 delivery-methods-image">
                                                <img style="margin-left:20px;" class="tab-image" src="/images/cities_site_images/Private_Groups_New.png" />
                                            </div>
                                            <div style="padding-left:40px;" class="col-md-11 delivery-methods-header">
                                                <p style="padding-left:0px;font-size:20px;" class="training-delivery-heading">Private Group Training</p>
                                                <p style="padding-left:7px;" class="delivery-method-description">
                                                    Your private group classroom experience will not only take place in the location of your
                                                    choice (including any of our training centers), but you will enjoy the following amenities:
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 delivery-method-description">
                                                <ul style="margin-top:10px !important;">
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
                                                        Post-Assessments to ensure your learners have fully comprehended
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
				            </div>
                             <div class="tab-pane" id="15b">
                                 <div class="row delivery-method-box" id="on-demand-learning">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-1 delivery-methods-image">
                                                <img class="tab-image" src="/images/cities_site_images/On_Demand.png" />
                                            </div>
                                            <div style="padding-left:50px;" class="col-md-11 delivery-methods-header">
                                                <p style="padding-left:0px;font-size:20px;" class="training-delivery-heading">On-Demand Learning</p>
                                                <p style="padding-left:7px;" class="delivery-method-description">
                                                    On-Demand is an IT training solution designed around your schedule, budget, and
                                                    learning needs.  Combining high-quality video, reading, and knowledge checks in a self-paced
                                                    format, On-Demand helps you build skills as your schedule allows—all at once or
                                                    five minutes at a time.<br />
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 delivery-method-description">
                                                <p>With On-Demand, you learn at your own pace and in the convenience of your own space.</p>
                                                <p>With Learn at your own pace…</p>
                                                <ul style="margin-top:10px !important;line-height:1.8">
                                                    <li>
                                                        Personal industry leading trainers and instructors right on your own desktop.
                                                    </li>
                                                    <li>
                                                        Acquire leverage to better career opportunities.
                                                    </li>
                                                    <li>
                                                        Learn the latest information technology.
                                                    </li>
                                                    <li>
                                                        Increase your earning potential
                                                    </li>
                                                    <li>
                                                        Get Certified
                                                    </li>
                                                </ul>
                                                  Try Before You Buy…<br />
    
                                                If you would like to experience On-Demand before you purchase, send an email to: <a href="mailto:ondemand@productivitypointls.com"> ondemand@productivitypointls.com</a>
                                                to receive your Course Demo Code.
                                            </div>
                                        </div>
                                    </div>
                                </div>
				            </div>
			            </div> 

</div>
    <script>
window.smoothScroll = function(target) {
    var scrollContainer = target;
    do { //find scroll container
        scrollContainer = scrollContainer.parentNode;
        if (!scrollContainer) return;
        scrollContainer.scrollTop += 1;
    } while (scrollContainer.scrollTop == 0);
    
    var targetY = 0;
    do { //find the top of target relatively to the container
        if (target == scrollContainer) break;
        targetY += target.offsetTop;
    } while (target = target.offsetParent);
    targetY -=100;
    scroll = function(c, a, b, i) {
        i++; if (i > 30) return;
        c.scrollTop = a + (b - a) / 30 * i;
        setTimeout(function(){ scroll(c, a, b, i); }, 20);
    }
    // start scrolling
    scroll(scrollContainer, scrollContainer.scrollTop, targetY, 0);
}
    </script>
</asp:Content>