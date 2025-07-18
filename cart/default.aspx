<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="ProductivityPointGlobal.cart.Default" Debug="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @media screen and (max-width: 600px) {
            table { width: 100%; }
            thead { display: none; }                        
            tbody td { display: block; text-align: left; }
                tbody td:before { content: attr(data-th); display: block; text-align: left; }
        }
    </style>  
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">      
    <div class="container-fluid view subPage subSectionPadding">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow">Shopping Cart Summary</h1>
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
                        
                        <uc:ShoppingCart ID="uc1" runat="server" />
                        <asp:UpdatePanel runat="server" ID="upCart" UpdateMode="Conditional">
                            <ContentTemplate>
                        <asp:ListView runat="server" ID="lvCart" DataKeyNames="sid" DataSourceID="sqlCart" OnDataBound="lvCart_DataBound" OnItemDeleted="lvCart_ItemDeleted" OnItemDataBound="lvCart_ItemDataBound">
                            <EmptyDataTemplate>
                                <p class="sectionHeadingSubPage text-left subSectionPadding">Your Shopping Cart Is Empty</p>
                            </EmptyDataTemplate>
                            <LayoutTemplate>
                                <p class="sectionHeadingSubPage text-left subSectionPadding" id="stud">Shopping Cart Items</p>
                                <table class="table">
                                    <thead>
                                        <tr>
                                        <th>Class</th>
                                        <th>Price</th>
                                        <th>Subtotal</th>
                                        <th>Seats/Qty.</th>
                                        <th>&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tr runat="server" id="itemPlaceholder"></tr>
                                    <%--<tfoot>
                                        <tr>
                                            <th colspan="4" class="text-right">Total:</th>
                                            <th>
                                                <asp:Literal ID="ltrTotal" runat="server" /></th>
                                        </tr>
                                    </tfoot>--%>
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="blackBg"><strong><span class="hidden-lg hidden-md hidden-sm">Class:</span> <%# Eval("courseName") %></strong>
                                        </td>
                                    <td class="blackBg"><span class="hidden-lg hidden-md hidden-sm"><strong>Price:</strong></span> $<%#Decimal.Parse(Eval("price").ToString()).ToString("0,00.00") %></td>
                                    <td class="blackBg"><span class="hidden-lg hidden-md hidden-sm"><strong>Subtotal:</strong></span><asp:Literal runat="server" ID="linetotal" Text='<%# Eval("linetotal") %>' Visible="false" /><%# Eval("linetotal", "{0:c}") %></td>
                                    <td class="blackBg">
                                        <span class="hidden-lg hidden-md hidden-sm"><strong>Seats/Qty.:</strong></span>
                                        <asp:Literal runat="server" ID="Seats" Text='<%#Eval("Quantity") %>' Visible='<%#(int)Eval("Quantity")>0 %>'></asp:Literal>
                                        <asp:Label runat="server" CssClass="redAlert bold" Visible='<%#(int)Eval("seats")==0 %>'><label for="ContentPlaceHolder1_ctlStudentName">Add Student</label></asp:Label>
                                        <%--<div class="row">
                                            <div class="col-lg-5">
                                                <asp:TextBox ID="ctlQuantity" Text='<%# Eval("Quantity") %>' CssClass="form-control text-center" ForeColor="Black" runat="server" />
                                            </div>
                                            <div class="col-lg-7">
                                                <asp:LinkButton ID="ctlUpdateCart" runat="server" Text="Update" CssClass="btn btn-warning btn-block" OnClick="ctlUpdateCart_Click" />
                                            </div>
                                        </div>--%>
                                    </td>
                                    <td class="blackBg"><span class="hidden-lg hidden-md hidden-sm"><strong>Remove:</strong></span>
                                        <asp:LinkButton ID="btnDel" runat="server" Text="Remove" CssClass="btn btn-warning btn-block" CommandName="Delete" />
                                    </td>
                                </tr>
                                <%--<tr>
                                    <td colspan="5">
                                        <asp:Literal runat="server" ID="ltrId" Text='<%#Eval("sid") %>' Visible="false"></asp:Literal>
                                        <asp:ListView runat="server" ID="lvStud" InsertItemPosition="LastItem" DataKeyNames="id" DataSourceID="sqlStud" OnItemDeleted="lvStud_ItemDeleted" OnItemInserted="lvStud_ItemInserted">
                                            <LayoutTemplate>
                                                <p class="bold">Registered Students</p>
                                                <div class="row hidden-xs">
                                                    <div class="col-sm-4 bold">Name</div>
                                                    <div class="col-sm-4 bold">Email</div>
                                                    <div class="col-sm-4">&nbsp;</div>
                                                </div>
                                                <div id="itemPlaceholder" runat="server"></div>
                                            </LayoutTemplate>
                                            <EmptyDataTemplate>
                                                No student
                                            </EmptyDataTemplate>
                                            <ItemTemplate>
                                                <div class="row">
                                                    <div class="col-sm-4"><strong class="hidden-lg hidden-md hidden-sm">Name:</strong> <%#Eval("name") %></div>
                                                    <div class="col-sm-4"><strong class="hidden-lg hidden-md hidden-sm">Email:</strong> <%#Eval("email") %></div>
                                                    <div class="col-sm-4 text-right">
                                                        <asp:LinkButton ID="btnEdit" CausesValidation="false" runat="server" CommandName="Edit"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>
                                                        <asp:LinkButton ID="btnDelete" CausesValidation="false" runat="server" CommandName="Delete"><span class="glyphicon glyphicon-remove"></span></asp:LinkButton>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                            <InsertItemTemplate>
                                                <p class="bold">Add Student</p>
                                                <div class="row">
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <strong class="hidden-lg hidden-md hidden-sm">Name:</strong> 
                                                            <asp:TextBox runat="server" ID="txtName" CssClass="form-control" Text='<%#Bind("name") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="txtName" CssClass="redAlert" 
                                                                ValidationGroup='<%#string.Format("ins{0}", ((ListViewDataItem)Container.NamingContainer.NamingContainer).DataItemIndex) %>'>Name is requiered</asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <strong class="hidden-lg hidden-md hidden-sm">Email:</strong> 
                                                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" Text='<%#Bind("email") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="txtEmail" CssClass="redAlert" 
                                                                ValidationGroup='<%#string.Format("ins{0}", ((ListViewDataItem)Container.NamingContainer.NamingContainer).DataItemIndex) %>'>Email is requiered</asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" CssClass="redAlert"
                                                                ValidationGroup='<%#string.Format("ins{0}", ((ListViewDataItem)Container.NamingContainer.NamingContainer).DataItemIndex) %>'>Email address is incorrect</asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4 text-right">
                                                        <asp:LinkButton ID="btnInsert" ValidationGroup='<%#string.Format("ins{0}", ((ListViewDataItem)Container.NamingContainer.NamingContainer).DataItemIndex) %>' runat="server" CommandName="Insert"><span class="glyphicon glyphicon-ok"></span></asp:LinkButton>
                                                        <asp:LinkButton ID="btnCancel" CausesValidation="false" runat="server" CommandName="Cancel"><span class="glyphicon glyphicon-ban-circle"></span></asp:LinkButton>
                                                    </div>
                                                </div>
                                            </InsertItemTemplate>
                                            <EditItemTemplate>
                                                <div class="row">
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <strong class="hidden-lg hidden-md hidden-sm">Name:</strong>
                                                            <asp:TextBox runat="server" ID="txtName" CssClass="form-control" Text='<%#Bind("name") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="txtName" CssClass="redAlert" 
                                                                ValidationGroup='<%#Eval("id","upd{0}") %>'>Name is requiered</asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <strong class="hidden-lg hidden-md hidden-sm">Email:</strong> 
                                                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" Text='<%#Bind("email") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="txtEmail" CssClass="redAlert" 
                                                                ValidationGroup='<%#Eval("id","upd{0}") %>'>Email is requiered</asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" CssClass="redAlert"
                                                                ValidationGroup='<%#Eval("id","upd{0}") %>'>Email address is incorrect</asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4 text-right">
                                                        <asp:LinkButton ID="btnUpdate" ValidationGroup='<%#Eval("id","upd{0}") %>' runat="server" CommandName="Update"><span class="glyphicon glyphicon-ok"></span></asp:LinkButton>
                                                        <asp:LinkButton ID="btnCancel" CausesValidation="false" runat="server" CommandName="Cancel"><span class="glyphicon glyphicon-ban-circle"></span></asp:LinkButton>
                                                    </div>
                                                </div>
                                            </EditItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="sqlStud" runat="server" ConnectionString='<%$ ConnectionStrings:SQLConnectionProd %>'
                                            SelectCommand="dbo.tblCartStudents_s" SelectCommandType="StoredProcedure"
                                            DeleteCommand="dbo.tblCartStudents_d" DeleteCommandType="StoredProcedure"
                                            UpdateCommand="dbo.tblCartStudents_u" UpdateCommandType="StoredProcedure"
                                            InsertCommand="dbo.tblCartStudents_i" InsertCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter Name="cartId" ControlID="ltrId" PropertyName="Text" Type="Int32" />
                                            </SelectParameters>
                                            <DeleteParameters>
                                                <asp:Parameter Name="id" Type="Int32" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="id" Type="Int32" />
                                                <asp:Parameter Name="name" Type="String" />
                                                <asp:Parameter Name="email" Type="String" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:ControlParameter Name="cartId" ControlID="ltrId" PropertyName="Text" Type="Int32" />
                                                <asp:Parameter Name="name" Type="String" />
                                                <asp:Parameter Name="email" Type="String" />
                                            </InsertParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td colspan="6">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <strong>Delivery Format:</strong>
                                                <br />
                                                <%# Eval("deliveryFormat") %>
                                            </div>
                                            <div class="col-md-3">
                                                <strong>Date:</strong>
                                                <br />
                                                <%#Eval("startDate","{0:MM/dd/yyyy}") %> - <%#Eval("endDate","{0:MM/dd/yyyy}") %>
                                            </div>
                                            <div class="col-md-3">
                                                <strong>Time:</strong>
                                                <br />
                                                <%#DateTime.Parse(Eval("startTime").ToString()).ToString("h:mm t.\\M.") %> - <%#DateTime.Parse(Eval("endTime").ToString()).ToString("h:mm t.\\M.") %>
                                            </div>
                                            <div class="col-md-3">
                                                <strong>Duration:</strong>
                                                <br />
                                                <%# Eval("duration") %> Day Course                                                                                          
                                            </div>
                                        </div>
                                        <br />
                                        <strong>Location:</strong><br />
                                        <%# Eval("address1") %> <%# Eval("address2") %> <%# Eval("city") %>, <%# Eval("state") %> <%# Eval("zip") %>                                          
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="sqlCart" runat="server" ConnectionString='<%$ ConnectionStrings:SQLConnectionProd %>'
                            SelectCommand="dbo.ShoppingCartItems_s" SelectCommandType="StoredProcedure"
                            DeleteCommand="dbo.tblShoppingCart_d" DeleteCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:CookieParameter Name="CartId" Type="String" CookieName="CartID" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="sid" Type="Int32" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                        <div class="row">
                            <asp:Panel ID="pnlCouponApplied" runat="server">                                                                                    
                                <div class="col-lg-10 col-md-9 col-sm-10 col-xs-8 text-right sectionSubHeadingPrices"><strong>Subtotal:</strong></div>
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 text-right sectionSubHeadingPrices"><asp:Label ID="ctlTotalCostReg" runat="server" /></div>
                                <div class="col-lg-10 col-md-9 col-sm-10 col-xs-8 text-right sectionSubHeadingPrices"><strong>Discount Applied:</strong></div>
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 text-right sectionSubHeadingPrices"><asp:Label ID="ctlDiscountTotal" CssClass="redAlert" runat="server" /></div>
                            </asp:Panel>    
                            <asp:Panel ID="pnlTotal" runat="server">
                                <div class="col-lg-10 col-md-9 col-sm-10 col-xs-8 text-right sectionSubHeadingPrices"><strong>Total:</strong></div>
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 text-right sectionSubHeadingPrices"><asp:Label ID="ctlTotalCost" runat="server" /></div>
                            </asp:Panel>
                        </div>
                        <br/>
                                <asp:PlaceHolder runat="server" ID="phStud">
                                <div class="col-lg-12">
                                    <%-- InsertItemPosition="LastItem"--%>
                                    <asp:ListView ID="lvStud" runat="server" DataKeyNames="id" DataSourceID="sqlStud" OnDataBound="lvStud_DataBound">
                                        <LayoutTemplate>
                                    <p class="sectionHeadingSubPage text-left">Student Information</p>
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>Student</th>
                                                        <th>Email</th>
                                                        <th>Course</th>
                                                        <th>Remove</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr id="itemPlaceholder" runat="server"></tr>
                                                </tbody>
                                            </table>
                                            <%--<div class="row hidden-xs">
                                                    <div class="col-sm-4 bold">Name</div>
                                                    <div class="col-sm-4 bold">Email</div>
                                                    <div class="col-sm-4">&nbsp;</div>
                                                </div>--%>
                                        </LayoutTemplate>
                                        <EmptyDataTemplate>
                                            <%--<div class="alert alert-warning" role="alert">Please make sure to <strong>ADD</strong> at least 1 student by <strong>CLICKING</strong> the <strong>Add Student</strong> button</div>--%>
                                        </EmptyDataTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td><strong class="hidden-lg hidden-md hidden-sm">Name:</strong> <%#Eval("name") %></td>
                                                <td><strong class="hidden-lg hidden-md hidden-sm">Email:</strong> <%#Eval("email") %></td>
                                                <td><strong class="hidden-lg hidden-md hidden-sm">Course:</strong> <%#Eval("courseName") %></td>
                                                <td class="text-right">
                                                    <%--<asp:LinkButton ID="btnEdit" CausesValidation="false" runat="server" CommandName="Edit"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>--%>
                                                    <%--<asp:LinkButton ID="btnDelete" CausesValidation="false" runat="server" CommandName="Delete"><span class="glyphicon glyphicon-remove"></span></asp:LinkButton>--%>
                                                    <asp:Button ID="btnRemove" runat="server" CommandName="Delete" CssClass="btn btn-danger" Text="Remove" />
                                                </td>

                                            </tr>
                                            <%--<div class="row">
                                                    <div class="col-sm-3"><strong class="hidden-lg hidden-md hidden-sm">Name:</strong> <%#Eval("name") %></div>
                                                    <div class="col-sm-3"><strong class="hidden-lg hidden-md hidden-sm">Email:</strong> <%#Eval("email") %></div>
                                                    <div class="col-sm-3"><strong class="hidden-lg hidden-md hidden-sm">Course:</strong> <%#Eval("courseName") %></div>
                                                    <div class="col-sm-3 text-right">
                                                        <asp:LinkButton ID="btnEdit" CausesValidation="false" runat="server" CommandName="Edit"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>
                                                        <asp:LinkButton ID="btnDelete" CausesValidation="false" runat="server" CommandName="Delete"><span class="glyphicon glyphicon-remove"></span></asp:LinkButton>
                                                    </div>
                                                </div>--%>
                                        </ItemTemplate>
                                        <%--                                            <InsertItemTemplate>
                                                <p class="bold">Add Student</p>
                                                <div class="row">
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <strong class="hidden-lg hidden-md hidden-sm">Name:</strong> 
                                                            <asp:TextBox runat="server" ID="txtName" CssClass="form-control" Text='<%#Bind("name") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="txtName" CssClass="redAlert" 
                                                                ValidationGroup="ins">Name is requiered</asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <strong class="hidden-lg hidden-md hidden-sm">Email:</strong> 
                                                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" Text='<%#Bind("email") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="txtEmail" CssClass="redAlert" 
                                                                ValidationGroup="ins">Email is requiered</asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" CssClass="redAlert"
                                                                ValidationGroup="ins">Email address is incorrect</asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4 text-right">
                                                        <asp:LinkButton ID="btnInsert" ValidationGroup="ins" runat="server" CommandName="Insert"><span class="glyphicon glyphicon-ok"></span></asp:LinkButton>
                                                        <asp:LinkButton ID="btnCancel" CausesValidation="false" runat="server" CommandName="Cancel"><span class="glyphicon glyphicon-ban-circle"></span></asp:LinkButton>
                                                    </div>
                                                </div>
                                            </InsertItemTemplate>
                                            <EditItemTemplate>
                                                <div class="row">
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <strong class="hidden-lg hidden-md hidden-sm">Name:</strong>
                                                            <asp:TextBox runat="server" ID="txtName" CssClass="form-control" Text='<%#Bind("name") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="txtName" CssClass="redAlert" 
                                                                ValidationGroup='<%#Eval("id","upd{0}") %>'>Name is requiered</asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <strong class="hidden-lg hidden-md hidden-sm">Email:</strong> 
                                                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" Text='<%#Bind("email") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="txtEmail" CssClass="redAlert" 
                                                                ValidationGroup='<%#Eval("id","upd{0}") %>'>Email is requiered</asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" CssClass="redAlert"
                                                                ValidationGroup='<%#Eval("id","upd{0}") %>'>Email address is incorrect</asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4 text-right">
                                                        <asp:LinkButton ID="btnUpdate" ValidationGroup='<%#Eval("id","upd{0}") %>' runat="server" CommandName="Update"><span class="glyphicon glyphicon-ok"></span></asp:LinkButton>
                                                        <asp:LinkButton ID="btnCancel" CausesValidation="false" runat="server" CommandName="Cancel"><span class="glyphicon glyphicon-ban-circle"></span></asp:LinkButton>
                                                    </div>
                                                </div>
UpdateCommand="dbo.tblCartStudents_u" UpdateCommandType="StoredProcedure"
                                            InsertCommand="dbo.tblCartStudents_i" InsertCommandType="StoredProcedure"
                                            </EditItemTemplate>--%>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="sqlStud" runat="server" ConnectionString='<%$ ConnectionStrings:SQLConnectionProd %>'
                                        DeleteCommand="dbo.tblCartStudents_d" DeleteCommandType="StoredProcedure"
                                        SelectCommand="dbo.tblCartStudentsCourse_s" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:CookieParameter CookieName="CartID" Name="CartId" Type="String" />
                                            <%--<asp:ControlParameter Name="cartId" ControlID="ltrId" PropertyName="Text" Type="Int32" />--%>
                                        </SelectParameters>
                                        <DeleteParameters>
                                            <asp:Parameter Name="id" Type="Int32" />
                                        </DeleteParameters>
                                        <%--<UpdateParameters>
                                                <asp:Parameter Name="id" Type="Int32" />
                                                <asp:Parameter Name="name" Type="String" />
                                                <asp:Parameter Name="email" Type="String" />
                                            </UpdateParameters>--%>
                                        <%--<InsertParameters>
                                                <asp:ControlParameter Name="cartId" ControlID="ctlStudentCourse" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:Parameter Name="name" Type="String" />
                                                <asp:Parameter Name="email" Type="String" />
                                            </InsertParameters>--%>
                                    </asp:SqlDataSource>

                                    <%--                                        <asp:GridView ID="ctlStudentList" AutoGenerateColumns="false" CssClass="table table-hover" DataKeyNames="id" GridLines="None" EnableViewState="true" runat="server" OnDataBound="ctlStudentList_DataBound">
                                            <Columns>
                                                <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" FooterStyle-CssClass="hidden">
                                                    <HeaderTemplate>
                                                        <thead>
                                                            <tr>
                                                                <th>Student</th>
                                                                <th>Email</th>
                                                                <th>Course</th>
                                                                <th>Remove</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>Student:</strong></span>
                                                            <asp:Label ID="ctlStudentName" Text='<%# Bind("student_name") %>' runat="server" /></td>
                                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>Email:</strong></span>
                                                            <asp:Label ID="ctlStudentEmail" Text='<%# Bind("student_email") %>' runat="server" /></td>
                                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>Course:</strong></span>
                                                            <asp:Label ID="ctlStudentCourse" Text='<%# Bind("student_course") %>' runat="server" /></td>
                                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>Remove:</strong></span>
                                                            <asp:CheckBox ID="ctlRemove" runat="server" /></td>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>--%>

                                    <%--<div class="form-group text-right">
                                            <asp:Button ID="ctlRemoveStudent" runat="server" CssClass="btn btn-danger" Text="Remove Selected Student" OnClick="ctlRemoveStudent_Click" />
                                        </div>--%>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <a href="#">
                                            <p class="sectionHeadingSubPage text-left">Add Students</p>
                                        </a>
                                        <asp:PlaceHolder runat="server" ID="phNoStud">
                                            <div class="alert alert-warning" role="alert">Please make sure to <strong>ADD</strong> at least 1 student by <strong>CLICKING</strong> the <strong>Add Student</strong> button</div>
                                        </asp:PlaceHolder>
                                        <%--<asp:Panel ID="ctlShowStudentNotification" runat="server">
                                        </asp:Panel>--%>

                                        <div class="form-group">
                                            <asp:CheckBox ID="ctlStudentInfoSame" runat="server" AutoPostBack="true" OnCheckedChanged="ctlStudentInfoSame_CheckedChanged" Text="Same As Contact Information" /><%--&nbsp;&nbsp;Same As Contact Information--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <asp:Label ID="Label1" runat="server" AssociatedControlID="ctlStudentName" Text="Student Name"></asp:Label>
                                            <asp:TextBox ID="ctlStudentName" runat="server" AutoCompleteType="None" CssClass="form-control" data-validation="required" data-validation-error-msg="Please enter a students name" placeholder="Student Name">
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ctlStudentName" CssClass="redAlert" Display="Dynamic" ErrorMessage="Name is required" ValidationGroup="ins">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <asp:Label ID="Label2" runat="server" AssociatedControlID="ctlStudentEmail" Text="Student Email"></asp:Label>
                                            <asp:TextBox ID="ctlStudentEmail" runat="server" AutoCompleteType="None" CssClass="form-control" data-validation="required" data-validation-error-msg="Please enter a valid email address" placeholder="Student Email Address">
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ctlStudentEmail" CssClass="redAlert" Display="Dynamic"
                                                ValidationGroup="ins">Email is requiered</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                ControlToValidate="ctlStudentEmail" CssClass="redAlert"
                                                Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                ValidationGroup="ins">Email address is incorrect</asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:Label ID="Label3" runat="server" AssociatedControlID="ctlStudentCourse" Text="Course"></asp:Label>
                                            <asp:DropDownList ID="ctlStudentCourse"
                                                runat="server"
                                                CssClass="form-control"
                                                DataSourceID="sqlCourse" DataTextField="courseName" DataValueField="id" placeholder="Country">
                                                <%--<asp:ListItem Value="0">Select Course</asp:ListItem>--%>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                                runat="server" ControlToValidate="ctlStudentCourse"
                                                CssClass="redAlert" Display="Dynamic" ErrorMessage="Select the course"
                                                InitialValue="0"
                                                ValidationGroup="ins">
                                            </asp:RequiredFieldValidator>

                                            <asp:SqlDataSource ID="sqlCourse" runat="server" ConnectionString='<%$ ConnectionStrings:SQLConnectionProd %>'
                                                SelectCommand="dbo.shoppingCartCourses" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:CookieParameter CookieName="CartID" Name="CartId" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <%--<div class="col-sm-2 col-xs-3">
                                            <img src="images/warning.jpg" style="max-width: 100%" />
                                        </div>--%>
                                        <%--<div class="col-sm-8 col-xs-9">
                                            <span class="italic">Select a course from the above Drop down list or locate a course 
                                            from the search box at the top of the screen. 
                                            You can also select a course from the Courses Menu.
                                            </span>
                                        </div>--%>
                                        <div class="col-sm-12 col-xs-12 text-right">
                                            <asp:Button ID="ctlAddStudent" runat="server" CssClass="btn btn-success" OnClick="ctlAddStudent_Click" Text="Add Student" ValidationGroup="ins" />
                                        </div>
                                        <br /><br />
                                    </div>
                                    <p>&nbsp;</p>

                                </div>
                                <%--<a href="#">
                                </a>--%>

                                </asp:PlaceHolder>


                                <div class="row">
                            <div class="col-lg-4 padding10B"><%--<asp:Button ID="ctlDeleteItem" Text="Remove Items" CssClass="btn btn-block btn-danger" runat="server" OnClick="ctlDeleteItem_Click" />--%></div>
                            <div class="col-lg-4 padding10B"><asp:Button ID="ctlContinueShopping" runat="server" CssClass="btn btn-block btn-warning" Text="Continue Shopping" OnClick="ctlContinueShopping_Click" /></div>
                            <div class="col-lg-4 padding10B"><asp:Button ID="ctlCheckOut" runat="server" CssClass="btn btn-block btn-success" Text="Checkout" OnClick="ctlCheckOut_Click" /></div>
                        </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <%--<p class="sectionHeadingSubPage text-left subSectionPadding"><asp:Label ID="ctlCartHeader" runat="server" /></p>--%>                                                
                        
<%--                        <asp:GridView ID="ctlCartInfo" AutoGenerateColumns="false" CssClass="table" DataKeyNames="ClassId" GridLines="None" EnableViewState="false" runat="server">
                            <Columns>
                                <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" FooterStyle-CssClass="hidden">                                    
                                    <HeaderTemplate>
                                        <thead>
                                            <th>Class</th>
                                            <th>Price</th>
                                            <th>Subtotal</th>
                                            <th>Seats/Qty.</th>
                                            <th>Remove</th>
                                        </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>                                                                                   
                                        <td class="blackBg"><strong><span class="hidden-lg hidden-md hidden-sm">Class:</span> <%# Eval("courseName") %></strong></div>
                                        <td class="blackBg"><span class="hidden-lg hidden-md hidden-sm"><strong>Price:</strong></span> $<%#Decimal.Parse(Eval("price").ToString()).ToString("0,00.00") %></td>
                                        <td class="blackBg"><span class="hidden-lg hidden-md hidden-sm"><strong>Subtotal:</strong></span> <%# Eval("Subtotal", "{0:c}") %></td>
                                        <td class="blackBg">
                                            <div class="row">
                                                <div class="col-lg-5">
                                                    <span class="hidden-lg hidden-md hidden-sm"><strong>Seats/Qty.:</strong></span> <asp:TextBox ID="ctlQuantity" Text='<%# Eval("Quantity") %>' CssClass="form-control text-center" ForeColor="Black" runat="server" />
                                                </div>
                                                <div class="col-lg-7">
                                                    <asp:LinkButton ID="ctlUpdateCart" runat="server" Text="Update" CssClass="btn btn-warning btn-block" OnClick="ctlUpdateCart_Click" />
                                                </div>
                                            </div>                                            
                                        </td>
                                        <td class="blackBg"><span class="hidden-lg hidden-md hidden-sm"><strong>Remove:</strong></span> <asp:CheckBox ID="ctlRemove" runat="server" /></td>
                            
                                        <tr>
                                            <td colspan="6">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <strong>Delivery Format:</strong>
                                                        <br/>
                                                        <%# Eval("deliveryFormat") %>                                                
                                                    </div>
                                                    <div class="col-md-3">
                                                        <strong>Date:</strong> 
                                                        <br/>
                                                        <%#DateTime.Parse(Eval("startDate").ToString()).ToString("MM/dd/yyyy") %> - <%#DateTime.Parse(Eval("endDate").ToString()).ToString("MM/dd/yyyy") %>
                                                
                                                    </div>
                                                    <div class="col-md-3">
                                                        <strong>Time:</strong>
                                                        <br/>
                                                        <%#DateTime.Parse(Eval("startTime").ToString()).ToString("h:mm t.\\M.") %> - <%#DateTime.Parse(Eval("endTime").ToString()).ToString("h:mm t.\\M.") %>
                                                
                                                    </div>
                                                    <div class="col-md-3">
                                                        <strong>Duration:</strong> 
                                                        <br/>
                                                        <%# Eval("duration") %> Day Course                                                                                          
                                                    </div>                                            
                                                </div> 
                                                <br/>
                                                <strong>Location:</strong><br />
                                                <%# Eval("address1") %> <%# Eval("address2") %> <%# Eval("city") %>, <%# Eval("state") %> <%# Eval("zip") %>                                          
                                            </td>                            
                                        </tr>
                                    </ItemTemplate>                          
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>--%>
                        
                        <%--<asp:Label ID="ctlCartStatus" runat="server" />--%>
                        
                    </div>

                    <uc:Partners runat="server" />                    
                </div>                      
            </div>
        </div>
    </div>	         
    
</asp:Content>