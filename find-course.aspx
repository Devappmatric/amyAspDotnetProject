<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="find-course.aspx.cs" Inherits="ProductivityPointGlobal.FindCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow">Find The Right Course</h1>
                        </div>
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
                        <p class="sectionHeadingSubPage text-left subSectionPadding">Productivity Point holds a variety of private and public open-enrollment classes ranging from full-day Desktop Application skills and Professional Development Skills training to multi-day, advanced bootcamps in most metropolitan hubs around the world.</p>   
                        <div class="row padding40T">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>My Name Is</label>
                                    <asp:TextBox ID="ctlName" TabIndex="1" CssClass="form-control" AutoCompleteType="None" placeholder="Full Name" runat="server" />                                        
                                </div>       
                              
                                <div class="form-group">
                                    <label>My Phone Number Is</label>
                                    <asp:TextBox ID="ctlPhone" data-validation="required" data-validation-error-msg="Please enter your phone number" TabIndex="3" CssClass="form-control" AutoCompleteType="None" placeholder="Phone Number" runat="server" />                                        
                                </div>                                                                         
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>My Email Address Is</label>
                                    <asp:TextBox ID="ctlEmail" data-validation="email" data-validation-error-msg="Please enter a valid email address" TabIndex="2" CssClass="form-control" AutoCompleteType="None" placeholder="Email Address" runat="server" />                   
                                </div>                                                                                                             
                            </div>
                        </div>
                    
                        <div class="form-group">
                            <label>I Am Interested In A</label>
                            <br/>
                            <asp:RadioButtonList ID="ctlInterestedInRBL" TabIndex="4" CssClass="btn-group" data-toggle="buttons" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server" >
                                <asp:ListItem class="btn btn-default" Text="Private Class" Value="Private Class"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="Public Class" Value="Public Class"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>

                        <div class="form-group">
                            <label>This Class Is For</label>
                            <br/>
                            <asp:RadioButtonList ID="ctlClassIsForRBL" TabIndex="5" CssClass="btn-group" data-toggle="buttons" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server" >
                                <asp:ListItem class="btn btn-default" Text="One Person" Value="One Person"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="A Group" Value="A Group"></asp:ListItem>
                            </asp:RadioButtonList>                  
                        </div>  

                        <div class="form-group">
                            <label>I Am Interested In The Following Course Types</label>
                            <asp:TextBox ID="ctlInterestedIn" TabIndex="6" CssClass="form-control" AutoCompleteType="None" placeholder="Your Comment" TextMode="MultiLine" runat="server" />                        	                                    
                        </div>
                    
                        <div class="form-group">
                            <label>The Approximate Number Of Class Participants Will Be</label>
                            <br/>
                            <asp:RadioButtonList ID="ctlParticipantsRBL" TabIndex="7" CssClass="btn-group" data-toggle="buttons" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server" >
                                <asp:ListItem class="btn btn-default" Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="5+" Value="5+"></asp:ListItem>
                            </asp:RadioButtonList>                       	                                    
                        </div>
                    
                        <div class="form-group">
                            <label>I Am Interested In A Special Pricing Plan, Due To A Potential Volume Purchase</label>
                            <br/>
                            <asp:RadioButtonList ID="ctlSpecialPricingRBL" TabIndex="8" CssClass="btn-group" data-toggle="buttons" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server" >
                                <asp:ListItem class="btn btn-default" Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="No" Value="No"></asp:ListItem>
                            </asp:RadioButtonList>                     	                                    
                        </div>

                        <div class="form-group text-right">                        
                            <asp:Button ID="ctlSubmitForm" Text="Submit" CssClass="btn btn-success" runat="server" OnClick="ctlSubmitForm_Click" />                    
                        </div>       
                    </div>

                    <uc:Partners runat="server" />
                    
                </div>                    
            </div>
        </div>
    </div>	      
    
    


             

             

</asp:Content>