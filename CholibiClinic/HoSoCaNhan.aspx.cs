using System;
using System.Data;
using System.Web.UI;

namespace CholibiClinic
{
    public partial class HoSoCaNhan : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("~/DangNhap.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadUserProfile();
            }
        }

        private void LoadUserProfile()
        {
            int userId = Convert.ToInt32(Session["UserId"]);
            DataTable dt = DbHelper.GetUserById(userId);

            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                txtFullName.Text = row["FullName"]?.ToString();
                txtEmail.Text = row["Email"]?.ToString();
                txtPhone.Text = row["Phone"]?.ToString();
                txtAddress.Text = row["Address"]?.ToString();

                string gender = row["Gender"]?.ToString();
                if (ddlGender.Items.FindByValue(gender) != null)
                {
                    ddlGender.SelectedValue = gender;
                }

                if (row["BirthDate"] != DBNull.Value && row["BirthDate"] != null)
                {
                    DateTime birthDate = Convert.ToDateTime(row["BirthDate"]);
                    txtBirthDate.Text = birthDate.ToString("yyyy-MM-dd");
                }
            }
            else
            {
                lblError.Text = "Không tìm thấy thông tin người dùng!";
                pnlError.Visible = true;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            pnlError.Visible = false;
            pnlSuccess.Visible = false;

            int userId = Convert.ToInt32(Session["UserId"]);
            string fullName = txtFullName.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string email = txtEmail.Text.Trim();
            string gender = ddlGender.SelectedValue;
            string address = txtAddress.Text.Trim();
            string newPassword = txtNewPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            // Validate
            if (string.IsNullOrEmpty(fullName) || string.IsNullOrEmpty(phone) || string.IsNullOrEmpty(email))
            {
                lblError.Text = "Họ tên, Số điện thoại và Email không được để trống!";
                pnlError.Visible = true;
                return;
            }

            if (!string.IsNullOrEmpty(newPassword))
            {
                if (newPassword != confirmPassword)
                {
                    lblError.Text = "Xác nhận mật khẩu mới không khớp!";
                    pnlError.Visible = true;
                    return;
                }
                if (newPassword.Length < 6)
                {
                    lblError.Text = "Mật khẩu mới phải có ít nhất 6 ký tự!";
                    pnlError.Visible = true;
                    return;
                }
            }

            DateTime birthDate;
            if (!DateTime.TryParse(txtBirthDate.Text, out birthDate))
            {
                birthDate = DateTime.Today.AddYears(-20);
            }

            bool success = DbHelper.UpdateUserProfile(userId, fullName, email, phone, gender, birthDate, address, newPassword);

            if (success)
            {
                lblSuccess.Text = "Cập nhật hồ sơ thành công!";
                pnlSuccess.Visible = true;

                // Cập nhật lại Session
                Session["FullName"] = fullName;
                Session["Email"] = email;

                // Tải lại header
                var master = this.Master as SiteMaster;
                if (master != null)
                {
                    var lnkUserFullName = master.FindControl("lnkUserFullName") as System.Web.UI.WebControls.HyperLink;
                    if (lnkUserFullName != null)
                    {
                        lnkUserFullName.Text = fullName;
                    }
                }
            }
            else
            {
                lblError.Text = "Cập nhật thất bại. Email có thể đã tồn tại hoặc có lỗi xảy ra!";
                pnlError.Visible = true;
            }
        }
    }
}
