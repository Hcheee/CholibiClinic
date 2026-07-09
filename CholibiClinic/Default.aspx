<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CholibiClinic._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- HERO SECTION -->
    <section class="hero-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-7">
                    <div class="tag-badge">✓ Hơn 5.000 bác sĩ đã xác minh</div>
                    <h1 class="hero-title">Đặt lịch khám <span>nhanh chóng</span>, tiện lợi</h1>
                    <p class="hero-desc">Kết nối với hàng nghìn bác sĩ chuyên khoa hàng đầu.<br />Đặt lịch trực tuyến, nhận xác nhận ngay lập tức.</p>
                    <a href="~/DatLich" runat="server" class="btn-book-now">📅 Đặt lịch khám ngay</a>
                </div>
                <div class="col-md-5 hero-img-box">
                    <img src="https://images.unsplash.com/photo-1576091160550-2173ff9e5eb2?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Bác sĩ" class="hero-img" />
                    <div class="feature-mini-cards">
                        <div class="mini-card">🔒<br />Bảo mật thông tin</div>
                        <div class="mini-card">⚡<br />Xác nhận tức thì</div>
                        <div class="mini-card">💳<br />Miễn phí đặt lịch</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- SPECIALTY SECTION -->
    <section class="specialty-section">
        <div class="container">
            <div class="text-center">
                <div class="section-subtitle">Chuyên khoa</div>
                <h2 class="section-title">Tìm theo chuyên khoa</h2>
            </div>
            
            <div class="row g-4 justify-content-center">
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <a href="#" class="specialty-card bg-red">
                        <div class="specialty-icon">❤️</div>
                        <div class="specialty-name">Tim mạch</div>
                        <div class="specialty-count">320 bác sĩ</div>
                    </a>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <a href="#" class="specialty-card bg-yellow">
                        <div class="specialty-icon">👶</div>
                        <div class="specialty-name">Nhi khoa</div>
                        <div class="specialty-count">280 bác sĩ</div>
                    </a>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <a href="#" class="specialty-card bg-green">
                        <div class="specialty-icon">🌿</div>
                        <div class="specialty-name">Da liễu</div>
                        <div class="specialty-count">210 bác sĩ</div>
                    </a>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <a href="#" class="specialty-card bg-pink">
                        <div class="specialty-icon">🌸</div>
                        <div class="specialty-name">Sản phụ khoa</div>
                        <div class="specialty-count">195 bác sĩ</div>
                    </a>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <a href="#" class="specialty-card bg-blue">
                        <div class="specialty-icon">👁️</div>
                        <div class="specialty-name">Mắt</div>
                        <div class="specialty-count">175 bác sĩ</div>
                    </a>
                </div>
                
                <!-- Dòng 2 -->
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <a href="#" class="specialty-card bg-purple">
                        <div class="specialty-icon">👂</div>
                        <div class="specialty-name">Tai mũi họng</div>
                        <div class="specialty-count">160 bác sĩ</div>
                    </a>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <a href="#" class="specialty-card bg-orange">
                        <div class="specialty-icon">🧠</div>
                        <div class="specialty-name">Thần kinh</div>
                        <div class="specialty-count">145 bác sĩ</div>
                    </a>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <a href="#" class="specialty-card bg-blue">
                        <div class="specialty-icon">🩺</div>
                        <div class="specialty-name">Nội tổng quát</div>
                        <div class="specialty-count">420 bác sĩ</div>
                    </a>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <a href="#" class="specialty-card bg-orange">
                        <div class="specialty-icon">🦴</div>
                        <div class="specialty-name">Cơ xương khớp</div>
                        <div class="specialty-count">130 bác sĩ</div>
                    </a>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <a href="#" class="specialty-card bg-green">
                        <div class="specialty-icon">🫁</div>
                        <div class="specialty-name">Tiêu hóa</div>
                        <div class="specialty-count">155 bác sĩ</div>
                    </a>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <a href="#" class="specialty-card bg-yellow">
                        <div class="specialty-icon">🔮</div>
                        <div class="specialty-name">Nội tiết</div>
                        <div class="specialty-count">110 bác sĩ</div>
                    </a>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <a href="#" class="specialty-card bg-purple">
                        <div class="specialty-icon">🧘</div>
                        <div class="specialty-name">Tâm thần</div>
                        <div class="specialty-count">95 bác sĩ</div>
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- PROCESS SECTION -->
    <section class="process-section">
        <div class="container">
            <div class="section-subtitle">Quy trình</div>
            <h2 class="section-title">Đặt lịch chỉ trong 3 phút</h2>
            <p class="mb-5 text-muted">Quy trình đơn giản, minh bạch — từ tìm bác sĩ đến nhận kết quả khám.</p>
            
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="process-card">
                        <div class="process-step">01</div>
                        <div class="process-icon">🔍</div>
                        <div class="process-title">Chọn chuyên khoa hoặc bác sĩ</div>
                        <div class="process-desc">Tìm kiếm theo triệu chứng, chuyên khoa hoặc tên bác sĩ. Xem hồ sơ, bằng cấp và đánh giá từ bệnh nhân.</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="process-card">
                        <div class="process-step" style="background-color: #e0f2fe; color: #0d6efd;">02</div>
                        <div class="process-icon">📅</div>
                        <div class="process-title">Chọn ngày & giờ phù hợp</div>
                        <div class="process-desc">Xem lịch trống theo thời gian thực. Chọn khung giờ phù hợp với lịch của bạn.</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="process-card">
                        <div class="process-step" style="background-color: #e0f2fe; color: #0d6efd;">03</div>
                        <div class="process-icon">✔️</div>
                        <div class="process-title">Xác nhận & thanh toán</div>
                        <div class="process-desc">Nhập thông tin cơ bản, xác nhận lịch hẹn. Thanh toán đặt cọc qua ví điện tử hoặc thẻ ngân hàng.</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="process-card">
                        <div class="process-step" style="background-color: #e0f2fe; color: #0d6efd;">04</div>
                        <div class="process-icon">📋</div>
                        <div class="process-title">Đến khám & nhận kết quả</div>
                        <div class="process-desc">Nhận nhắc nhở tự động. Sau khám, kết quả và đơn thuốc được lưu trong hồ sơ điện tử của bạn.</div>
                    </div>
                </div>
            </div>
        </div>
    </section>


</asp:Content>
