<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="SupportConfirmation.aspx.cs"
    Inherits="AranCommunitySupport.Pages.SupportConfirmation" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>ARAN | Support Confirmation</title>

    <style type="text/css">

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Times New Roman", Times, serif;
            background: #080b18;
            color: white;
            min-height: 100vh;
        }

        /* NAVBAR */

        .navbar {
            width: 100%;
            min-height: 80px;
            padding: 0 8%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #0b1027;
            border-bottom: 1px solid rgba(255,255,255,0.10);
        }

        .logo {
            font-size: 32px;
            font-weight: bold;
            letter-spacing: 4px;
        }

        .logo span {
            color: #ff4f61;
        }

        .back-btn {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border: 1px solid rgba(255,255,255,0.15);
            border-radius: 25px;
        }

        .back-btn:hover {
            background: rgba(255,255,255,0.08);
        }

        /* MAIN */

        .main-container {
            min-height: 80vh;
            padding: 70px 8%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .confirmation-card {
            width: 100%;
            max-width: 750px;
            background: #111735;
            border: 1px solid rgba(255,255,255,0.10);
            border-radius: 25px;
            padding: 50px;
            text-align: center;
            box-shadow: 0 25px 70px rgba(0,0,0,0.40);
        }

        .success-icon {
            font-size: 70px;
            margin-bottom: 20px;
        }

        .confirmation-card h1 {
            font-size: 40px;
            margin-bottom: 15px;
        }

        .subtitle {
            color: #aeb5d2;
            font-size: 18px;
            line-height: 1.7;
            margin-bottom: 35px;
        }

        /* DETAILS */

        .details-box {
            background: #0b1027;
            border: 1px solid #303961;
            border-radius: 18px;
            padding: 30px;
            text-align: left;
            margin-top: 20px;
        }

        .detail-title {
            color: #ff8794;
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 10px;
            margin-top: 20px;
        }

        .detail-title:first-child {
            margin-top: 0;
        }

        .detail-value {
            font-size: 21px;
            font-weight: bold;
            color: white;
            line-height: 1.6;
        }

        .amount {
            color: #7dffb2;
            font-size: 30px;
        }

        /* BUTTON */

        .dashboard-btn {
            display: inline-block;
            margin-top: 35px;
            padding: 15px 35px;
            border-radius: 12px;
            text-decoration: none;
            color: white;
            font-size: 17px;
            font-weight: bold;
            background: linear-gradient(135deg, #ff4f61, #8b56ff);
        }

        .dashboard-btn:hover {
            transform: translateY(-2px);
        }

        /* FOOTER */

        footer {
            padding: 30px;
            text-align: center;
            background: #050713;
            color: #8f98ba;
        }

        @media (max-width: 700px) {

            .navbar {
                padding: 20px;
            }

            .confirmation-card {
                padding: 30px 20px;
            }

            .confirmation-card h1 {
                font-size: 30px;
            }

        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <!-- NAVBAR -->

        <div class="navbar">

            <div class="logo">
                🛡️ AR<span>AN</span>
            </div>

            <a href="Dashboard.aspx" class="back-btn">
                ← Dashboard
            </a>

        </div>


        <!-- MAIN CONTENT -->

        <div class="main-container">

            <div class="confirmation-card">

                <div class="success-icon">
                    ✅
                </div>

                <h1>
                    Support Confirmed!
                </h1>

                <p class="subtitle">
                    Thank you for your valuable support.
                    Your contribution has been successfully recorded.
                </p>


                <!-- SUPPORT DETAILS -->

                <div class="details-box">

                    <div class="detail-title">
                        SELECTED SUPPORT REQUEST
                    </div>

                    <div class="detail-value">

                        <asp:Label
                            ID="lblSupportRequest"
                            runat="server"
                            Text="No support request selected.">
                        </asp:Label>

                    </div>


                    <div class="detail-title">
                        SUPPORT AMOUNT
                    </div>

                    <div class="detail-value amount">

                        ₹
                        <asp:Label
                            ID="lblSupportAmount"
                            runat="server"
                            Text="0">
                        </asp:Label>

                    </div>

                </div>


                <!-- DASHBOARD BUTTON -->

                <a href="Dashboard.aspx"
                   class="dashboard-btn">

                    🏠 Go to Dashboard

                </a>

            </div>

        </div>


        <!-- FOOTER -->

        <footer>

            <p>
                🛡️ ARAN — A Digital Safety Net for Communities
            </p>

            <br />

            <p>
                © 2026 ARAN Community Emergency Support System
            </p>

        </footer>

    </form>

</body>

</html>