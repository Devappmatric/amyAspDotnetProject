<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucAddress.ascx.cs" Inherits="ProductivityPointGlobal.Controls.UcAddress" %>

<div itemscope itemtype="http://schema.org/LocalBusiness">    
    <span itemprop="name"><strong>Productivity Point Learning Solutions</strong> <asp:Literal ID="ctlText1" runat="server"/></span>    
    <div itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
        <p class="smallText">
            <span itemprop="streetAddress">1580 Sawgrass Corporate Parkway <br/>Suite 205<br /></span>
            <span itemprop="addressLocality">Sunrise</span>,
            <span itemprop="addressRegion">Florida</span>
            <span itemprop="postalCode">33323</span><br />       
            <span itemprop="addressCountry">United States</span>
        </p>
    </div>
    <br />
	<p>
	    <span itemprop="telephone">T 1-844-238-8607</span><br />
        <span itemprop="telephone">P 954-838-7301</span><br />
        <span itemprop="telephone">F 954-838-7307</span><br />
        <span itemprop="email">E <a href="mailto:info@productivitypoint.com">info@productivitypoint.com</a></span>
	</p>
</div>
