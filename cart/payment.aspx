<%@ Page AutoEventWireup="true" CodeBehind="payment.aspx.cs" Debug="true" Inherits="ProductivityPointGlobal.cart.Payment" Language="C#" MasterPageFile="~/default.master" Title="Productivity Point Learning Solutions - Payment Summary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../styles/basic.css" rel="stylesheet" />
    <style>
        @media screen and (max-width: 600px) {
            table { width: 100%; }
            thead { display: none; }                        
            tbody td { display: block; text-align: left; }
                tbody td:before { content: attr(data-th); display: block; text-align: left; }
        }
    </style>  
<%--    <script src="https://js.squareup.com/v2/paymentform"></script>--%>
    <asp:Literal ID="ltrSquare" runat="server" />
<%--    <script src="../scripts/basic.js"></script>--%>
   <%-- <script>
        document.addEventListener("DOMContentLoaded", function (event) {
            buildSqPayment();
        });
        function buildSqPayment() {
            if (SqPaymentForm.isSupportedBrowser()) {
                paymentForm.build();
                paymentForm.recalculateSize();
                paymentForm.cc = true;
            }
        }
    </script>--%>

    <script
      type="text/javascript"
      src="https://web.squarecdn.com/v1/square.js"
    ></script>
    <script>
        const appId = applicationId;

        async function initializeCard(payments) {
            const card = await payments.card();
            await card.attach('#card-container');

            return card;
        }

        async function createPayment(token) {
            debugger;
            var paymentMethod = $("#ctlBillingInfoPaymentMethod").val();
            const body = JSON.stringify({
                locationId,
                sourceId: token,
            });

            if (paymentMethod != "CC") {
                $("#ctlMasterForm").submit();
                return;
            }

            $("#nonce").val(token);
            document.getElementById('ctlMasterForm').submit();
            //var form = $("#ctlMasterForm");
            //form.submit();
            return;

            if (!paymentForm || !paymentForm.cc) return;

            const paymentResponse = await fetch('/payment', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body,
            });

            if (paymentResponse.ok) {
                return paymentResponse.json();
            }

            const errorBody = await paymentResponse.text();
            throw new Error(errorBody);
        }

        async function tokenize(paymentMethod) {
            const tokenResult = await paymentMethod.tokenize();
            if (tokenResult.status === 'OK') {
                return tokenResult.token;
            } else {
                let errorMessage = `Tokenization failed with status: ${tokenResult.status}`;
                if (tokenResult.errors) {
                    errorMessage += ` and errors: ${JSON.stringify(
                        tokenResult.errors
                    )}`;
                }

                throw new Error(errorMessage);
            }
        }

        // status is either SUCCESS or FAILURE;
        function displayPaymentResults(status) {
            const statusContainer = document.getElementById(
                'payment-status-container'
            );
            if (status === 'SUCCESS') {
                statusContainer.classList.remove('is-failure');
                statusContainer.classList.add('is-success');
            } else {
                statusContainer.classList.remove('is-success');
                statusContainer.classList.add('is-failure');
            }

            statusContainer.style.visibility = 'visible';
        }

        document.addEventListener('DOMContentLoaded', async function () {
            if (!window.Square) {
                throw new Error('Square.js failed to load properly');
            }

            let payments;
            try {
                payments = window.Square.payments(appId, locationId);
            } catch {
                const statusContainer = document.getElementById(
                    'payment-status-container'
                );
                statusContainer.className = 'missing-credentials';
                statusContainer.style.visibility = 'visible';
                return;
            }

            let card;
            try {
                card = await initializeCard(payments);
            } catch (e) {
                console.error('Initializing Card failed', e);
                return;
            }

            // Checkpoint 2.
            async function handlePaymentMethodSubmission(event, paymentMethod) {
                event.preventDefault();

                try {
                    // disable the submit button as we await tokenization and make a payment request.
                    //cardButton.disabled = true;
                    const token = await tokenize(paymentMethod);
                    debugger;
                    const paymentResults = await createPayment(token);
                    displayPaymentResults('SUCCESS');

                    console.debug('Payment Success', paymentResults);
                } catch (e) {
                    cardButton.disabled = false;
                    displayPaymentResults('FAILURE');
                    console.error(e.message);
                }
            }
            const cardButton = document.getElementById('ContentPlaceHolder1_ctlSubmitOrder');
            cardButton.addEventListener('click', async function (event) {
                var paymentMethod = $("#ctlBillingInfoPaymentMethod").val();
                if (paymentMethod == "CC") {
                    event.preventDefault();
                    await handlePaymentMethodSubmission(event, card);
                    debugger;
                    return;
                } else {
                    return;
                }
            });
        });
    </script>
    <script>
        
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    
<div class="container-fluid view subPage">
    <div class="row">
        <div class="container">
            <div class="row padding20T">
                <div class="col-lg-8 col-md-7 col-sm-12 col-xs-12">
                    <div class="section1RowSubpage">
                        <h1 class="white fontShadow">Billing &amp; Payment</h1>
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
                    
                    <p class="sectionHeadingSubPage text-left subSectionPadding">Shopping Cart Summary</p>
                    
<%--                    <asp:GridView ID="ctlCartInfo" AutoGenerateColumns="false" CssClass="table" DataKeyNames="ClassId" GridLines="None" EnableViewState="false" runat="server">
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
                                    <td class="blackBg"><span class="hidden-lg hidden-md hidden-sm"><strong>Class:</strong></span> <strong><asp:Label ID="ctlCourseName" Text='<%# Eval("courseName") %>' runat="server" /></strong></td>
                                    <td class="blackBg"><span class="hidden-lg hidden-md hidden-sm"><strong>Price:</strong></span> $<asp:Label ID="ctlCoursePrice" runat="server" Text='<%#Decimal.Parse(Eval("price").ToString()).ToString("0,00.00") %>' /></td>
                                    <td class="blackBg"><span class="hidden-lg hidden-md hidden-sm"><strong>Subtotal:</strong></span> <asp:Label ID="ctlSubtotal" Text='<%# Eval("Subtotal", "{0:c}") %>' runat="server" /></td>
                                    <td class="blackBg"><span class="hidden-lg hidden-md hidden-sm"><strong>Seats/Qty.:</strong></span> <asp:Label ID="ctlQuantity" Text='<%# Eval("Quantity") %>' Width="50px" runat="server" /></td>                                
                            
                                    <tr>
                                        <td colspan="6">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <strong>Delivery Format:</strong>
                                                    <br/>
                                                    <asp:Label ID="ctlDeliveryFormat" Text='<%# Eval("deliveryFormat") %>' runat="server" />                                               
                                                </div>
                                                <div class="col-md-3">
                                                    <strong>Date:</strong> 
                                                    <br/>
                                                    <asp:Label ID="ctlStartDate" Text='<%#DateTime.Parse(Eval("startDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" /> - <asp:Label ID="ctlEndDate" Text='<%#DateTime.Parse(Eval("endDate").ToString()).ToString("MM/dd/yyyy") %>' runat="server" />                                                
                                                </div>
                                                <div class="col-md-3">
                                                    <strong>Time:</strong>
                                                    <br/>
                                                    <asp:Label ID="ctlStartTime" Text='<%#DateTime.Parse(Eval("startTime").ToString()).ToString("h:mm t.\\M.") %>' runat="server" /> - <asp:Label ID="ctlEndTime" Text='<%#DateTime.Parse(Eval("endTime").ToString()).ToString("h:mm t.\\M.") %>' runat="server" />                                                
                                                </div>
                                                <div class="col-md-3">
                                                    <strong>Duration:</strong> 
                                                    <br/>
                                                    <asp:Label ID="ctlDuration" Text='<%# Eval("duration") %>' runat="server" /> Day Course                                                                                          
                                                </div>                                            
                                            </div> 
                                            <br/>
                                            <strong>Location:</strong><br />
                                            <asp:Label ID="ctlAddress1" Text='<%# Eval("address1") %>' runat="server" /> <asp:Label ID="ctlAddress2" Text='<%# Eval("address2") %>' runat="server" /> <asp:Label ID="ctlCity" Text='<%# Eval("city") %>' runat="server" />, <asp:Label ID="ctlState" Text='<%# Eval("state") %>' runat="server" /> <asp:Label ID="ctlZip" Text='<%# Eval("zip") %>' runat="server" />                                        
                                        </td>                            
                                    </tr>
                                </ItemTemplate>                          
                            </asp:TemplateField>                    
                        </Columns>
                    </asp:GridView>           --%>
                    
                    <asp:UpdatePanel ID="UpdatePanel2" ChildrenAsTriggers="False" UpdateMode="Conditional" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnReset" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnApplyCoupon" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>                       
                        <asp:ListView runat="server" ID="lvCart" DataKeyNames="sid" DataSourceID="sqlCart" OnDataBound="lvCart_DataBound">
                            <EmptyDataTemplate>
                                <p class="sectionHeadingSubPage text-left subSectionPadding">Your Shopping Cart Is Empty</p>
                            </EmptyDataTemplate>
                            <LayoutTemplate>
                                <table class="table">
                                    <thead>
                                        <tr>
                                        <th>Class</th>
                                        <th>Price</th>
                                        <th>Subtotal</th>
                                        <th>Seats/Qty.</th>
                                        <%--<th>&nbsp;</th>--%>
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
                                        <asp:Literal runat="server" Text='<%#Eval("seats") %>' Visible='<%#(int)Eval("seats")>0 %>'></asp:Literal>
                                        <asp:Label runat="server" CssClass="redAlert bold" Visible='<%#(int)Eval("seats")==0 %>'><br />Add Student</asp:Label>
                                        <%--<div class="row">
                                            <div class="col-lg-5">
                                                <asp:TextBox ID="ctlQuantity" Text='<%# Eval("Quantity") %>' CssClass="form-control text-center" ForeColor="Black" runat="server" />
                                            </div>
                                            <div class="col-lg-7">
                                                <asp:LinkButton ID="ctlUpdateCart" runat="server" Text="Update" CssClass="btn btn-warning btn-block" OnClick="ctlUpdateCart_Click" />
                                            </div>
                                        </div>--%>
                                    </td>
                                    <%--<td class="blackBg"><span class="hidden-lg hidden-md hidden-sm"><strong>Remove:</strong></span>
                                        <asp:LinkButton ID="btnDel" runat="server" Text="Remove" CssClass="btn btn-warning btn-block" CommandName="Delete" />
                                    </td>--%>
                                </tr>
                                <%--<tr>
                                    <td colspan="4">
                                        <asp:Literal runat="server" ID="ltrId" Text='<%#Eval("sid") %>' Visible="false"></asp:Literal>
                                        <asp:ListView runat="server" ID="lvStud" DataKeyNames="id" DataSourceID="sqlStud">
                                            <LayoutTemplate>
                                                <p class="bold">Registered Students</p>
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
                                                    <div class="col-sm-6"><strong class="hidden-lg hidden-md hidden-sm">Name:</strong> <%#Eval("name") %></div>
                                                    <div class="col-sm-6"><strong class="hidden-lg hidden-md hidden-sm">Email:</strong> <%#Eval("email") %></div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="sqlStud" runat="server" ConnectionString='<%$ ConnectionStrings:SQLConnectionProd %>'
                                            SelectCommand="dbo.tblCartStudents_s" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter Name="cartId" ControlID="ltrId" PropertyName="Text" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td colspan="4">
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
                            SelectCommand="dbo.ShoppingCartItems_s" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:CookieParameter Name="CartId" Type="String" CookieName="CartID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                            <div class="row">
                                <asp:Panel ID="pnlCouponApplied" runat="server">                                                                                    
                                    <div class="col-lg-10 col-md-9 col-sm-10 col-xs-8 text-right sectionSubHeadingPrices"><strong>Subtotal:</strong></div>
                                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 text-right sectionSubHeadingPrices"><asp:Label ID="ctlTotalCostReg" runat="server" /></div>
                                    <div class="col-lg-10 col-md-9 col-sm-10 col-xs-8 text-right sectionSubHeadingPrices"><strong>Discount Applied:</strong></div>
                                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 text-right sectionSubHeadingPrices"><asp:Label ID="ctlDiscountTotal" CssClass="redAlert" runat="server" /></div>
                                </asp:Panel>    
                                <div class="col-lg-10 col-md-9 col-sm-10 col-xs-8 text-right sectionSubHeadingPrices"><strong>Total:</strong></div>
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 text-right sectionSubHeadingPrices">
                                    <asp:Label ID="ctlTotalCost" runat="server" />
                                    <asp:Literal ID="ltrTotal" runat="server" Visible="false"></asp:Literal>
                                    <asp:Literal ID="ltrSubTotal" runat="server" Visible="false"></asp:Literal>
                                </div>
                            </div>          
                            <br/>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-inline text-right">
                                        <div class="form-group">
                                            <strong>Offer Code:</strong>
                                            <asp:TextBox ID="tbCouponCode" CssClass="form-control" placeholder="Offer Code" runat="server"/>
                                        </div>
                                        <asp:Button ID="btnReset" CssClass="btn btn-warning" OnClick="btnReset_OnClick" runat="server" Text="Reset" /> <asp:Button ID="btnApplyCoupon" CssClass="btn btn-success" OnClick="btnApplyCoupon_OnClick" runat="server" Text="Apply" />
                                        <br/><br/><strong><asp:Label ID="lblCouponStatus" runat="server"></asp:Label></strong>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate> 
                    </asp:UpdatePanel>
                    
                    <p class="sectionHeadingSubPage text-left subSectionPadding">Student Information</p>
                    <asp:ListView ID="lvStud" runat="server" DataKeyNames="id" DataSourceID="sqlStud">
                        <LayoutTemplate>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Student</th>
                                        <th>Email</th>
                                        <th>Course</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr id="itemPlaceholder" runat="server"></tr>
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <EmptyDataTemplate>
                            <div class="alert alert-warning" role="alert">Please make sure to <strong>ADD</strong> at least 1 student by <strong>CLICKING</strong> the <strong>Add Student</strong> button</div>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><strong class="hidden-lg hidden-md hidden-sm">Name:</strong> <%#Eval("name") %></td>
                                <td><strong class="hidden-lg hidden-md hidden-sm">Email:</strong> <%#Eval("email") %></td>
                                <td><strong class="hidden-lg hidden-md hidden-sm">Course:</strong> <%#Eval("courseName") %></td>

                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="sqlStud" runat="server" ConnectionString='<%$ ConnectionStrings:SQLConnectionProd %>'
                        DeleteCommand="dbo.tblCartStudents_d" DeleteCommandType="StoredProcedure"
                        SelectCommand="dbo.tblCartStudentsCourse_s" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:CookieParameter CookieName="CartID" Name="CartId" Type="String" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                        </DeleteParameters>
                    </asp:SqlDataSource>

                    <%--<asp:Repeater ID="ctlStudentList" runat="server">
                        <HeaderTemplate>            
                            <table class="table">
                            <thead>
                            <tr>
                                <th>Student Name</th>
                                <th>Email Address</th>
                                <th>Course</th>
                            </tr>
                            </thead>
                            <tbody>     
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><span class="hidden-lg hidden-md hidden-sm"><strong>Student Name:</strong></span> <asp:Label ID="ctlStudentName" Text='<%# Bind("student_name") %>' runat="server" /></td>
                                <td><span class="hidden-lg hidden-md hidden-sm"><strong>Email Address:</strong></span> <asp:Label ID="ctlStudentEmail" Text='<%# Bind("student_email") %>' runat="server" /></td>
                                <td><span class="hidden-lg hidden-md hidden-sm"><strong>Course:</strong></span> <asp:Label ID="ctlStudentCourse" Text='<%# Bind("student_course") %>' runat="server" /></td> 
                            </tr>                                       
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                            </table>                           
                        </FooterTemplate>
                    </asp:Repeater>--%>
                    
                    <p class="sectionHeadingSubPage text-left subSectionPadding">Contact Information</p>

                    <asp:GridView ID="ctlUserInfo" DataKeyNames="id" CssClass="table" AutoGenerateColumns="False" GridLines="None" AllowPaging="False" runat="server">
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
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>First Name:</strong></span> <asp:Label ID="ctlFirstName" Text='<%# Eval("firstname") %>' runat="server" /></td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Last Name:</strong></span> <asp:Label ID="ctlLastName" Text='<%# Eval("lastname") %>' runat="server" /></td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Phone #:</strong></span> <asp:Label ID="ctlPhone" Text='<%# Eval("phone") %>' runat="server" /></td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Company Name:</strong></span> <asp:Label ID="ctlCompany" Text='<%# Eval("company") %>' runat="server" /></td>                                                                
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Address:</strong></span> <asp:Label ID="ctlAddress" Text='<%# Eval("address") %>' runat="server" /></td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>City:</strong></span> <asp:Label ID="ctlCity" Text='<%# Eval("city") %>' runat="server" /></td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>State/Province:</strong></span> <asp:Label ID="ctlState" Text='<%# Eval("state") %>' runat="server" /></td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Country:</strong></span> <asp:Label ID="ctlCountry" Text='<%# Eval("country") %>' runat="server" /></td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Zip Code:</strong></span> <asp:Label ID="ctlZipCode" Text='<%# Eval("zipcode") %>' runat="server" /></td>      
                                    <asp:HiddenField ID="ctlUserEmail" Value='<%# Eval("username") %>' runat="server" />                                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    
                    <p class="sectionHeadingSubPage text-left subSectionPadding">Billing Information</p>
                   
                    <asp:GridView ID="ctlBillingInfoGrid" DataKeyNames="id" CssClass="table" AutoGenerateColumns="False" GridLines="None" AllowPaging="False" runat="server">
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
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>First Name:</strong></span> <asp:Label ID="ctlFirstName" Text='<%# Eval("billing_firstname") %>' runat="server" /></td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Last Name:</strong></span> <asp:Label ID="ctlLastName" Text='<%# Eval("billing_lastname") %>' runat="server" /></td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Phone #:</strong></span> <asp:Label ID="ctlPhone" Text='<%# Eval("billing_phone") %>' runat="server" /></td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Company Name:</strong></span> <asp:Label ID="ctlCompany" Text='<%# Eval("billing_company") %>' runat="server" /></td>                        
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Address:</strong></span> <asp:Label ID="ctlAddress" Text='<%# Eval("billing_address") %>' runat="server" /></td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>City:</strong></span> <asp:Label ID="ctlCity" Text='<%# Eval("billing_city") %>' runat="server" /></td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>State/Province:</strong></span> <asp:Label ID="ctlState" Text='<%# Eval("billing_state") %>' runat="server" /> </td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Country:</strong></span> <asp:Label ID="ctlCountry" Text='<%# Eval("billing_country") %>' runat="server" /></td>
                                    <td><span class="hidden-lg hidden-md hidden-sm"><strong>Zip Code:</strong></span> <asp:Label ID="ctlZipCode" Text='<%# Eval("billing_zipcode") %>' runat="server" /></td>                   
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    
                    <p class="sectionHeadingSubPage text-left subSectionPadding payment">Payment Information</p>
                   
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Payment Method</label>
                                        <asp:DropDownList ID="ctlBillingInfoPaymentMethod" ClientIDMode="Static" onchange="togglePayment()" CssClass="form-control" runat="server">                                    
                                            <asp:ListItem Value="CC" Text="Credit Card" Selected="True" />
                                            <asp:ListItem Value="Check" Text="Check" />
                                            <%--<asp:ListItem Value="DD" Text="Direct Deposit (ACH)" />--%>
                                        </asp:DropDownList>	                        
                                    </div><%--OnSelectedIndexChanged="ctlBillingInfoPaymentMethod_SelectedIndexChanged" AutoPostBack="true"--%>
                                </div>
                            </div>

                                <asp:PlaceHolder ID="phCCError" runat="server" Visible="false">
                                    <div class="alert alert-danger alert-dismissible">
                                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        <strong>Error!</strong> 
                                        <ul>
                                            <asp:Literal ID="ltrErr" runat="server"></asp:Literal>
                                        </ul>
                                    </div>
                                </asp:PlaceHolder>
                            <asp:Panel ID="ctlCCPanel" ClientIDMode="Static" runat="server">  
                                   <form id="payment-form">
                                      <div id="card-container"></div>
<%--                                      <button id="card-button" type="button">Submit Order</button>--%>
                                    </form>
                                    <div id="payment-status-container"></div>
                                <asp:HiddenField ID="nonce" runat="server" ClientIDMode="Static" />

                            </asp:Panel>

                            <asp:Panel ID="ctlCheckPanel" ClientIDMode="Static" style="display:none" runat="server">   
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Purchase Order Number*</label>
                                            <asp:TextBox ID="ctlPO" data-validation="required" data-validation-error-msg="Purchase Order Number Required" CssClass="form-control" AutoCompleteType="None" placeholder="Purchase Order Number" MaxLength="100" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Please send your payment to</label>
                                            <p>Productivity Point Learning Solutions<br />
                                                ATT: Accounts Receivable<br />
                                                1580 Sawgrass Corporate Parkway, Suite 205<br />
                                                Sunrise, FL  33323</p>
                                            <%--<p>Productivity Point Learning Solutions<br/>
                                            Accounts Receivable Dept.<br/>
	                                        4 Lan Drive, Suite 130<br/>
	                                        Westford, MA  01886
                                            </p>--%>
                                        </div>
                                    </div>
                                </div>                                             
                            </asp:Panel>

                            <asp:Panel ID="ctlDDPanel" runat="server" Visible="false">
                                <div class="row">
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label>Username (Email Address)*</label>
	
                                        </div>                                
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label>Username (Email Address)*</label>
	
                                        </div>                                
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label>Username (Email Address)*</label>
	
                                        </div>                                
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label>Username (Email Address)*</label>
	
                                        </div>                                
                                    </div>
                                </div>
                                <table class="table">
                                    <thead>   
                                    <tr>
                                        <th>Routing Number</th>
                                        <th>Account Number</th>
                                        <th>Account Type</th>
                                        <th>Bank Name</th>
                                        <th>Bank Account Name</th>
                                    </tr>                     
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="ctlRoutingNumber" CssClass="form-control" runat="server" />                              
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ctlAccountNumber" CssClass="form-control" runat="server" />                                                                               
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ctlAccountType" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="" Text="" />
                                                <asp:ListItem Value="CHECKING" Text="Checking" />
                                                <asp:ListItem Value="BUSINESSCHECKING" Text="Business Checking" />
                                                <asp:ListItem Value="SAVINGS" Text="Savings" />
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ctlBankName" CssClass="form-control" runat="server" />                               
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ctlBankAccountName" CssClass="form-control" runat="server" />              
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>           
                            </asp:Panel>
                        </ContentTemplate>
	                    <%--<Triggers>
		                    <asp:AsyncPostBackTrigger ControlID="ctlBillingInfoCCYear" EventName="SelectedIndexChanged" />
	                    </Triggers>--%>
                    </asp:UpdatePanel>                    

                    <div class="row">
                        <div class="col-lg-6 text-left">
                            <div class="form-group">                                
                                <asp:Label ID="ctlMerchantStatus" runat="server" />    
                            </div>                                                           
                        </div>
                        <div class="col-lg-6 text-right">
                            <asp:Button ID="ctlSubmitOrder"  runat="server" CssClass="btn btn-success" OnClick="ctlSubmitOrder_Click" Text="Submit Order"  OnClientClick="submitForm(event)" />            
                        </div>                        
                    </div>  
                    
                    <div class="row margin20T">
                        <div class="col-lg-2 col-md-2 col-sm-4 col-xs-12 text-left">
                            <%--                            <!-- (c) 2005, 2013. Authorize.Net is a registered trademark of CyberSource Corporation --> <div class="AuthorizeNetSeal"> <script type="text/javascript">var ANS_customer_id = "6e1ff342-eb6c-4f9c-af6b-001e0b6e31ac";</script> 
                                <script type="text/javascript" src="//verify.authorize.net/anetseal/seal.js" ></script> 
                                <a href="http://www.authorize.net/" id="AuthorizeNetText" target="_blank">Payment Processing</a>--%>
                            <img src="/images/square-pay-logo.png" alt="Secure Square Payment" />
                        </div>
                        <div class="col-lg-10 col-md-10 col-sm-8 col-xs-12 text-right padding20T">
                            <asp:Image ID="ctlCC1" ImageUrl="~/images/ae.png" runat="server" />&nbsp;&nbsp;&nbsp;<asp:Image ID="Image1" ImageUrl="~/images/discover.png" runat="server" />&nbsp;&nbsp;<asp:Image ID="Image2" ImageUrl="~/images/visa.png" runat="server" />&nbsp;&nbsp;&nbsp;<asp:Image ID="Image3" ImageUrl="~/images/jcb.png" runat="server" />&nbsp;&nbsp;&nbsp;<asp:Image ID="Image5" ImageUrl="~/images/dc.png" runat="server" />&nbsp;&nbsp;&nbsp;<asp:Image ID="Image6" ImageUrl="~/images/mc.png" runat="server" />
                        </div>                        
                    </div>
                    </div>                                                
                </div>

                <uc:Partners runat="server" />
                    
            </div>                    
        </div>
    </div>
<%--</div>	         --%>

    <script>
        function togglePayment() {
            var el = document.getElementById('ctlBillingInfoPaymentMethod');
            var pnlCC = document.getElementById('ctlCCPanel');
            var pnlCheck = document.getElementById('ctlCheckPanel');
            if (el.value === 'CC') {
                pnlCC.style.display = 'block';
                pnlCheck.style.display = 'none';
                paymentForm.cc = true;
            }
            else if (el.value === 'Check') {
                pnlCC.style.display = 'none';
                pnlCheck.style.display = 'block';
                paymentForm.cc = false;
            }
        }
    </script>
</asp:Content>
