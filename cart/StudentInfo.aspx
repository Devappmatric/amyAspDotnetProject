<%@ Page AutoEventWireup="true" CodeBehind="StudentInfo.aspx.cs" Debug="true" Inherits="ProductivityPointGlobal.cart.StudentInfo" Language="C#" MasterPageFile="~/default.master" Title="Productivity Point Learning Solutions - Payment Summary" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .checkout-menu > a{
            border-radius:8px !important;
        }

        .form-group{
            display:flex;
        }

        .form-group > label{
            width:180px;
        }

        .checkout-header-style{
            background-color:#23446a!important;padding:10px;color:White;margin:-15px;font-size:24px;text-align:center;
        }

        .contact-and-billing-block{
            padding:10px;
        }

        .contact-and-billing-block > div{
            background-color:#efefef;
            margin-top:0px;
            height:560px;
            padding:10px;
        }

        .form-group{
            display:block;
        }
        
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row" style="margin-left:0">
            <div class="container">
                <div class="row padding20T">
                    
                    <div class="col-lg-4 col-md-5 hidden-sm hidden-xs subSectionPadding">
                        <%--<uc:ContactForm runat="server" /> --%>
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
                    <div class="col-lg-8 col-md-6 col-sm-12 col-xs-12 ">

                        <uc:ShoppingCart2 ID="uc1" Selection="2" runat="server" />

                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>                                
                                <div class="row" style="padding-top:40px;">
                                    <div class="row" style="margin-bottom:10px;">
                                        <div class="col-md-12">
                                            <p>Who will be attending the training? Please update student names and emails below as needed.</p>
                                            <p>
                                                <asp:CheckBox AutoPostBack="true" OnCheckedChanged="chkSameAsContactInformation_CheckedChanged" ID="chkSameAsContactInformation" runat="server" Text="&nbsp; Same As Contact Information" />
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-lg-12" style="background-color:#efefef">
                                        <asp:ListView runat="server" ID="lvCart" DataKeyNames="sid" DataSourceID="sqlCart" OnItemDataBound="lvCart_ItemDataBound">
                                            <EmptyDataTemplate>
                                                <p class="sectionHeadingSubPage text-left subSectionPadding">Your Shopping Cart Is Empty</p>
                                            </EmptyDataTemplate>
                                            <ItemTemplate>
                                                <div>
                                                    <div class="checkout-header-style" style="font-size:16px;height:34px;margin-top:12px">
                                                        <span style="float:left">
                                                            <%# Eval("courseName") %>
                                                        </span>
                                                         <span  style="float:right"><%# Eval("startDate","{0:MM/dd/yyyy}") %> - <%# Eval("endDate","{0:MM/dd/yyyy}") %></span> &nbsp;&nbsp;
                                                        <span  style="float:right;padding-right:10px"><%#DateTime.Parse(Eval("startTime").ToString()).ToString("h:mm tt") %> - <%#DateTime.Parse(Eval("endTime").ToString()).ToString("h:mm tt") %></span>
                                                    </div>
                                                    <div>
                                                        <asp:HiddenField runat="server" ID="hfClassID"/>
                                                        <asp:HiddenField runat="server" ID="hfCartID"/>
                                                        <asp:HiddenField runat="server" ID="hfsid"/>
                                                        <asp:Repeater ID="rptStudentsList" runat="server">
                                                            <ItemTemplate>
                                                                    <div class="row" style="margin-top:30px;">
                                                                        <div class="col-md-3">
                                                                            <div class="form-group">
                                                                                <label>First Name</label>
                                                                                <div>
                                                                                    <asp:TextBox runat="server" ID="txtFirstName" CssClass="form-control" />
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-3">
                                                                            <div class="form-group">
                                                                                <label>Last Name</label>
                                                                                <div>
                                                                                    <asp:TextBox runat="server" ID="txtLastName" CssClass="form-control" />
                                                                                 </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <div class="form-group">
                                                                                <label>Attendee Email</label>
                                                                                <div>
                                                                                    <asp:TextBox runat="server" ID="txtStudentEmail" CssClass="form-control" />
                                                                                </div>                                                                
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                            </ItemTemplate>

                                                        </asp:Repeater>
                                                    </div>
                                                </div> 
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
                                        
                                    </div>

                                    
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <asp:UpdatePanel runat="server" UpdateMode="Always">
                            <ContentTemplate>
                                <div class="row" style="margin-top:20px;">
                                    <div class="col-md-6">
                                        <a type="button" class="btn btn-default" href="/cart/cart2.aspx" ><i class="fa fa-arrow-left"></i> Back to Cart </a>
                                    </div>
                                    <div class="col-md-6">
                                         <div class="form-group text-right">
                                              <asp:Button ID="ctlPlaceOrder" runat="server" BackColor="#e85c24" CssClass="btn btn-success" OnClick="ctlPlaceOrder_Click" Text="Next →" />
                                         </div>
                                    </div>
                                </div>
                                   
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <style>
        @media screen and (max-width: 600px) {
            table { width: 100%; }
            thead { display: none; }
            tbody td { display: block; text-align: left; }
                tbody td:before { content: attr(data-th); display: block; text-align: left; }
        }
    </style>

    <script type="text/javascript">
        window.onload = function () {
            setTimeout(function () {
                var checkbox = document.getElementById('<%= chkSameAsContactInformation.ClientID %>');
                if (checkbox) {
                    checkbox.click(); 
                }
            }, 1000);
            
        };
    </script>
</asp:Content>
