using System;
using System.Configuration;
using System.Data.SqlClient;

namespace AranCommunitySupport.Pages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Check empty fields
            if (txtName.Text == "" ||
                txtPhone.Text == "" ||
                txtEmail.Text == "" ||
                ddlRole.SelectedValue == "" ||
                txtPassword.Text == "" ||
                txtConfirmPassword.Text == "")
            {
                Response.Write("<script>alert('Please fill all fields!');</script>");
                return;
            }

            // Check password
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                Response.Write("<script>alert('Passwords do not match!');</script>");
                return;
            }

            // Check terms
            if (!chkTerms.Checked)
            {
                Response.Write("<script>alert('Please accept Terms and Privacy Policy!');</script>");
                return;
            }

            string connectionString =
                ConfigurationManager.ConnectionStrings["AranDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"INSERT INTO Users
                                (FullName, Phone, Email, Role, Password)
                                VALUES
                                (@FullName, @Phone, @Email, @Role, @Password)";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@FullName", txtName.Text);
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Role", ddlRole.SelectedValue);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                con.Open();

                cmd.ExecuteNonQuery();

                Response.Write(
                    "<script>alert('Registration Successful! Welcome to ARAN ❤️');" +
                    "window.location='Login.aspx';</script>"
                );
            }
        }
    }
}