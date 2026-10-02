using System;
using System.Configuration;
using System.Data.SqlClient;

namespace AranCommunitySupport.Pages
{
    public partial class SupportDetails : System.Web.UI.Page
    {
        private string connectionString =
            ConfigurationManager.ConnectionStrings["AranDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
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
            }
        }

        protected void btnConfirmSupport_Click(object sender, EventArgs e)
        {
            decimal amount;

            if (string.IsNullOrWhiteSpace(txtAmount.Text))
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "alert",
                    "alert('Please enter a support amount.');",
                    true);
                return;
            }

            if (!decimal.TryParse(txtAmount.Text, out amount))
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "alert",
                    "alert('Please enter a valid amount.');",
                    true);
                return;
            }

            if (amount <= 0)
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "alert",
                    "alert('Support amount must be greater than ₹0.');",
                    true);
                return;
            }

            Session["SupportAmount"] = amount;

            string supporterEmail = Session["UserEmail"].ToString();

            int requestID = 0;

            if (Session["SupportRequestID"] != null)
            {
                int.TryParse(
                    Session["SupportRequestID"].ToString(),
                    out requestID);
            }

            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    con.Open();

                    SqlTransaction transaction =
                        con.BeginTransaction();

                    try
                    {
                        // 1. Save support transaction
                        string insertQuery = @"
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
                            new SqlCommand(
                                insertQuery,
                                con,
                                transaction))
                        {
                            cmd.Parameters.AddWithValue(
                                "@RequestID",
                                requestID);

                            cmd.Parameters.AddWithValue(
                                "@SupporterEmail",
                                supporterEmail);

                            cmd.Parameters.AddWithValue(
                                "@SupportAmount",
                                amount);

                            cmd.ExecuteNonQuery();
                        }

                        // 2. Update emergency request status
                        string updateQuery = @"
                            UPDATE EmergencyRequests
                            SET Status = 'Supported'
                            WHERE RequestID = @RequestID";

                        using (SqlCommand cmd =
                            new SqlCommand(
                                updateQuery,
                                con,
                                transaction))
                        {
                            cmd.Parameters.AddWithValue(
                                "@RequestID",
                                requestID);

                            cmd.ExecuteNonQuery();
                        }

                        // 3. Save both changes permanently
                        transaction.Commit();

                        // 4. Go to confirmation page
                        Response.Redirect("SupportConfirmation.aspx");
                    }
                    catch
                    {
                        transaction.Rollback();
                        throw;
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "error",
                    "alert('Database Error: " +
                    ex.Message.Replace("'", "\\'") +
                    "');",
                    true);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("SupportRequests.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("SupportRequests.aspx");
        }
    }
}