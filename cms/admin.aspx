<%@ Page Title="" Language="C#" MasterPageFile="~/CMS/admin.master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="ProductivityPointGlobal.CMS.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">            
            <h3>Add Administrators</h3>                
        </div>
    </div>    
    
    <div class="row">
        <div class="col-md-12">
            <asp:FormView ID="ctlNewRecord" DataSourceID="CMS" DefaultMode="Insert" RenderOuterTable="False" DataKeyNames="id" runat="server">
                <InsertItemTemplate>
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr class="active">
                            <th class="col-sm-1">Tools</th>
                            <th class="col-sm-5">User Name</th>
                            <th class="col-sm-5">Password</th>  
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><asp:Button Text="Insert" CssClass="btn btn-success" CommandName="Insert" runat="server" /></td>
                                <td>
                                    <asp:TextBox ID="ctlUsernameNew" Text='<%# Bind("UserName") %>' CssClass="form-control" runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox ID="ctlPassName" Text='<%# Bind("Password") %>' CssClass="form-control" runat="server" />
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
            <h3>Manage Administrators</h3>                
        </div>
    </div>  
    
    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="ctlAdminCMS" DataSourceID="CMS" DataKeyNames="id" AutoGenerateColumns="False" GridLines="None" AllowPaging="True" CssClass="table table-hover" runat="server" >
                <Columns>
                    <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" FooterStyle-CssClass="hidden">
                        <HeaderTemplate>                    
                            <thead>
                                <tr class="active">
                                    <th class="col-sm-2">Tools</th>
                                    <th class="col-sm-5">User Name</th>
                                    <th class="col-sm-5">Password</th>                                
                                </tr>
                            </thead>                        
                        </HeaderTemplate>
                        <ItemTemplate>                            
                            <td>
                                <div class="btn-group" role="group" aria-label="...">
                                    <asp:Button Text="Edit" CssClass="btn btn-warning" CommandName="Edit" runat="server" />
                                    <asp:Button Text="Delete" CssClass="btn btn-danger" CommandName="Delete" OnClientClick='<%# Eval("Username", "return confirm(\"Delete item [{0}]?\");") %>' runat="server" />
                                </div>                                
                            </td>
                            <td><asp:Label ID="ctlUsernameNew" Text='<%# Eval("Username") %>' runat="server" /></td>
                            <td><asp:Label ID="ctlPassName" Text='<%# Eval("Password") %>' runat="server" /></td>                            
                        </ItemTemplate>
                        <EditItemTemplate>
                            <td>
                                <div class="btn-group" role="group" aria-label="...">
                                    <asp:Button Text="Cancel" CssClass="btn btn-primary" CommandName="Cancel" runat="server" />                                    
                                    <asp:Button Text="Update" CssClass="btn btn-success" CommandName="Update" runat="server" />
                                </div>                                
                            </td>
                            <td><asp:TextBox ID="ctlUsernameNew" Text='<%# Bind("Username") %>' CssClass="form-control" runat="server" /></td>
                            <td><asp:TextBox ID="ctlPassName" Text='<%# Bind("Password") %>' CssClass="form-control" runat="server" /></td>                               
                        </EditItemTemplate>
                    </asp:TemplateField>                                        
                </Columns>          
            </asp:GridView>            
        </div>
    </div>
    
    <asp:SqlDataSource ID="CMS" runat="server"
                       SelectCommand="SELECT * FROM [tblAdmin]" 
                       InsertCommand="INSERT INTO [tblAdmin] ([UserName], [Password]) VALUES (@UserName, @Password)"
                       UpdateCommand="UPDATE [tblAdmin] SET Username = @Username, Password  = @Password WHERE id = @id"
                       DeleteCommand="DELETE FROM [tblAdmin] WHERE [id] = @id" >
        <InsertParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Password" Type="String" />            
        </InsertParameters>        
        <UpdateParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Password" Type="String" />            
        </UpdateParameters>        
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>   
</asp:Content>