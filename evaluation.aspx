<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="evaluation.aspx.cs" Inherits="ProductivityPointGlobal.Evaluation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container-fluid view subPage">
    <div class="row">
        <div class="container">
            <div class="row padding20T">
                <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                    <div class="section1RowSubpage">
                        <h1 class="white fontShadow">Course Evaluation</h1>
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
                <p style="font-size:19px" class="sectionHeadingSubPage text-left subSectionPadding">The quality of your learning experience is very important to us. The goal of this Survey is to gather your feedback so that we may better monitor and improve our processes for supporting our clients. Thank you in advance for helping with this effort.</p>

                <div class="row padding40T">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Full Name (Leave blank for anonymous)</label>
                            <asp:TextBox ID="ctlName" data-validation-optional="true" data-validation-error-msg="Full Name" TabIndex="1" CssClass="form-control" AutoCompleteType="None" placeholder="Full Name" runat="server" />                                        
                        </div>           
                        <div class="form-group">
                            <label>Instructor</label>
                            <asp:TextBox ID="ctlInstructor" data-validation-optional="true" data-validation-error-msg="Instructor" TabIndex="3" CssClass="form-control" AutoCompleteType="None" placeholder="Instructor" runat="server" />                   
                        </div>      
                        <div class="form-group">
                            <label>Dates</label>
                            <asp:TextBox ID="ctlDates" data-validation-optional="true" data-validation-error-msg="Dates" TabIndex="5" CssClass="form-control" AutoCompleteType="None" placeholder="Dates" runat="server" />                    
                        </div>                                                                                                 
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Course Name</label>
                            <asp:TextBox ID="ctlCourseName" data-validation-optional="true" data-validation-error-msg="Course Name" TabIndex="2" CssClass="form-control" AutoCompleteType="None" placeholder="Course Name" runat="server" />                                        
                        </div>                               
                        <div class="form-group">
                            <label>Location</label>
                            <asp:TextBox ID="ctlLocation" data-validation-optional="true" data-validation-error-msg="Location" TabIndex="4" CssClass="form-control" AutoCompleteType="None" placeholder="Location" runat="server" />                    
                        </div>                                                   
                    </div>
                </div>
                    
                <div class="row">
                    <div class="col-md-12">
                        <label>1. The instructor was prepared:</label>
                        <br/>
                        <div class="form-group">                    
                            <asp:RadioButtonList ID="ddlQ1" TabIndex="6" CssClass="btn-group" data-toggle="buttons" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server" >
                                <asp:ListItem class="btn btn-default" Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="5" Value="5"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="6" Value="6"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="7" Value="7"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="8" Value="8"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="9" Value="9"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="10" Value="10"></asp:ListItem>
                            </asp:RadioButtonList>                                   
                        </div>  
                                                        
                        <label>2. The instructor was knowledgeable about the course content:</label>
                        <br/>
                        <div class="form-group">                    
                            <asp:RadioButtonList ID="ddlQ2" TabIndex="7" CssClass="btn-group" data-toggle="buttons" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server" >
                                <asp:ListItem class="btn btn-default" Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="5" Value="5"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="6" Value="6"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="7" Value="7"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="8" Value="8"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="9" Value="9"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="10" Value="10"></asp:ListItem>
                            </asp:RadioButtonList>                                                                                                                                                                                                                                                                                                                                                                                                      	
                        </div>   
                            
                        <label>3. The instructor encouraged questions from the class:</label>
                        <br/>
                        <div class="form-group">                    
                            <asp:RadioButtonList ID="ddlQ3" TabIndex="8" CssClass="btn-group" data-toggle="buttons" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server" >
                                <asp:ListItem class="btn btn-default" Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="5" Value="5"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="6" Value="6"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="7" Value="7"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="8" Value="8"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="9" Value="9"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="10" Value="10"></asp:ListItem>
                            </asp:RadioButtonList>                                                                                                                                                                                                                                                                                                                                                                                                      	
                        </div>                                
                            
                        <label>4. Overall, the instructor's teaching skills were excellent:</label>
                        <br/>
                        <div class="form-group">                    
                            <asp:RadioButtonList ID="ddlQ4" TabIndex="9" CssClass="btn-group" data-toggle="buttons" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server" >
                                <asp:ListItem class="btn btn-default" Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="5" Value="5"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="6" Value="6"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="7" Value="7"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="8" Value="8"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="9" Value="9"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="10" Value="10"></asp:ListItem>
                            </asp:RadioButtonList>     
                        </div>                              

                        <label>5. The material I learned in class will improve my work/school/home performance:</label>
                        <br/>
                        <div class="form-group">                    
                            <asp:RadioButtonList ID="ddlQ5" TabIndex="10" CssClass="btn-group" data-toggle="buttons" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server" >
                                <asp:ListItem class="btn btn-default" Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="5" Value="5"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="6" Value="6"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="7" Value="7"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="8" Value="8"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="9" Value="9"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="10" Value="10"></asp:ListItem>
                            </asp:RadioButtonList>     
                        </div>                                            

                        <label>6. The course materials met or exceeded my expectations:</label>
                        <br/>
                        <div class="form-group">                    
                            <asp:RadioButtonList ID="ddlQ6" TabIndex="11" CssClass="btn-group" data-toggle="buttons" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server" >
                                <asp:ListItem class="btn btn-default" Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="5" Value="5"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="6" Value="6"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="7" Value="7"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="8" Value="8"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="9" Value="9"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="10" Value="10"></asp:ListItem>
                            </asp:RadioButtonList> 
                        </div>                                            

                                        
                        <%--<label>7. The classroom environment was satisfactory.</label>
                        <br/>
                        If rated 3 or less, please explain. (Ex: Temperature, Lighting, Work Space)
                        <br/>
                        <div class="form-group">                    
                            <asp:RadioButtonList ID="ddlQ7" TabIndex="12" CssClass="btn-group" data-toggle="buttons" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server" >
                                <asp:ListItem class="btn btn-default" Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="5" Value="5"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="6" Value="6"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="7" Value="7"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="8" Value="8"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="9" Value="9"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="10" Value="10"></asp:ListItem>
                            </asp:RadioButtonList> 
                        </div>    --%>   

                        <label>7. Prior to this training, my knowledge (or level of confidence) on this topic was</label> 
                        <br/>
                        <div class="form-group">                    
                            <asp:RadioButtonList ID="ddlQ14" TabIndex="12" CssClass="btn-group" data-toggle="buttons" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server" >
                                <asp:ListItem class="btn btn-default" Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="5" Value="5"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="6" Value="6"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="7" Value="7"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="8" Value="8"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="9" Value="9"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="10" Value="10"></asp:ListItem>
                            </asp:RadioButtonList> 
                        </div>    

                        <label>8. Following this training, my knowledge (or level of confidence) on this topic is</label> 
                        <br/>
                        <div class="form-group">                    
                            <asp:RadioButtonList ID="ddlQ15" TabIndex="12" CssClass="btn-group" data-toggle="buttons" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server" >
                                <asp:ListItem class="btn btn-default" Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="5" Value="5"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="6" Value="6"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="7" Value="7"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="8" Value="8"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="9" Value="9"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="10" Value="10"></asp:ListItem>
                            </asp:RadioButtonList> 
                        </div> 
                                                        
                        <div class="form-group">
                            <asp:TextBox ID="tbQ7Comment" TabIndex="13" CssClass="form-control" AutoCompleteType="None" placeholder="Your Comment" TextMode="MultiLine" runat="server" />                        	                                    
                        </div> 

                        <label>9. Would you recommend this course to other people in your company?</label>
                        <div class="form-group">    
                            <asp:RadioButtonList ID="ddlQ8" TabIndex="14" CssClass="btn-group" data-toggle="buttons" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server" >
                                <asp:ListItem class="btn btn-default" Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="Yes with reservations" Value="Yes with reservations"></asp:ListItem>
                                <asp:ListItem class="btn btn-default" Text="No" Value="No"></asp:ListItem>
                            </asp:RadioButtonList>                                                                                             
                        </div>                                            
                          
                        <label>10. The best thing about this course was:</label>                                
                        <div class="form-group">
                            <asp:TextBox ID="tbQ9" TabIndex="15" CssClass="form-control" AutoCompleteType="None" placeholder="Your Comment" TextMode="MultiLine" runat="server" />                        	                                    
                        </div>                                              

                        <label>11. If I could change one thing about this course, I would:</label>                                
                        <div class="form-group">
                            <asp:TextBox ID="tbQ10" TabIndex="16" CssClass="form-control" AutoCompleteType="None" placeholder="Your Comment" TextMode="MultiLine" runat="server" />                        	                                    
                        </div>                                              

                        <label>12. What other courses would you like to have available in the future?</label>                                
                        <div class="form-group">
                            <asp:TextBox ID="tbQ11" TabIndex="17" CssClass="form-control" AutoCompleteType="None" placeholder="Your Comment" TextMode="MultiLine" runat="server" />  
                        </div>                                              
  
                        <label style="display:none">12. How did you hear about Productivity Point?</label>                                
                        <div class="form-group" style="display:none">
                            <asp:TextBox ID="tbQ12" Visible="false" TabIndex="18" CssClass="form-control" AutoCompleteType="None" placeholder="Your Comment" TextMode="MultiLine" runat="server" />  
                        </div>                                              
                                    
                        <label>13. Do you have friends or associates who may also benefit from our Services? If so, please list them here:</label>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Name</label>
                                    <asp:TextBox ID="txtFriend1" data-validation-optional="true" data-validation-error-msg="Name" TabIndex="19" CssClass="form-control" AutoCompleteType="None" placeholder="Name" runat="server" />                   
                                </div>                                                                            
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Phone</label>
                                    <asp:TextBox ID="txtFriendPhone1" data-validation-optional="true" data-validation-error-msg="Phone" TabIndex="20" CssClass="form-control" AutoCompleteType="None" placeholder="Phone" runat="server" />                   
                                </div>                                                                         
                            </div>
                        </div>

                        <label>14. I would like more information on your services:</label>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="tbMoreInfo" TabIndex="21" CssClass="form-control" AutoCompleteType="None" placeholder="My Name" TextMode="SingleLine" runat="server" />  
                                </div>                                         
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="tbMoreInfoPhone" TabIndex="22" CssClass="form-control" AutoCompleteType="None" placeholder="Please call or e-mail me at" TextMode="Phone" runat="server" />  
                                </div>                                       
                            </div>
                        </div>                                                                                                                  

                        <label>Please make any additional comments:</label>                                         
                        <div class="form-group">                                
                            <asp:TextBox ID="tbAdditionalComments" TabIndex="23" CssClass="form-control" AutoCompleteType="None" placeholder="Your Comment" TextMode="MultiLine" runat="server" />                        	                                    
                        </div>                                                                             
                    </div>
                </div>

                <div class="form-group text-right">                        
                    <asp:Button ID="ctlSubmit" Text="Submit" CssClass="btn btn-success" runat="server" OnClick="ctlSubmit_OnClick" />                    
                </div>

                <asp:Panel ID="ctlThankYouPanel" runat="server">                    
                    <div class="alert alert-success" role="alert">
                    <h1>Thank You!</h1>                                      
                    <h2>Your request has been submitted successfully.<br />
                    You will be contacted shortly by a Productivity Point Associate.</h2>                                        
                    </div>
                </asp:Panel>  

                </div>

                <uc:Partners runat="server" />
                    
            </div>                    
        </div>
    </div>
</div>	   
    
    
    


          
</asp:Content>
