using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace AranCommunitySupport.Pages
{
    public partial class AdminSupportTransactions : System.Web.UI.Page
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
                LoadSummary();
                LoadTransactions();
            }
        }

        private void LoadSummary()
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    con.Open();

                    // Total transactions
                    string transactionQuery = @"
                        SELECT COUNT(*)
                        FROM SupportTransactions";

                    using (SqlCommand cmd =
                        new SqlCommand(transactionQuery, con))
                    {
                        int totalTransactions =
                            Convert.ToInt32(cmd.ExecuteScalar());

                        lblTotalTransactions.Text =
                            totalTransactions.ToString();
                    }


                    // Total support amount
                    string amountQuery = @"
                        SELECT ISNULL(SUM(SupportAmount), 0)
                        FROM SupportTransactions";

                    using (SqlCommand cmd =
                        new SqlCommand(amountQuery, con))
                    {
                        decimal totalAmount =
                            Convert.ToDecimal(cmd.ExecuteScalar());

                        lblTotalAmount.Text =
                            "₹" + totalAmount.ToString("N2");
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage(
                    "Summary Database Error: " +
                    ex.Message);
            }
        }


        private void LoadTransactions()
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                        SELECT
                            SupportID,
                            RequestID,
                            SupporterEmail,
                            SupportAmount,
                            SupportDate
                        FROM SupportTransactions
                        ORDER BY SupportDate DESC";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    using (SqlDataAdapter da =
                        new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();

                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            rptTransactions.DataSource = dt;
                            rptTransactions.DataBind();

                            pnlEmpty.Visible = false;
                        }
                        else
                        {
                            rptTransactions.DataSource = null;
                            rptTransactions.DataBind();

                            pnlEmpty.Visible = true;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage(
                    "Transaction Database Error: " +
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