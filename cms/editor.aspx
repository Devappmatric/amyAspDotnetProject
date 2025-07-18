<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/cms/admin.master"  CodeBehind="editor.aspx.cs" Inherits="ProductivityPointGlobal.cms.editor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
    <style>
        .form-group {
            margin-bottom: 15px;
            padding-bottom: 15px;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">            
            <h3 class="page-header">Add New Post</h3>
        </div>
    </div>    
    
    <div class="row" style="margin-bottom:30px;">        
         <div class="container">
            <h2>Post Details</h2>

            <!-- Title -->
            <div class="form-group">
                <label class="control-label col-sm-2">Title</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" />
                </div>
            </div>
             <br />

            <!-- Slug -->
            <div class="form-group">
                <label class="control-label col-sm-2">Slug</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtSlug" runat="server" CssClass="form-control" />
                </div>
            </div>
             <br />
            <!-- SEO Title -->
            <div class="form-group">
                <label class="control-label col-sm-2">SEO Title</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtSeoTitle" runat="server" CssClass="form-control" />
                </div>
            </div>
             <br />
            <!-- Description -->
            <div class="form-group">
                <label class="control-label col-sm-2">Description</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
                </div>
            </div>
             &nbsp;
             <br />
            <!-- Content -->
            <div class="form-group">
                <label class="control-label col-sm-2">Content</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtContent" runat="server" CssClass="form-control editor1" TextMode="MultiLine" Rows="6" />
                </div>
            </div>
             &nbsp;
             <br />

            <!-- Cover Image URL -->
            <div class="form-group">
                <label class="control-label col-sm-2">Cover Image</label>
                <div class="col-sm-10">
                    <asp:FileUpload ID="fuCoverImage" runat="server" CssClass="form-control" />
                    <br />
                    <asp:Image ID="imgPreview" runat="server" Width="200px" Visible="false" />
                    <asp:HiddenField ID="hfImagePath" runat="server" />
                </div>
            </div>
             <br />
             &nbsp;
              <!-- Category -->
             <div class="form-group">
                 <label class="control-label col-sm-2">Category</label>
                 <div class="col-sm-10">
                     <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                        <asp:ListItem Text="-- Select Category --" Value="" />
                        <asp:ListItem Text="Blog" Value="1" />
                        <asp:ListItem Text="Press Release" Value="2" />
                        <asp:ListItem Text="Topics" Value="3" />
                    </asp:DropDownList>
                 </div>
             </div>
             <br />
            <!-- Published -->
            <div class="form-group">
                <label class="control-label col-sm-2">Publish</label>
                <div class="col-sm-10">
                    <asp:CheckBox ID="chkPublished" runat="server" CssClass="checkbox-inline" />
                </div>
            </div>
             <br />
            <!-- Created At -->
            <div class="form-group"  style="display:none">
                <label class="control-label col-sm-2">Created At</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtCreatedAt" runat="server" CssClass="form-control" ReadOnly="true" />
                </div>
            </div>

            <!-- Updated At -->
            <div class="form-group" style="display:none">
                <label class="control-label col-sm-2">Updated At</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtUpdatedAt" runat="server" CssClass="form-control" ReadOnly="true" />
                </div>
            </div>
             <br />
            <!-- Submit Button -->
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10" style="text-align:center">
                    <asp:Button ID="btnSave" runat="server" Text="Save Post" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                </div>
            </div>
        </div>        
    </div>   
    <script>
                // Replace the <textarea id="editor1"> with a CKEditor 4
                // instance, using default configuration.
        CKEDITOR.replace('<%= txtContent.ClientID %>');
    </script>
    <script>
        function generateSlug(text) {
            return text
                .toString()
                .toLowerCase()
                .trim()
                .replace(/&/g, '-and-')           // Replace & with 'and'
                .replace(/[\s\W-]+/g, '-')         // Replace spaces and non-word chars with -
                .replace(/^-+|-+$/g, '');          // Trim - from start/end
        }

        document.addEventListener("DOMContentLoaded", function () {
            const titleInput = document.getElementById('<%= txtTitle.ClientID %>');
        const slugInput = document.getElementById('<%= txtSlug.ClientID %>');

        if (titleInput && slugInput) {
            titleInput.addEventListener('input', function () {
                slugInput.value = generateSlug(titleInput.value);
            });
        }
    });
    </script>
</asp:Content>
