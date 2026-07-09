using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CholibiClinic
{
    public partial class BacSi : System.Web.UI.Page
    {
        // Hiển thị tối đa bao nhiêu người 1 lần
        private int pageSize = 20;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Lần đầu vào trang, gán số lượng cần lấy là 20
                ViewState["CurrentLimit"] = pageSize;
                LoadDoctors();
            }
        }

        private void LoadDoctors()
        {
            int limit = (int)ViewState["CurrentLimit"];
            string connString = ConfigurationManager.ConnectionStrings["ClinicDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                // 1. Đếm tổng số bác sĩ để hiển thị và ẩn nút Xem thêm
                string countQuery = "SELECT COUNT(*) FROM Doctors";
                using (SqlCommand cmdCount = new SqlCommand(countQuery, conn))
                {
                    conn.Open();
                    int totalDoctors = (int)cmdCount.ExecuteScalar();
                    lblCount.Text = $"{totalDoctors} bác sĩ trong hệ thống";
                    
                    // Ẩn nút nếu đã lấy hết
                    if (limit >= totalDoctors)
                    {
                        btnLoadMore.Visible = false;
                    }
                    else
                    {
                        btnLoadMore.Visible = true;
                    }
                }

                // 2. Lấy danh sách bác sĩ (kết nối 2 bảng Doctors và Specialties)
                string query = @"
                    SELECT TOP (@Limit) d.DoctorId, d.DoctorName, s.SpecialtyName, d.SpecialtyId
                    FROM Doctors d
                    LEFT JOIN Specialties s ON d.SpecialtyId = s.SpecialtyId
                    ORDER BY d.DoctorId ASC";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Limit", limit);
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        
                        // Đổ dữ liệu vào Repeater trên giao diện
                        rptDoctors.DataSource = dt;
                        rptDoctors.DataBind();
                    }
                }
            }
        }

        // Xử lý sự kiện khi bấm nút "Tải thêm 20 bác sĩ"
        protected void btnLoadMore_Click(object sender, EventArgs e)
        {
            // Tăng số lượng giới hạn lên thêm 20
            int currentLimit = (int)ViewState["CurrentLimit"];
            ViewState["CurrentLimit"] = currentLimit + pageSize;
            
            // Load lại danh sách với giới hạn mới
            LoadDoctors();
        }

        // Các hàm hỗ trợ giao diện (tuỳ biến Badge theo Id)
        protected string GetBadgeText(object specialtyIdObj)
        {
            if (specialtyIdObj == null || specialtyIdObj == DBNull.Value) return "Nổi bật";
            int id = Convert.ToInt32(specialtyIdObj);
            return (id % 2 == 0) ? "Nổi bật" : "Còn lịch hôm nay";
        }

        protected string GetBadgeClass(object specialtyIdObj)
        {
            if (specialtyIdObj == null || specialtyIdObj == DBNull.Value) return "badge-blue";
            int id = Convert.ToInt32(specialtyIdObj);
            return (id % 2 == 0) ? "badge-blue" : "badge-teal";
        }
    }
}
