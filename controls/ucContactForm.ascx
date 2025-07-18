<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucContactForm.ascx.cs" Inherits="ProductivityPointGlobal.Controls.UcContactForm" %>

<div class="frostBg padding30 subPageForm">
    <p class="font24 text-center">I Want Answers</p>
    <div class="checkbox padding10T">
        <label>                
            <asp:CheckBox ID="cbBecomingCertified" runat="server"/> Becoming Certified
        </label>
    </div>
    <div class="checkbox">
        <label>
            <asp:CheckBox ID="cbCustomizedTraining" runat="server" /> Customized Training
        </label>
    </div>
    <div class="checkbox">
        <label>
            <asp:CheckBox ID="cbSpecialGroupPricing" runat="server" /> Special Group Pricing
        </label>
    </div>
    <div class="checkbox">
        <label>
            <asp:CheckBox ID="cbEventHostingServices" runat="server" /> Event Hosting Services
        </label>
    </div>
    <div class="form-group">            
        <asp:Label runat="server" AssociatedControlID="ddlGroupSize" Text="Group size*"/> <span id="f1Required"></span>
        <asp:DropDownList ID="ddlGroupSize" CssClass="form-control" runat="server" data-validation="required" data-validation-error-msg="Group size required" data-validation-error-msg-container="#f1Required">
            <asp:ListItem Value="" Text="Please select one" Selected="True" disabled/>
            <asp:ListItem Value="1" Text="1"/>
            <asp:ListItem Value="2" Text="2"/>
            <asp:ListItem Value="3" Text="3"/>
            <asp:ListItem Value="4" Text="4"/>
            <asp:ListItem Value="5+" Text="5+"/>
        </asp:DropDownList>
    </div>
    <div class="form-group">            
        <asp:Label runat="server" AssociatedControlID="tbName" Text="Name*"/> <span id="f2Required"></span>
        <asp:TextBox ID="tbName" CssClass="form-control" placeholder="Name" runat="server" MaxLength="40" data-validation="required" data-validation-error-msg="Name is required" data-validation-error-msg-container="#f2Required" />
    </div>
    <div class="form-group">            
        <asp:Label runat="server" AssociatedControlID="tbEmail" Text="Email*"/> <span id="f3Required"></span>
        <asp:TextBox ID="tbEmail" CssClass="form-control" placeholder="Email Address" MaxLength="40" runat="server" data-validation="email" data-validation-error-msg="Email address is required" data-validation-error-msg-container="#f3Required"/>
    </div>
    <div class="form-group">
        <asp:Label runat="server" AssociatedControlID="tbPhone" Text="Phone*"/> <span id="f4Required"></span>          
        <asp:TextBox ID="tbPhone" CssClass="form-control" placeholder="Phone" runat="server" MaxLength="20" data-validation="required" data-validation-error-msg="Phone number is required" data-validation-error-msg-container="#f4Required"/>
    </div>
    <div class="form-group">
        <p class="smallText">By submitting this form, you are giving your express 
            written consent for Productivity Point to contact you regarding our 
            services using email, telephone or text - including our 
            use of automated technology for calls and periodic texts 
            to any wireless number you provide.</p>
    </div>
    <div class="checkbox">
        <label>
            <input name="cbIAgree" data-validation="required" type="checkbox" data-validation-error-msg="You must agree" data-validation-error-msg-container="#f5Required"> I understand &amp; agree <span id="f5Required"></span>            
        </label>
    </div>
    <div class="form-group padding20T">
        <asp:Button ID="btnSubmitHomeForm" CssClass="btn btn-lg btn-block btn-success" runat="server" OnClick="btnSubmitHomeForm_OnClick" Text="Get info Now!" />
    </div>
</div>