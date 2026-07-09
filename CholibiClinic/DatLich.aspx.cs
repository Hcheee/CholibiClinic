using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CholibiClinic
{
    public partial class DatLich : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                // Chưa đăng nhập thì bắt buộc chuyển về Đăng nhập và lưu URL quay lại
                Response.Redirect("~/DangNhap?ReturnUrl=DatLich.aspx");
                return;
            }

            if (!IsPostBack)
            {
                lblPatientName.Text = Session["FullName"]?.ToString() ?? "Khách hàng";
                
                // Mặc định ngày khám là ngày mai
                txtDate.Text = DateTime.Today.AddDays(1).ToString("yyyy-MM-dd");

                LoadSpecialties();
                LoadDoctors();
            }
        }

        private void LoadSpecialties()
        {
            DataTable dt = DbHelper.GetSpecialties();
            
            ddlSpecialty.Items.Clear();
            ddlSpecialty.Items.Add(new ListItem("--- Tất cả chuyên khoa ---", "0"));

            foreach (DataRow row in dt.Rows)
            {
                ddlSpecialty.Items.Add(new ListItem(row["SpecialtyName"].ToString(), row["SpecialtyId"].ToString()));
            }
        }

        private void LoadDoctors(int? specialtyId = null)
        {
            DataTable dt = DbHelper.GetDoctors(specialtyId);
            
            ddlDoctor.Items.Clear();
            if (dt.Rows.Count == 0)
            {
                ddlDoctor.Items.Add(new ListItem("Không có bác sĩ nào trống lịch", "0"));
                return;
            }

            ddlDoctor.Items.Add(new ListItem("--- Chọn bác sĩ ---", "0"));
            foreach (DataRow row in dt.Rows)
            {
                string text = $"{row["DoctorName"]} ({row["SpecialtyName"]})";
                ddlDoctor.Items.Add(new ListItem(text, row["DoctorId"].ToString()));
            }
        }

        protected void ddlSpecialty_SelectedIndexChanged(object sender, EventArgs e)
        {
            int specId = Convert.ToInt32(ddlSpecialty.SelectedValue);
            if (specId > 0)
            {
                LoadDoctors(specId);
            }
            else
            {
                LoadDoctors();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("~/DangNhap?ReturnUrl=DatLich.aspx");
                return;
            }

            int userId = Convert.ToInt32(Session["UserId"]);
            int doctorId = Convert.ToInt32(ddlDoctor.SelectedValue);
            string dateStr = txtDate.Text;
            string timeStr = ddlTime.SelectedValue;
            string notes = txtNotes.Text.Trim();

            if (doctorId <= 0)
            {
                lblError.Text = "Vui lòng chọn bác sĩ khám hợp lệ!";
                pnlError.Visible = true;
                return;
            }

            DateTime appDate;
            if (!DateTime.TryParse(dateStr, out appDate))
            {
                lblError.Text = "Vui lòng chọn ngày khám hợp lệ!";
                pnlError.Visible = true;
                return;
            }

            if (appDate.Date < DateTime.Today)
            {
                lblError.Text = "Ngày khám không được chọn trong quá khứ!";
                pnlError.Visible = true;
                return;
            }

            TimeSpan appTime;
            if (!TimeSpan.TryParse(timeStr, out appTime))
            {
                appTime = new TimeSpan(8, 0, 0);
            }

            bool success = DbHelper.AddAppointment(userId, doctorId, appDate, appTime, notes);

            if (success)
            {
                pnlError.Visible = false;
                // Chuyển hướng sang trang lịch khám
                Response.Redirect("~/LichKham.aspx");
            }
            else
            {
                lblError.Text = "Có lỗi xảy ra trong quá trình lưu lịch hẹn. Vui lòng kiểm tra lại thông tin!";
                pnlError.Visible = true;
            }
        }
    }
}
