<%@ Page Language="C#"  MasterPageFile="~/cms/admin.master" AutoEventWireup="true" CodeBehind="brand-images.aspx.cs" Inherits="ProductivityPointGlobal.cms.brand_images" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		#pnlModalOverlay{ position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.7); }
		#pnlModal{ position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); padding: 25px; min-width: 300px; background: #fff; }
		#pnlModal td{ padding: 10px 0; }
		#pnlModal td img, .grid-img{ max-width: 500px; }
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="row">
		<div class="col-md-12">
			<h3>Manage Brand Images</h3>
		</div>
	</div>

	<asp:Button ID="btnNew" runat="server" CssClass="btn btn-success" Text="Add New" OnClick="btnNew_Click" />

	<asp:GridView ID="ctlCMSBrandImages" DataKeyNames="id" AutoGenerateColumns="False" GridLines="None" AllowPaging="False" CssClass="table table-hover" runat="server" OnRowCommand="ctlCMSBrandImages_RowCommand">
		<Columns>
			<asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" FooterStyle-CssClass="hidden">
				<HeaderTemplate>
					<thead>
						<tr class="active">
							<th class="col-sm-2">Tools</th>
							<th class="col-sm-3">Brand</th>
							<th class="col-sm-2">Courses?</th>
							<th class="col-md-5">Image</th>
						</tr>
					</thead>
				</HeaderTemplate>
				<ItemTemplate>
					<td>
						<div class="btn-group" role="group" aria-label="...">
							<asp:Button Style="margin-right:10px;" Text="Edit" CssClass="btn btn-warning" ID ="btnEdit" CommandName="ImgEdit" CommandArgument='<%# Bind("id") %>' runat="server" />&nbsp;
							<asp:Button Text="Delete" CssClass="btn btn-danger" ID="btnDelete" CommandName="ImgDelete" CommandArgument='<%# Bind("id") %>' OnClientClick='<%# Eval("brand_name", "return confirm(\"Delete item [{0}]?\");") %>' runat="server" />
						</div>
					</td>
					<td>
						<asp:Label ID="ctlBrand" Text='<%# Eval("brand_name") %>' runat="server" />
					</td>
					<td>
						<asp:Label ID="ctlCourseSw" Text='<%# Eval("course_sw") %>' runat="server" />
					</td>
					<td>
						<asp:Image ID="ctlImage" ImageUrl='<%# Eval("img_path") %>' runat="server" CssClass="grid-img" />
					</td>
				</ItemTemplate>
			</asp:TemplateField>
		</Columns>
	</asp:GridView>

	<asp:Panel ID="pnlModalOverlay" runat="server" ClientIDMode="Static" Visible="false">
		<asp:Panel ID="pnlModal" runat="server" ClientIDMode="Static">
			<asp:HiddenField ID="hdnModalId" runat="server" Value="0" />
			<table>
				<tr>
					<td><asp:Label ID="lblName" runat="server" Text="Brand Name"></asp:Label></td>
					<%--<td><asp:TextBox ID="tbName" runat="server"></asp:TextBox></td>--%>
					<td><asp:DropDownList id="ddName" runat="server" DataValueField="brand_name" DataTextField="brand_name"></asp:DropDownList></td>
				</tr>
				<tr>
					<td><asp:Label ID="lblCourseSw" runat="server" Text="Use For Courses?"></asp:Label></td>
					<td><asp:CheckBox ID="cbCourseSw" runat="server" /></td>
				</tr>
				<tr>
					<td><asp:Label ID="lblImage" runat="server" Text="Image"></asp:Label></td>
					<td>
						<asp:FileUpload ID="fuImage" runat="server" />
						<asp:Image ID="imgModal" runat="server" />
						<asp:Button ID="btnImgEdit" runat="server" Text="Change Image" OnClick="btnImgEdit_Click" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<asp:Button ID="btnModalCancel" runat="server" CssClass="btn btn-secondary" Text="Cancel" OnClick="btnModalCancel_Click" />
						<asp:Button ID="btnModalSave" runat="server" CssClass="btn btn-success" Text="Save" OnClick="btnModalSave_Click" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<asp:Label ID="lblModalError" runat="server"></asp:Label>
					</td>
				</tr>
			</table>
		</asp:Panel>
	</asp:Panel>
</asp:Content>

