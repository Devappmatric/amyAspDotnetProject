<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="confirmation-check.aspx.cs" Inherits="ProductivityPointGlobal.cart.ConfirmationCheck" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-8 col-md-7 col-sm-12 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow">Payment Confirmation</h1>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-5 hidden-sm hidden-xs col-xs-12 margin20T responsiveCol">
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

                        <%--<div class="alert alert-success margin20T" role="alert">Thank you for registering with Productivity Point Learning Solutions. We appreciate your Business!</div>--%>

                        <p class="sectionHeadingSubPage text-left subSectionPadding">Order Summary</p>

                        <asp:GridView ID="ctlCartInfo" AutoGenerateColumns="false" CssClass="table" DataKeyNames="ClassId" GridLines="None" EnableViewState="false" runat="server">
                            <Columns>
                                <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" FooterStyle-CssClass="hidden">
                                    <HeaderTemplate>
                                        <thead>
                                            <tr>
                                                <th>Class</th>
                                                <th>Price</th>
                                                <th>Subtotal</th>
                                                <th>Seats/Qty.</th>
                                            </tr>
                                        </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <td class="blackBg"><span class="hidden-lg hidden-md hidden-sm"><strong>Class:</strong></span> <strong>
                                            <asp:Label ID="ctlCourseName" Text='<%# Eval("courseName") %>' runat="server" /></strong></td>
                                        <td class="blackBg"><span class="hidden-lg hidden-md hidden-sm"><strong>Price:</strong></span> $<asp:Label ID="ctlCoursePrice" runat="server" Text='<%#Decimal.Parse(Eval("price").ToString()).ToString("0,00.00") %>' /></td>
                                        <td class="blackBg"><span class="hidden-lg hidden-md hidden-sm"><strong>Subtotal:</strong></span>
                                            <asp:Label ID="ctlSubtotal" Text='<%# Eval("Subtotal", "{0:c}") %>' runat="server" /></td>
                                        <td class="blackBg"><span class="hidden-lg hidden-md hidden-sm"><strong>Seats/Qty.:</strong></span>
                                            <asp:Label ID="ctlQuantity" Text='<%# Eval("Quantity") %>' Width="50px" runat="server" /></td>

                                        <tr>
                                            <td colspan="6">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <strong>Delivery Format:</strong>
                                                        <br />
                                                        <asp:Label ID="ctlDeliveryFormat" Text='<%# Eval("deliveryFormat") %>' runat="server" />
                                                    </div>
                                                    <div class="col-md-3">
                                                        <strong>Date:</strong>
                                                        <br />
                                                        <asp:Label ID="ctlStartDate" Text='<%#DateTime.Parse(Eval("startDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" />
                                                        -
                                                        <asp:Label ID="ctlEndDate" Text='<%#DateTime.Parse(Eval("endDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" />
                                                    </div>
                                                    <div class="col-md-3">
                                                        <strong>Time:</strong>
                                                        <br />
                                                        <asp:Label ID="ctlStartTime" Text='<%#DateTime.Parse(Eval("startTime").ToString()).ToString("h:mm t.\\M.") %>' runat="server" />
                                                        -
                                                        <asp:Label ID="ctlEndTime" Text='<%#DateTime.Parse(Eval("endTime").ToString()).ToString("h:mm t.\\M.") %>' runat="server" />
                                                    </div>
                                                    <div class="col-md-3">
                                                        <strong>Duration:</strong>
                                                        <br />
                                                        <asp:Label ID="ctlDuration" Text='<%# Eval("duration") %>' runat="server" />
                                                        Day Course                                                                                          
                                                    </div>
                                                </div>
                                                <br />
                                                <strong>Location:</strong><br />
                                                <asp:Label ID="ctlAddress1" Text='<%# Eval("address1") %>' runat="server" />
                                                <asp:Label ID="ctlAddress2" Text='<%# Eval("address2") %>' runat="server" />
                                                <asp:Label ID="ctlCity" Text='<%# Eval("city") %>' runat="server" />,
                                                <asp:Label ID="ctlState" Text='<%# Eval("state") %>' runat="server" />
                                                <asp:Label ID="ctlZip" Text='<%# Eval("zip") %>' runat="server" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                        <p class="sectionHeadingSubPage text-left subSectionPadding">Student Information</p>

                        <asp:GridView ID="ctlStudentList" CssClass="table" AutoGenerateColumns="false" DataKeyNames="id" GridLines="None" EnableViewState="false" runat="server">
                            <Columns>
                                <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" FooterStyle-CssClass="hidden">
                                    <HeaderTemplate>
                                        <thead>
                                            <tr>
                                                <th>Student Name</th>
                                                <th>Email Address</th>
                                                <th>Course</th>
                                            </tr>
                                        </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>Student Name</strong></span><asp:Label ID="ctlStudentName" Text='<%# Bind("student_name") %>' runat="server" /></td>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>Email Address</strong></span><asp:Label ID="ctlStudentEmail" Text='<%# Bind("student_email") %>' runat="server" /></td>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>Course</strong></span><asp:Label ID="ctlStudentCourse" Text='<%# Bind("student_course") %>' runat="server" /></td>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                        <p class="sectionHeadingSubPage text-left subSectionPadding">Purchasing Information</p>

                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Invoice Number</th>
                                    <th>Order Number</th>
                                    <th>Purchase Order Number</th>
                                    <th>Order Date</th>
                                    <th>Payment Method</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Invoice Number:</strong></span>
                                        <asp:Label ID="ctlInvoiceNumber" runat="server" /></td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Order Number:</strong></span>
                                        <asp:Label ID="ctlOrderNumber" runat="server" />
                                    </td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Purchase Order Number:</strong></span>
                                        <asp:Label ID="ctlPO" runat="server" /></td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Order Date:</strong></span>
                                        <asp:Label ID="ctlTodaysDate" runat="server" /></td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Payment Method:</strong></span>
                                        <asp:Label ID="ctlPaymentMethod" runat="server" /></td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Total:</strong></span>
                                        <asp:Label ID="ctlTotalCost" runat="server" /></td>
                                </tr>
                            </tbody>
                        </table>

                        <p class="sectionHeadingSubPage text-left subSectionPadding">Billing Information</p>

                        <asp:GridView ID="ctlBillingInfoGrid" CssClass="table" DataKeyNames="id" AutoGenerateColumns="False" GridLines="None" AllowPaging="False" runat="server">
                            <Columns>
                                <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" FooterStyle-CssClass="hidden">
                                    <HeaderTemplate>
                                        <thead>
                                            <tr>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Phone #</th>
                                                <th>Company Name</th>
                                                <th>Address</th>
                                                <th>City</th>
                                                <th>State/Province</th>
                                                <th>Country</th>
                                                <th>Zip Code</th>
                                            </tr>
                                        </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>First Name:</strong></span>
                                            <asp:Label ID="ctlFirstName" Text='<%# Eval("billing_firstname") %>' runat="server" /></td>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>Last Name:</strong></span>
                                            <asp:Label ID="ctlLastName" Text='<%# Eval("billing_lastname") %>' runat="server" /></td>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>Phone #:</strong></span>
                                            <asp:Label ID="ctlPhone" Text='<%# Eval("billing_phone") %>' runat="server" /></td>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>Company Name:</strong></span>
                                            <asp:Label ID="ctlCompany" Text='<%# Eval("billing_company") %>' runat="server" /></td>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>Address:</strong></span>
                                            <asp:Label ID="ctlAddress" Text='<%# Eval("billing_address") %>' runat="server" /></td>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>City:</strong></span>
                                            <asp:Label ID="ctlCity" Text='<%# Eval("billing_city") %>' runat="server" /></td>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>State/Province:</strong></span>
                                            <asp:Label ID="ctlState" Text='<%# Eval("billing_state") %>' runat="server" />
                                        </td>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>Country:</strong></span>
                                            <asp:Label ID="ctlCountry" Text='<%# Eval("billing_country") %>' runat="server" /></td>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>Zip Code:</strong></span>
                                            <asp:Label ID="ctlZipCode" Text='<%# Eval("billing_zipcode") %>' runat="server" /></td>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                        <p class="sectionHeadingSubPage text-left subSectionPadding">Contact Information</p>

                        <asp:GridView ID="ctlUserInfo" CssClass="table" DataKeyNames="id" AutoGenerateColumns="False" GridLines="None" AllowPaging="False" runat="server">
                            <Columns>
                                <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" FooterStyle-CssClass="hidden">
                                    <HeaderTemplate>
                                        <thead>
                                            <tr>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Phone #</th>
                                                <th>Company Name</th>
                                                <th>Address</th>
                                                <th>City</th>
                                                <th>State/Province</th>
                                                <th>Country</th>
                                                <th>Zip Code</th>
                                            </tr>
                                        </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>First Name:</strong></span>
                                            <asp:Label ID="ctlFirstName" Text='<%# Eval("firstname") %>' runat="server" /></td>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>Last Name:</strong></span>
                                            <asp:Label ID="ctlLastName" Text='<%# Eval("lastname") %>' runat="server" /></td>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>Phone #:</strong></span>
                                            <asp:Label ID="ctlPhone" Text='<%# Eval("phone") %>' runat="server" /></td>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>Company Name:</strong></span>
                                            <asp:Label ID="ctlCompany" Text='<%# Eval("company") %>' runat="server" /></td>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>Address:</strong></span>
                                            <asp:Label ID="ctlAddress" Text='<%# Eval("address") %>' runat="server" /></td>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>City:</strong></span>
                                            <asp:Label ID="ctlCity" Text='<%# Eval("city") %>' runat="server" /></td>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>State/Province:</strong></span>
                                            <asp:Label ID="ctlState" Text='<%# Eval("state") %>' runat="server" /></td>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>Country:</strong></span> <span class="hidden-lg hidden-md hidden-sm"><strong></strong></span>
                                            <asp:Label ID="ctlCountry" Text='<%# Eval("country") %>' runat="server" /></td>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>Zip Code:</strong></span>
                                            <asp:Label ID="ctlZipCode" Text='<%# Eval("zipcode") %>' runat="server" /></td>
                                        <asp:HiddenField ID="ctlUserEmail" Value='<%# Eval("username") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                        <p class="sectionHeadingSubPage text-left subSectionPadding">Please allow us 24 hours to process your order.</p>
                        <p>For more information, please contact us at <strong>844-238-8607</strong> or <a href="mailto:info@productivitypointls.com" class="bold">info@productivitypointls.com</a>.</p>
                        <br />
                        <p>
                            <strong>Please send your payment to:</strong><br />
                            Productivity Point Learning Solutions<br />
                            ATT: Accounts Receivable<br />
                            1580 Sawgrass Corporate Parkway<br />
                            Suite 205<br />
                            Sunrise, FL 33323
                        </p>
                    </div>

                    <uc:Partners runat="server" />

                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script>

    <!-- Google Code for Sale Conversion Page -->
    <script type="text/javascript">
        /* <![CDATA[ */
        var google_conversion_id = 1059358811;
        var google_conversion_language = "en";
        var google_conversion_format = "2";
        var google_conversion_color = "ffffff";
        var google_conversion_label = "tRIqCKXP6ggQ25CS-QM";
        var google_remarketing_only = false;
    /* ]]> */
    </script>

    <noscript>
        <div style="display: inline;">
            <img height="1" width="1" style="border-style: none;" alt="" src="//www.googleadservices.com/pagead/conversion/1059358811/?label=tRIqCKXP6ggQ25CS-QM&amp;guid=ON&amp;script=0" />
        </div>
    </noscript>

    <!-- Google Code for Course Purchase Conversion Page -->
    <script type="text/javascript">
        /* <![CDATA[ */
        var google_conversion_id = 856073820;
        var google_conversion_language = "en";
        var google_conversion_format = "3";
        var google_conversion_color = "ffffff";
        var google_conversion_label = "zGp5CNKCgXEQ3MyamAM";
        var google_remarketing_only = false;
    /* ]]> */
    </script>

    <noscript>
        <div style="display: inline;">
            <img height="1" width="1" style="border-style: none;" alt="" src="//www.googleadservices.com/pagead/conversion/856073820/?label=zGp5CNKCgXEQ3MyamAM&amp;guid=ON&amp;script=0" />
        </div>
    </noscript>

    <style>
        @media screen and (max-width: 600px) {
            table { width: 100%; }
            thead { display: none; }
            tbody td { display: block; text-align: left; }
                tbody td:before { content: attr(data-th); display: block; text-align: left; }
        }
    </style>
</asp:Content>
