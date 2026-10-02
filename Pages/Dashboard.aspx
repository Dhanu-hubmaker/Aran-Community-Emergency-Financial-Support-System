<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs"
    Inherits="AranCommunitySupport.Pages.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>ARAN | Community Dashboard</title>

    <style type="text/css">

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Times New Roman", Times, serif;
            background:
                radial-gradient(circle at 10% 10%, rgba(255,79,97,0.16), transparent 25%),
                radial-gradient(circle at 90% 90%, rgba(120,85,255,0.18), transparent 25%),
                linear-gradient(135deg, #070a16, #12183a, #090b18);
            color: white;
            min-height: 100vh;
        }


        /* ================= NAVBAR ================= */

        .navbar {
            width: 100%;
            min-height: 80px;
            padding: 0 7%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: rgba(7,10,22,0.96);
            border-bottom: 1px solid rgba(255,255,255,0.08);
        }

        .logo {
            font-size: 34px;
            font-weight: bold;
            letter-spacing: 4px;
        }

        .logo span {
            color: #ff6273;
        }

        .nav-links {
            display: flex;
            gap: 22px;
            align-items: center;
        }

        .nav-links a {
            text-decoration: none;
            color: #c9cde0;
            font-size: 16px;
            font-weight: bold;
            transition: 0.3s;
        }

        .nav-links a:hover {
            color: #ff7886;
        }


        /* ================= LOGOUT ================= */

        .logout-btn {
            background: transparent;
            border: none;
            color: #ff7886;
            font-family: "Times New Roman", Times, serif;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .logout-btn:hover {
            color: white;
        }


        /* ================= DASHBOARD ================= */

        .dashboard {
            max-width: 1250px;
            margin: auto;
            padding: 55px 25px 80px;
        }


        /* ================= WELCOME ================= */

        .welcome-box {
            padding: 38px;
            border-radius: 25px;
            margin-bottom: 35px;

            background:
                radial-gradient(circle at 90% 10%,
                rgba(255,255,255,0.10),
                transparent 20%),
                linear-gradient(135deg,
                #24205a,
                #432047,
                #742f4d);

            border: 1px solid rgba(255,255,255,0.08);
        }

        .welcome-box h1 {
            font-size: 38px;
            margin-bottom: 12px;
        }

        .welcome-box h1 span {
            color: #ff9ba6;
        }

        .welcome-box p {
            color: #f1dfe5;
            font-size: 17px;
            line-height: 1.7;
            max-width: 750px;
        }


        /* ================= STATS ================= */

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 35px;
        }

        .stat-card {
            padding: 25px;
            border-radius: 20px;

            background: rgba(18,24,52,0.95);

            border: 1px solid rgba(255,255,255,0.08);

            transition: 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-6px);
            border-color: rgba(255,79,97,0.30);
        }

        .stat-icon {
            font-size: 32px;
            margin-bottom: 14px;
        }

        .stat-card h2 {
            font-size: 30px;
            margin-bottom: 5px;
            color: #ff8a96;
        }

        .stat-card p {
            color: #aeb6d3;
            font-size: 15px;
        }


        /* ================= QUICK ACTIONS ================= */

        .section-title {
            font-size: 28px;
            margin-bottom: 22px;
        }

        .section-title span {
            color: #ff7886;
        }

        .actions-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 22px;
            margin-bottom: 45px;
        }

        .action-card {
            padding: 30px;
            border-radius: 22px;

            text-decoration: none;
            color: white;

            background: rgba(18,24,52,0.95);

            border: 1px solid rgba(255,255,255,0.08);

            transition: 0.3s;
        }

        .action-card:hover {
            transform: translateY(-7px);
            border-color: #ff6374;
        }

        .action-icon {
            font-size: 40px;
            margin-bottom: 16px;
        }

        .action-card h3 {
            font-size: 23px;
            margin-bottom: 10px;
        }

        .action-card p {
            color: #aeb6d3;
            line-height: 1.6;
        }


        /* ================= ACTIVITY ================= */

        .activity-grid {
            display: grid;
            grid-template-columns: 1.5fr 1fr;
            gap: 25px;
        }

        .panel {
            background: rgba(15,20,48,0.96);
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 22px;
            padding: 30px;
        }

        .panel h2 {
            font-size: 25px;
            margin-bottom: 22px;
        }


        /* ================= REQUEST LIST ================= */

        .request-item {
            display: flex;
            justify-content: space-between;
            align-items: center;

            padding: 18px 0;

            border-bottom: 1px solid rgba(255,255,255,0.07);
        }

        .request-item:last-child {
            border-bottom: none;
        }

        .request-info h3 {
            font-size: 18px;
            margin-bottom: 5px;
        }

        .request-info p {
            color: #929bbd;
            font-size: 14px;
        }


        /* ================= STATUS ================= */

        .status {
            padding: 7px 14px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
            white-space: nowrap;
        }

        .status.active {
            background: rgba(255,79,97,0.15);
            color: #ff8491;
        }

        .status.safe {
            background: rgba(80,220,150,0.12);
            color: #7ee6b1;
        }

        .status.progress {
            background: rgba(255,190,80,0.15);
            color: #ffc26b;
        }


        /* ================= NO ACTIVITY ================= */

        .no-activity {
            color: #929bbd;
            text-align: center;
            padding: 30px 10px;
            font-size: 17px;
        }


        /* ================= SAFETY ================= */

        .safety-score {
            text-align: center;
            padding: 25px 0;
        }

        .score-circle {
            width: 150px;
            height: 150px;
            border-radius: 50%;

            margin: 0 auto 18px;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 38px;
            font-weight: bold;

            background: conic-gradient(
                #ff6273 0deg 300deg,
                #252c50 300deg 360deg
            );
        }

        .score-inner {
            width: 115px;
            height: 115px;
            border-radius: 50%;

            display: flex;
            align-items: center;
            justify-content: center;

            background: #101632;
        }

        .safety-score h3 {
            font-size: 22px;
            margin-bottom: 10px;
        }

        .safety-score p {
            color: #aeb6d3;
            line-height: 1.6;
        }


        /* ================= RESPONSIVE ================= */

        @media (max-width: 950px) {

            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .actions-grid {
                grid-template-columns: 1fr;
            }

            .activity-grid {
                grid-template-columns: 1fr;
            }

            .navbar {
                flex-direction: column;
                padding: 18px;
                gap: 15px;
            }

            .nav-links {
                flex-wrap: wrap;
                justify-content: center;
            }
        }


        @media (max-width: 550px) {

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .welcome-box h1 {
                font-size: 30px;
            }

            .dashboard {
                padding: 35px 15px 60px;
            }

            .request-item {
                flex-direction: column;
                align-items: flex-start;
                gap: 12px;
            }
        }

    </style>

</head>


<body>

<form id="form1" runat="server">


    <!-- ================= NAVBAR ================= -->

    <div class="navbar">

        <div class="logo">
            🛡️ AR<span>AN</span>
        </div>


        <div class="nav-links">

            <a href="Home.aspx">
                Home
            </a>

            <a href="EmergencyRequest.aspx">
                Emergency
            </a>

            <a href="SupportRequests.aspx">
                Support
            </a>

            <a href="About.aspx">
                About
            </a>

            <a href="Contact.aspx">
                Contact
            </a>


            <asp:Button
                ID="btnLogout"
                runat="server"
                Text="Logout"
                CssClass="logout-btn"
                CausesValidation="false"
                OnClick="btnLogout_Click" />

        </div>

    </div>


    <!-- ================= DASHBOARD ================= -->

    <div class="dashboard">


        <!-- ================= WELCOME ================= -->

        <div class="welcome-box">

            <h1>
                Welcome to
                <span>ARAN Dashboard</span>
                👋
            </h1>

            <p>
                Your community support space.
                Stay informed about emergency requests,
                community support activity and the positive
                impact created through ARAN.
            </p>

        </div>


        <!-- ================= LIVE STATISTICS ================= -->

        <div class="stats-grid">


            <!-- TOTAL REQUESTS -->

            <div class="stat-card">

                <div class="stat-icon">
                    🚨
                </div>

                <h2>
                    <asp:Label
                        ID="lblTotalRequests"
                        runat="server"
                        Text="0">
                    </asp:Label>
                </h2>

                <p>
                    Total Emergency Requests
                </p>

            </div>


            <!-- PENDING -->

            <div class="stat-card">

                <div class="stat-icon">
                    ⏳
                </div>

                <h2>
                    <asp:Label
                        ID="lblPendingRequests"
                        runat="server"
                        Text="0">
                    </asp:Label>
                </h2>

                <p>
                    Pending Requests
                </p>

            </div>


            <!-- SUPPORTED -->

            <div class="stat-card">

                <div class="stat-icon">
                    ❤️
                </div>

                <h2>
                    <asp:Label
                        ID="lblSupportedRequests"
                        runat="server"
                        Text="0">
                    </asp:Label>
                </h2>

                <p>
                    Supported Requests
                </p>

            </div>


            <!-- TOTAL SUPPORT -->

            <div class="stat-card">

                <div class="stat-icon">
                    💰
                </div>

                <h2>
                    ₹<asp:Label
                        ID="lblTotalSupport"
                        runat="server"
                        Text="0.00">
                    </asp:Label>
                </h2>

                <p>
                    Total Community Support
                </p>

            </div>

        </div>


        <!-- ================= QUICK ACTIONS ================= -->

        <h2 class="section-title">
            Quick <span>Actions</span>
        </h2>


        <div class="actions-grid">


            <a href="EmergencyRequest.aspx"
               class="action-card">

                <div class="action-icon">
                    🚨
                </div>

                <h3>
                    Request Emergency Support
                </h3>

                <p>
                    Share an emergency request and
                    connect with people who may be able
                    to provide immediate assistance.
                </p>

            </a>


            <a href="SupportRequests.aspx"
               class="action-card">

                <div class="action-icon">
                    🤝
                </div>

                <h3>
                    Support Your Community
                </h3>

                <p>
                    Explore active requests and see
                    where your support can make a
                    meaningful difference.
                </p>

            </a>


            <a href="Contact.aspx"
               class="action-card">

                <div class="action-icon">
                    💬
                </div>

                <h3>
                    Get Help & Guidance
                </h3>

                <p>
                    Contact ARAN support for guidance,
                    suggestions or information about
                    using the platform.
                </p>

            </a>
            <a href="History.aspx" class="action-card">
    <div class="action-icon">📋</div>

    <h3>View My History</h3>

    <p>
        View your emergency requests,
        support activity and previous community actions.
    </p>
</a> 

        </div>


        <!-- ================= ACTIVITY ================= -->

        <div class="activity-grid">


            <!-- RECENT REQUESTS -->

            <div class="panel">

                <h2>
                    📋 Recent Community Activity
                </h2>


                <asp:Repeater
                    ID="rptRecentRequests"
                    runat="server"
                    OnItemDataBound="rptRecentRequests_ItemDataBound">

                    <ItemTemplate>

                        <div class="request-item">

                            <div class="request-info">

                                <h3>
                                    🚨
                                    <%# Eval("EmergencyType") %>
                                </h3>

                                <p>
                                    <%# Eval("Name") %>
                                    •
                                    <%# Eval("Location") %>
                                </p>

                                <p>
                                    <%# Eval(
                                        "RequestDate",
                                        "{0:dd MMM yyyy, hh:mm tt}") %>
                                </p>

                            </div>


                            <asp:Label
                                ID="lblActivityStatus"
                                runat="server"
                                Text='<%# Eval("Status") %>'
                                CssClass="status">
                            </asp:Label>

                        </div>

                    </ItemTemplate>

                </asp:Repeater>


                <asp:Panel
                    ID="pnlNoActivity"
                    runat="server"
                    CssClass="no-activity"
                    Visible="false">

                    No emergency activity available yet. ❤️

                </asp:Panel>

            </div>


            <!-- ================= SAFETY SCORE ================= -->

            <div class="panel">

                <h2>
                    🛡️ Community Safety
                </h2>


                <div class="safety-score">

                    <div class="score-circle">

                        <div class="score-inner">

                            <asp:Label
                                ID="lblSafetyScore"
                                runat="server"
                                Text="0%">
                            </asp:Label>

                        </div>

                    </div>


                    <h3>

                        <asp:Label
                            ID="lblSafetyTitle"
                            runat="server"
                            Text="Community Response">
                        </asp:Label>

                    </h3>


                    <p>

                        <asp:Label
                            ID="lblSafetyDescription"
                            runat="server"
                            Text="Community support activity will appear here.">
                        </asp:Label>

                    </p>

                </div>

            </div>

        </div>

    </div>

</form>

</body>

</html>