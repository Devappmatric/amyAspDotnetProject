<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/cms/admin.master"  CodeBehind="Posts.aspx.cs" Inherits="ProductivityPointGlobal.cms.Posts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .post-link-container{
            background-color: #efefef;
            padding:20px;
        }
        .card-body{
            padding-bottom:10px;
        }

        .margin-right-15{
            margin-right:15px;
        }

        .item-post{
            border:1px solid #efefef;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">            
            <h3 class="page-header">Posts</h3>
            <a class="btn btn-primary pull-right" href="/cms/editor.aspx" >Add New</a>
        </div>
    </div>    
    
    <div class="row" style="margin-top:30px;">     
        <div class="col-md-12">
            <div class="container">

          <div class="row">
            <asp:Repeater ID="rptPosts" runat="server">
                <ItemTemplate>
                    <div class="col-md-4 item-post" style="margin-bottom:30px;">
                      <div class="card mb-4 box-shadow">
                        <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" src="/uploads/posts/<%# Eval("cover_image_url") %>" data-holder-rendered="true" style="height: 225px; width: 100%; display: block;">
                        <div class="card-body">
                            <h4>
                                <%# Eval("title") %>
                                <span style="color:darkorange"><%# !(Convert.ToBoolean(Eval("published"))) ? " [Draft]" : "" %></span>
                            </h4>

                          <p class="card-text" style="height:40px;overflow:hidden"><%# Eval("description") %></p>
                            <p class="text-muted">
                                <%# Eval("created_at", "{0:MMMM dd, yyyy}") %> |
                                Category: <%# GetCategoryName(Eval("category")) %>
                            </p>                         
                            <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                              <button type="button" onclick="window.location.href='/cms/editor.aspx?id=<%# Eval("id") %>'" class="btn btn-sm btn-warning margin-right-15">Edit</button> &nbsp; &nbsp;
<asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-sm btn-danger"
    CommandName="DeletePost" CommandArgument='<%# Eval("id") %>' OnClientClick="return confirm('Are you sure you want to delete this post?');" />
                            </div>
        
                          </div>
                        </div>
                      </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

          </div>
        </div>
        </div>
             
    </div>   
</asp:Content>
