using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                    lblUserFullName.Text = Session["FullName"]?.ToString() ?? "Bệnh nhân";
                }
                else
                {
                    plhAnonymous.Visible = true;
                    plhLoggedIn.Visible = false;
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