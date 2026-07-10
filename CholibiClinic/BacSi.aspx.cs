using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CholibiClinic
{
    public partial class BacSi : System.Web.UI.Page
    {
        private int pageSize = 20;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Chưa đăng nhập
            if (Session["UserId"] == null)
            {
                Response.Redirect("~/DangNhap.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // Chỉ Admin mới nhìn thấy nút Thêm bác sĩ
                btnAddDoctor.Visible = Session["Role"] != null &&
                                       Session["Role"].ToString() == "Admin";

                LoadDoctors();
            }
        }

        private void LoadDoctors()
        {
            if (ViewState["CurrentLimit"] == null)
                ViewState["CurrentLimit"] = pageSize;

            int limit = (int)ViewState["CurrentLimit"];

            string connString = ConfigurationManager.ConnectionStrings["ClinicDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                // Đếm tổng số bác sĩ
                string countQuery = "SELECT COUNT(*) FROM Doctors";

                using (SqlCommand cmdCount = new SqlCommand(countQuery, conn))
                {
                    int totalDoctors = (int)cmdCount.ExecuteScalar();

                    lblCount.Text = totalDoctors + " bác sĩ trong hệ thống";

                    btnLoadMore.Visible = limit < totalDoctors;
                }

                string query = @"
SELECT TOP (@Limit)
       d.DoctorId,
       d.DoctorName,
       d.SpecialtyId,
       s.SpecialtyName
FROM Doctors d
INNER JOIN Specialties s
    ON d.SpecialtyId = s.SpecialtyId
ORDER BY d.DoctorId";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Limit", limit);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    DataTable dt = new DataTable();

                    da.Fill(dt);

                    rptDoctors.DataSource = dt;

                    rptDoctors.DataBind();
                }
            }
        }

        protected void btnLoadMore_Click(object sender, EventArgs e)
        {
            if (ViewState["CurrentLimit"] == null)
                ViewState["CurrentLimit"] = pageSize;

            ViewState["CurrentLimit"] =
                (int)ViewState["CurrentLimit"] + pageSize;

            LoadDoctors();
        }

        protected void btnAddDoctor_Click(object sender, EventArgs e)
        {
            if (Session["Role"] == null ||
                Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/");
                return;
            }

            Response.Redirect("~/AddDoctor.aspx");
        }

        protected void rptDoctors_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (Session["Role"] == null ||
                Session["Role"].ToString() != "Admin")
                return;

            int doctorId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditDoctor")
            {
                Response.Redirect("~/EditDoctor.aspx?id=" + doctorId);
            }
            if (e.CommandName == "DeleteDoctor")
            {
                bool result = DbHelper.DeleteDoctor(doctorId);

                if (result)
                {
                    lblMessage.Visible = true;
                    lblMessage.CssClass = "alert alert-success";
                    lblMessage.Text = "Xóa bác sĩ thành công.";
                }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.CssClass = "alert alert-danger";
                    lblMessage.Text = "Không thể xóa bác sĩ vì bác sĩ đang có lịch khám.";
                }

                LoadDoctors();
            }
        }

        protected string GetBadgeText(object specialtyIdObj)
        {
            if (specialtyIdObj == null || specialtyIdObj == DBNull.Value)
                return "Nổi bật";

            int id = Convert.ToInt32(specialtyIdObj);

            return id % 2 == 0
                ? "Nổi bật"
                : "Còn lịch hôm nay";
        }

        protected string GetBadgeClass(object specialtyIdObj)
        {
            if (specialtyIdObj == null || specialtyIdObj == DBNull.Value) return "badge-blue";
            int id = Convert.ToInt32(specialtyIdObj);
            return (id % 2 == 0) ? "badge-blue" : "badge-teal";
        }

        protected string GetDoctorImage(object doctorIdObj)
        {
            string[] doctorImages = new string[]
            {
                "https://images.pexels.com/photos/5327656/pexels-photo-5327656.jpeg?auto=compress&cs=tinysrgb&w=300",
                "https://images.pexels.com/photos/5215024/pexels-photo-5215024.jpeg?auto=compress&cs=tinysrgb&w=300",
                "https://images.pexels.com/photos/5452293/pexels-photo-5452293.jpeg?auto=compress&cs=tinysrgb&w=300",
                "https://images.pexels.com/photos/4173251/pexels-photo-4173251.jpeg?auto=compress&cs=tinysrgb&w=300",
                "https://images.pexels.com/photos/5327585/pexels-photo-5327585.jpeg?auto=compress&cs=tinysrgb&w=300",
                "https://images.pexels.com/photos/5215024/pexels-photo-5215024.jpeg?auto=compress&cs=tinysrgb&w=300"
            };
            if (doctorIdObj == null || doctorIdObj == DBNull.Value) return doctorImages[0];
            int id = Convert.ToInt32(doctorIdObj);
            return doctorImages[id % doctorImages.Length];
        }
    }
}