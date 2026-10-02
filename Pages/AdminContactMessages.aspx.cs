using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace AranCommunitySupport.Pages
{
    public partial class AdminContactMessages : System.Web.UI.Page
    {
        private string connectionString =
            ConfigurationManager.ConnectionStrings["AranDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Admin login check
            if (Session["AdminEmail"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadMessages();
            }
        }

        private void LoadMessages()
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                        SELECT
                            MessageID,
                            Name,
                            Email,
                            Subject,
                            Message,
                            MessageDate
                        FROM ContactMessages
                        ORDER BY MessageDate DESC";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    using (SqlDataAdapter da =
                        new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();

                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            rptMessages.DataSource = dt;
                            rptMessages.DataBind();

                            pnlEmpty.Visible = false;
                        }
                        else
                        {
                            rptMessages.DataSource = null;
                            rptMessages.DataBind();

                            pnlEmpty.Visible = true;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage(
                    "Database Error: " +
                    ex.Message);
            }
        }

        protected void btnBack_Click(
            object sender,
            EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx");
        }

        private void ShowMessage(string message)
        {
            string safeMessage = message
                .Replace("\\", "\\\\")
                .Replace("'", "\\'")
                .Replace("\r", "")
                .Replace("\n", " ");

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "adminMessage",
                "alert('" + safeMessage + "');",
                true);
        }
    }
}
