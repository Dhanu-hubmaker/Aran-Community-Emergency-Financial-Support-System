using System;
using System.Configuration;
using System.Data.SqlClient;

namespace AranCommunitySupport.Pages
{
    public partial class Contact : System.Web.UI.Page
    {
        private string connectionString =
            ConfigurationManager.ConnectionStrings["AranDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Login check
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // Automatically fill logged-in user's email
                txtEmail.Text = Session["UserEmail"].ToString();
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            // Validation
            if (string.IsNullOrWhiteSpace(txtName.Text))
            {
                ShowMessage("Please enter your name.");
                return;
            }

            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                ShowMessage("Please enter your email address.");
                return;
            }

            if (string.IsNullOrWhiteSpace(txtSubject.Text))
            {
                ShowMessage("Please enter the subject.");
                return;
            }

            if (string.IsNullOrWhiteSpace(txtMessage.Text))
            {
                ShowMessage("Please enter your message.");
                return;
            }

            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                        INSERT INTO ContactMessages
                        (
                            Name,
                            Email,
                            Subject,
                            Message
                        )
                        VALUES
                        (
                            @Name,
                            @Email,
                            @Subject,
                            @Message
                        )";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@Name",
                            txtName.Text.Trim());

                        cmd.Parameters.AddWithValue(
                            "@Email",
                            txtEmail.Text.Trim());

                        cmd.Parameters.AddWithValue(
                            "@Subject",
                            txtSubject.Text.Trim());

                        cmd.Parameters.AddWithValue(
                            "@Message",
                            txtMessage.Text.Trim());

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                // Success message
                ShowMessage(
                    "Thank you for contacting ARAN! ❤️ " +
                    "Your message has been saved successfully."
                );

                // Clear form
                txtName.Text = "";
                txtSubject.Text = "";
                txtMessage.Text = "";

                // Keep logged-in email
                txtEmail.Text =
                    Session["UserEmail"].ToString();
            }
            catch (Exception ex)
            {
                ShowMessage(
                    "Database Error: " +
                    ex.Message
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
                "contactMessage",
                "alert('" + safeMessage + "');",
                true
            );
        }
    }
}