using System;
using System.Configuration;
using System.Data.SqlClient;

namespace AranCommunitySupport.Pages
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        private string connectionString =
            ConfigurationManager.ConnectionStrings["AranDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminEmail"] != null)
            {
                Response.Redirect("AdminDashboard.aspx");
                return;
            }
        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrWhiteSpace(email))
            {
                ShowMessage("Please enter admin email.");
                return;
            }

            if (string.IsNullOrWhiteSpace(password))
            {
                ShowMessage("Please enter admin password.");
                return;
            }

            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                        SELECT UserId, FullName, Email, Role
                        FROM Users
                        WHERE Email = @Email
                        AND Password = @Password
                        AND Role = 'Admin'";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password);

                        con.Open();

                        using (SqlDataReader reader =
                            cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                Session["AdminEmail"] =
                                    reader["Email"].ToString();

                                Session["AdminName"] =
                                    reader["FullName"].ToString();

                                Session["AdminRole"] =
                                    reader["Role"].ToString();

                                Response.Redirect("AdminDashboard.aspx");
                            }
                            else
                            {
                                ShowMessage(
                                    "Invalid admin email or password."
                                );
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage(
                    "Database Error: " + ex.Message
                );
            }
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
                true
            );
        }
    }
}