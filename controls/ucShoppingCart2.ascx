<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcShoppingCart2.ascx.cs" Inherits="ProductivityPointGlobal.Controls.UcShopping2" %>

<asp:Panel ID="ctlShowCartNav" runat="server">                                           
    <div class="row text-center subSectionPadding">
        <div class="col-md-12">
            <div class="btn-group btn-group-justified checkout-menu" role="group" aria-label="...">
<%--                <asp:HyperLink runat="server" ID="hCart" NavigateUrl="/cart/" CssClass="btn btn-primary">My Cart</asp:HyperLink>--%>
                <asp:HyperLink runat="server" ID="hAccount" NavigateUrl="/cart/account-edit2.aspx"  CssClass="btn btn-primary">Contact & Billing Info
                </asp:HyperLink>
                <asp:HyperLink runat="server" ID="hStudentInfo" NavigateUrl="/cart/StudentInfo.aspx" CssClass="btn btn-primary">Attendee Info</asp:HyperLink>
                <asp:HyperLink runat="server" ID="hPaymentInfo"  NavigateUrl="/cart/payment2.aspx" CssClass="btn btn-primary">Payment Info</asp:HyperLink>
                <asp:HyperLink runat="server" ID="hOrderConfirmation"  NavigateUrl="#" CssClass="btn btn-primary">Order Confirmation</asp:HyperLink>
<%--                <asp:LinkButton ID="ctlMyCart" runat="server" CssClass="btn btn-primary">My Cart</asp:LinkButton>
                <asp:LinkButton ID="ctlAccount" CssClass="btn btn-primary" runat="server">Account</asp:LinkButton>
                <asp:LinkButton ID="ctlPayment" CssClass="btn btn-primary" runat="server">Payment</asp:LinkButton>--%>
                <div style="display:none">
                    <asp:LinkButton ID="ctlLogInUser" CssClass="btn btn-success" runat="server" OnClick="ctlLogInUser_Click">Log In</asp:LinkButton>
                    <asp:LinkButton ID="ctlLogOutUser" CssClass="btn btn-primary" runat="server" OnClick="ctlLogOutUser_Click">Log Out</asp:LinkButton>
                </div>
                
            </div>                    
        </div>            
    </div>    
</asp:Panel>

