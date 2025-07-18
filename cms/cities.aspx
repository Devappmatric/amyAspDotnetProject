<%@ Page Title="" Language="C#" MasterPageFile="~/cms/admin.master" AutoEventWireup="true" CodeBehind="cities.aspx.cs" Inherits="ProductivityPointGlobal.cms.Cities" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">            
            <h2>Add City</h2>                
        </div>
    </div>    
    
    <div class="row">
        <div class="col-md-12">
            <asp:FormView ID="ctlNewRecord" DataSourceID="CMS" DataKeyNames="cityId" DefaultMode="Insert" RenderOuterTable="False" runat="server">
                <InsertItemTemplate>
                    <table class="table table-hover">
                        <thead>
                        <tr class="active">
                            <th class="col-sm-1">Tools</th>
                            <th class="col-sm-5">City</th>                            
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><asp:Button Text="Insert" CssClass="btn btn-success" CommandName="Insert" runat="server" /></td>
                                <td>
                                    <asp:TextBox ID="ctlUsernameNew" Text='<%# Bind("city") %>' CssClass="form-control" runat="server" />
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
            <h2>Manage Cities</h2>                
        </div>
    </div>  
    
    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="ctlAdminCMS" DataSourceID="CMS" DataKeyNames="cityId" AutoGenerateColumns="False" GridLines="None" AllowPaging="True" CssClass="table table-hover" runat="server" >
                <Columns>
                    <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" FooterStyle-CssClass="hidden">
                        <HeaderTemplate>                    
                            <thead>
                                <tr class="active">
                                    <th class="col-sm-2">Tools</th>
                                    <th class="col-sm-5">State</th>                                                                
                                </tr>
                            </thead>                        
                        </HeaderTemplate>
                        <ItemTemplate>                            
                            <td>
                                <div class="btn-group" role="group" aria-label="...">
                                    <asp:Button Text="Edit" CssClass="btn btn-warning" CommandName="Edit" runat="server" />
                                    <asp:Button Text="Delete" CssClass="btn btn-danger" CommandName="Delete" OnClientClick='<%# Eval("city", "return confirm(\"Delete item [{0}]?\");") %>' runat="server" />
                                </div>                                
                            </td>
                            <td><asp:Label ID="ctlUsernameNew" Text='<%# Eval("city") %>' runat="server" /></td>                                                       
                        </ItemTemplate>
                        <EditItemTemplate>
                            <td>
                                <div class="btn-group" role="group" aria-label="...">
                                    <asp:Button Text="Cancel" CssClass="btn btn-primary" CommandName="Cancel" runat="server" />                                    
                                    <asp:Button Text="Update" CssClass="btn btn-success" CommandName="Update" runat="server" />
                                </div>                                
                            </td>
                            <td><asp:TextBox ID="ctlUsernameNew" Text='<%# Bind("city") %>' CssClass="form-control" runat="server" /></td>                            
                        </EditItemTemplate>
                    </asp:TemplateField>                                        
                </Columns>          
            </asp:GridView>            
        </div>
    </div>
    
    <asp:SqlDataSource ID="CMS" runat="server" 
                       SelectCommand="SELECT * FROM [tblCities]" 
                       InsertCommand="INSERT INTO [tblCities] ([city]) VALUES (@city)"
                       UpdateCommand="UPDATE [tblCities] SET city = @city WHERE cityId = @cityId"
                       DeleteCommand="DELETE FROM [tblCities] WHERE [cityId] = @cityId" >
        <InsertParameters>
            <asp:Parameter Name="city" Type="String" />                     
        </InsertParameters>        
        <UpdateParameters>
            <asp:Parameter Name="city" Type="String" />            
        </UpdateParameters>        
        <DeleteParameters>
            <asp:Parameter Name="cityId" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>      
</asp:Content>
