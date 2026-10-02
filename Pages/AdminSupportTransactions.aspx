<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AdminSupportTransactions.aspx.cs"
    Inherits="AranCommunitySupport.Pages.AdminSupportTransactions" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title>ARAN | Support Transactions</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: "Times New Roman", serif;
            background: #080b18;
            color: white;
            min-height: 100vh;
        }

        .topbar {
            height: 75px;
            padding: 0 55px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: #0d1020;
            border-bottom: 1px solid #252945;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .shield {
            width: 42px;
            height: 48px;
            background: linear-gradient(135deg, #ff3158, #8b3dff);
            clip-path: polygon(
                50% 0%,
                92% 15%,
                88% 62%,
                50% 100%,
                12% 62%,
                8% 15%
            );
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 19px;
        }

        .logo-text {
            font-size: 27px;
            font-weight: bold;
            letter-spacing: 2px;
        }

        .admin-badge {
            background: #171a2d;
            border: 1px solid #30344f;
            padding: 9px 18px;
            border-radius: 25px;
            color: #d7d9e7;
        }

        .container {
            width: 92%;
            max-width: 1200px;
            margin: 45px auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .header h1 {
            font-size: 38px;
            margin-bottom: 8px;
        }

        .header p {
            color: #aeb2c8;
            font-size: 17px;
        }

        .back-btn {
            background: #15182a;
            border: 1px solid #343850;
            color: white;
            padding: 12px 20px;
            border-radius: 10px;
            font-family: inherit;
            font-size: 15px;
            cursor: pointer;
        }

        .back-btn:hover {
            background: #20243b;
        }

        /* SUMMARY */

        .summary-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
            margin-bottom: 30px;
        }

        .summary-card {
            background: #101426;
            border: 1px solid #292d47;
            border-radius: 16px;
            padding: 22px;
        }

        .summary-icon {
            font-size: 27px;
            margin-bottom: 12px;
        }

        .summary-title {
            color: #858ba8;
            font-size: 14px;
            margin-bottom: 8px;
        }

        .summary-value {
            font-size: 28px;
            font-weight: bold;
        }

        .amount {
            color: #36d399;
        }

        /* TRANSACTION CARD */

        .transaction-card {
            background: #101426;
            border: 1px solid #292d47;
            border-radius: 18px;
            padding: 25px;
            margin-bottom: 18px;
        }

        .transaction-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .support-id {
            color: #9d7cff;
            font-size: 15px;
            font-weight: bold;
        }

        .support-date {
            color: #858ba8;
            font-size: 14px;
        }

        .transaction-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
        }

        .detail-box {
            background: #15192c;
            border: 1px solid #292d47;
            border-radius: 12px;
            padding: 15px;
        }

        .detail-label {
            display: block;
            color: #858ba8;
            font-size: 13px;
            margin-bottom: 7px;
        }

        .detail-value {
            color: #ffffff;
            font-size: 16px;
            word-break: break-word;
        }

        .support-amount {
            color: #36d399;
            font-size: 21px;
            font-weight: bold;
        }

        .empty {
            text-align: center;
            padding: 70px 20px;
            background: #101426;
            border: 1px solid #292d47;
            border-radius: 18px;
            color: #8f94aa;
            font-size: 18px;
        }

        @media(max-width: 800px) {

            .topbar {
                padding: 0 20px;
            }

            .container {
                width: 94%;
            }

            .header {
                flex-direction: column;
                align-items: flex-start;
                gap: 20px;
            }

            .summary-grid {
                grid-template-columns: 1fr;
            }

            .transaction-grid {
                grid-template-columns: 1fr;
            }
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <!-- TOP BAR -->

    <div class="topbar">

        <div class="logo">

            <div class="shield">
                A
            </div>

            <div class="logo-text">
                ARAN
            </div>

        </div>

        <div class="admin-badge">
            🛡️ Administrator
        </div>

    </div>


    <!-- MAIN -->

    <div class="container">

        <div class="header">

            <div>

                <h1>❤️ Support Transactions</h1>

                <p>
                    Monitor community contributions and financial support.
                </p>

            </div>


            <asp:Button
                ID="btnBack"
                runat="server"
                Text="← Admin Dashboard"
                CssClass="back-btn"
                OnClick="btnBack_Click" />

        </div>


        <!-- SUMMARY -->

        <div class="summary-grid">

            <div class="summary-card">

                <div class="summary-icon">
                    ❤️
                </div>

                <div class="summary-title">
                    Total Support Transactions
                </div>

                <asp:Label
                    ID="lblTotalTransactions"
                    runat="server"
                    CssClass="summary-value"
                    Text="0">
                </asp:Label>

            </div>


            <div class="summary-card">

                <div class="summary-icon">
                    💰
                </div>

                <div class="summary-title">
                    Total Support Amount
                </div>

                <asp:Label
                    ID="lblTotalAmount"
                    runat="server"
                    CssClass="summary-value amount"
                    Text="₹0.00">
                </asp:Label>

            </div>


            <div class="summary-card">

                <div class="summary-icon">
                    🤝
                </div>

                <div class="summary-title">
                    Community Support
                </div>

                <asp:Label
                    ID="lblCommunitySupport"
                    runat="server"
                    CssClass="summary-value"
                    Text="Active">
                </asp:Label>

            </div>

        </div>


        <!-- TRANSACTIONS -->

        <asp:Repeater
            ID="rptTransactions"
            runat="server">

            <ItemTemplate>

                <div class="transaction-card">

                    <div class="transaction-top">

                        <div class="support-id">
                            SUPPORT #<%# Eval("SupportID") %>
                        </div>

                        <div class="support-date">
                            🕒
                            <%# Eval(
                                "SupportDate",
                                "{0:dd MMM yyyy, hh:mm tt}"
                            ) %>
                        </div>

                    </div>


                    <div class="transaction-grid">

                        <div class="detail-box">

                            <span class="detail-label">
                                🚨 Emergency Request
                            </span>

                            <span class="detail-value">
                                Request #<%# Eval("RequestID") %>
                            </span>

                        </div>


                        <div class="detail-box">

                            <span class="detail-label">
                                ✉ Supporter Email
                            </span>

                            <span class="detail-value">
                                <%# Eval("SupporterEmail") %>
                            </span>

                        </div>


                        <div class="detail-box">

                            <span class="detail-label">
                                💰 Support Amount
                            </span>

                            <span class="support-amount">
                                ₹<%# Eval(
                                    "SupportAmount",
                                    "{0:N2}"
                                ) %>
                            </span>

                        </div>

                    </div>

                </div>

            </ItemTemplate>

        </asp:Repeater>


        <!-- EMPTY -->

        <asp:Panel
            ID="pnlEmpty"
            runat="server"
            CssClass="empty"
            Visible="false">

            <div style="font-size:50px; margin-bottom:15px;">
                🤝
            </div>

            <div>
                No support transactions found.
            </div>

        </asp:Panel>

    </div>

</form>

</body>
</html>