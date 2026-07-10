using System;
using System.Collections.Generic;

namespace CholibiClinic
{
    public partial class TinTuc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadNews();
            }
        }

        private void LoadNews()
        {
            var newsList = new List<object>
            {
                new { 
                    Title = "7 Dấu hiệu cảnh báo bệnh tiểu đường bạn không nên bỏ qua", 
                    Summary = "Tiểu đường là căn bệnh âm thầm nhưng nguy hiểm. Dưới đây là 7 dấu hiệu ban đầu giúp bạn phát hiện sớm và điều trị kịp thời...",
                    ImageUrl = "https://images.pexels.com/photos/7659639/pexels-photo-7659639.jpeg?auto=compress&cs=tinysrgb&w=600",
                    Category = "Cẩm nang",
                    BadgeClass = "badge-teal",
                    Date = "10/07/2026"
                },
                new { 
                    Title = "Cholibi Clinic nhận giải thưởng bệnh viện xuất sắc năm 2026", 
                    Summary = "Với nỗ lực không ngừng nghỉ trong việc nâng cao chất lượng dịch vụ, Cholibi Clinic vinh dự nhận giải thưởng danh giá từ Bộ Y tế.",
                    ImageUrl = "https://images.pexels.com/photos/7089012/pexels-photo-7089012.jpeg?auto=compress&cs=tinysrgb&w=600",
                    Category = "Sự kiện",
                    BadgeClass = "badge-blue",
                    Date = "08/07/2026"
                },
                new { 
                    Title = "Làm thế nào để bảo vệ mắt khi làm việc với máy tính liên tục?", 
                    Summary = "Màn hình điện thoại và máy tính phát ra ánh sáng xanh gây hại cho mắt. Hãy áp dụng quy tắc 20-20-20 để bảo vệ cửa sổ tâm hồn.",
                    ImageUrl = "https://images.pexels.com/photos/5751853/pexels-photo-5751853.jpeg?auto=compress&cs=tinysrgb&w=600",
                    Category = "Sức khoẻ",
                    BadgeClass = "badge-teal",
                    Date = "05/07/2026"
                },
                new { 
                    Title = "Hệ thống Cholibi ra mắt gói khám tổng quát giảm 30%", 
                    Summary = "Nhân dịp tri ân khách hàng, hệ thống phòng khám Cholibi ra mắt gói tầm soát ung thư và khám tổng quát với mức giá ưu đãi nhất.",
                    ImageUrl = "https://images.pexels.com/photos/5327891/pexels-photo-5327891.jpeg?auto=compress&cs=tinysrgb&w=600",
                    Category = "Khuyến mãi",
                    BadgeClass = "badge-blue",
                    Date = "01/07/2026"
                },
                new { 
                    Title = "Chế độ dinh dưỡng hoàn hảo cho người mắc bệnh tim mạch", 
                    Summary = "Chế độ ăn Địa Trung Hải đang được các chuyên gia tim mạch hàng đầu khuyên dùng. Khám phá thực đơn tốt cho tim.",
                    ImageUrl = "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=600",
                    Category = "Dinh dưỡng",
                    BadgeClass = "badge-teal",
                    Date = "28/06/2026"
                },
                new { 
                    Title = "Tại sao bạn luôn cảm thấy mệt mỏi dù đã ngủ đủ 8 tiếng?", 
                    Summary = "Rất nhiều người mắc phải hội chứng ngưng thở khi ngủ hoặc suy nhược mạn tính mà không hề hay biết. Chuyên gia giải đáp.",
                    ImageUrl = "https://images.pexels.com/photos/4134442/pexels-photo-4134442.jpeg?auto=compress&cs=tinysrgb&w=600",
                    Category = "Cẩm nang",
                    BadgeClass = "badge-teal",
                    Date = "25/06/2026"
                },
                new { 
                    Title = "Cảnh báo dịch sốt xuất huyết đang bùng phát ở trẻ nhỏ", 
                    Summary = "Sốt xuất huyết diễn biến bất thường, phụ huynh cần chú ý các nốt phát ban và tình trạng sốt cao không hạ ở trẻ em.",
                    ImageUrl = "https://images.pexels.com/photos/5800057/pexels-photo-5800057.jpeg?auto=compress&cs=tinysrgb&w=600",
                    Category = "Cảnh báo y tế",
                    BadgeClass = "badge-blue",
                    Date = "20/06/2026"
                },
                new { 
                    Title = "Những lầm tưởng tai hại khi sơ cứu bỏng nước sôi", 
                    Summary = "Bôi kem đánh răng hay nước mắm lên vết bỏng là sai lầm nghiêm trọng khiến vết thương nhiễm trùng. Hãy làm theo cách sau.",
                    ImageUrl = "https://images.pexels.com/photos/5855263/pexels-photo-5855263.jpeg?auto=compress&cs=tinysrgb&w=600",
                    Category = "Cẩm nang sơ cứu",
                    BadgeClass = "badge-teal",
                    Date = "15/06/2026"
                },
                new { 
                    Title = "Cholibi Clinic trang bị hệ thống MRI 3 Tesla hiện đại nhất", 
                    Summary = "Hệ thống chụp cắt lớp MRI mới giúp phát hiện khối u nhỏ cỡ vài mm mà không bị ảnh hưởng bởi bức xạ như X-Quang.",
                    ImageUrl = "https://images.pexels.com/photos/3845624/pexels-photo-3845624.jpeg?auto=compress&cs=tinysrgb&w=600",
                    Category = "Công nghệ y khoa",
                    BadgeClass = "badge-blue",
                    Date = "10/06/2026"
                },
                new { 
                    Title = "Bí quyết giúp dân văn phòng tránh đau mỏi vai gáy", 
                    Summary = "Ngồi sai tư thế trong thời gian dài là nguyên nhân chính. Tham khảo 5 bài tập kéo giãn đơn giản ngay tại bàn làm việc.",
                    ImageUrl = "https://images.pexels.com/photos/4488820/pexels-photo-4488820.jpeg?auto=compress&cs=tinysrgb&w=600",
                    Category = "Sức khoẻ",
                    BadgeClass = "badge-teal",
                    Date = "05/06/2026"
                },
                new { 
                    Title = "Trầm cảm sau sinh: Căn bệnh âm thầm tàn phá hạnh phúc gia đình", 
                    Summary = "Sự thay đổi hormone và áp lực chăm con khiến hàng triệu phụ nữ rơi vào trầm cảm. Gia đình cần quan tâm và chia sẻ.",
                    ImageUrl = "https://images.pexels.com/photos/7089626/pexels-photo-7089626.jpeg?auto=compress&cs=tinysrgb&w=600",
                    Category = "Tâm lý",
                    BadgeClass = "badge-teal",
                    Date = "01/06/2026"
                },
                new { 
                    Title = "Lịch làm việc của các giáo sư đầu ngành tại Cholibi tháng này", 
                    Summary = "Cập nhật danh sách ngày khám của các PGS, TS chuyên khoa Thần kinh và Tim mạch. Đặt lịch sớm kẻo hết chỗ.",
                    ImageUrl = "https://images.pexels.com/photos/5214958/pexels-photo-5214958.jpeg?auto=compress&cs=tinysrgb&w=600",
                    Category = "Tin tức",
                    BadgeClass = "badge-blue",
                    Date = "28/05/2026"
                }
            };

            rptNews.DataSource = newsList;
            rptNews.DataBind();
        }
    }
}
