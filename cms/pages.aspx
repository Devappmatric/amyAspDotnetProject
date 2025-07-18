<%@ Page Title="" Language="C#" MasterPageFile="~/cms/admin.master" AutoEventWireup="true" CodeBehind="pages.aspx.cs" Inherits="ProductivityPointGlobal.cms.Pages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h3>Manage SEO</h3>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="ctlGridView" DataSourceID="CMS" DataKeyNames="id" AutoGenerateColumns="False" GridLines="None" AllowPaging="False" CssClass="table table-hover" runat="server" >
                <Columns>
                    <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" FooterStyle-CssClass="hidden">
                        <HeaderTemplate>                    
                            <thead>
                                <tr class="active">
                                    <th class="col-sm-2">Tools</th>
                                    <th class="col-sm-2">Page</th>
                                    <th class="col-sm-2">Title</th>                                
                                    <th class="col-sm-3">Description</th>  
                                    <th class="col-sm-3">Keywords</th>                                      
                                </tr>
                            </thead>                        
                        </HeaderTemplate>
                        <ItemTemplate>                            
                            <td>
                                <div class="btn-group" role="group" aria-label="...">
                                    <asp:Button Text="Edit" CssClass="btn btn-warning" CommandName="Edit" runat="server" />                                    
                                </div>                                
                            </td>
                            <td><asp:Label ID="ctlPage" Text='<%# Eval("page") %>' runat="server" /></td>
                            <td><asp:Label ID="ctlPageTitle" Text='<%# Eval("pageTitle") %>' runat="server" /></td>   
                            <td><asp:Label ID="ctlDescription" Text='<%# Eval("metaDescription") %>' runat="server" /></td>   
                            <td><asp:Label ID="ctlKeywords" Text='<%# Eval("metaKeywords") %>' runat="server" /></td>                                                                                       
                        </ItemTemplate>
                        <EditItemTemplate>
                            <td>
                                <div class="btn-group" role="group" aria-label="...">
                                    <asp:Button Text="Cancel" CssClass="btn btn-primary" CommandName="Cancel" runat="server" />                                    
                                    <asp:Button Text="Update" CssClass="btn btn-success" CommandName="Update" runat="server" />
                                </div>                                
                            </td>
                            <td><asp:TextBox ID="ctlPage" Text='<%# Bind("page") %>' CssClass="form-control" runat="server" /></td>
                            <td><asp:TextBox ID="ctlPageTitle" Text='<%# Bind("pageTitle") %>' CssClass="form-control" runat="server" /></td>                               
                            <td><asp:TextBox ID="ctlDescription" Text='<%# Bind("metaDescription") %>' CssClass="form-control" TextMode="MultiLine" runat="server" /></td>
                            <td><asp:TextBox ID="ctlKeywords" Text='<%# Bind("metaKeywords") %>' CssClass="form-control" TextMode="MultiLine" runat="server" /></td>
                        </EditItemTemplate>                          
                    </asp:TemplateField>                                        
                </Columns>         
            </asp:GridView>            
        </div>
    </div>       
    
    <asp:SqlDataSource ID="CMS" runat="server" 
                       SelectCommand="SELECT * FROM [tblSEO] ORDER BY [page] ASC"
                       UpdateCommand="UPDATE [tblSEO] SET page=@page, pageTitle=@pageTitle, metaDescription=@metaDescription, metaKeywords=@metaKeywords WHERE id = @id">       
        <UpdateParameters>
            <asp:Parameter Name="page" Type="String" />
            <asp:Parameter Name="pageTitle" Type="String" />            
            <asp:Parameter Name="metaDescription" Type="String" /> 
            <asp:Parameter Name="metaKeywords" Type="String" /> 
        </UpdateParameters>        
    </asp:SqlDataSource>               
</asp:Content>
