<%@ Page Title="Tin tức Y tế" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TinTuc.aspx.cs" Inherits="CholibiClinic.TinTuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="doc-page-header">
        <div class="container">
            <div class="doc-breadcrumb">
                <a href="~/" runat="server">← Về trang chủ</a><br><br>
                <span style="color: #0d6efd; font-weight: bold;">TIN TỨC & CẨM NANG</span>
            </div>
            
            <h1 class="doc-page-title">Kiến thức Y khoa</h1>
            
            <div class="doc-page-count">
                <asp:Label ID="lblCount" runat="server" Text="12 bài viết mới nhất"></asp:Label>
            </div>

            <div class="row g-4">
                <asp:Repeater ID="rptNews" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="doc-card" style="display: flex; flex-direction: column; height: 100%;">
                                <div class="doc-img-wrap" style="height: 220px;">
                                    <span class='doc-badge <%# Eval("BadgeClass") %>'>
                                        <%# Eval("Category") %>
                                    </span>
                                    <img src='<%# Eval("ImageUrl") %>' alt="Tin tức" style="object-fit: cover; width: 100%; height: 100%;">
                                </div>
                                <div class="doc-info" style="flex: 1; display: flex; flex-direction: column;">
                                    <div class="doc-name" style="font-size: 1.1rem; line-height: 1.4; margin-bottom: 10px;"><%# Eval("Title") %></div>
                                    <div class="doc-desc" style="flex: 1;"><%# Eval("Summary") %></div>
                                    
                                    <div class="doc-footer-info" style="margin-top: 15px; border-top: 1px solid #eee; padding-top: 15px;">
                                        <div class="doc-footer-col">
                                            <div class="doc-footer-label">Ngày đăng</div>
                                            <div class="doc-footer-value" style="color: #666; font-size: 0.9rem;"><%# Eval("Date") %></div>
                                        </div>
                                        <div class="doc-footer-col text-end">
                                            <a href="#" 
                                               style="color: #0d6efd; font-weight: 500; text-decoration: none;"
                                               data-bs-toggle="modal" 
                                               data-bs-target="#newsModal"
                                               onclick='openNewsModal("<%# Eval("Title") %>", "<%# Eval("Summary") %>", "<%# Eval("ImageUrl") %>", "<%# Eval("Date") %>", "<%# Eval("Category") %>")'>Đọc tiếp →</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>

    <!-- Modal Tin Tức -->
    <div class="modal fade" id="newsModal" tabindex="-1" aria-labelledby="newsModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content" style="border-radius: 15px; border: none; box-shadow: 0 10px 30px rgba(0,0,0,0.2);">
                <div class="modal-header" style="border-bottom: 1px solid #eee;">
                    <span id="modalCategory" class="badge" style="background: #0d6efd; color: white; margin-right: 15px;"></span>
                    <h5 class="modal-title fw-bold" id="newsModalLabel" style="color: #0056b3;">Chi tiết tin tức</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-0">
                    <img id="modalImage" src="" alt="News Image" style="width: 100%; height: 350px; object-fit: cover;">
                    <div class="p-4">
                        <h3 id="modalTitle" class="fw-bold mb-3" style="color: #333;"></h3>
                        <p id="modalDate" class="text-muted mb-4" style="font-size: 0.9rem;"></p>
                        <div id="modalContent" style="font-size: 1.1rem; line-height: 1.8; color: #444;">
                            <!-- Nội dung đầy đủ sẽ được load vào đây -->
                        </div>
                    </div>
                </div>
                <div class="modal-footer" style="border-top: none;">
                    <button type="button" class="btn btn-secondary" style="border-radius: 8px;" data-bs-dismiss="modal">Đóng lại</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function openNewsModal(title, summary, imgUrl, date, category) {
            document.getElementById('modalTitle').innerText = title;
            document.getElementById('modalImage').src = imgUrl;
            document.getElementById('modalDate').innerText = "Ngày đăng: " + date;
            document.getElementById('modalCategory').innerText = category;
            
            // Giả lập nội dung chi tiết bằng cách thêm text vào summary
            let fullContent = `<p><strong>${summary}</strong></p>
                               <p>Tại Cholibi Clinic, chúng tôi không ngừng cải thiện các dịch vụ y tế nhằm mang lại trải nghiệm tốt nhất cho bệnh nhân. Kiến thức y khoa luôn được cập nhật thường xuyên từ các chuyên gia hàng đầu.</p>
                               <p>Để biết thêm thông tin chi tiết hoặc đặt lịch tư vấn trực tiếp với bác sĩ chuyên khoa, quý khách vui lòng liên hệ Hotline hoặc đặt lịch qua hệ thống trực tuyến của chúng tôi.</p>
                               <p style="text-align: right; font-style: italic;">Ban biên tập Cholibi Clinic</p>`;
            document.getElementById('modalContent').innerHTML = fullContent;
        }
    </script>
</asp:Content>
