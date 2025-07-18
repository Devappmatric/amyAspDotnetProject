<%@ Page Title="" Language="C#" MasterPageFile="~/CMS/admin.master" AutoEventWireup="true" CodeBehind="import.aspx.cs" Inherits="ProductivityPointGlobal.CMS.Import" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h3>Import Data</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
<div class="alert alert-<asp:Literal runat="server" ID="alertStatus" Text="success" /> alert-dismissible show" role="alert">
  <strong>Holy guacamole!</strong> You should check in on some of those fields below.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered">
                <thead>
                    <tr class="active">
                        <th>Tools</th>
                        <th>Import Excel Sheet</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <div class="form-group">
                                <span class="btn btn-default">
                                    <asp:FileUpload ID="ctlFileToUpload" AllowMultiple="False" runat="server" />
                                </span>
                                <asp:Button ID="ctlImportData" Text="Upload File" OnClick="ctlImportData_Click" CssClass="btn btn-success" runat="server" />
                            </div>
                        </td>
                        <td>
                            <asp:Button ID="ctlImportClasses" CssClass="btn btn-success" runat="server" OnClick="ctlImportClasses_OnClick" Text="Classes" />
                            <asp:Button ID="ctlImportCourses" CssClass="btn btn-success" runat="server" OnClick="ctlImportCourses_OnClick" Text="Courses" />
                            <asp:Button ID="ctlImportLocations" CssClass="btn btn-success" runat="server" OnClick="ctlImportLocations_OnClick" Text="Locations" />                                                            
                            <asp:Button ID="ctlImportUrls" CssClass="btn btn-success" runat="server" OnClick="ctlImportUrls_OnClick" Text="Url For Redirect" />  
                        </td>
                    </tr>
                </tbody>
            </table>
            <hr />
            <h2>Page Update</h2>
            <asp:Button ID="ctlPrepareCityCourses" CssClass="btn btn-success" runat="server" OnClick="ctlPrepareCityCourses_OnClick" Text="Update City Courses" />
            <asp:Button ID="ctlNationalLocations" CssClass="btn btn-success" runat="server" OnClick="ctlNationalLocations_OnClick" Text="Update National Locations" />
            <asp:Button ID="ctlBrand" CssClass="btn btn-success" runat="server" OnClick="ctlBrand_OnClick" Text="Update Brands" />
            <asp:Button ID="ctlTopic" CssClass="btn btn-success" runat="server" OnClick="ctlTopic_OnClick" Text="Update Topics" />
        </div>
    </div>
</asp:Content>