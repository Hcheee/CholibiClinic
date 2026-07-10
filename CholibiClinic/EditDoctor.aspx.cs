using System;
using System.Data;

namespace CholibiClinic
{
    public partial class EditDoctor : System.Web.UI.Page
    {
        int doctorId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null ||
                Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/");
                return;
            }

            doctorId = Convert.ToInt32(Request.QueryString["id"]);

            if (!IsPostBack)
            {
                LoadSpecialty();
                LoadDoctor();
            }
        }

        void LoadSpecialty()
        {
            DataTable dt = DbHelper.GetSpecialties();

            ddlSpecialty.DataSource = dt;
            ddlSpecialty.DataTextField = "SpecialtyName";
            ddlSpecialty.DataValueField = "SpecialtyId";
            ddlSpecialty.DataBind();
        }

        void LoadDoctor()
        {
            DataTable dt = DbHelper.GetDoctorById(doctorId);

            if (dt.Rows.Count == 0)
                return;

            txtDoctorName.Text = dt.Rows[0]["DoctorName"].ToString();
            txtPhone.Text = dt.Rows[0]["Phone"].ToString();
            txtEmail.Text = dt.Rows[0]["Email"].ToString();

            ddlSpecialty.SelectedValue =
                dt.Rows[0]["SpecialtyId"].ToString();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            bool ok = DbHelper.UpdateDoctor(
                doctorId,
                txtDoctorName.Text,
                txtPhone.Text,
                txtEmail.Text,
                Convert.ToInt32(ddlSpecialty.SelectedValue));

            if (ok)
            {
                Response.Redirect("BacSi.aspx");
            }
        }
    }
}