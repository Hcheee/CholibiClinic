<%@ Page Title="Danh sách bác sĩ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BacSi.aspx.cs" Inherits="CholibiClinic.BacSi" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="doc-page-header">
        <div class="container">
            <div class="doc-breadcrumb">
                <a href="~/" runat="server">← Về trang chủ</a><br><br>
                <span style="color: #0d6efd; font-weight: bold;">HỆ THỐNG</span>
            </div>
            
            <h1 class="doc-page-title">Danh sách bác sĩ</h1>
            
            <div class="doc-page-count">
                <asp:Label ID="lblCount" runat="server" Text="0 bác sĩ trong hệ thống"></asp:Label>
            </div>

            <div class="row g-4">
                <asp:Repeater ID="rptDoctors" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-6 col-12">
                            <div class="doc-card">
                                <div class="doc-img-wrap">
                                    <span class='doc-badge <%# GetBadgeClass(Eval("SpecialtyId")) %>'>
                                        <%# GetBadgeText(Eval("SpecialtyId")) %>
                                    </span>
                                    <!-- Ảnh ngẫu nhiên cho đẹp -->
                                    <img src='https://ui-avatars.com/api/?name=<%# Eval("DoctorName") %>&background=random&size=300' alt="Bác sĩ">
                                </div>
                                <div class="doc-info">
                                    <div class="doc-name"><%# Eval("DoctorName") %></div>
                                    <div class="doc-specialty"><%# Eval("SpecialtyName") %></div>
                                    <div class="doc-experience">Kinh nghiệm chuyên môn cao</div>
                                    <div class="doc-desc">Bác sĩ <%# Eval("DoctorName") %> là chuyên gia hàng đầu về <%# Eval("SpecialtyName") %>, tận tâm với người bệnh.</div>
                                    
                                    <div class="doc-rating">
                                        ★★★★★ <span>4.9</span> <small>(<%# (Convert.ToInt32(Eval("DoctorId")) * 17) % 500 + 50 %> đánh giá)</small>
                                    </div>
                                    
                                    <div class="doc-footer-info">
                                        <div class="doc-footer-col">
                                            <div class="doc-footer-label">Phí khám từ</div>
                                            <div class="doc-footer-value text-blue">300.000đ</div>
                                        </div>
                                        <div class="doc-footer-col text-end">
                                            <div class="doc-footer-label">Lịch trống</div>
                                            <div class="doc-footer-value text-teal">Hôm nay</div>
                                        </div>
                                    </div>
                                    <a href='DatLich.aspx?doctorId=<%# Eval("DoctorId") %>&specialtyId=<%# Eval("SpecialtyId") %>' class="btn-book">📅 Đặt lịch khám</a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- Nút Tải thêm -->
            <asp:Button ID="btnLoadMore" runat="server" Text="Tải thêm 20 bác sĩ ⟳" CssClass="btn-load-more" OnClick="btnLoadMore_Click" />
            
        </div>
    </section>
</asp:Content>
