using System;
using System.Data;
using System.Web;
using System.Web.UI;

namespace CholibiClinic
{
    public partial class DangNhap : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Nếu đã đăng nhập rồi thì chuyển về trang chủ
                if (Session["UserId"] != null)
                {
                    Response.Redirect("~/");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblError.Text = "Vui lòng nhập đầy đủ Email và Mật khẩu!";
                pnlError.Visible = true;
                return;
            }

            DataTable dtUser = DbHelper.LoginUser(email, password);
            if (dtUser != null && dtUser.Rows.Count > 0)
            {
                DataRow userRow = dtUser.Rows[0];
                
                // Lưu session đăng nhập
                Session["UserId"] = userRow["UserId"];
                Session["FullName"] = userRow["FullName"];
                Session["Email"] = userRow["Email"];
                Session["Role"] = userRow["Role"];

                // Nếu có tham số quay lại trang đặt lịch (ReturnUrl)
                if (Request.QueryString["ReturnUrl"] != null)
                {
                    Response.Redirect(Request.QueryString["ReturnUrl"]);
                }
                else
                {
                    Response.Redirect("~/");
                }
            }
            else
            {
                lblError.Text = "Email hoặc mật khẩu không chính xác. Vui lòng thử lại!";
                pnlError.Visible = true;
            }
        }
    }
}
