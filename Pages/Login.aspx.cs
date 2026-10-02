using System;
using System.Configuration;
using System.Data.SqlClient;

namespace AranCommunitySupport.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Check empty fields
            if (email == "" || password == "")
            {
                ShowMessage("Please enter your email and password!");
                return;
            }

            // Get connection string from Web.config
            string connectionString =
                ConfigurationManager.ConnectionStrings["AranDB"].ConnectionString;

            using (SqlConnection con =
                new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT UserId, FullName, Email, Role
                    FROM Users
                    WHERE Email = @Email
                    AND Password = @Password";

                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);

                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string role = reader["Role"].ToString();

                            // =========================
                            // ADMIN LOGIN
                            // =========================
                            if (role.Equals(
                                "Admin",
                                StringComparison.OrdinalIgnoreCase))
                            {
                                Session["AdminEmail"] =
                                    reader["Email"].ToString();

                                Session["AdminName"] =
                                    reader["FullName"].ToString();

                                Session["AdminRole"] =
                                    reader["Role"].ToString();

                                Response.Redirect(
                                    "AdminDashboard.aspx");
                            }
                            else
                            {
                                // =========================
                                // NORMAL USER LOGIN
                                // =========================
                                Session["UserEmail"] =
                                    reader["Email"].ToString();

                                Session["UserName"] =
                                    reader["FullName"].ToString();

                                Session["UserRole"] =
                                    reader["Role"].ToString();

                                Response.Redirect(
                                    "Dashboard.aspx");
                            }
                        }
                        else
                        {
                            ShowMessage(
                                "Invalid Email or Password!");
                        }
                    }
                }
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
                "loginMessage",
                "alert('" + safeMessage + "');",
                true);
        }
    }
}