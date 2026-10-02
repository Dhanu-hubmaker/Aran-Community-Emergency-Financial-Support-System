using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AranCommunitySupport.Pages
{
    public partial class History : System.Web.UI.Page
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
                LoadHistory();
                LoadSummary();
            }
        }


        // =====================================================
        // LOAD HISTORY
        // =====================================================

        private void LoadHistory()
        {
            try
            {
                string email = Session["UserEmail"].ToString();

                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                        SELECT
                            RequestID,
                            Name,
                            Phone,
                            Location,
                            EmergencyType,
                            Description,
                            RequestDate,
                            Status
                        FROM EmergencyRequests
                        WHERE Email = @Email
                        ORDER BY RequestDate DESC";


                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);

                        using (SqlDataAdapter da =
                            new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();

                            da.Fill(dt);


                            if (dt.Rows.Count > 0)
                            {
                                rptHistory.DataSource = dt;
                                rptHistory.DataBind();

                                pnlEmpty.Visible = false;
                            }
                            else
                            {
                                rptHistory.DataSource = null;
                                rptHistory.DataBind();

                                pnlEmpty.Visible = true;
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "historyError",
                    "alert('History Database Error: " +
                    ex.Message.Replace("'", "\\'") +
                    "');",
                    true);
            }
        }


        // =====================================================
        // LOAD SUMMARY
        // =====================================================

        private void LoadSummary()
        {
            try
            {
                string email = Session["UserEmail"].ToString();

                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    // ================================
                    // MY EMERGENCY REQUESTS
                    // ================================

                    string requestQuery = @"
                        SELECT COUNT(*)
                        FROM EmergencyRequests
                        WHERE Email = @Email";


                    using (SqlCommand cmd =
                        new SqlCommand(requestQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);

                        con.Open();

                        int myRequests =
                            Convert.ToInt32(cmd.ExecuteScalar());

                        lblMyRequests.Text =
                            myRequests.ToString();

                        con.Close();
                    }


                    // ================================
                    // REQUESTS I SUPPORTED
                    // ================================

                    string supportedQuery = @"
                        SELECT COUNT(DISTINCT RequestID)
                        FROM SupportTransactions
                        WHERE SupporterEmail = @Email";


                    using (SqlCommand cmd =
                        new SqlCommand(supportedQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);

                        con.Open();

                        int supportedRequests =
                            Convert.ToInt32(cmd.ExecuteScalar());

                        lblSupportedRequests.Text =
                            supportedRequests.ToString();

                        con.Close();
                    }


                    // ================================
                    // TOTAL SUPPORT AMOUNT
                    // ================================

                    string amountQuery = @"
                        SELECT ISNULL(SUM(SupportAmount), 0)
                        FROM SupportTransactions
                        WHERE SupporterEmail = @Email";


                    using (SqlCommand cmd =
                        new SqlCommand(amountQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);

                        con.Open();

                        decimal totalAmount =
                            Convert.ToDecimal(cmd.ExecuteScalar());

                        lblTotalAmount.Text =
                            totalAmount.ToString("N2");

                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "summaryError",
                    "alert('Summary Database Error: " +
                    ex.Message.Replace("'", "\\'") +
                    "');",
                    true);
            }
        }


        // =====================================================
        // STATUS DESIGN
        // =====================================================

        protected void rptHistory_ItemDataBound(
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
                    lblStatus.Text =
                        "✓ SUPPORTED";

                    lblStatus.CssClass =
                        "status supported";
                }

                else if (status.Equals(
                    "Pending",
                    StringComparison.OrdinalIgnoreCase))
                {
                    lblStatus.Text =
                        "⏳ PENDING";

                    lblStatus.CssClass =
                        "status pending";
                }

                else
                {
                    lblStatus.Text =
                        status.ToUpper();

                    lblStatus.CssClass =
                        "status other";
                }
            }
        }


        // =====================================================
        // BACK TO DASHBOARD
        // =====================================================

        protected void btnBack_Click(
            object sender,
            EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }
}