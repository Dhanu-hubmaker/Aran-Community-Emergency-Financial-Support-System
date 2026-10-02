<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AdminDashboard.aspx.cs"
    Inherits="AranCommunitySupport.Pages.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Admin Dashboard - ARAN</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: "Times New Roman", serif;
            background: #0b0f14;
            color: white;
        }

        .header {
            background: linear-gradient(135deg, #111820, #1b1424);
            padding: 22px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #303b48;
        }

        .logo {
            font-size: 30px;
            font-weight: bold;
            letter-spacing: 4px;
        }

        .logo span {
            color: #e53935;
        }

        .admin-info {
            color: #c7d0d9;
            font-size: 16px;
        }

        .logout-btn {
            margin-left: 20px;
            padding: 9px 18px;
            border: 1px solid #e53935;
            border-radius: 8px;
            background: transparent;
            color: white;
            font-family: "Times New Roman", serif;
            cursor: pointer;
        }

        .logout-btn:hover {
            background: #e53935;
        }

        .container {
            width: 90%;
            max-width: 1250px;
            margin: 40px auto;
        }

        .welcome {
            margin-bottom: 35px;
        }

        .welcome h1 {
            margin: 0 0 8px;
            font-size: 38px;
        }

        .welcome p {
            margin: 0;
            color: #aeb8c2;
            font-size: 18px;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 35px;
        }

        .stat-card {
            background: #151d26;
            border: 1px solid #2b3947;
            border-radius: 15px;
            padding: 25px;
            transition: .3s;
        }

        .stat-card:hover {
            transform: translateY(-4px);
            border-color: #e53935;
        }

        .stat-icon {
            font-size: 30px;
            margin-bottom: 15px;
        }

        .stat-title {
            color: #aeb8c2;
            font-size: 16px;
            margin-bottom: 8px;
        }

        .stat-value {
            font-size: 32px;
            font-weight: bold;
        }

        .section {
            background: #151d26;
            border: 1px solid #2b3947;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 25px;
        }

        .section-title {
            font-size: 25px;
            margin-bottom: 20px;
        }

        .activity {
            border-bottom: 1px solid #293541;
            padding: 15px 0;
        }

        .activity:last-child {
            border-bottom: none;
        }

        .activity-type {
            font-size: 19px;
            font-weight: bold;
            color: #ff5252;
        }

        .activity-details {
            color: #b9c3cc;
            margin-top: 6px;
            font-size: 16px;
        }

        .status {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 15px;
            font-size: 14px;
            font-weight: bold;
            margin-top: 8px;
        }

        .pending {
            background: #5a4215;
            color: #ffd166;
        }

        .supported {
            background: #173d2a;
            color: #66e39a;
        }
.quick-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
}
        }

        .quick-card {
            display: block;
            padding: 25px;
            background: #10161d;
            border: 1px solid #303d4b;
            border-radius: 12px;
            color: white;
            text-decoration: none;
            transition: .3s;
        }

        .quick-card:hover {
            border-color: #e53935;
            transform: translateY(-4px);
        }

        .quick-icon {
            font-size: 35px;
            margin-bottom: 12px;
        }

        .quick-card h3 {
            margin: 0 0 8px;
            font-size: 21px;
        }

        .quick-card p {
            margin: 0;
            color: #aeb8c2;
            line-height: 1.4;
        }

        .empty {
            text-align: center;
            color: #9da8b3;
            padding: 20px;
            font-size: 17px;
        }

        @media (max-width: 900px) {
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .quick-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 600px) {
            .header {
                padding: 18px 20px;
            }

            .container {
                width: 94%;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .welcome h1 {
                font-size: 30px;
            }
        }

    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="header">

        <div class="logo">
            AR<span>AN</span>
        </div>

        <div class="admin-info">
            👨‍💼 Admin:
            <asp:Label ID="lblAdminName" runat="server"></asp:Label>

            <asp:Button
                ID="btnLogout"
                runat="server"
                Text="Logout"
                CssClass="logout-btn"
                CausesValidation="false"
                OnClick="btnLogout_Click" />
        </div>

    </div>

    <div class="container">

        <div class="welcome">
            <h1>Admin Dashboard</h1>
            <p>
                Manage emergency requests and community support activities.
            </p>
        </div>

        <!-- Statistics -->

        <div class="stats-grid">

            <div class="stat-card">
                <div class="stat-icon">🚨</div>
                <div class="stat-title">Total Emergency Requests</div>
                <asp:Label
                    ID="lblTotalRequests"
                    runat="server"
                    CssClass="stat-value">
                    0
                </asp:Label>
            </div>

            <div class="stat-card">
                <div class="stat-icon">⏳</div>
                <div class="stat-title">Pending Requests</div>
                <asp:Label
                    ID="lblPendingRequests"
                    runat="server"
                    CssClass="stat-value">
                    0
                </asp:Label>
            </div>

            <div class="stat-card">
                <div class="stat-icon">❤️</div>
                <div class="stat-title">Supported Requests</div>
                <asp:Label
                    ID="lblSupportedRequests"
                    runat="server"
                    CssClass="stat-value">
                    0
                </asp:Label>
            </div>

            <div class="stat-card">
                <div class="stat-icon">💰</div>
                <div class="stat-title">Community Support</div>
                <asp:Label
                    ID="lblTotalSupport"
                    runat="server"
                    CssClass="stat-value">
                    ₹0
                </asp:Label>
            </div>

        </div>

        <!-- Recent Requests -->

        <div class="section">

            <div class="section-title">
                📋 Recent Emergency Requests
            </div>

            <asp:Repeater
                ID="rptRecentRequests"
                runat="server"  OnItemDataBound="rptRecentRequests_ItemDataBound">

                <ItemTemplate>

                    <div class="activity">

                        <div class="activity-type">
                            🚨 <%# Eval("EmergencyType") %>
                        </div>

                        <div class="activity-details">
                            👤 <%# Eval("Name") %>
                            &nbsp; | &nbsp;
                            📍 <%# Eval("Location") %>
                        </div>

                        <div class="activity-details">
                            <%# Eval("Description") %>
                        </div>

                        <asp:Label
                            ID="lblStatus"
                            runat="server"
                            Text='<%# Eval("Status") %>'
                            CssClass="status">
                        </asp:Label>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

            <asp:Panel
                ID="pnlNoRequests"
                runat="server"
                CssClass="empty"
                Visible="false">

                No emergency requests available.

            </asp:Panel>

        </div>

      <!-- Quick Actions -->

<div class="section">

    <div class="section-title">
        ⚡ Admin Quick Actions
    </div>

    <div class="quick-grid">

        <!-- Emergency Requests -->

        <a href="AdminEmergencyRequests.aspx" class="quick-card">

            <div class="quick-icon">🚨</div>

            <h3>Emergency Requests</h3>

            <p>
                View and manage all emergency requests
                received from community members.
            </p>

        </a>


        <!-- Contact Messages -->

        <a href="AdminContactMessages.aspx" class="quick-card">

            <div class="quick-icon">💬</div>

            <h3>Contact Messages</h3>

            <p>
                View messages and enquiries received
                from ARAN community members.
            </p>

        </a>


        <!-- Support Requests -->

        <a href="SupportRequests.aspx" class="quick-card">

            <div class="quick-icon">❤️</div>

            <h3>Support Requests</h3>

            <p>
                View and monitor community emergency
                support requests.
            </p>

        </a>


        <!-- User Dashboard -->

        <a href="Dashboard.aspx" class="quick-card">

            <div class="quick-icon">🏠</div>

            <h3>User Dashboard</h3>

            <p>
                Return to the main ARAN user dashboard.
            </p>

        </a>

    </div>

    <!--Support transaction -->

    <div class="quick-card">
    <div class="quick-icon">💰</div>

    <a href="AdminSupportTransactions.aspx">

       <h3> Support Transactions</h3>
    </a>

    <p>
        View all community support transactions
        and total support amounts.
    </p>
</div>

</div>

    </div>

</form>

</body>
</html>