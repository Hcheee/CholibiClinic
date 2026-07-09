using System;
using System.Web.UI;

namespace CholibiClinic
{
    public partial class DangKy : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserId"] != null)
                {
                    Response.Redirect("~/");
                }
                
                // Mặc định ngày sinh là ngày hiện tại trừ đi 20 năm
                txtBirthDate.Text = DateTime.Today.AddYears(-20).ToString("yyyy-MM-dd");
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string email = txtEmail.Text.Trim();
            string gender = ddlGender.SelectedValue;
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;
            string address = txtAddress.Text.Trim();

            // Validate
            if (string.IsNullOrEmpty(fullName) || string.IsNullOrEmpty(phone) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblError.Text = "Các trường có dấu (*) không được để trống!";
                pnlError.Visible = true;
                return;
            }

            if (password != confirmPassword)
            {
                lblError.Text = "Mật khẩu xác nhận không khớp!";
                pnlError.Visible = true;
                return;
            }

            DateTime birthDate;
            if (!DateTime.TryParse(txtBirthDate.Text, out birthDate))
            {
                birthDate = DateTime.Today.AddYears(-20);
            }

            bool success = DbHelper.RegisterUser(fullName, email, password, phone, gender, birthDate, address);

            if (success)
            {
                pnlError.Visible = false;
                lblSuccess.Text = "Đăng ký thành công! Đang tự động chuyển hướng sang trang đăng nhập...";
                pnlSuccess.Visible = true;

                // Tự động đăng nhập
                var dtUser = DbHelper.LoginUser(email, password);
                if (dtUser != null && dtUser.Rows.Count > 0)
                {
                    Session["UserId"] = dtUser.Rows[0]["UserId"];
                    Session["FullName"] = dtUser.Rows[0]["FullName"];
                    Session["Email"] = dtUser.Rows[0]["Email"];
                    Session["Role"] = dtUser.Rows[0]["Role"];
                }

                // Redirect sau 2 giây
                Response.AddHeader("REFRESH", "2;URL=DatLich.aspx");
            }
            else
            {
                lblError.Text = "Đăng ký thất bại. Email này đã được đăng ký hoặc có lỗi xảy ra!";
                pnlError.Visible = true;
            }
        }
    }
}
