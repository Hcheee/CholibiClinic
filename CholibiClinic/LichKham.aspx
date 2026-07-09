<%@ Page Title="Lịch khám cá nhân" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LichKham.aspx.cs" Inherits="CholibiClinic.LichKham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="appt-history-container">
        <div class="container py-5">
            <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap">
                <div>
                    <h1 class="history-title">📅 Lịch khám của bạn</h1>
                    <p class="history-subtitle text-muted">Xem và quản lý tất cả lịch hẹn đã đăng ký với Cholibi Clinic</p>
                </div>
                <a href="~/DatLich" runat="server" class="btn-book-more-appt">+ Đăng ký lịch mới</a>
            </div>

            <asp:Panel ID="pnlNoAppointments" runat="server" CssClass="no-appt-card text-center py-5" Visible="false">
                <span class="no-appt-icon">📭</span>
                <h3>Bạn chưa có lịch khám nào</h3>
                <p class="text-muted mb-4">Đăng ký đặt lịch khám ngay với các chuyên gia y tế của chúng tôi chỉ trong 3 phút.</p>
                <a href="~/DatLich" runat="server" class="btn-book-now-empty">Đặt lịch khám ngay</a>
            </asp:Panel>

            <div class="row g-4">
                <asp:Repeater ID="rptAppointments" runat="server" OnItemCommand="rptAppointments_ItemCommand">
                    <ItemTemplate>
                        <div class="col-lg-6 col-12">
                            <div class='appt-card <%# GetStatusClass(Eval("Status")) %>'>
                                <div class="appt-card-header d-flex justify-content-between align-items-start">
                                    <div class="doc-brief d-flex align-items-center">
                                        <img src='https://ui-avatars.com/api/?name=<%# Eval("DoctorName") %>&background=random&size=100' alt="Bác sĩ" class="doc-brief-avatar">
                                        <div class="doc-brief-info">
                                            <div class="doc-brief-name">BS. <%# Eval("DoctorName") %></div>
                                            <div class="doc-brief-spec"><%# Eval("SpecialtyName") %></div>
                                        </div>
                                    </div>
                                    <span class='appt-status-badge <%# GetBadgeStatusClass(Eval("Status")) %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </div>

                                <div class="appt-card-body">
                                    <div class="appt-detail-row">
                                        <span class="detail-icon">📅</span>
                                        <span class="detail-label">Ngày khám:</span>
                                        <span class="detail-value"><%# Convert.ToDateTime(Eval("AppointmentDate")).ToString("dd/MM/yyyy") %></span>
                                    </div>
                                    <div class="appt-detail-row">
                                        <span class="detail-icon">⏰</span>
                                        <span class="detail-label">Giờ khám:</span>
                                        <span class="detail-value"><%# FormatTime(Eval("AppointmentTime")) %></span>
                                    </div>
                                    <div class="appt-detail-row">
                                        <span class="detail-icon">📌</span>
                                        <span class="detail-label">Địa điểm:</span>
                                        <span class="detail-value">Phòng khám Cholibi - Tầng 2, Tòa nhà Y Tế</span>
                                    </div>
                                </div>

                                <div class="appt-card-footer d-flex justify-content-between align-items-center">
                                    <span class="appt-id-text">Mã số lịch hẹn: #<%# Eval("AppointmentId") %></span>
                                    <asp:LinkButton ID="btnCancel" runat="server" 
                                        CommandName="CancelAppointment" 
                                        CommandArgument='<%# Eval("AppointmentId") %>' 
                                        CssClass="btn-cancel-appt"
                                        OnClientClick="return confirm('Bạn có chắc chắn muốn hủy lịch khám này không?');"
                                        Visible='<%# Eval("Status").ToString() == "Chờ khám" %>'>
                                        ❌ Hủy lịch hẹn
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
