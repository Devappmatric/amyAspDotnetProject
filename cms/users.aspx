<%@ Page Title="" Language="C#" MasterPageFile="~/cms/admin.master" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="ProductivityPointGlobal.cms.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="masterHeaderTitle">
        <div style="float: left; padding: 0px 0px 0px 0px;"><h1 class="Grey">View Users</h1></div>
        <div style="float: right;"><h2 class="Grey">&nbsp;</h2></div>
        <div class="clearFloat"></div>
    </div>
    <br />

    <asp:GridView ID="ctlAdminCMS" DataSourceID="CMS" DataKeyNames="id" AutoGenerateColumns="False" GridLines="None" AllowPaging="True" OnDataBound="ctlAdminCMS_DataBound" Width="100%" runat="server" >
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <table class="cmsMasterTable">
                        <tr>                            
                            <td style="width: 50%;"><h2 class="Grey">User Information</h2></td>
                            <td style="width: 50%;"><h2 class="Grey">Billing Information</h2></td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table class="cmsMasterTableData">
                        <tr>
                            <td style="width: 50%;">
                                <p><span class="bold">Name:</span> <asp:Label ID="ctlFirstName" Text='<%# Eval("firstname") %>' runat="server" /> <asp:Label ID="ctlLastName" Text='<%# Eval("lastname") %>' runat="server" /></p>
                                <p><span class="bold">Email:</span> <asp:Label ID="ctlEmail" Text='<%# Eval("username") %>' runat="server" /></p>
                                <p><span class="bold">Phone:</span> <asp:Label ID="ctlPhone" Text='<%# Eval("phone") %>' runat="server" /></p>
                                <p><span class="bold">Company:</span> <asp:Label ID="ctlCompany" Text='<%# Eval("company") %>' runat="server" /></p>
                                <p><span class="bold">Address:</span> <asp:Label ID="ctlAddress" Text='<%# Eval("address") %>' runat="server" /></p>
                                <p><span class="bold">City:</span> <asp:Label ID="ctlCity" Text='<%# Eval("city") %>' runat="server" /></p>
                                <p><span class="bold">Country:</span> <asp:Label ID="ctlCountry" Text='<%# Eval("country") %>' runat="server" /></p>
                                <p><span class="bold">State:</span> <asp:Label ID="ctlState" Text='<%# Eval("state") %>' runat="server" /></p>
                                <p><span class="bold">Zipcode:</span> <asp:Label ID="ctlZipcode" Text='<%# Eval("zipcode") %>' runat="server" /></p>                                
                            </td>
                            <td style="width: 50%;">
                                <p><span class="bold">Name:</span> <asp:Label ID="ctlBillingFirstName" Text='<%# Eval("billing_firstname") %>' runat="server" /> <asp:Label ID="ctlBillingLastName" Text='<%# Eval("billing_lastname") %>' runat="server" /></p>
                                <p><span class="bold">Phone:</span> <asp:Label ID="ctlBillingPhone" Text='<%# Eval("billing_phone") %>' runat="server" /></p>
                                <p><span class="bold">Company:</span> <asp:Label ID="ctlBillingCompany" Text='<%# Eval("billing_company") %>' runat="server" /></p>
                                <p><span class="bold">Address:</span> <asp:Label ID="ctlBillingAddress" Text='<%# Eval("billing_address") %>' runat="server" /></p>
                                <p><span class="bold">City:</span> <asp:Label ID="ctlBillingCity" Text='<%# Eval("billing_city") %>' runat="server" /></p>
                                <p><span class="bold">Country:</span> <asp:Label ID="ctlBillingCountry" Text='<%# Eval("billing_country") %>' runat="server" /></p>
                                <p><span class="bold">State:</span> <asp:Label ID="ctlBillingState" Text='<%# Eval("billing_state") %>' runat="server" /></p>
                                <p><span class="bold">Zipcode:</span> <asp:Label ID="ctlBillingZipcode" Text='<%# Eval("billing_zipcode") %>' runat="server" /></p>                                
                                <p>&nbsp;</p>
                            </td>                            
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>        
        <PagerTemplate>    
            <div class="masterPagerL">   
                <h2 class="Grey">Page: </h2>
            </div>
            <div class="masterPagerR">
                <asp:Menu ID="ctlPager" Orientation="Horizontal" CssClass="masterPager" OnMenuItemClick="ctlPager_MenuItemClick" runat="server" />
            </div>
            <div class="clearFloat"></div>
        </PagerTemplate>    
    </asp:GridView>

    <asp:SqlDataSource ID="CMS" runat="server"
                       SelectCommand="SELECT * FROM [tblUsers]">
    </asp:SqlDataSource>
</asp:Content>
