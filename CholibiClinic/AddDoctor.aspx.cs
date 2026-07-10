using System;
using System.Data;
using System.Web.UI;

namespace CholibiClinic
{
    public partial class AddDoctor : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null ||
                Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/");
                return;
            }

            if (!IsPostBack)
            {
                LoadSpecialties();
            }
        }

        private void LoadSpecialties()
        {
            ddlSpecialty.DataSource = DbHelper.GetSpecialties();

            ddlSpecialty.DataTextField = "SpecialtyName";

            ddlSpecialty.DataValueField = "SpecialtyId";

            ddlSpecialty.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            bool ok = DbHelper.AddDoctor(
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