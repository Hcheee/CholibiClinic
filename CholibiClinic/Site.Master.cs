using System;
using System.Web.UI;

namespace CholibiClinic
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserId"] != null)
                {
                    plhAnonymous.Visible = false;
                    plhLoggedIn.Visible = true;

                    lblUserFullName.Text = Session["FullName"]?.ToString() ?? "";

                    string role = Session["Role"]?.ToString() ?? "";

                    // Chỉ bệnh nhân mới thấy menu Đặt lịch
                    phPatientMenu.Visible = (role == "Patient");
                }
                else
                {
                    plhAnonymous.Visible = true;
                    plhLoggedIn.Visible = false;

                    phPatientMenu.Visible = false;
                }
            }
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/");
        }
    }
}