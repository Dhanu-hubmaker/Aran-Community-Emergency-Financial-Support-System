using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AranCommunitySupport.Pages
{
    public partial class AdminEmergencyRequests : System.Web.UI.Page
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
                LoadRequests();
            }
        }


        private void LoadRequests()
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
                            Status,
                            Email
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
                            rptRequests.DataSource = dt;
                            rptRequests.DataBind();

                            pnlEmpty.Visible = false;
                        }
                        else
                        {
                            rptRequests.DataSource = null;
                            rptRequests.DataBind();

                            pnlEmpty.Visible = true;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage(
                    "Database Error: " +
                    ex.Message);
            }
        }


        protected void rptRequests_ItemDataBound(
            object sender,
            RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
                e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblStatus =
                    (Label)e.Item.FindControl("lblStatus");

                DropDownList ddlStatus =
                    (DropDownList)e.Item.FindControl("ddlStatus");

                string status =
                    DataBinder.Eval(
                        e.Item.DataItem,
                        "Status").ToString();

                // Status label
                if (status.Equals(
                    "Supported",
                    StringComparison.OrdinalIgnoreCase))
                {
                    lblStatus.Text = "✓ SUPPORTED";
                    lblStatus.CssClass =
                        "status status-supported";
                }
                else
                {
                    lblStatus.Text = "⏳ PENDING";
                    lblStatus.CssClass =
                        "status status-pending";
                }

                // Dropdown selected value
                ListItem selectedItem =
                    ddlStatus.Items.FindByValue(status);

                if (selectedItem != null)
                {
                    ddlStatus.ClearSelection();
                    selectedItem.Selected = true;
                }
            }
        }


        protected void rptRequests_ItemCommand(
            object source,
            RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "UpdateStatus")
            {
                try
                {
                    int requestId =
                        Convert.ToInt32(
                            e.CommandArgument);

                    DropDownList ddlStatus =
                        (DropDownList)e.Item.FindControl(
                            "ddlStatus");

                    string newStatus =
                        ddlStatus.SelectedValue;


                    using (SqlConnection con =
                        new SqlConnection(connectionString))
                    {
                        string query = @"
                            UPDATE EmergencyRequests
                            SET Status = @Status
                            WHERE RequestID = @RequestID";

                        using (SqlCommand cmd =
                            new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue(
                                "@Status",
                                newStatus);

                            cmd.Parameters.AddWithValue(
                                "@RequestID",
                                requestId);

                            con.Open();

                            int rows =
                                cmd.ExecuteNonQuery();

                            if (rows > 0)
                            {
                                LoadRequests();

                                ShowMessage(
                                    "Emergency request status updated successfully.");
                            }
                            else
                            {
                                ShowMessage(
                                    "Request not found.");
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    ShowMessage(
                        "Update Error: " +
                        ex.Message);
                }
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