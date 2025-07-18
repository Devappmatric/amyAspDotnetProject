<%@ Page Title="" Language="C#" MasterPageFile="~/cms/admin.master" AutoEventWireup="true" CodeBehind="specialsavings.aspx.cs" Inherits="ProductivityPointGlobal.cms.Specialsavings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">            
            <h3 class="page-header">Add A Special Savings Page</h3>
        </div>
    </div>    
    
    <div class="row">        
        <asp:FormView ID="ctlNewRecord" DefaultMode="Insert" RenderOuterTable="False" runat="server">
            <InsertItemTemplate>
                <div class="col-md-4">
                    <div class="form-group">
                        <strong>Company Name</strong>
                        <asp:TextBox ID="tbCompanyName" Text='<%# Bind("CompanyName") %>' CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <strong>Coupon Code 1</strong>
                        <asp:TextBox ID="tbCouponCode" Text='<%# Bind("CouponCode") %>' CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <strong>Coupon Code 2</strong>
                        <asp:TextBox ID="tbCouponCode2" Text='<%# Bind("CouponCode2") %>' CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <strong>Text Field 1</strong>
                        <asp:TextBox ID="tbTextField1" Text='<%# Bind("TextField1") %>' CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <strong>Text Field 2</strong>
                        <asp:TextBox ID="tbTextField2" Text='<%# Bind("TextField2") %>' CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <strong>Text Field 3</strong>
                        <asp:TextBox ID="tbTextField3" Text='<%# Bind("TextField3") %>' CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <strong>Text Field 4</strong>
                        <asp:TextBox ID="tbTextField4" Text='<%# Bind("TextField4") %>' CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-12 text-right">
                    <div class="form-group">
                        &nbsp;<br/>
                        <asp:Button ID="btnInsertPage" CssClass="btn btn-success" OnClick="btnInsertPage_OnClick" Text="Insert" runat="server" />
                    </div>
                </div>
            </InsertItemTemplate>
        </asp:FormView>        
    </div>
    
    <div class="row">
        <div class="col-md-12">            
            <h3 class="page-header">Manage Special Savings Pages</h3>                
        </div>
    </div>  
    
    <div class="row">
        <div class="col-md-12">            
            <asp:Repeater ID="rptPageTemplates" OnItemCommand="rptPageTemplates_OnItemCommand" runat="server">
                <ItemTemplate>
                    <div class="row rowHover rowPadding">
                        <div class="col-lg-4">                            
                            <div class="form-group">
                                <strong>Company Name</strong>
                                <asp:TextBox ID="tbCompanyName" CssClass="form-control" Text='<%# Eval("CompanyName") %>' runat="server" />
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <strong>Coupon Code 1</strong>
                                <asp:TextBox ID="tbCouponCode" CssClass="form-control" Text='<%# Eval("CouponCode") %>' runat="server" />
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <strong>Coupon Code 2</strong>
                                <asp:TextBox ID="tbCouponCode2" CssClass="form-control" Text='<%# Eval("CouponCode2") %>' runat="server" />
                            </div>
                        </div>
                        <div class="col-lg-6">                            
                            <div class="form-group">
                                <strong>Text Field 1</strong>
                                <asp:TextBox ID="tbTextField1" CssClass="form-control" Text='<%# Eval("TextField1") %>' runat="server" />
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <strong>Text Field 2</strong>
                                <asp:TextBox ID="tbTextField2" CssClass="form-control" Text='<%# Eval("TextField2") %>' runat="server" />
                            </div>
                        </div>
                        <div class="col-lg-6">                            
                            <div class="form-group">
                                <strong>Text Field 3</strong>
                                <asp:TextBox ID="tbTextField3" CssClass="form-control" Text='<%# Eval("TextField3") %>' runat="server" />
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <strong>Text Field 4</strong>
                                <asp:TextBox ID="tbTextField4" CssClass="form-control" Text='<%# Eval("TextField4") %>' runat="server" />
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <strong><a href="<%=RelatvePath %>special-savings.aspx?PageId=<%# Eval("PageId") %>">Page URL</a></strong> 
                                <br/>
                                <%=RelatvePath %>special-savings.aspx?PageId=<%# Eval("PageId") %>
                            </div>
                        </div>
                        <div class="col-lg-12 text-right">                            
                            <div class="form-group">                                
                                <asp:LinkButton Text="Update" CssClass="btn btn-warning" CommandName="Update" CommandArgument='<%# Eval("Id") %>' runat="server" />
                                <asp:LinkButton Text="Delete" CssClass="btn btn-danger" CommandName="Delete" CommandArgument='<%# Eval("Id") %>' OnClientClick="if (!confirm('Are you sure you want delete this record?')) return false;" runat="server" />                            
                            </div>
                        </div>
                    </div>                      
                </ItemTemplate>                
            </asp:Repeater>      
        </div>
    </div>          
</asp:Content>
