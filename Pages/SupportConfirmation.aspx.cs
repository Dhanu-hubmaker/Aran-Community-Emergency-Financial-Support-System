using System;
using System.Configuration;
using System.Data.SqlClient;

namespace AranCommunitySupport.Pages
{
    public partial class SupportConfirmation : System.Web.UI.Page
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
                // Show selected request
                if (Session["SupportRequest"] != null)
                {
                    lblSupportRequest.Text =
                        Session["SupportRequest"].ToString();
                }
                else
                {
                    lblSupportRequest.Text =
                        "No support request selected.";
                }

                // Show support amount
                if (Session["SupportAmount"] != null)
                {
                    decimal amount;

                    if (decimal.TryParse(
                        Session["SupportAmount"].ToString(),
                        out amount))
                    {
                        lblSupportAmount.Text =
                            "₹" + amount.ToString("N2");
                    }
                    else
                    {
                        lblSupportAmount.Text = "₹0.00";
                    }
                }
                else
                {
                    lblSupportAmount.Text = "₹0.00";
                }
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                // Get supporter email
                string supporterEmail =
                    Session["UserEmail"].ToString();

                // Get support amount
                decimal amount = 0;

                if (Session["SupportAmount"] != null)
                {
                    decimal.TryParse(
                        Session["SupportAmount"].ToString(),
                        out amount);
                }

                // Get request ID
                int requestID = 0;

                if (Session["SupportRequestID"] != null)
                {
                    int.TryParse(
                        Session["SupportRequestID"].ToString(),
                        out requestID);
                }

                // Insert support transaction
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                        INSERT INTO SupportTransactions
                        (
                            RequestID,
                            SupporterEmail,
                            SupportAmount
                        )
                        VALUES
                        (
                            @RequestID,
                            @SupporterEmail,
                            @SupportAmount
                        )";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@RequestID", requestID);

                        cmd.Parameters.AddWithValue(
                            "@SupporterEmail", supporterEmail);

                        cmd.Parameters.AddWithValue(
                            "@SupportAmount", amount);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                // Success message
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "success",
                    "alert('❤️ Support confirmed successfully!');",
                    true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "error",
                    "alert('Error: " +
                    ex.Message.Replace("'", "\\'") +
                    "');",
                    true);
            }
        }
    }
}