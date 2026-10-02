using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AranCommunitySupport.Pages
{
    public partial class SupportRequests : System.Web.UI.Page
    {
        private string connectionString =
            ConfigurationManager.ConnectionStrings["AranDB"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            // Check login
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }


            // Load requests only once
            if (!IsPostBack)
            {
                LoadSupportRequests();
            }
        }


        // ============================================
        // LOAD SUPPORT REQUESTS
        // ============================================

        private void LoadSupportRequests()
        {
            try
            {
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
                        ORDER BY RequestDate DESC";


                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        using (SqlDataAdapter da =
                            new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();

                            da.Fill(dt);


                            if (dt.Rows.Count > 0)
                            {
                                rptRequests.DataSource = dt;
                                rptRequests.DataBind();

                                pnlNoRequests.Visible = false;
                            }
                            else
                            {
                                rptRequests.DataSource = null;
                                rptRequests.DataBind();

                                pnlNoRequests.Visible = true;
                            }
                        }
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


        // ============================================
        // CHECK STATUS OF EACH REQUEST
        // ============================================

        protected void rptRequests_ItemDataBound(
            object sender,
            RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
                e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblStatus =
                    (Label)e.Item.FindControl("lblStatus");

                Button btnSupport =
                    (Button)e.Item.FindControl("btnSupport");

                Label lblAlreadySupported =
                    (Label)e.Item.FindControl(
                        "lblAlreadySupported");


                string status = DataBinder.Eval(
                    e.Item.DataItem,
                    "Status").ToString();


                // ====================================
                // SUPPORTED
                // ====================================

                if (status.Equals(
                    "Supported",
                    StringComparison.OrdinalIgnoreCase))
                {
                    lblStatus.Text = "✓ Supported";

                    lblStatus.CssClass =
                        "status supported";


                    // Hide support button
                    btnSupport.Visible = false;


                    // Show already supported
                    lblAlreadySupported.Visible = true;
                }


                // ====================================
                // PENDING
                // ====================================

                else
                {
                    lblStatus.Text = "⏳ Pending";

                    lblStatus.CssClass =
                        "status pending";


                    // Show support button
                    btnSupport.Visible = true;


                    // Hide already supported
                    lblAlreadySupported.Visible = false;
                }
            }
        }


        // ============================================
        // SUPPORT REQUEST BUTTON
        // ============================================

        protected void rptRequests_ItemCommand(
            object source,
            RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SupportRequest")
            {
                int requestID;

                if (int.TryParse(
                    e.CommandArgument.ToString(),
                    out requestID))
                {
                    Session["SupportRequestID"] =
                        requestID;


                    // Get selected request details
                    LoadSelectedRequest(requestID);


                    Response.Redirect(
                        "SupportDetails.aspx");
                }
            }
        }


        // ============================================
        // GET SELECTED REQUEST
        // ============================================

        private void LoadSelectedRequest(int requestID)
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                        SELECT
                            EmergencyType,
                            Name,
                            Location
                        FROM EmergencyRequests
                        WHERE RequestID = @RequestID";


                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@RequestID",
                            requestID);


                        con.Open();


                        using (SqlDataReader reader =
                            cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string emergencyType =
                                    reader["EmergencyType"]
                                    .ToString();

                                string name =
                                    reader["Name"]
                                    .ToString();

                                string location =
                                    reader["Location"]
                                    .ToString();


                                Session["SupportRequest"] =
                                    emergencyType +
                                    " - " +
                                    name +
                                    " (" +
                                    location +
                                    ")";
                            }
                        }
                    }
                }
            }
            catch
            {
                Session["SupportRequest"] =
                    "Emergency Support Request";
            }
        }


        // ============================================
        // BACK TO DASHBOARD
        // ============================================

        protected void btnBack_Click(
            object sender,
            EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }
}