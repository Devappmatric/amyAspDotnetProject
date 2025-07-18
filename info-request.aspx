<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="info-request.aspx.cs" Inherits="ProductivityPointGlobal.InfoRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow">Request Info</h1>
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
                        <div>
                            <p class="sectionHeadingSubPage text-left subSectionPadding">Get the Facts, Start your Training.</p>   
                            <div class="paddingRightImageContainer">
                                <img src="/images/request_info1.jpg" alt="Public Classroom Training" />
                            </div>
                            <p>Fill out the form below and a helpful Training Center Specialist will promptly answer any questions you have about corporate training and event hosting services.
                            <br/><br/>
                            Tell us what information you are looking for and we will direct you to the proper Training Center Specialist and give you the most informative answer possible.</p>
                            <div class="clearfix"></div>
                        </div>
                                                
                        <asp:Panel ID="ctlFormPanel" runat="server">
                            <div class="row padding40T">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Full Name*</label> 
                                        <asp:TextBox ID="ctlUsernameNew" data-validation="required" data-validation-error-msg="Please enter your full name" TabIndex="1" CssClass="form-control" AutoCompleteType="None" placeholder="Full Name" runat="server" />                                        
                                    </div>         
                                    <div class="form-group">
                                        <label>Phone Number</label>
                                        <asp:TextBox ID="ctlPhone" TabIndex="3" CssClass="form-control" AutoCompleteType="None" placeholder="Phone Number" runat="server" />
                                    </div>     
                                    <div class="form-group">
                                        <label>Email Address*</label>
                                        <asp:TextBox ID="ctlEmail" data-validation="required" data-validation-error-msg="Please enter your email address" TabIndex="5" CssClass="form-control" AutoCompleteType="None" placeholder="Email Address" runat="server" />                   
                                    </div>                                                                      
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Company Name</label>
                                        <asp:TextBox ID="ctlCompany" TabIndex="2" CssClass="form-control" AutoCompleteType="None" placeholder="Company Name" runat="server" />                    
                                    </div>   
                                    <div class="form-group">
                                        <label>Title</label>
                                        <asp:TextBox ID="ctlTitle" TabIndex="4" CssClass="form-control" AutoCompleteType="None" placeholder="Title" runat="server" />                    
                                    </div>                                                     
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Your Comment</label>
                                <asp:TextBox ID="ctlComment" TabIndex="6" CssClass="form-control" AutoCompleteType="None" placeholder="Your Comment" TextMode="MultiLine" runat="server" />                        	                                    
                            </div>
                            <div class="form-group text-right">                        
                                <asp:Button ID="ctlSubmitForm" Text="Submit" CssClass="btn btn-success" runat="server" OnClick="ctlSubmitForm_Click" />                    
                            </div>                    
                        </asp:Panel>                                               
                    </div>

                    <uc:Partners runat="server" />
                    
                </div>                    
            </div>
        </div>
    </div>
</asp:Content>