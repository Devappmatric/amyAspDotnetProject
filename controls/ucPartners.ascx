<%@ Control CodeBehind="ucPartners.ascx.cs" Inherits="ProductivityPointGlobal.controls.UcPartners" Language="C#" %>

<div class="col-lg-4 col-md-6 hidden-sm hidden-xs">
    <div class="row subPageRightColumn">
        <div class="col-lg-12">
            <p class="sectionHeadingSubPage text-center subSectionPadding">Partners</p>
            <br/>
        </div>        
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <asp:HyperLink ID="hlCisco" NavigateUrl="/brand/cisco/technical-courses" runat="server"><asp:Image ID="Image1" ImageUrl="~/images/cisco.new.png" AlternateText="Cisco" runat="server" /></asp:HyperLink>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <asp:HyperLink ID="HyperLink1" NavigateUrl="/topic/business-analysis/professional-development-skills" runat="server"><asp:Image ID="Image2" AlternateText="International Institute of Business Analysis (IIBA)" ImageUrl="~/images/home5.jpg" runat="server" /></asp:HyperLink>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <asp:HyperLink ID="HyperLink2" NavigateUrl="~/courses/category.aspx?cat2=Microsoft" runat="server"><asp:Image ID="Image3" AlternateText="Microsoft Partner" ImageUrl="~/images/home6.jpg" runat="server" /></asp:HyperLink>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <asp:HyperLink ID="HyperLink3" NavigateUrl="http://www.pmi.org/Learning/Professional-Development/rep-find-a-registered-education-provider.aspx" runat="server"><asp:Image ID="Image4" AlternateText="Project Management Institute" ImageUrl="~/images/home7.jpg" runat="server" /></asp:HyperLink>
        </div>
        <div class="col-lg-6 col-md-6 6col-sm-6 col-xs-12 text-center">
            <asp:HyperLink ID="HyperLink4" NavigateUrl="/topic/linux-and-unix/technical-courses" runat="server"><asp:Image ID="Image5" AlternateText="Red Hat Linux" ImageUrl="~/images/home8.jpg" runat="server" /></asp:HyperLink>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <asp:HyperLink ID="HyperLink5" NavigateUrl="/brand/vmware/technical-courses" runat="server"><asp:Image ID="Image6" AlternateText="VMWare Partner" ImageUrl="~/images/home9.jpg" runat="server" /></asp:HyperLink>
        </div>                            
    </div>                        
</div>   
<div class="col-sm-12 col-xs-12 hidden-lg hidden-md">
    <div class="col-lg-12">
        <p class="sectionHeading text-center subSectionPadding">Partners</p>
        <br/>
    </div>                 
    <div id="imgSlider1" class="owl-carousel">
        <div class="img-thumbnailCustom">
            <asp:HyperLink ID="HyperLink7" NavigateUrl="~/courses/category.aspx?cat2=Cisco" runat="server"><asp:Image ID="Image7" AlternateText="Cisco" ImageUrl="~/images/cisco.new.png" runat="server" /></asp:HyperLink>
        </div>
        <div class="img-thumbnailCustom">
            <asp:HyperLink ID="HyperLink8" NavigateUrl="~/courses/category.aspx?cat2=Business Analysis" runat="server"><asp:Image ID="Image8" AlternateText="International Institute of Business Analysis (IIBA)" ImageUrl="~/images/home5.jpg" runat="server" /></asp:HyperLink>
        </div>
        <div class="img-thumbnailCustom">
            <asp:HyperLink ID="HyperLink9" NavigateUrl="~/courses/category.aspx?cat2=Microsoft" runat="server"><asp:Image ID="Image9" AlternateText="Microsoft Partner" ImageUrl="~/images/home6.jpg" runat="server" /></asp:HyperLink>
        </div>
        <div class="img-thumbnailCustom">
            <asp:HyperLink ID="HyperLink10" NavigateUrl="http://www.pmi.org/Learning/Professional-Development/rep-find-a-registered-education-provider.aspx" runat="server"><asp:Image ID="Image10" AlternateText="Project Management Institute" ImageUrl="~/images/home7.jpg" runat="server" /></asp:HyperLink>
        </div>
        <div class="img-thumbnailCustom">
            <asp:HyperLink ID="HyperLink11" NavigateUrl="~/courses/category.aspx?cat2=Linux" runat="server"><asp:Image ID="Image11" AlternateText="Red Hat Linux" ImageUrl="~/images/home8.jpg" runat="server" /></asp:HyperLink>
        </div>
        <div class="img-thumbnailCustom">
            <asp:HyperLink ID="HyperLink12" NavigateUrl="~/courses/category.aspx?cat2=VMware" runat="server"><asp:Image ID="Image12" AlternateText="VMWare Partner" ImageUrl="~/images/home9.jpg" runat="server" /></asp:HyperLink>
        </div>
    </div>		
</div> 