<%@ Page Title="Đặt lịch khám bệnh" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DatLich.aspx.cs" Inherits="CholibiClinic.DatLich" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="booking-container">
        <div class="booking-card">
            <div class="booking-header">
                <span class="booking-icon">📅</span>
                <h2 class="booking-title">Đăng ký đặt lịch khám</h2>
                <p class="booking-subtitle">Vui lòng chọn bác sĩ và thời gian khám phù hợp dưới đây</p>
            </div>
            
            <div class="booking-body">
                <!-- Patient Info Banner -->
                <div class="patient-banner">
                    <span class="patient-avatar">👤</span>
                    <div class="patient-details">
                        <div class="patient-label">Bệnh nhân đang đặt lịch:</div>
                        <div class="patient-name">
                            <asp:Label ID="lblPatientName" runat="server" Text="Đang tải..."></asp:Label>
                        </div>
                    </div>
                </div>

                <asp:Panel ID="pnlError" runat="server" CssClass="alert alert-danger" Visible="false">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </asp:Panel>
                
                <!-- Specialty Dropdown -->
                <div class="form-group mb-3">
                    <label class="form-label fw-bold">1. Chọn chuyên khoa <span class="text-danger">*</span></label>
                    <asp:DropDownList ID="ddlSpecialty" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlSpecialty_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
                
                <!-- Doctor Dropdown -->
                <div class="form-group mb-3">
                    <label class="form-label fw-bold">2. Chọn bác sĩ khám <span class="text-danger">*</span></label>
                    <asp:DropDownList ID="ddlDoctor" runat="server" CssClass="form-select">
                    </asp:DropDownList>
                </div>
                
                <!-- Date & Time Row -->
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">3. Ngày khám <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">4. Giờ khám mong muốn <span class="text-danger">*</span></label>
                        <asp:DropDownList ID="ddlTime" runat="server" CssClass="form-select">
                            <asp:ListItem Value="08:00:00">08:00 - 09:00 (Sáng)</asp:ListItem>
                            <asp:ListItem Value="09:00:00">09:00 - 10:00 (Sáng)</asp:ListItem>
                            <asp:ListItem Value="10:00:00">10:00 - 11:00 (Sáng)</asp:ListItem>
                            <asp:ListItem Value="11:00:00">11:00 - 12:00 (Sáng)</asp:ListItem>
                            <asp:ListItem Value="13:30:00">13:30 - 14:30 (Chiều)</asp:ListItem>
                            <asp:ListItem Value="14:30:00">14:30 - 15:30 (Chiều)</asp:ListItem>
                            <asp:ListItem Value="15:30:00">15:30 - 16:30 (Chiều)</asp:ListItem>
                            <asp:ListItem Value="16:30:00">16:30 - 17:30 (Chiều)</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                
                <!-- Notes Field -->
                <div class="form-group mb-4">
                    <label class="form-label fw-bold">5. Ghi chú triệu chứng hoặc yêu cầu khác</label>
                    <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control" placeholder="Nhập triệu chứng đau hoặc yêu cầu đặc biệt của bạn để bác sĩ chuẩn bị trước..." TextMode="MultiLine" Rows="3"></asp:TextBox>
                </div>
                
                <!-- Submit Button -->
                <asp:Button ID="btnSubmit" runat="server" Text="✓ Xác nhận đặt lịch ngay" CssClass="btn-booking-submit" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>
</asp:Content>
