<%@ Page Title="" Language="C#" MasterPageFile="~/cms/admin.master" AutoEventWireup="true" CodeBehind="images.aspx.cs" Inherits="ProductivityPointGlobal.cms.Images" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">            
            <h3>Manage Course Images</h3>                
        </div>
    </div>    
    
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <thead>
                <tr class="active">
                    <th class="col-sm-1">Tools</th>
                    <th class="col-sm-5">Category</th>                            
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><asp:Button ID="ctlInsertRecord" Text="Insert Cat2 Category" CssClass="btn btn-success" OnClick="ctlInsertRecord_OnClick" runat="server" /></td>
                    <td>
                        <asp:TextBox ID="ctlCat2" CssClass="form-control" runat="server" />
                    </td>                                
                </tr>
                </tbody>
            </table>
        </div>        
    </div>

    <asp:GridView ID="ctlAdminCMS" DataKeyNames="id" AutoGenerateColumns="False" GridLines="None" AllowPaging="False" CssClass="table table-hover" OnRowEditing="ctlAdminCMS_OnRowEditing" OnRowUpdating="ctlAdminCMS_OnRowUpdating" OnRowCancelingEdit="ctlAdminCMS_OnRowCancelingEdit" OnRowDeleting="ctlAdminCMS_OnRowDeleting" runat="server" >
        <Columns>
            <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" FooterStyle-CssClass="hidden">
                <HeaderTemplate>
                    <thead>
                        <tr class="active">
                            <th class="col-sm-2">Tools</th>
                            <th class="col-sm-5">Category</th>
                            <th class="col-md-5">Image</th>
                        </tr>
                    </thead>                                          
                </HeaderTemplate>
                <ItemTemplate>
                    <td>
                        <div class="btn-group" role="group" aria-label="...">
                            <asp:Button Text="Edit" CssClass="btn btn-warning" CommandName="Edit" runat="server" />    
                            <asp:Button Text="Delete" CssClass="btn btn-danger" CommandName="Delete" OnClientClick='<%# Eval("cat2", "return confirm(\"Delete item [{0}]?\");") %>' runat="server" />
                        </div>                        
                    </td>
                    <td><asp:Label ID="ctlCategory" Text='<%# Eval("cat2") %>' runat="server" /></td> 
                    <td><asp:Image ID="ctlImage" ImageUrl='<%# Eval("img_url", "~/uploads/courses/{0}") %>' runat="server" /></td>                                    
                </ItemTemplate>
                <EditItemTemplate>
                    <td>
                        <asp:HiddenField ID="ctlCat2" Value='<%# Bind("cat2") %>' runat="server" />                        
                        <div class="btn-group" role="group" aria-label="...">
                            <asp:Button Text="Cancel" CssClass="btn btn-primary" CommandName="Cancel" runat="server" />                                    
                            <asp:Button Text="Update" CssClass="btn btn-success" CommandName="Update" runat="server" />
                        </div>                                
                    </td>                                        
                    <td>
                        <span class="btn btn-default btn-file">
                            <asp:FileUpload ID="ctlImage" runat="server" />
                        </span>
                    </td>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>          
    </asp:GridView>
</asp:Content>
