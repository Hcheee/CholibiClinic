<%@ Page Title="Thêm bác sĩ" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="AddDoctor.aspx.cs"
Inherits="CholibiClinic.AddDoctor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<h2>Thêm bác sĩ</h2>

<table class="table">

<tr>
    <td>Họ tên</td>
    <td>
        <asp:TextBox ID="txtDoctorName" runat="server" CssClass="form-control"></asp:TextBox>
    </td>
</tr>

<tr>
    <td>Số điện thoại</td>
    <td>
        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
    </td>
</tr>

<tr>
    <td>Email</td>
    <td>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
    </td>
</tr>

<tr>
    <td>Chuyên khoa</td>
    <td>
        <asp:DropDownList ID="ddlSpecialty"
            runat="server"
            CssClass="form-control">
        </asp:DropDownList>
    </td>
</tr>

<tr>
    <td></td>
    <td>

        <asp:Button
            ID="btnSave"
            runat="server"
            Text="Lưu"
            CssClass="btn btn-success"
            OnClick="btnSave_Click" />

        <asp:Button
            ID="btnCancel"
            runat="server"
            Text="Hủy"
            CssClass="btn btn-secondary"
            PostBackUrl="~/BacSi.aspx"/>

    </td>
</tr>

</table>

</asp:Content>