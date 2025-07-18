<%@ Page Title="" Language="C#" MasterPageFile="~/cms/admin.master" AutoEventWireup="true" CodeBehind="companies.aspx.cs" Inherits="ProductivityPointGlobal.cms.Companies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">            
            <h3 class="page-header">Add Companies</h3>
        </div>
    </div>    
    
    <div class="row">        
        <asp:FormView ID="ctlNewRecord" DefaultMode="Insert" RenderOuterTable="False" runat="server">
            <InsertItemTemplate>
                <div class="col-md-3">
                    <div class="form-group">
                        <strong>Company Name</strong>
                        <asp:TextBox ID="tbCompanyName" Text='<%# Bind("CompanyName") %>' CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <strong>Coupon Code</strong>
                        <asp:TextBox ID="tbCouponCode" Text='<%# Bind("CouponCode") %>' CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <strong>Coupon Discount %</strong>
                        <asp:TextBox ID="tbCouponDiscount" Text='<%# Bind("CouponDiscount") %>' CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <strong>Coupon Enabled</strong>
                        <asp:CheckBox ID="cbCouponEnabled" Checked='<%# Bind("CouponEnabled") %>' CssClass="form-control" runat="server" />
                    </div>
                </div>                                    
                <div class="col-md-1 text-right">
                    <div class="form-group">
                        &nbsp;<br/>
                        <asp:Button ID="btnInsertCompany" CssClass="btn btn-success" OnClick="btnInsertCompany_OnClick" Text="Insert" runat="server" />
                    </div>
                </div>
            </InsertItemTemplate>
        </asp:FormView>        
    </div>
    
    <div class="row">
        <div class="col-md-12">            
            <h3 class="page-header">Manage Companies</h3>                
        </div>
    </div>  
    
    <div class="row">
        <div class="col-md-12">
            
            <asp:Repeater ID="rptCompanies" OnItemCommand="rptCompanies_OnItemCommand" runat="server">
                <HeaderTemplate>
                    <div class="row">                                
                        <div class="col-lg-3 col-md-3"><strong>Company Name</strong></div>
                        <div class="col-lg-3 col-md-2"><strong>Coupon Code</strong></div>
                        <div class="col-lg-2 col-md-2"><strong>Coupon Discount %</strong></div>
                        <div class="col-lg-2 col-md-2"><strong>Coupon Enabled</strong></div>                                
                        <div class="col-lg-2 col-md-3"><strong>Tools</strong></div>
                    </div>                    
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="row rowHover rowPadding">
                        <div class="col-lg-3 col-md-3"><asp:TextBox ID="tbCompanyName" Text='<%# Eval("CompanyName") %>' CssClass="form-control" runat="server" /></div>
                        <div class="col-lg-3 col-md-2"><asp:TextBox ID="tbCouponCode" Text='<%# Eval("CouponCode") %>' CssClass="form-control" runat="server" /></div>
                        <div class="col-lg-2 col-md-2"><asp:TextBox ID="tbCouponDiscount" Text='<%# Eval("CouponDiscount") %>' CssClass="form-control" runat="server" /></div>
                        <div class="col-lg-2 col-md-2"><asp:CheckBox ID="cbCouponEnabled" Checked='<%# Eval("CouponEnabled") %>' CssClass="form-control" runat="server" /></div>
                        <div class="col-lg-2 col-md-3">                            
                            <asp:LinkButton Text="Update" CssClass="btn btn-warning" CommandName="Update" CommandArgument='<%# Eval("Id") %>' runat="server" />
                            <asp:LinkButton Text="Delete" CssClass="btn btn-danger" CommandName="Delete" CommandArgument='<%# Eval("Id") %>' OnClientClick="if (!confirm('Are you sure you want delete this record?')) return false;" runat="server" />                            
                        </div>
                    </div>  
                    
                </ItemTemplate>                
            </asp:Repeater>      
        </div>
    </div>       
</asp:Content>
