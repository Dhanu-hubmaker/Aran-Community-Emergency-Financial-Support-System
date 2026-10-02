<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AdminContactMessages.aspx.cs"
    Inherits="AranCommunitySupport.Pages.AdminContactMessages" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Contact Messages - ARAN</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: "Times New Roman", serif;
            background: #080b12;
            color: white;
        }

        /* ================= HEADER ================= */

        .header {
            background: linear-gradient(135deg, #111722, #1a1022);
            padding: 20px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #303b48;
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .logo {
            font-size: 32px;
            font-weight: bold;
            letter-spacing: 5px;
        }

        .logo span {
            color: #e53935;
        }

        .admin-label {
            color: #9da8b3;
            font-size: 15px;
            margin-top: 4px;
        }

        .header-left {
            display: flex;
            flex-direction: column;
        }

        .back-btn {
            background: transparent;
            border: 1px solid #657383;
            color: white;
            padding: 11px 22px;
            border-radius: 8px;
            font-family: "Times New Roman", serif;
            font-size: 16px;
            cursor: pointer;
            transition: .3s;
        }

        .back-btn:hover {
            background: #263442;
            border-color: #e53935;
        }

        /* ================= CONTAINER ================= */

        .container {
            width: 92%;
            max-width: 1250px;
            margin: 45px auto;
        }

        /* ================= TITLE ================= */

        .title-section {
            text-align: center;
            margin-bottom: 35px;
        }

        .title {
            font-size: 40px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .title-icon {
            color: #e53935;
        }

        .subtitle {
            color: #aeb8c2;
            font-size: 18px;
        }

        /* ================= INFO BAR ================= */

        .info-bar {
            background: linear-gradient(
                135deg,
                #121923,
                #17111f
            );

            border: 1px solid #2b3947;
            border-radius: 14px;

            padding: 20px 25px;

            margin-bottom: 30px;

            display: flex;
            justify-content: space-between;
            align-items: center;

            box-shadow: 0 8px 25px rgba(0,0,0,.25);
        }

        .info-text {
            color: #c5ced7;
            font-size: 17px;
        }

        .info-text strong {
            color: white;
        }

        .message-count {
            background: #2a171c;
            border: 1px solid #e53935;
            color: #ff6b6b;

            padding: 9px 17px;

            border-radius: 20px;

            font-size: 16px;
            font-weight: bold;
        }

        /* ================= MESSAGE CARD ================= */

        .message-card {
            background: linear-gradient(
                145deg,
                #151d26,
                #10161e
            );

            border: 1px solid #2b3947;

            border-radius: 16px;

            padding: 28px;

            margin-bottom: 22px;

            transition: .3s;

            box-shadow:
                0 8px 25px rgba(0,0,0,.20);
        }

        .message-card:hover {
            border-color: #e53935;
            transform: translateY(-4px);

            box-shadow:
                0 12px 35px rgba(229,57,53,.12);
        }

        /* ================= MESSAGE HEADER ================= */

        .message-header {
            display: flex;
            justify-content: space-between;
            align-items: center;

            gap: 20px;

            margin-bottom: 20px;

            padding-bottom: 15px;

            border-bottom: 1px solid #283441;
        }

        .name {
            font-size: 23px;
            font-weight: bold;
            color: #ffffff;
        }

        .date {
            color: #9da8b3;
            font-size: 15px;
        }

        /* ================= SUBJECT ================= */

        .subject {
            color: #ff5252;
            font-size: 21px;
            font-weight: bold;

            margin-bottom: 12px;
        }

        /* ================= EMAIL ================= */

        .email {
            color: #bfc8d1;
            font-size: 16px;

            margin-bottom: 18px;
        }

        /* ================= MESSAGE BODY ================= */

        .message-label {
            color: #8995a2;
            font-size: 14px;

            text-transform: uppercase;

            letter-spacing: 1px;

            margin-bottom: 7px;
        }

        .message {
            background: #0d131a;

            border: 1px solid #25313d;

            border-radius: 11px;

            padding: 20px;

            color: #d6dde4;

            font-size: 17px;

            line-height: 1.7;

            white-space: pre-wrap;
        }

        /* ================= EMPTY ================= */

        .empty {
            text-align: center;

            background: #151d26;

            border: 1px solid #2b3947;

            border-radius: 15px;

            padding: 55px;

            color: #aeb8c2;

            font-size: 20px;
        }

        .empty-icon {
            font-size: 45px;
            margin-bottom: 12px;
        }

        /* ================= FOOTER ================= */

        .footer {
            text-align: center;

            color: #687582;

            font-size: 14px;

            margin-top: 45px;

            padding-bottom: 30px;
        }

        /* ================= MOBILE ================= */

        @media(max-width: 700px) {

            .header {
                padding: 18px 20px;
            }

            .logo {
                font-size: 26px;
            }

            .admin-label {
                font-size: 13px;
            }

            .back-btn {
                padding: 9px 13px;
                font-size: 14px;
            }

            .container {
                width: 94%;
                margin: 30px auto;
            }

            .title {
                font-size: 31px;
            }

            .subtitle {
                font-size: 16px;
            }

            .info-bar {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .message-card {
                padding: 20px;
            }

            .message-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .name {
                font-size: 20px;
            }

            .subject {
                font-size: 19px;
            }

        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <!-- ================= HEADER ================= -->

    <div class="header">

        <div class="header-left">

            <div class="logo">
                AR<span>AN</span>
            </div>

            <div class="admin-label">
                Administrator Panel
            </div>

        </div>

        <asp:Button
            ID="btnBack"
            runat="server"
            Text="← Admin Dashboard"
            CssClass="back-btn"
            CausesValidation="false"
            OnClick="btnBack_Click" />

    </div>


    <!-- ================= MAIN CONTAINER ================= -->

    <div class="container">


        <!-- ================= TITLE ================= -->

        <div class="title-section">

            <div class="title">

                <span class="title-icon">💬</span>
                Contact Messages

            </div>

            <div class="subtitle">

                Messages and enquiries received
                from ARAN community members

            </div>

        </div>


        <!-- ================= INFO BAR ================= -->

        <div class="info-bar">

            <div class="info-text">

                📩
                <strong>Community Communication</strong>

                <br />

                Review messages submitted through
                the ARAN Contact page.

            </div>

            <div class="message-count">

                💬 Messages

            </div>

        </div>


        <!-- ================= MESSAGES ================= -->

        <asp:Repeater
            ID="rptMessages"
            runat="server">

            <ItemTemplate>

                <div class="message-card">


                    <!-- MESSAGE HEADER -->

                    <div class="message-header">

                        <div class="name">

                            👤
                            <%# Eval("Name") %>

                        </div>

                        <div class="date">

                            📅
                            <%# Eval(
                                "MessageDate",
                                "{0:dd MMM yyyy, hh:mm tt}"
                            ) %>

                        </div>

                    </div>


                    <!-- SUBJECT -->

                    <div class="subject">

                        📝
                        <%# Eval("Subject") %>

                    </div>


                    <!-- EMAIL -->

                    <div class="email">

                        📧
                        <%# Eval("Email") %>

                    </div>


                    <!-- MESSAGE -->

                    <div class="message-label">

                        Message

                    </div>

                    <div class="message">

                        <%# Eval("Message") %>

                    </div>


                </div>

            </ItemTemplate>

        </asp:Repeater>


        <!-- ================= EMPTY MESSAGE ================= -->

        <asp:Panel
            ID="pnlEmpty"
            runat="server"
            CssClass="empty"
            Visible="false">

            <div class="empty-icon">
                💬
            </div>

            <div>
                No contact messages available.
            </div>

            <div style="font-size:15px; margin-top:8px; color:#7f8b97;">
                Messages submitted by community members
                will appear here.
            </div>

        </asp:Panel>


        <!-- ================= FOOTER ================= -->

        <div class="footer">

            ARAN Community Emergency Support System
            <br />
            Administrator Communication Center

        </div>


    </div>

</form>

</body>

</html>