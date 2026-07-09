<%@ Page Title="Đăng nhập" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="CholibiClinic.DangNhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="auth-container">
        <div class="auth-card">
            <div class="auth-header">
                <span class="auth-icon">🔑</span>
                <h2 class="auth-title">Đăng nhập tài khoản</h2>
                <p class="auth-subtitle">Kết nối với bác sĩ và quản lý lịch khám của bạn</p>
            </div>

            <div class="auth-body">
                <asp:Panel ID="pnlError" runat="server" CssClass="alert alert-danger" Visible="false">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </asp:Panel>

                <div class="form-group mb-3">
                    <label class="form-label fw-bold">Email đăng nhập</label>
                    <div class="input-icon-group">
                        <span class="input-icon">✉️</span>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="nhapemail@gmail.com" TextMode="Email"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group mb-4">
                    <label class="form-label fw-bold">Mật khẩu</label>
                    <div class="input-icon-group">
                        <span class="input-icon">🔒</span>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="••••••••" TextMode="Password"></asp:TextBox>
                    </div>
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" CssClass="btn-auth-submit" OnClick="btnLogin_Click" />
            </div>

            <div class="auth-footer text-center">
                <span>Chưa có tài khoản?</span>
                <a href="~/DangKy" runat="server" class="auth-link">Đăng ký tài khoản mới</a>
            </div>
        </div>
    </div>
</asp:Content>
