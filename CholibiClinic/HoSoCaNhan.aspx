<%@ Page Title="Hồ sơ cá nhân" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HoSoCaNhan.aspx.cs" Inherits="CholibiClinic.HoSoCaNhan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="auth-container py-5">
        <div class="auth-card max-w-700 mx-auto bg-white shadow rounded-lg p-4">
            <div class="auth-header text-center mb-4">
                <span class="auth-icon" style="font-size: 48px; display: inline-block; margin-bottom: 10px;">👤</span>
                <h2 class="auth-title fw-bold text-primary">Hồ sơ cá nhân</h2>
                <p class="auth-subtitle text-muted">Xem và cập nhật thông tin cá nhân của bạn</p>
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

                <div class="form-group mb-3">
                    <label class="form-label fw-bold">Địa chỉ</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Số nhà, đường, quận/huyện, thành phố" TextMode="MultiLine" Rows="2"></asp:TextBox>
                </div>

                <div class="card bg-light border-0 mb-4">
                    <div class="card-body p-3">
                        <h6 class="fw-bold mb-2 text-dark">🔑 Thay đổi mật khẩu (Tùy chọn)</h6>
                        <div class="row">
                            <div class="col-md-6">
                                <label class="form-label text-muted small">Mật khẩu mới</label>
                                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" placeholder="Để trống nếu không đổi" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label text-muted small">Xác nhận mật khẩu mới</label>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" placeholder="Để trống nếu không đổi" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="d-grid gap-2">
                    <asp:Button ID="btnSave" runat="server" Text="Lưu thay đổi" CssClass="btn btn-primary py-2 fw-bold" OnClick="btnSave_Click" />
                    <a href="~/Default.aspx" runat="server" class="btn btn-outline-secondary py-2">Quay lại trang chủ</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
