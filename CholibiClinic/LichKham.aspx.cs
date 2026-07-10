using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CholibiClinic
{
    public partial class LichKham : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Chưa đăng nhập
            if (Session["UserId"] == null)
            {
                Response.Redirect("~/DangNhap?ReturnUrl=LichKham.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadAppointments();
            }
        }

        private void LoadAppointments()
        {
            string role = Session["Role"]?.ToString() ?? "";
            DataTable dt = null;

            if (role == "Admin")
            {
                // Admin xem tất cả lịch khám
                dt = DbHelper.GetAllAppointments();
            }
            else if (role == "Doctor")
            {
                // Doctor chỉ xem lịch của mình
                string email = Session["Email"]?.ToString();

                int doctorId = DbHelper.GetDoctorIdByEmail(email);

                dt = DbHelper.GetAppointmentsByDoctor(doctorId);
            }
            else if (role == "Patient")
            {
                // Patient chỉ xem lịch của mình
                int userId = Convert.ToInt32(Session["UserId"]);

                dt = DbHelper.GetAppointments(userId);
            }
            else
            {
                Response.Redirect("~/");
                return;
            }

            if (dt == null || dt.Rows.Count == 0)
            {
                pnlNoAppointments.Visible = true;
                rptAppointments.Visible = false;
            }
            else
            {
                pnlNoAppointments.Visible = false;
                rptAppointments.Visible = true;
                rptAppointments.DataSource = dt;
                rptAppointments.DataBind();
            }
        }

        protected void rptAppointments_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName != "CancelAppointment")
                return;

            string role = Session["Role"]?.ToString() ?? "";

            // Doctor không được hủy lịch
            if (role == "Doctor")
            {
                ScriptManager.RegisterStartupScript(
                    this,
                    GetType(),
                    "alert",
                    "alert('Bác sĩ không có quyền hủy lịch khám.');",
                    true);

                return;
            }

            int apptId = Convert.ToInt32(e.CommandArgument);

            bool success = DbHelper.CancelAppointment(apptId);

            if (success)
            {
                LoadAppointments();
            }
            else
            {
                ScriptManager.RegisterStartupScript(
                    this,
                    GetType(),
                    "alert",
                    "alert('Không thể hủy lịch khám. Vui lòng thử lại!');",
                    true);
            }
        }

        // Màu viền theo trạng thái
        protected string GetStatusClass(object statusObj)
        {
            if (statusObj == null) return "border-pending";

            switch (statusObj.ToString())
            {
                case "Chờ khám":
                    return "border-pending";

                case "Đã khám":
                    return "border-completed";

                case "Đã hủy":
                    return "border-cancelled";

                default:
                    return "border-pending";
            }
        }

        // Badge trạng thái
        protected string GetBadgeStatusClass(object statusObj)
        {
            if (statusObj == null) return "status-pending";

            switch (statusObj.ToString())
            {
                case "Chờ khám":
                    return "status-pending";

                case "Đã khám":
                    return "status-completed";

                case "Đã hủy":
                    return "status-cancelled";

                default:
                    return "status-pending";
            }
        }

        // Định dạng giờ
        protected string FormatTime(object timeObj)
        {
            if (timeObj == null)
                return "08:00";

            if (timeObj is TimeSpan)
            {
                TimeSpan ts = (TimeSpan)timeObj;
                return ts.ToString(@"hh\:mm");
            }

            return timeObj.ToString();
        }
    }
}