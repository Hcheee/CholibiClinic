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
            if (Session["UserId"] == null)
            {
                // Chưa đăng nhập thì chuyển sang đăng nhập
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
            int userId = Convert.ToInt32(Session["UserId"]);
            DataTable dt = DbHelper.GetAppointments(userId);

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
            if (e.CommandName == "CancelAppointment")
            {
                int apptId = Convert.ToInt32(e.CommandArgument);
                bool success = DbHelper.CancelAppointment(apptId);
                
                if (success)
                {
                    // Reload
                    LoadAppointments();
                }
                else
                {
                    // Hiển thị lỗi nếu cần (có thể dùng ScriptManager để alert)
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Không thể hủy lịch khám này. Vui lòng liên hệ hỗ trợ!');", true);
                }
            }
        }

        // Định dạng màu viền cho thẻ lịch hẹn theo trạng thái
        protected string GetStatusClass(object statusObj)
        {
            if (statusObj == null) return "border-pending";
            string status = statusObj.ToString();
            switch (status)
            {
                case "Chờ khám": return "border-pending";
                case "Đã khám": return "border-completed";
                case "Đã hủy": return "border-cancelled";
                default: return "border-pending";
            }
        }

        // Định dạng class cho badge trạng thái
        protected string GetBadgeStatusClass(object statusObj)
        {
            if (statusObj == null) return "status-pending";
            string status = statusObj.ToString();
            switch (status)
            {
                case "Chờ khám": return "status-pending";
                case "Đã khám": return "status-completed";
                case "Đã hủy": return "status-cancelled";
                default: return "status-pending";
            }
        }

        // Định dạng hiển thị giờ (TimeSpan)
        protected string FormatTime(object timeObj)
        {
            if (timeObj == null) return "08:00";
            if (timeObj is TimeSpan)
            {
                TimeSpan ts = (TimeSpan)timeObj;
                return ts.ToString(@"hh\:mm");
            }
            return timeObj.ToString();
        }
    }
}
