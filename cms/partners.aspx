<%@ Page Title="" Language="C#" MasterPageFile="~/CMS/admin.master" AutoEventWireup="true" CodeBehind="partners.aspx.cs" Inherits="ProductivityPointGlobal.CMS.Partners" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">            
            <h3>Add Partners</h3>                
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
                            <th class="col-sm-3">Title</th>
                            <th class="col-sm-5">Description</th>
                            <th class="col-sm-2">Logo</th>  
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><asp:Button Text="Insert" CssClass="btn btn-success" OnClick="ctlInsertRecord_Click" runat="server" /></td>
                                <td><asp:Textbox ID="ctlName" Text='<%# Bind("name") %>' CssClass="form-control" TextMode="MultiLine" Height="100px" runat="server" /></td>
                                <td><asp:Textbox ID="ctlDescription" Text='<%# Bind("description") %>' TextMode="MultiLine" CssClass="form-control" Height="100px" runat="server" /></td>
                                <td>
                                    <span class="btn btn-default btn-file">
                                        <asp:FileUpload ID="ctlLogo" runat="server" />
                                    </span>
                                </td>                                                                                                                                                                                                
                            </tr>
                        </tbody>                
                    </table>                  
                </InsertItemTemplate>
            </asp:FormView>
        </div>        
    </div>
    
    <div class="row">
        <div class="col-md-12">            
            <h3>Manage Partners</h3>                
        </div>
    </div>  
    
    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="ctlAdminCMS" DataKeyNames="id" AutoGenerateColumns="False" GridLines="None" AllowPaging="False" OnRowEditing="ctlAdminCMS_RowEditing" OnRowUpdating="ctlAdminCMS_RowUpdating" OnRowCancelingEdit="ctlAdminCMS_RowCancelingEdit" OnRowDeleting="ctlAdminCMS_RowDeleting" CssClass="table table-hover"  runat="server" >
                <Columns>
                    <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" FooterStyle-CssClass="hidden">
                        <HeaderTemplate>
                            <thead>
                                <tr class="active">
                                    <th class="col-sm-2">Tools</th>
                                    <th class="col-sm-3">Title</th>
                                    <th class="col-sm-5">Description</th>                                
                                    <th class="col-sm-2">Logo</th>                                
                                </tr>
                            </thead> 
                        </HeaderTemplate>
                        <ItemTemplate>
                            <td>
                                <div class="btn-group" role="group" aria-label="...">
                                    <asp:Button Text="Edit" CssClass="btn btn-warning" CommandName="Edit" runat="server" />
                                    <asp:Button Text="Delete" CssClass="btn btn-danger" CommandName="Delete" OnClientClick='<%# Eval("name", "return confirm(\"Delete item [{0}]?\");") %>' runat="server" />
                                </div>                                  
                            </td>
                            <td><asp:Label ID="ctlName" Text='<%# Eval("name") %>' runat="server" /></td>
                            <td><asp:Label ID="ctlDescription" Text='<%# CheckEmptyData(Eval("description").ToString()) %>' runat="server" /></td>
                            <td><asp:Image ID="ctlLogo" ImageUrl='<%# Eval("logo", "~/uploads/partners/{0}") %>' runat="server" /></td>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <td>
                                <asp:HiddenField ID="ctlImageId" Value='<%# Eval("id") %>' runat="server" />
                                <div class="btn-group" role="group" aria-label="...">
                                    <asp:Button Text="Cancel" CssClass="btn btn-primary" CommandName="Cancel" runat="server" />                                    
                                    <asp:Button Text="Update" CssClass="btn btn-success" CommandName="Update" runat="server" />
                                </div>                                
                            </td>    
                            <td><asp:TextBox ID="ctlName" Text='<%# Bind("name") %>' CssClass="form-control" TextMode="MultiLine" Height="100px" runat="server" /></td>
                            <td><asp:TextBox ID="ctlDescription" Text='<%# Bind("description") %>' CssClass="form-control" TextMode="MultiLine" Height="100px" runat="server" /></td>
                            <td>
                                <span class="btn btn-default btn-file">
                                    <asp:FileUpload ID="ctlImage" runat="server" />
                                </span>
                            </td>                                                                                                                      
                        </EditItemTemplate>
                    </asp:TemplateField>                    
                </Columns>          
            </asp:GridView>      
        </div>
    </div>          
</asp:Content>