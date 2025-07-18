<%@ Page Title="" Language="C#" MasterPageFile="~/cms/admin.master" AutoEventWireup="true" CodeBehind="images-edit.aspx.cs" Inherits="ProductivityPointGlobal.cms.ImagesEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="masterHeaderTitle">
        <div style="float: left; padding: 0px 0px 0px 0px;"><h1 class="Grey">Update Course Image</h1></div>
        <div style="float: right;"><h2 class="Grey"><asp:Button ID="ctlUpdateRecord" Text="Update Record" CssClass="cmsMasterButtonGreen" runat="server" OnClick="ctlUpdateRecord_Click" />&nbsp;&nbsp;<asp:Button ID="ctlCancel" Text="Cancel" runat="server" CssClass="cmsMasterButtonBlack" OnClick="ctlCancel_Click" /></h2></div>
        <div class="clearFloat"></div>
    </div>
    <br />
    <asp:FormView ID="ctlNewRecord" DataSourceID="CMS" DataKeyNames="id" runat="server">
        <EditItemTemplate>
            <table class="cmsMasterTableDataUpdate">
                <tr>
                    <td><h2 class="Grey">Category</h2></td>
                    <td><asp:Label ID="ctlName" Text='<%# Eval("cat2") %>' Width="500px" runat="server" /></td>
                </tr>
                <tr>
                    <td><h2 class="Grey">Current Image</h2></td>
                    <td><asp:Label ID="Label1" Text='<%# Eval("img_url") %>' Width="500px" runat="server" /></td>
                </tr>
                <tr>
                    <td><h2 class="Grey">New Image</h2></td>
                    <td>
                        <asp:FileUpload ID="ctlImage" runat="server" />
                    </td>
                </tr>
            </table>
        </EditItemTemplate>
    </asp:FormView>

    <asp:SqlDataSource ID="CMS" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnection %>" 
                       SelectCommand="SELECT * FROM [tblCourse_Images] WHERE ([id] = @id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
