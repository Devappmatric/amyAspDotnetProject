<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="confirmation2.aspx.cs" Inherits="ProductivityPointGlobal.Cart.Confirmation2" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .checkout-menu > a {
            border-radius: 8px !important;
        }

        .form-group {
            display: flex;
        }

            .form-group > label {
                width: 180px;
            }

        .checkout-header-style {
            background-color: #23446a !important;
            padding: 10px;
            color: White;
            margin: -15px;
            font-size: 24px;
            text-align: center;
        }

        .contact-and-billing-block {
            padding: 10px;
        }

            .contact-and-billing-block > div {
                background-color: #efefef;
                margin-top: 0px;
                height: 560px;
                padding: 10px;
            }

        .form-group {
            display: block;
        }

        .subSectionPadding-order {
            padding-top: 20px;
        }
        .colorTh{
            color:#e85c24!important;
        }
        .total-class{
            margin-left: -25px;
        }
    </style>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">

                    <div class="col-lg-4 col-md-5 hidden-sm hidden-xs margin20T responsiveCol">
                        <%--<uc:ContactForm runat="server" />--%>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="container-fluid bgWhite subPage padding75B">
        <div class="row" style="">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-6 col-sm-12 col-xs-12 subSectionPadding">

                        <uc:ShoppingCart2 ID="uc1" Selection="4" runat="server" />

                        <p class="sectionHeadingSubPage text-left subSectionPadding-order">Order Summary</p>

                        <asp:ListView runat="server" ID="lvCart" DataKeyNames="sid" DataSourceID="sqlCart" OnDataBound="lvCart_DataBound">
                            <EmptyDataTemplate>
                                <p class="sectionHeadingSubPage text-left subSectionPadding">Your Shopping Cart Is Empty</p>
                            </EmptyDataTemplate>
                            <LayoutTemplate>
                                <table class="table">
                                    <thead>
                                        <tr class="colorTh">
                                            <th>Course</th>
                                            <th>Price</th>
                                            <th>Subtotal</th>
                                            <th>Seats/Qty.</th>
                                        </tr>
                                    </thead>
                                    <tr runat="server" id="itemPlaceholder"></tr>
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="blackBg"><strong><span class="hidden-lg hidden-md hidden-sm">Class:</span>
                                        <asp:Literal ID="ltrCourse" runat="server" Text='<%# Eval("courseName") %>'></asp:Literal></strong>
                                    </td>
                                    <td class="blackBg"><span class="hidden-lg hidden-md hidden-sm"><strong>Price:</strong></span>
                                        <asp:Literal ID="ltrPrice" runat="server" Text='<%#Eval("price","{0:c}") %>'></asp:Literal></td>
                                    <td class="blackBg"><span class="hidden-lg hidden-md hidden-sm"><strong>Subtotal:</strong></span>
                                        <asp:Literal runat="server" ID="linetotal" Text='<%# Eval("linetotal") %>' Visible="false" />
                                        <asp:Literal runat="server" ID="ltrLnTot" Text='<%# Eval("linetotal","{0:c}") %>' />
                                    </td>
                                    <td class="blackBg">
                                        <span class="hidden-lg hidden-md hidden-sm"><strong>Seats/Qty.:</strong></span>
                                        <asp:Literal runat="server" ID="ltrSeats" Text='<%#Eval("Quantity") %>'></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <asp:Literal runat="server" ID="ltrId" Text='<%#Eval("sid") %>' Visible="false"></asp:Literal>
                                        <asp:Literal runat="server" ID="ltrClassId" Text='<%#Eval("ClassID") %>' Visible="false"></asp:Literal>
                                        <asp:ListView runat="server" ID="lvStud" DataKeyNames="id" DataSourceID="sqlStud">
                                            <LayoutTemplate>
                                                <p class="bold">Registered Attendees</p>
                                                <div class="row hidden-xs">
                                                    <div class="col-sm-6 bold">Name</div>
                                                    <div class="col-sm-6 bold">Email</div>
                                                </div>
                                                <div id="itemPlaceholder" runat="server"></div>
                                            </LayoutTemplate>
                                            <EmptyDataTemplate>
                                                No student
                                           
                                            </EmptyDataTemplate>
                                            <ItemTemplate>
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <strong class="hidden-lg hidden-md hidden-sm">Name:</strong>
                                                        <asp:Literal ID="ltrName" runat="server" Text='<%#Eval("name") %>'></asp:Literal>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <strong class="hidden-lg hidden-md hidden-sm">Email:</strong>
                                                        <asp:Literal ID="ltrEmail" runat="server" Text='<%#Eval("email") %>'></asp:Literal>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="sqlStud" runat="server" ConnectionString='<%$ ConnectionStrings:SQLConnectionProd %>'
                                            SelectCommand="dbo.tblCartStudents_s_v2" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter Name="cartId" ControlID="ltrId" PropertyName="Text" Type="Int32" />
                                                <asp:ControlParameter Name="classId" ControlID="ltrClassId" PropertyName="Text" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <strong>Delivery Format</strong>
                                                <br />
                                                <asp:Literal ID="ltrDelivery" runat="server" Text='<%# Eval("deliveryFormat") %>'></asp:Literal>
                                            </div>
                                            <div class="col-md-3">
                                                <strong>Date</strong>
                                                <br />
                                                <asp:Literal ID="ltrStartDate" runat="server" Text='<%#Eval("startDate","{0:MM/dd/yyyy}") %>'></asp:Literal>
                                                - 
                                              
                                                <asp:Literal ID="ltrEndDate" runat="server" Text='<%#Eval("endDate","{0:MM/dd/yyyy}") %>'></asp:Literal>
                                            </div>
                                            <div class="col-md-3">
                                                <strong>Time</strong>
                                                <br />
                                                <asp:Literal ID="ltrStartTime" runat="server" Text='<%#DateTime.Parse(Eval("startTime").ToString()).ToString("h:mm tt") %>'></asp:Literal>
                                                - 
                                             
                                                <asp:Literal ID="ltrEndTime" runat="server" Text='<%#DateTime.Parse(Eval("endTime").ToString()).ToString("h:mm tt") %>'></asp:Literal>
                                            </div>
                                            <div class="col-md-3">
                                                <strong>Duration</strong>
                                                <br />
                                                <asp:Literal ID="ltrDuration" runat="server" Text='<%# Eval("duration","{0} Day Course") %>'></asp:Literal>
                                            </div>
                                        </div>
                                        <br />
                                        <strong>Location</strong><br />
                                        <asp:Literal ID="ltrLocation" runat="server" Text='<%# Eval("address1").ToString().Trim() == "Live Online" ?"Live Online": Eval("address1").ToString()+" "+ Eval("address2").ToString() +", " +Eval("city").ToString() +", "+ Eval("state") +" "+ Eval("zip")%>'></asp:Literal>
                                        <asp:Literal ID="ltrLocation1" runat="server" Text='<%#string.Format("{0}, {1} {2}",  Eval("city"),Eval("state"), Eval("zip")) %>'></asp:Literal>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="sqlCart" runat="server" ConnectionString='<%$ ConnectionStrings:SQLConnectionProd %>'
                            SelectCommand="dbo.ShoppingCartItems_s" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:CookieParameter Name="CartId" Type="String" CookieName="CartID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <div class="row">
                            <asp:Panel ID="pnlCouponApplied" runat="server">
                                <div class="col-lg-10 col-md-9 col-sm-10 col-xs-8 text-right sectionSubHeadingPrices"><strong>Subtotal:</strong></div>
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 text-right sectionSubHeadingPrices">
                                    <asp:Label ID="ctlTotalCostReg" runat="server" />
                                </div>
                                <div class="col-lg-10 col-md-9 col-sm-10 col-xs-8 text-right sectionSubHeadingPrices"><strong>Discount Applied:</strong></div>
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 text-right sectionSubHeadingPrices">
                                    <asp:Label ID="ctlDiscountTotal" CssClass="redAlert" runat="server" />
                                </div>
                            </asp:Panel>
                            <div class="col-lg-10 col-md-9 col-sm-10 col-xs-8 text-right sectionSubHeadingPrices"><strong>Total:</strong></div>
                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 text-right sectionSubHeadingPrices">
                                <asp:Label ID="lblCartTotal" runat="server" CssClass="total-class" />
                                <asp:Literal ID="ltrTotal" runat="server" Visible="false"></asp:Literal>
                            </div>
                        </div>

                        <p class="sectionHeadingSubPage text-left subSectionPadding1">Purchasing Information</p>

                        <table class="table">
                            <thead>
                                <tr class="colorTh">
                                    <th>Order Number</th>
                                    <th>Purchase Order Number</th>
                                    <th>Order Date</th>
                                    <th>Payment Method</th>
                                    <th>Payment Status</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Order Number:</strong></span>
                                        <asp:Label ID="ctlOrderNumber" runat="server" />
                                    </td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Purchase Order Number:</strong></span>
                                        <asp:Label ID="ctlPO" runat="server" /></td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Order Date:</strong></span>
                                        <asp:Label ID="ctlTodaysDate" runat="server" /></td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Payment Method:</strong></span>
                                        <asp:Label ID="ctlPaymentMethod" runat="server" /></td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Payment Status:</strong></span>
                                        <asp:Label ID="ctlPaymentStatus" runat="server" /></td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Total:</strong></span>
                                        <asp:Label ID="ctlTotalCost" runat="server" /></td>
                                </tr>
                            </tbody>
                        </table>

                        <p class="sectionHeadingSubPage text-left subSectionPadding1">Billing Information</p>

                        <asp:GridView ID="ctlBillingInfoGrid" CssClass="table" DataKeyNames="id" AutoGenerateColumns="False" GridLines="None" AllowPaging="False" runat="server">
                            <Columns>
                                <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" FooterStyle-CssClass="hidden">
                                    <HeaderTemplate>
                                        <thead>
                                            <tr class="colorTh">
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
                                            <asp:Label ID="ctlCountry" Text='<%# Eval("country") %>' runat="server" /></td>
                                        <td><span class="hidden-lg hidden-md hidden-sm"><strong>Zip Code:</strong></span>
                                            <asp:Label ID="ctlZipCode" Text='<%# Eval("zipcode") %>' runat="server" /></td>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                        <p class="sectionHeadingSubPage text-left subSectionPadding1">Contact Information</p>

                        <asp:GridView ID="ctlUserInfo" CssClass="table" DataKeyNames="id" AutoGenerateColumns="False" GridLines="None" AllowPaging="False" runat="server">
                            <Columns>
                                <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" FooterStyle-CssClass="hidden">
                                    <HeaderTemplate>
                                        <thead>
                                            <tr class="colorTh">
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
                        <p>For more information, please contact us at <strong>844-238-8607</strong> or <a href="mailto:info@productivitypointls.com" style="font-weight: bold;">info@productivitypointls.com</a>.</p>
                    </div>

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

</asp:Content>
