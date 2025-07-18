<%@ Page Title="" Language="C#" MasterPageFile="~/cms/admin.master" AutoEventWireup="true" CodeBehind="editseo.aspx.cs" Inherits="ProductivityPointGlobal.cms.Editseo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="masterHeaderTitle">
        <div style="float: left; padding: 0px 0px 0px 0px;"><h1 class="Grey">Update SEO</h1></div>
        <div style="float: right;"><h2 class="Grey"><asp:Button ID="ctlUpdateRecord" Text="Update Record" CssClass="cmsMasterButtonGreen" runat="server" OnClick="ctlUpdateRecord_OnClick" />&nbsp;&nbsp;<asp:Button ID="ctlCancel" Text="Cancel" runat="server" CssClass="cmsMasterButtonBlack" OnClick="ctlCancel_OnClick" /></h2></div>
        <div class="clearFloat"></div>
    </div>
    <br />    
    <asp:FormView ID="ctlEditForm" DataKeyNames="id" Width="100%" runat="server"         
        OnItemUpdating="ctlEditForm_ItemUpdating"                    
        DefaultMode="Edit">
        <EditItemTemplate>
        <table class="cmsMasterTableDataUpdate">
            <tr>
                <td><h2 class="White">Page Title</h2></td>
                <td><asp:TextBox ID="ctlTitle" Width="500px" CssClass="styledTextBoxWhite" Text='<%# Bind("pageTitle") %>' runat="server" /></td>
            </tr>   
            <tr>
                <td><h2 class="White">Description</h2></td>
                <td><asp:TextBox ID="ctlDescription" Width="500px" CssClass="styledTextBoxWhite" Text='<%# Bind("metaDescription") %>' runat="server" /></td>
            </tr>
            <tr>
                <td><h2 class="White">Keywords</h2></td>
                <td><asp:TextBox ID="ctlKeywords" Width="500px" CssClass="styledTextBoxWhite" Text='<%# Bind("metaKeywords") %>' runat="server" /></td>
            </tr>                          
        </table>      
        </EditItemTemplate>
    </asp:FormView>    
</asp:Content>
