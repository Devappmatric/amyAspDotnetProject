<%@ Page AutoEventWireup="true" CodeBehind="payment2.aspx.cs" Debug="true" Inherits="ProductivityPointGlobal.cart.Payment2" Language="C#" MasterPageFile="~/default.master" Title="Productivity Point Learning Solutions - Payment Summary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../styles/basic.css" rel="stylesheet" />
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
        src="https://web.squarecdn.com/v1/square.js"></script>
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
    <style>
        .checkout-menu > a {
            border-radius: 8px !important;
        }

        .no-border {
            border: none !important;
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
    </style>
    <div class="container-fluid bgWhite subPage subSectionPadding">
        <div class="row">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-6 col-sm-12 col-xs-12" style="margin-top: 30px;">
                        <uc:ShoppingCart2 ID="uc1" Selection="3" runat="server" />


                        <asp:ListView Visible="false" runat="server" ID="lvCart" DataKeyNames="sid" DataSourceID="sqlCart" OnDataBound="lvCart_DataBound">
                            <EmptyDataTemplate>
                                <p class="sectionHeadingSubPage text-left">Your Shopping Cart Is Empty</p>
                            </EmptyDataTemplate>
                            <LayoutTemplate>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Class</th>
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
                                    <td class="blackBg"><strong><span class="hidden-lg hidden-md hidden-sm">Class:</span> <%# Eval("courseName") %></strong>
                                    </td>
                                    <td class="blackBg"><span class="hidden-lg hidden-md hidden-sm"><strong>Price:</strong></span> $<%#Decimal.Parse(Eval("price").ToString()).ToString("0,00.00") %></td>
                                    <td class="blackBg"><span class="hidden-lg hidden-md hidden-sm"><strong>Subtotal:</strong></span><asp:Literal runat="server" ID="linetotal" Text='<%# Eval("linetotal") %>' Visible="false" /><%# Eval("linetotal", "{0:c}") %></td>
                                    <td class="blackBg">
                                        <span class="hidden-lg hidden-md hidden-sm"><strong>Seats/Qty.:</strong></span>
                                        <asp:Literal runat="server" Text='<%#Eval("seats") %>' Visible='<%#(int)Eval("seats")>0 %>'></asp:Literal>
                                        <asp:Label runat="server" CssClass="redAlert bold" Visible='<%#(int)Eval("seats")==0 %>'><br />Add Student</asp:Label>
                                    </td>

                                </tr>
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
                            <asp:Panel ID="pnlCouponApplied" Visible="false" runat="server">
                                <div class="col-lg-10 col-md-9 col-sm-10 col-xs-8 text-right sectionSubHeadingPrices"><strong>Subtotal:</strong></div>
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 text-right sectionSubHeadingPrices">
                                    <asp:Label ID="ctlTotalCostReg" runat="server" /></div>
                                <div class="col-lg-10 col-md-9 col-sm-10 col-xs-8 text-right sectionSubHeadingPrices"><strong>Discount Applied:</strong></div>
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 text-right sectionSubHeadingPrices">
                                    <asp:Label ID="ctlDiscountTotal" CssClass="redAlert" runat="server" /></div>
                            </asp:Panel>
                            <div style="display: none" class="col-lg-10 col-md-9 col-sm-10 col-xs-8 text-right sectionSubHeadingPrices"><strong>Total:</strong></div>
                            <div style="display: none" class="col-lg-1 col-md-1 col-sm-1 col-xs-1 text-right sectionSubHeadingPrices">
                                <asp:Label ID="ctlTotalCost" runat="server" />
                                <asp:Literal ID="ltrTotal" runat="server" Visible="false"></asp:Literal>
                                <asp:Literal ID="ltrSubTotal" runat="server" Visible="false"></asp:Literal>
                            </div>
                        </div>



                        <p class="sectionHeadingSubPage text-left subSectionPadding payment">Payment Information</p>

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="row">
                                            <div class="col-md-12" style="color: white; background-color: #204d74; padding: 8px;">
                                                <label>Select your Payment Method</label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label></label>
                                            <asp:RadioButtonList ID="ctlBillingInfoPaymentMethod" CssClass="form-control no-border" ClientIDMode="Static" runat="server" RepeatLayout="Flow" onchange="togglePayment()">
                                                <asp:ListItem Value="CC" Selected="True">Credit Card</asp:ListItem>
                                                <asp:ListItem Value="Check">Check</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                        <%--OnSelectedIndexChanged="ctlBillingInfoPaymentMethod_SelectedIndexChanged" AutoPostBack="true"--%>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="row" style="margin-bottom: 20px;">
                                            <div class="col-md-12">
                                                <div style="color: white; background-color: #204d74; padding: 8px;">
                                                    <label id="payment-details">Credit Card</label>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:Panel ID="ctlCCPanel" ClientIDMode="Static" runat="server">
                                            <form id="payment-form">
                                                <div id="card-container"></div>
                                                <%--                                      <button id="card-button" type="button">Submit Order</button>--%>
                                            </form>
                                            <div id="payment-status-container"></div>
                                            <asp:HiddenField ID="nonce" runat="server" ClientIDMode="Static" />

                                        </asp:Panel>

                                        <asp:Panel ID="ctlCheckPanel" ClientIDMode="Static" Style="display: none" runat="server">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="form-group">
                                                        <label>Purchase Order Number*</label>
                                                        <asp:TextBox ID="ctlPO" data-validation="required" data-validation-error-msg="Purchase Order Number Required" CssClass="form-control" AutoCompleteType="None" placeholder="Purchase Order Number" MaxLength="100" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="form-group">
                                                        <label style="width: 100%">Please send your payment to: </label>
                                                        <p>
                                                            Productivity Point Learning Solutions<br />
                                                            ATT: Accounts Receivable<br />
                                                            12000 Santaluz Drive, Suite 101<br />
                                                            Fort Myers, FL  33913
                                           
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
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
                                <asp:Button ID="ctlSubmitOrder" BackColor="#e85c24" ForeColor="White" runat="server" CssClass="btn btn-success" OnClick="ctlSubmitOrder_Click" Text="Submit Order" OnClientClick="submitForm(event)" />
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
            var el = document.getElementById('ctlBillingInfoPaymentMethod_0');
            var el2 = document.getElementById('ctlBillingInfoPaymentMethod_1');
            var pnlCC = document.getElementById('ctlCCPanel');
            var pnlCheck = document.getElementById('ctlCheckPanel');
            if (el.checked === true) {
                pnlCC.style.display = 'block';
                pnlCheck.style.display = 'none';
                document.getElementById("payment-details").innerText = "Credit Card";
                paymentForm.cc = true;
            }
            else if (el2.checked === true) {
                pnlCC.style.display = 'none';
                pnlCheck.style.display = 'block';
                document.getElementById("payment-details").innerText = "Check";
                paymentForm.cc = false;
            }
        }
    </script>
</asp:Content>
