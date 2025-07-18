<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="cart2.aspx.cs" Inherits="ProductivityPointGlobal.cart.Cart2" Debug="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @media screen and (max-width: 600px) {
            table {
                width: 100%;
            }

            thead {
                display: none;
            }

            tbody td {
                display: block;
                text-align: left;
            }

                tbody td:before {
                    content: attr(data-th);
                    display: block;
                    text-align: left;
                }
        }
    </style>
    <style>
        .cart-table > thead > tr {
            border-radius: 5px;
        }

            .cart-table > thead > tr > th {
                background-color: darkblue !important;
                color: white;
            }

        .remove-button {
            width: 32px;
            padding: 4px;
            margin: 0px;
            background-color: #E85C24 !important;
        }

        .width-60 {
            width: 60px;
        }

        .ul-quantity {
            margin: 20px 0 0 0 !important;
        }

        #alignElement {
            margin-left: auto;
            width: 200px; /* Adjust to match your "Price" column width */
            text-align: right;
        }
        .custom-width{
            width:65px;
        }
        .custom-price{

        }
    </style>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <%--<uc:Search ID="ucSearch" runat="server" />--%>

    <div class="container-fluid bgWhite subPage padding75B">
        <div class="row">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div style="margin-top: 90px;">
                            <p class="sectionHeadingSubPage text-left subSectionPadding"><b>Cart</b></p>
                            <ul style="font-size: 18px;" class="ul-quantity">
                                <li>Quantity indicates the number of seats you are purchasing.</li>
                                <li>Specify attendee names during check-out if you are buying multiple seats or courses.</li>
                            </ul>
                            <br />
                            <contenttemplate>
                                <asp:ListView runat="server" ID="lvCart" DataKeyNames="sid" DataSourceID="sqlCart" OnDataBound="lvCart_DataBound" OnItemDeleted="lvCart_ItemDeleted" OnItemDataBound="lvCart_ItemDataBound">
                                    <EmptyDataTemplate>
                                        <p class="sectionHeadingSubPage text-left subSectionPadding"><b>Your Shopping Cart Is Empty</b></p>
                                    </EmptyDataTemplate>
                                    <LayoutTemplate>
                                        <%--<p class="sectionHeadingSubPage text-left subSectionPadding" id="stud"><b>Shopping Cart Items</b></p>--%>
                                        <table class="table cart-table" id="cart-table" style="position:relative">
                                            <thead>
                                                <tr class="background-primary">
                                                    <th style="width:115px">Quantity</th>
                                                    <th style="width:360px">Course</th>
                                                    <th style="width: 270px;">Date</th>
                                                    <th style="width: 255px;">Time</th>
                                                    <th style="width: 265px">Location</th>
                                                    <th style="width: 210px">Delivery</th>
                                                    <th style="width: 150px;position:absolute;padding-left:45px;">Price</th>
                                                    <th></th>
                                                    <th style="width: 210px; text-align:center"></th>
                                                </tr>
                                            </thead>
                                            <tr runat="server" id="itemPlaceholder"></tr>
                                        </table>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td class="blackBg" style="width:115px">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <asp:HiddenField ID="hiddenItemId" runat="server" Value='<%# Eval("ClassID") %>' />
                                                        <asp:TextBox AutoPostBack="true" ID="txtQuantity" Text='<%# Eval("Quantity") %>'
                                                            runat="server" type="number" CssClass="form-control custom-width"
                                                            OnTextChanged="ctlChangeQuantity">
                                                        </asp:TextBox>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="blackBg" style="width:360px"><span class="hidden-lg hidden-md hidden-sm"><strong>Course:</strong></span> <%# Eval("courseName") %></td>
                                            <td class="blackBg" style="width: 270px;"><span class="hidden-lg hidden-md hidden-sm"><strong>Date:</strong></span> <%# Eval("startDate","{0:MM/dd/yyyy}") %> - <%# Eval("endDate","{0:MM/dd/yyyy}") %></td>
                                           <td class="blackBg" style="width: 255px;">
    <span class="hidden-lg hidden-md hidden-sm"><strong>Time:</strong></span>
    <%# DateTime.Parse(Eval("startTime").ToString()).ToString("hh:mm tt") %> - 
    <%# DateTime.Parse(Eval("endTime").ToString()).ToString("hh:mm tt") %>
</td>
                                            <td class="blackBg" style="width: 265px"><span class="hidden-lg hidden-md hidden-sm"><strong>Where:</strong></span> <%# Eval("address1").ToString().Trim() == "Live Online" ?"Live Online": Eval("address1").ToString()+", "+ Eval("address2").ToString() +", " +Eval("city").ToString() +", "+ Eval("state") +" "+ Eval("zip")%></td>
                                            <td class="blackBg" style="width: 210px"><span class="hidden-lg hidden-md hidden-sm"><strong>Delivery:</strong></span> <%# Eval("deliveryFormat").ToString().Trim() == "Live Online"?"Virtual":Eval("deliveryFormat") %></td>
                                            <td class="blackBg" style="width: 150px;text-align:right"><span class="hidden-lg hidden-md hidden-sm"><strong>Price:</strong></span>
                                                <asp:Literal runat="server" ID="price" Text='<%# Eval("price") %>' Visible="false" />
                                                $<%#(Decimal.Parse(Eval("price").ToString()) * Decimal.Parse(Eval("quantity").ToString())).ToString("0,00.00") %></td>
                                            <td class="blackBg"><span class="hidden-lg hidden-md hidden-sm"><strong>Subtotal:</strong></span><asp:Literal runat="server" ID="linetotal" Text='<%# Eval("linetotal") %>' Visible="false" /></td>
                                            <td class="blackBg" style="width: 210px">
                                                <div class="row">
                                                    <div class="" style="position:absolute;padding-left:50px">
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-warning btn-block remove-button" CommandName="Delete">
                                                    <i class="fa fa-times" style="color:white"></i>
                                                        </asp:LinkButton>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>

                                    </ItemTemplate>

                                </asp:ListView>

                                <table class="table cart-table" style="margin-top: 0;">
                                    <tr>
                                        <td colspan="6"></td>
                                        <!-- empty columns before Price -->
                                        <td style="text-align: right; border-top: 1px solid black; padding-top: 10px; padding-right:47px">
                                            <asp:Panel ID="pnlCouponApplied" runat="server" Visible="false">
                                                <div class="sectionSubHeadingPrices">
                                                    <strong>Discount Applied:</strong>
                                                    <asp:Label ID="ctlDiscountTotal" CssClass="redAlert" runat="server" />
                                                </div>
                                            </asp:Panel>

                                            <asp:Panel ID="pnlTotal" runat="server">
                                                <div class="sectionSubHeadingPrices">
                                                    <strong>Total:</strong>
                                                    <strong>
                                                        <asp:Label ID="ctlTotalCost" runat="server" />
                                                    </strong>
                                                </div>
                                            </asp:Panel>
                                        </td>
                                        <td colspan="2"></td>
                                        <!-- remaining columns -->
                                    </tr>
                                </table>
                                <%-- <div class="row">
                                    <div class="col-md-5">
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                    <div class="col-md-2" style="border-top: 1px solid black; padding-top: 10px;" id="alignElement">
                                        <div class="row">

                                            <asp:Panel ID="pnlCouponApplied" runat="server">
                                                <div class="col-lg-10 col-md-9 col-sm-10 col-xs-8 text-right sectionSubHeadingPrices"><strong>Discount Applied:</strong></div>
                                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 text-right sectionSubHeadingPrices">
                                                    <asp:Label ID="ctlDiscountTotal" CssClass="redAlert" runat="server" />
                                                </div>
                                            </asp:Panel>
                                            <asp:Panel ID="pnlTotal" runat="server">
                                                <div class="col-lg-10 col-md-9 col-sm-10 col-xs-8 text-right sectionSubHeadingPrices" style="float: right">
                                                    <strong>Total:</strong> <strong>
                                                        <asp:Label ID="ctlTotalCost" runat="server" />
                                                    </strong>
                                                </div>
                                            </asp:Panel>
                                        </div>

                                    </div>
                                </div>--%>
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
                                </div>
                                <br />
                                <asp:PlaceHolder runat="server" ID="phStud">
                                    <div class="col-lg-12">
                                        <%-- InsertItemPosition="LastItem"--%>
                                        <asp:ListView ID="lvStud" EnableViewState="true" runat="server" DataKeyNames="id" DataSourceID="sqlStud" OnDataBound="lvStud_DataBound">
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
                                    <div class="row" style="display: none">
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
                                    <div class="row" style="display: none">
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
                                            <br />
                                            <br />
                                        </div>
                                        <p>&nbsp;</p>

                                    </div>
                                    <%--<a href="#">
                                </a>--%>

                                </asp:PlaceHolder>


                                <div class="row">
                                    <div class="col-lg-4 padding10B">
                                        <button type="button" class="btn btn-default" onclick="document.getElementById('searchIconImage').click()"><i class="fa fa-arrow-left"></i>Back to Search </button>
                                    </div>
                                    <div class="col-lg-4 padding10B" style="display: none">
                                        <asp:Button ID="ctlContinueShopping" runat="server" CssClass="btn btn-block btn-warning" Text="Continue Shopping" OnClick="ctlContinueShopping_Click" />
                                    </div>
                                    <div class="col-lg-6">
                                    </div>
                                    <div class="col-lg-2" style="text-align: right;">
                                        <asp:Button ID="ctlCheckOut" runat="server" BackColor="#e85c24" ForeColor="White" CssClass="btn btn-block" Width="160" Text="Next" OnClick="ctlCheckOut_Click"></asp:Button>
                                    </div>
                                </div>

                            </contenttemplate>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>

</asp:Content>

