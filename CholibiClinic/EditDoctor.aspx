<%@ Page Title="Sửa bác sĩ" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="EditDoctor.aspx.cs"
    Inherits="CholibiClinic.EditDoctor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-4">

        <h2 class="mb-4">Cập nhật thông tin bác sĩ</h2>

        <table class="table table-bordered">

            <tr>
                <td style="width:200px;">Họ và tên</td>
                <td>
                    <asp:TextBox ID="txtDoctorName"
                        runat="server"
                        CssClass="form-control">
                    </asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Số điện thoại</td>
                <td>
                    <asp:TextBox ID="txtPhone"
                        runat="server"
                        CssClass="form-control">
                    </asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Email</td>
                <td>
                    <asp:TextBox ID="txtEmail"
                        runat="server"
                        CssClass="form-control">
                    </asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Chuyên khoa</td>
                <td>
                    <asp:DropDownList
                        ID="ddlSpecialty"
                        runat="server"
                        CssClass="form-control">
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td></td>
                <td>

                    <asp:Button
                        ID="btnUpdate"
                        runat="server"
                        Text="💾 Cập nhật"
                        CssClass="btn btn-warning"
                        OnClick="btnUpdate_Click" />

                    &nbsp;

                    <asp:Button
                        ID="btnCancel"
                        runat="server"
                        Text="Hủy"
                        CssClass="btn btn-secondary"
                        PostBackUrl="~/BacSi.aspx" />

                </td>
            </tr>

        </table>

    </div>

</asp:Content>