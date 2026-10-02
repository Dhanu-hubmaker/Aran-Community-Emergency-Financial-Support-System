<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="History.aspx.cs"
    Inherits="AranCommunitySupport.Pages.History" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>ARAN | History</title>

    <style type="text/css">

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Times New Roman", Times, serif;
            background:
                radial-gradient(circle at 10% 10%, rgba(255,79,97,0.15), transparent 25%),
                radial-gradient(circle at 90% 90%, rgba(120,85,255,0.15), transparent 25%),
                linear-gradient(135deg, #070a16, #12183a, #090b18);
            color: white;
            min-height: 100vh;
        }

        /* ================= HEADER ================= */

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

        .back-btn {
            background: transparent;
            border: 1px solid #69738f;
            color: white;

            padding: 10px 20px;
            border-radius: 9px;

            font-family: "Times New Roman", Times, serif;
            font-size: 16px;
            font-weight: bold;

            cursor: pointer;
            transition: .3s;
        }

        .back-btn:hover {
            background: #ff6273;
            border-color: #ff6273;
        }


        /* ================= MAIN ================= */

        .container {
            width: 90%;
            max-width: 1150px;
            margin: 45px auto 80px;
        }

        .page-title {
            text-align: center;
            font-size: 40px;
            margin-bottom: 10px;
        }

        .page-title span {
            color: #ff7280;
        }

        .subtitle {
            text-align: center;
            color: #aeb6d3;
            font-size: 18px;
            margin-bottom: 40px;
        }


        /* ================= SUMMARY ================= */

        .summary-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 35px;
        }

        .summary-card {
            background: rgba(18,24,52,.95);
            border: 1px solid rgba(255,255,255,.08);
            border-radius: 20px;
            padding: 25px;
            text-align: center;
            transition: .3s;
        }

        .summary-card:hover {
            transform: translateY(-5px);
            border-color: #ff6273;
        }

        .summary-icon {
            font-size: 32px;
            margin-bottom: 12px;
        }

        .summary-number {
            font-size: 30px;
            font-weight: bold;
            color: #ff8a96;
            margin-bottom: 5px;
        }

        .summary-label {
            color: #aeb6d3;
            font-size: 16px;
        }


        /* ================= HISTORY CARD ================= */

        .history-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .history-card {
            background: rgba(15,20,48,.96);
            border: 1px solid rgba(255,255,255,.08);
            border-radius: 20px;
            padding: 25px;

            transition: .3s;
        }

        .history-card:hover {
            transform: translateY(-4px);
            border-color: rgba(255,98,115,.5);
        }

        .history-top {
            display: flex;
            justify-content: space-between;
            align-items: center;

            gap: 20px;
            margin-bottom: 20px;
        }

        .request-title {
            font-size: 23px;
            font-weight: bold;
            color: #ffffff;
        }

        .request-date {
            color: #929bbd;
            font-size: 14px;
            margin-top: 6px;
        }


        /* ================= STATUS ================= */

        .status {
            padding: 8px 15px;
            border-radius: 20px;

            font-size: 14px;
            font-weight: bold;

            white-space: nowrap;
        }

        .status.pending {
            background: rgba(255,190,80,.15);
            color: #ffc26b;
            border: 1px solid rgba(255,190,80,.25);
        }

        .status.supported {
            background: rgba(80,220,150,.12);
            color: #7ee6b1;
            border: 1px solid rgba(80,220,150,.25);
        }

        .status.other {
            background: rgba(255,79,97,.15);
            color: #ff8491;
        }


        /* ================= DETAILS ================= */

        .details-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
        }

        .detail-box {
            background: rgba(7,10,22,.65);
            border-radius: 12px;
            padding: 16px;
        }

        .detail-label {
            color: #858eae;
            font-size: 13px;
            margin-bottom: 6px;
        }

        .detail-value {
            color: #ffffff;
            font-size: 16px;
            font-weight: bold;
        }


        /* ================= SUPPORT INFO ================= */

        .support-info {
            margin-top: 20px;
            padding-top: 18px;

            border-top: 1px solid rgba(255,255,255,.07);

            color: #b9c0d8;
            font-size: 16px;
        }

        .support-info strong {
            color: #7ee6b1;
        }


        /* ================= EMPTY ================= */

        .empty-panel {
            background: rgba(15,20,48,.96);
            border: 1px solid rgba(255,255,255,.08);
            border-radius: 20px;

            text-align: center;
            padding: 55px 25px;

            color: #aeb6d3;
            font-size: 20px;
        }

        .empty-icon {
            font-size: 55px;
            margin-bottom: 15px;
        }


        /* ================= RESPONSIVE ================= */

        @media(max-width: 850px) {

            .summary-grid {
                grid-template-columns: 1fr;
            }

            .details-grid {
                grid-template-columns: 1fr;
            }

            .history-top {
                flex-direction: column;
                align-items: flex-start;
            }

            .navbar {
                padding: 18px 25px;
            }

        }

        @media(max-width: 550px) {

            .container {
                width: 94%;
                margin-top: 30px;
            }

            .page-title {
                font-size: 30px;
            }

            .subtitle {
                font-size: 16px;
            }

            .logo {
                font-size: 26px;
            }

        }

    </style>

</head>


<body>

<form id="form1" runat="server">


    <!-- ================= HEADER ================= -->

    <div class="navbar">

        <div class="logo">
            🛡️ AR<span>AN</span>
        </div>

        <asp:Button
            ID="btnBack"
            runat="server"
            Text="← Dashboard"
            CssClass="back-btn"
            CausesValidation="false"
            OnClick="btnBack_Click" />

    </div>


    <!-- ================= MAIN ================= -->

    <div class="container">

        <div class="page-title">
            My <span>History</span> 📋
        </div>

        <div class="subtitle">
            Track your emergency requests and community support activity.
        </div>


        <!-- ================= SUMMARY ================= -->

        <div class="summary-grid">

            <div class="summary-card">

                <div class="summary-icon">
                    🚨
                </div>

                <div class="summary-number">

                    <asp:Label
                        ID="lblMyRequests"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </div>

                <div class="summary-label">
                    My Emergency Requests
                </div>

            </div>


            <div class="summary-card">

                <div class="summary-icon">
                    ❤️
                </div>

                <div class="summary-number">

                    <asp:Label
                        ID="lblSupportedRequests"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </div>

                <div class="summary-label">
                    Requests I Supported
                </div>

            </div>


            <div class="summary-card">

                <div class="summary-icon">
                    💰
                </div>

                <div class="summary-number">

                    ₹<asp:Label
                        ID="lblTotalAmount"
                        runat="server"
                        Text="0.00">
                    </asp:Label>

                </div>

                <div class="summary-label">
                    Total Support Given
                </div>

            </div>

        </div>


        <!-- ================= HISTORY ================= -->

        <div class="history-list">

            <asp:Repeater
                ID="rptHistory"
                runat="server"
                OnItemDataBound="rptHistory_ItemDataBound">

                <ItemTemplate>

                    <div class="history-card">

                        <div class="history-top">

                            <div>

                                <div class="request-title">

                                    🚨
                                    <%# Eval("EmergencyType") %>

                                </div>

                                <div class="request-date">

                                    📅
                                    <%# Eval(
                                        "RequestDate",
                                        "{0:dd MMM yyyy, hh:mm tt}") %>

                                </div>

                            </div>


                            <asp:Label
                                ID="lblStatus"
                                runat="server"
                                Text='<%# Eval("Status") %>'
                                CssClass="status">
                            </asp:Label>

                        </div>


                        <div class="details-grid">

                            <div class="detail-box">

                                <div class="detail-label">
                                    👤 Name
                                </div>

                                <div class="detail-value">
                                    <%# Eval("Name") %>
                                </div>

                            </div>


                            <div class="detail-box">

                                <div class="detail-label">
                                    📍 Location
                                </div>

                                <div class="detail-value">
                                    <%# Eval("Location") %>
                                </div>

                            </div>


                            <div class="detail-box">

                                <div class="detail-label">
                                    📞 Phone
                                </div>

                                <div class="detail-value">
                                    <%# Eval("Phone") %>
                                </div>

                            </div>

                        </div>


                        <div class="support-info">

                            <%# Eval("Description") %>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:Repeater>


            <!-- ================= EMPTY ================= -->

            <asp:Panel
                ID="pnlEmpty"
                runat="server"
                CssClass="empty-panel"
                Visible="false">

                <div class="empty-icon">
                    📭
                </div>

                <div>
                    No history available yet.
                </div>

                <div style="margin-top:10px;font-size:16px;">
                    Your emergency requests and support activity
                    will appear here.
                </div>

            </asp:Panel>

        </div>

    </div>

</form>

</body>

</html>