<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="SupportDetails.aspx.cs"
    Inherits="AranCommunitySupport.Pages.SupportDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>ARAN | Support Details</title>

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
            transition: 0.3s;
        }

        .back-btn:hover {
            background: rgba(255,255,255,0.08);
        }

        /* MAIN CONTAINER */

        .main-container {
            min-height: 80vh;
            padding: 80px 8%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .support-card {
            width: 100%;
            max-width: 850px;
            background: #111735;
            border: 1px solid rgba(255,255,255,0.10);
            border-radius: 25px;
            padding: 50px;
            box-shadow: 0 25px 70px rgba(0,0,0,0.40);
        }

        .badge {
            display: inline-block;
            padding: 10px 20px;
            border-radius: 25px;
            background: rgba(255,79,97,0.12);
            border: 1px solid rgba(255,79,97,0.30);
            color: #ff9aa5;
            font-weight: bold;
            margin-bottom: 25px;
        }

        .support-card h1 {
            font-size: 42px;
            margin-bottom: 18px;
        }

        .subtitle {
            color: #aeb5d2;
            font-size: 18px;
            line-height: 1.7;
            margin-bottom: 35px;
        }

        /* REQUEST BOX */

        .request-box {
            padding: 30px;
            background: #0b1027;
            border: 1px solid #303961;
            border-radius: 18px;
            margin-bottom: 30px;
        }

        .request-title {
            color: #ff8794;
            font-size: 17px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .request-value {
            color: white;
            font-size: 22px;
            line-height: 1.6;
            font-weight: bold;
        }

        /* AMOUNT */

        .amount-section {
            margin-bottom: 30px;
        }

        .amount-section label {
            display: block;
            margin-bottom: 10px;
            color: #c0c6e1;
            font-size: 17px;
        }

        .amount-input {
            width: 100%;
            padding: 16px 18px;
            border-radius: 12px;
            border: 1px solid #303961;
            background: #0b1027;
            color: white;
            font-size: 17px;
            outline: none;
        }

        .amount-input:focus {
            border-color: #ff5668;
        }

        /* BUTTONS */

        .button-group {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }

        .confirm-btn {
            flex: 1;
            padding: 16px;
            border: none;
            border-radius: 13px;
            color: white;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
            background: linear-gradient(135deg, #ff4f61, #8b56ff);
            transition: 0.3s;
        }

        .confirm-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(255,79,97,0.25);
        }

        .cancel-btn {
            flex: 1;
            padding: 16px;
            border-radius: 13px;
            color: white;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
            background: transparent;
            border: 1px solid #3c456d;
            transition: 0.3s;
        }

        .cancel-btn:hover {
            background: rgba(255,255,255,0.07);
        }

        /* FOOTER */

        footer {
            padding: 35px;
            text-align: center;
            background: #050713;
            color: #8f98ba;
        }

        @media (max-width: 700px) {

            .navbar {
                padding: 20px;
            }

            .support-card {
                padding: 30px 20px;
            }

            .support-card h1 {
                font-size: 32px;
            }

            .button-group {
                flex-direction: column;
            }

        }
        .message-label {
    display: block;
    margin-top: 12px;
    color: #ff9aa5;
    font-size: 16px;
    font-weight: bold;
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

            <a href="SupportRequests.aspx" class="back-btn">
                ← Back to Requests
            </a>

        </div>


        <!-- MAIN CONTENT -->

        <div class="main-container">

            <div class="support-card">

                <div class="badge">
                    ❤️ COMMUNITY SUPPORT
                </div>


                <h1>
                    Support This Signal
                </h1>


                <p class="subtitle">

                    Your support can make a meaningful difference
                    during someone's emergency situation.

                </p>


                <!-- SELECTED REQUEST -->

                <div class="request-box">

                    <div class="request-title">
                        SELECTED EMERGENCY REQUEST
                    </div>


                    <div class="request-value">

                        <asp:Label
                            ID="lblSupportRequest"
                            runat="server"
                            Text="No support request selected.">
                        </asp:Label>

                    </div>

                </div>


                <!-- AMOUNT -->

                <div class="amount-section">

                    <label>
                        Enter Support Amount (₹)
                    </label>


                    <asp:TextBox
                        ID="txtAmount"
                        runat="server"
                        CssClass="amount-input"
                        TextMode="Number"
                        placeholder="Enter amount you want to contribute">
                    </asp:TextBox>
                    <asp:Label
    ID="lblMessage"
    runat="server"
    CssClass="message-label">
</asp:Label>
                </div>


                <!-- BUTTONS -->

                <div class="button-group">
<asp:Button
    ID="btnConfirmSupport"
    runat="server"
    Text="❤️ Confirm Support"
    CssClass="confirm-btn"
    CausesValidation="false"
    OnClick="btnConfirmSupport_Click" />


                    <asp:Button
                        ID="btnCancel"
                        runat="server"
                        Text="Cancel"
                        CssClass="cancel-btn"
                        CausesValidation="false"
                        OnClick="btnCancel_Click" />

                </div>

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