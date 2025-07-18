<%@ Page Title="" Language="C#" MasterPageFile="~/cms/admin.master" AutoEventWireup="true" CodeBehind="course-professional.aspx.cs" Inherits="ProductivityPointGlobal.cms.CourseProfessional" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h3>Add a Professional Development Link</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:FormView ID="ctlNewRecord" RenderOuterTable="False" DefaultMode="Insert" runat="server">
                <InsertItemTemplate>
                    <table class="table table-hover">
                        <thead>
                        <tr class="active">
                            <th class="col-sm-2">Tools</th>                            
                            <th class="col-sm-10">Cat 2</th>                                                        
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><asp:Button Text="Insert" CssClass="btn btn-success" OnClick="ctlInsertRecord_Click" runat="server"/></td>                            
                            <td><asp:Textbox ID="ctlCat2" CssClass="form-control" runat="server"/></td>                            
                        </tr>
                        </tbody>
                    </table>
                </InsertItemTemplate>
            </asp:FormView>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h3>Edit Professional Development Links</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="ctlAdminCMS" DataKeyNames="id" AutoGenerateColumns="False" GridLines="None" AllowPaging="False" OnRowEditing="ctlAdminCMS_RowEditing" OnRowUpdating="ctlAdminCMS_RowUpdating" OnRowCancelingEdit="ctlAdminCMS_RowCancelingEdit" OnRowDeleting="ctlAdminCMS_RowDeleting" CssClass="table table-hover" runat="server">
                <Columns>
                    <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" FooterStyle-CssClass="hidden">
                        <HeaderTemplate>
                            <thead>
                            <tr class="active">
                                <th class="col-sm-2">Tools</th>
                                <th class="col-sm-10">Cat 2</th>                                
                            </tr>
                            </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <td>
                                <div class="btn-group" role="group" aria-label="...">
                                    <asp:Button Text="Edit" CssClass="btn btn-warning" CommandName="Edit" runat="server"/>
                                    <asp:Button Text="Delete" CssClass="btn btn-danger" CommandName="Delete" OnClientClick='<%# Eval("cat2", "return confirm(\"Delete item [{0}]?\");") %>' runat="server"/>
                                </div>
                            </td>                            
                            <td><asp:Label ID="ctlCat2" Text='<%# Eval("cat2") %>' runat="server"/></td>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <td>
                                <asp:HiddenField ID="ctlImageId" Value='<%# Eval("id") %>' runat="server"/>
                                <div class="btn-group" role="group" aria-label="...">
                                    <asp:Button Text="Cancel" CssClass="btn btn-primary" CommandName="Cancel" runat="server"/>
                                    <asp:Button Text="Update" CssClass="btn btn-success" CommandName="Update" runat="server"/>
                                </div>
                            </td>                            
                            <td><asp:TextBox ID="ctlCat2" Text='<%# Bind("cat2") %>' CssClass="form-control" runat="server"/></td>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>    
</asp:Content>
