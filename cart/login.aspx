<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ProductivityPointGlobal.cart.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
         @media screen and (max-width: 572px) {
              #ContentPlaceHolder1_brnNewRegister{
                  margin-bottom:20px;
                  margin-top:2px;
              } 
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc:ShoppingCart ID="uc1" runat="server" />
    
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow">Account Sign In</h1>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-5 hidden-sm hidden-xs margin20T responsiveCol">
                        <%--<uc:ContactForm runat="server" />--%>
                    </div>
                </div>
            </div>
        </div>
    </div>    
    
    <%--<uc:Search ID="ucSearch" runat="server" />--%>

    <div class="container-fluid bgWhite subPage padding75B">
        <div class="row">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-6 col-sm-12 col-xs-12">                                                                        
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Label CssClass="red" ID="ctlLoginErrorNotification" runat="server" />                                                                                                    
                            </div>        
                             <div class="col-lg-12">
                                 <br />
                             </div>
                            <div class="col-lg-5">
                                <asp:Label class="sectionHeadingSubPage text-left subSectionPadding" ID="lblHeadingRegister" runat="server"  Text="New Clients"/>                                                                                                    

                                
                                <asp:Button ID="brnNewRegister" runat="server" Text="Continue Checkout And Create Account" OnClick="brnNewRegister_Click" class="btn btn-success" />

                            </div>
                            <div class="col-lg-7">
                                <asp:Label ID="lblHeadingPage" class="sectionHeadingSubPage text-left subSectionPadding" runat="server" Text="Returning Clients"></asp:Label>
                                <br />

                                 
                                <asp:Panel ID="ctlShowLoginControls" DefaultButton="ctlUserLogin" runat="server">   
                                    <div style="margin-top:4px;" class="form-group">
                                        <label for="ctlUsername">Username (Email Address)</label>
                                        <asp:TextBox ID="ctlUsername" data-validation="required" data-validation-error-msg="Please enter your Username" CssClass="form-control" AutoCompleteType="None" placeholder="Username (E-Mail Address) *" runat="server" />                                                                            
                                    </div>     
                        
                                    <div class="form-group">
                                        <label for="ctlPassword">Password</label>
                                        <asp:TextBox ID="ctlPassword" data-validation="required" data-validation-error-msg="Please enter your Password" CssClass="form-control" AutoCompleteType="None" placeholder="Password *" TextMode="Password" runat="server" />                                                                        
                                    </div>   
                        
                                    <div class="form-group text-right">                            
                                        <asp:LinkButton ID="ctlPasswordReset" Text="Forgot Your Password?" CssClass="btn btn-warning" OnClick="ctlPasswordReset_Click" runat="server" />&nbsp;&nbsp;<asp:Button ID="ctlUserLogin" CssClass="btn btn-success" OnClick="ctlUserLogin_Click" runat="server" Text="Login" />
                                    </div>                                                                                                                                                                                                                                      
                                </asp:Panel>

                                <asp:Panel ID="ctlShowPasswordReset" runat="server">                                  
                                    <div class="form-group">
                                    <asp:ValidationSummary runat="server" ValidationGroup="Restore Password" CssClass="redAlert" />
                                        <label for="ctlUsernameEmail">Username (Email Address)</label>
                                        <asp:TextBox ID="ctlUsernameEmail" Width="90%" style="display:inline-block" data-validation="required" data-validation-error-msg="Please enter your email" CssClass="form-control" AutoCompleteType="None" placeholder="Username (E-Mail Address) *" runat="server" />                                                                        
                                        <asp:RegularExpressionValidator runat="server" ID="valEmail" ControlToValidate="ctlUsernameEmail" Display="Dynamic"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Invalid Email" ValidationGroup="Restore Password" CssClass="redAlert" Font-Size="Large">*</asp:RegularExpressionValidator>
                                    </div>                           
                                    <div class="form-group text-right">                            
                                        <asp:Button ID="ctlCancelPasswordReset" CausesValidation="false" CssClass="btn btn-default" OnClick="ctlCancelPasswordReset_Click" runat="server" Text="Cancel"/>&nbsp;&nbsp;
                                        <asp:Button ID="ctlPasswordResetSubmit" ValidationGroup="Restore Password" CssClass="btn btn-success" OnClick="ctlPasswordResetSubmit_Click" runat="server" Text="Submit" />
                                    </div>
                                </asp:Panel>                                
                            </div>
                        </div>
                    </div>

                    <uc:Partners runat="server" />
                    
                </div>                    
            </div>
        </div>
    </div>	    
</asp:Content>
