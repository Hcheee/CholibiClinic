<%@ Page Title="Đăng ký tài khoản" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="CholibiClinic.DangKy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="auth-container">
        <div class="auth-card max-w-600">
            <div class="auth-header">
                <span class="auth-icon">📝</span>
                <h2 class="auth-title">Đăng ký tài khoản mới</h2>
                <p class="auth-subtitle">Tạo tài khoản bệnh nhân để trải nghiệm đặt lịch tốt nhất</p>
            </div>

            <div class="auth-body">
                <asp:Panel ID="pnlError" runat="server" CssClass="alert alert-danger" Visible="false">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </asp:Panel>

                <asp:Panel ID="pnlSuccess" runat="server" CssClass="alert alert-success" Visible="false">
                    <asp:Label ID="lblSuccess" runat="server"></asp:Label>
                </asp:Panel>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Họ và tên <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Nguyễn Văn A"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Số điện thoại <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="0987654321"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Email <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="nhapemail@gmail.com" TextMode="Email"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="form-label fw-bold">Giới tính</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select">
                            <asp:ListItem Value="Nam">Nam</asp:ListItem>
                            <asp:ListItem Value="Nữ">Nữ</asp:ListItem>
                            <asp:ListItem Value="Khác">Khác</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="form-label fw-bold">Ngày sinh</label>
                        <asp:TextBox ID="txtBirthDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Mật khẩu <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="••••••••" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Xác nhận mật khẩu <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" placeholder="••••••••" TextMode="Password"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group mb-4">
                    <label class="form-label fw-bold">Địa chỉ</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Số nhà, đường, quận/huyện, thành phố" TextMode="MultiLine" Rows="2"></asp:TextBox>
                </div>

                <asp:Button ID="btnRegister" runat="server" Text="Đăng ký tài khoản" CssClass="btn-auth-submit" OnClick="btnRegister_Click" />
            </div>

            <div class="auth-footer text-center">
                <span>Đã có tài khoản?</span>
                <a href="~/DangNhap" runat="server" class="auth-link">Đăng nhập tại đây</a>
            </div>
        </div>
    </div>
</asp:Content>
