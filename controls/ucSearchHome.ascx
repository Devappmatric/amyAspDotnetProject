<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSearchHome.ascx.cs" Inherits="ProductivityPointGlobal.controls.UcSearchHome" %>

<div class="container">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 padding20T padding20B">
            <asp:Panel runat="server" CssClass="input-group input-group-lg" DefaultButton="ctlSearchMobile">
                <asp:Label ID="Label1" runat="server" AssociatedControlID="ctlSearchInputMobile" Visible="False" Text="Search Box for Mobile"/>
                <asp:TextBox ID="ctlSearchInputMobile" CssClass="form-control required" placeholder="Search for courses" runat="server" />
                <span class="input-group-btn">
                    <asp:Button ID="ctlSearchMobile" CssClass="btn btn-primary" OnClick="ctlSearchMobile_OnClick" Text="SEARCH" runat="server" />
                </span>
            </asp:Panel>            
        </div>
    </div>
</div>
