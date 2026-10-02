using System;
using System.Configuration;
using System.Data.SqlClient;

namespace AranCommunitySupport.Pages
{
    public partial class EmergencyRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check whether the user is logged in
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            // Automatically show logged-in user's email
            if (!IsPostBack)
            {
                if (Session["UserEmail"] != null)
                {
                    txtEmail.Text = Session["UserEmail"].ToString();
                }
            }
        }


        // Emergency Submit Button Click
        protected void btnEmergency_Click(object sender, EventArgs e)
        {
            // Validation
            if (string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtPhone.Text) ||
                string.IsNullOrWhiteSpace(txtLocation.Text) ||
                ddlEmergencyType.SelectedValue == "" ||
                string.IsNullOrWhiteSpace(txtDescription.Text))
            {
                Response.Write(
                    "<script>alert('Please fill all required fields!');</script>"
                );

                return;
            }


            string connectionString =
                ConfigurationManager.ConnectionStrings["AranDB"].ConnectionString;


            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
                    INSERT INTO EmergencyRequests
                    (
                        Name,
                        Email,
                        Phone,
                        Location,
                        EmergencyType,
                        Description
                    )
                    VALUES
                    (
                        @Name,
                        @Email,
                        @Phone,
                        @Location,
                        @EmergencyType,
                        @Description
                    )";


                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue(
                        "@Name",
                        txtName.Text.Trim()
                    );

                    cmd.Parameters.AddWithValue(
                        "@Email",
                        txtEmail.Text.Trim()
                    );

                    cmd.Parameters.AddWithValue(
                        "@Phone",
                        txtPhone.Text.Trim()
                    );

                    cmd.Parameters.AddWithValue(
                        "@Location",
                        txtLocation.Text.Trim()
                    );

                    cmd.Parameters.AddWithValue(
                        "@EmergencyType",
                        ddlEmergencyType.SelectedValue
                    );

                    cmd.Parameters.AddWithValue(
                        "@Description",
                        txtDescription.Text.Trim()
                    );


                    con.Open();

                    cmd.ExecuteNonQuery();
                }
            }


            Response.Write(
                "<script>" +
                "alert('Emergency Request Submitted Successfully!');" +
                "window.location='Dashboard.aspx';" +
                "</script>"
            );
        }
    }
}