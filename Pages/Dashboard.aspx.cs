using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AranCommunitySupport.Pages
{
    public partial class Dashboard : System.Web.UI.Page
    {
        private string connectionString =
            ConfigurationManager.ConnectionStrings["AranDB"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            // Check whether user is logged in
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }


            // Load dashboard data only when page opens
            if (!IsPostBack)
            {
                LoadDashboardStatistics();

                LoadRecentRequests();
            }
        }


        // =====================================================
        // LOAD DASHBOARD STATISTICS
        // =====================================================

        private void LoadDashboardStatistics()
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                        SELECT

                            COUNT(*) AS TotalRequests,

                            SUM(
                                CASE
                                    WHEN ISNULL(Status, 'Pending') = 'Pending'
                                    THEN 1
                                    ELSE 0
                                END
                            ) AS PendingRequests,

                            SUM(
                                CASE
                                    WHEN Status = 'Supported'
                                    THEN 1
                                    ELSE 0
                                END
                            ) AS SupportedRequests,

                            ISNULL(
                                (
                                    SELECT SUM(SupportAmount)
                                    FROM SupportTransactions
                                ),
                                0
                            ) AS TotalSupportAmount

                        FROM EmergencyRequests";


                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        con.Open();


                        using (SqlDataReader reader =
                            cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                int totalRequests =
                                    Convert.ToInt32(
                                        reader["TotalRequests"]);


                                int pendingRequests =
                                    Convert.ToInt32(
                                        reader["PendingRequests"]);


                                int supportedRequests =
                                    Convert.ToInt32(
                                        reader["SupportedRequests"]);


                                decimal totalSupportAmount =
                                    Convert.ToDecimal(
                                        reader["TotalSupportAmount"]);


                                // Display statistics

                                lblTotalRequests.Text =
                                    totalRequests.ToString();


                                lblPendingRequests.Text =
                                    pendingRequests.ToString();


                                lblSupportedRequests.Text =
                                    supportedRequests.ToString();


                                lblTotalSupport.Text =
                                    totalSupportAmount.ToString("N2");


                                // ====================================
                                // CALCULATE SAFETY SCORE
                                // ====================================

                                int safetyScore = 0;

                                if (totalRequests > 0)
                                {
                                    safetyScore =
                                        (int)Math.Round(
                                            ((double)supportedRequests /
                                             totalRequests) * 100);
                                }


                                if (safetyScore > 100)
                                {
                                    safetyScore = 100;
                                }


                                lblSafetyScore.Text =
                                    safetyScore.ToString() + "%";


                                // ====================================
                                // SAFETY MESSAGE
                                // ====================================

                                if (safetyScore >= 75)
                                {
                                    lblSafetyTitle.Text =
                                        "Strong Community Response";


                                    lblSafetyDescription.Text =
                                        "Your community is actively responding " +
                                        "and supporting people through ARAN.";
                                }

                                else if (safetyScore >= 50)
                                {
                                    lblSafetyTitle.Text =
                                        "Active Community Response";


                                    lblSafetyDescription.Text =
                                        "Community members are actively " +
                                        "responding to emergency requests.";
                                }

                                else if (safetyScore > 0)
                                {
                                    lblSafetyTitle.Text =
                                        "Growing Community Response";


                                    lblSafetyDescription.Text =
                                        "Every support action helps strengthen " +
                                        "the ARAN community.";
                                }

                                else
                                {
                                    lblSafetyTitle.Text =
                                        "Community Response";


                                    lblSafetyDescription.Text =
                                        "Support an emergency request to help " +
                                        "strengthen the community.";
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "dashboardError",
                    "alert('Dashboard Database Error: " +
                    ex.Message.Replace("'", "\\'") +
                    "');",
                    true);
            }
        }


        // =====================================================
        // LOAD RECENT EMERGENCY REQUESTS
        // =====================================================

        private void LoadRecentRequests()
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                        SELECT TOP 5

                            RequestID,
                            Name,
                            Location,
                            EmergencyType,
                            Status,
                            RequestDate

                        FROM EmergencyRequests

                        ORDER BY RequestDate DESC";


                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        using (SqlDataAdapter da =
                            new SqlDataAdapter(cmd))
                        {
                            DataTable dt =
                                new DataTable();


                            da.Fill(dt);


                            if (dt.Rows.Count > 0)
                            {
                                rptRecentRequests.DataSource =
                                    dt;

                                rptRecentRequests.DataBind();


                                pnlNoActivity.Visible =
                                    false;
                            }

                            else
                            {
                                rptRecentRequests.DataSource =
                                    null;

                                rptRecentRequests.DataBind();


                                pnlNoActivity.Visible =
                                    true;
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "recentError",
                    "alert('Recent Activity Error: " +
                    ex.Message.Replace("'", "\\'") +
                    "');",
                    true);
            }
        }


        // =====================================================
        // RECENT REQUEST STATUS STYLE
        // =====================================================

        protected void rptRecentRequests_ItemDataBound(
            object sender,
            RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
                e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblStatus =
                    (Label)e.Item.FindControl(
                        "lblActivityStatus");


                string status =
                    DataBinder.Eval(
                        e.Item.DataItem,
                        "Status").ToString();


                if (status.Equals(
                    "Supported",
                    StringComparison.OrdinalIgnoreCase))
                {
                    lblStatus.Text =
                        "SUPPORTED";

                    lblStatus.CssClass =
                        "status safe";
                }

                else if (status.Equals(
                    "Pending",
                    StringComparison.OrdinalIgnoreCase))
                {
                    lblStatus.Text =
                        "PENDING";

                    lblStatus.CssClass =
                        "status progress";
                }

                else
                {
                    lblStatus.Text =
                        status.ToUpper();

                    lblStatus.CssClass =
                        "status active";
                }
            }
        }


        // =====================================================
        // LOGOUT
        // =====================================================

        protected void btnLogout_Click(
            object sender,
            EventArgs e)
        {
            // Clear all session data
            Session.Clear();

            Session.Abandon();


            // Go back to login page
            Response.Redirect("Login.aspx");
        }
    }
}