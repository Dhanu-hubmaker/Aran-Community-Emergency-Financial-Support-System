using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AranCommunitySupport.Pages
{
    public partial class AdminDashboard : System.Web.UI.Page
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
                LoadAdminName();
                LoadStatistics();
                LoadRecentRequests();
            }
        }

        private void LoadAdminName()
        {
            if (Session["AdminName"] != null)
            {
                lblAdminName.Text =
                    Session["AdminName"].ToString();
            }
            else
            {
                lblAdminName.Text = "Administrator";
            }
        }

        private void LoadStatistics()
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    con.Open();

                    // Total Emergency Requests
                    string totalQuery =
                        "SELECT COUNT(*) FROM EmergencyRequests";

                    using (SqlCommand cmd =
                        new SqlCommand(totalQuery, con))
                    {
                        lblTotalRequests.Text =
                            Convert.ToInt32(
                                cmd.ExecuteScalar()).ToString();
                    }

                    // Pending Requests
                    string pendingQuery = @"
                        SELECT COUNT(*)
                        FROM EmergencyRequests
                        WHERE Status = 'Pending'";

                    using (SqlCommand cmd =
                        new SqlCommand(pendingQuery, con))
                    {
                        lblPendingRequests.Text =
                            Convert.ToInt32(
                                cmd.ExecuteScalar()).ToString();
                    }

                    // Supported Requests
                    string supportedQuery = @"
                        SELECT COUNT(*)
                        FROM EmergencyRequests
                        WHERE Status = 'Supported'";

                    using (SqlCommand cmd =
                        new SqlCommand(supportedQuery, con))
                    {
                        lblSupportedRequests.Text =
                            Convert.ToInt32(
                                cmd.ExecuteScalar()).ToString();
                    }

                    // Total Community Support
                    string amountQuery = @"
                        SELECT ISNULL(SUM(SupportAmount), 0)
                        FROM SupportTransactions";

                    using (SqlCommand cmd =
                        new SqlCommand(amountQuery, con))
                    {
                        decimal totalSupport =
                            Convert.ToDecimal(
                                cmd.ExecuteScalar());

                        lblTotalSupport.Text =
                            "₹" + totalSupport.ToString("N2");
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage(
                    "Statistics Database Error: " +
                    ex.Message);
            }
        }

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
                            Description,
                            Status,
                            RequestDate
                        FROM EmergencyRequests
                        ORDER BY RequestDate DESC";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    using (SqlDataAdapter da =
                        new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();

                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            rptRecentRequests.DataSource = dt;
                            rptRecentRequests.DataBind();

                            pnlNoRequests.Visible = false;
                        }
                        else
                        {
                            rptRecentRequests.DataSource = null;
                            rptRecentRequests.DataBind();

                            pnlNoRequests.Visible = true;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage(
                    "Requests Database Error: " +
                    ex.Message);
            }
        }

        protected void rptRecentRequests_ItemDataBound(
            object sender,
            RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
                e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblStatus =
                    (Label)e.Item.FindControl("lblStatus");

                string status =
                    DataBinder.Eval(
                        e.Item.DataItem,
                        "Status").ToString();

                if (status.Equals(
                    "Supported",
                    StringComparison.OrdinalIgnoreCase))
                {
                    lblStatus.Text = "✓ SUPPORTED";
                    lblStatus.CssClass =
                        "status supported";
                }
                else if (status.Equals(
                    "Pending",
                    StringComparison.OrdinalIgnoreCase))
                {
                    lblStatus.Text = "⏳ PENDING";
                    lblStatus.CssClass =
                        "status pending";
                }
                else
                {
                    lblStatus.Text =
                        status.ToUpper();

                    lblStatus.CssClass = "status";
                }
            }
        }

        protected void btnLogout_Click(
            object sender,
            EventArgs e)
        {
            Session["AdminEmail"] = null;
            Session["AdminName"] = null;
            Session["AdminRole"] = null;

            Response.Redirect("AdminLogin.aspx");
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