<%@ Page Title="" Language="C#" MasterPageFile="~/cms/admin.master" AutoEventWireup="true" CodeBehind="allcitypages.aspx.cs" Inherits="ProductivityPointGlobal.cms.Allcitypages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h2>All City Pages</h2>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">                            
            <asp:Repeater ID="masterRepeater" OnItemDataBound="masterRepeater_ItemDataBound" runat="server">
                <ItemTemplate>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <asp:Label ID="ctlState" runat="server" Text='<%# Eval("state") %>' /> - <asp:Label ID="ctlCity" runat="server" Text='<%# Eval("city") %>' />&nbsp;<strong>Pages:&nbsp;&nbsp;</strong>
                            <asp:Repeater ID="detailRepeater" runat="server">
                                <ItemTemplate>                                                                                                   
                                    <asp:HyperLink ID="ctlCourse" NavigateUrl='<%# Eval("id", "editcitypage.aspx?id={0}") %>' Text='<%# Eval("course") %>' CssClass="" runat="server"/><asp:HiddenField ID="ctlCourseId" Value='<%# Eval("id") %>' runat="server" /> - 
                                </ItemTemplate>                                                                                     
                            </asp:Repeater>  
                        </div>
                    </div>                                                      
                </ItemTemplate>
            </asp:Repeater>                                
        </div>
    </div>            
</asp:Content>
