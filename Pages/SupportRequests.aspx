<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="SupportRequests.aspx.cs"
    Inherits="AranCommunitySupport.Pages.SupportRequests" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Support Requests - ARAN</title>

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
            background: linear-gradient(135deg, #111820, #18232e);
            padding: 22px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #263442;
        }

        .logo {
            font-size: 30px;
            font-weight: bold;
            letter-spacing: 3px;
            color: #ffffff;
        }

        .logo span {
            color: #e53935;
        }

        .back-btn {
            background: transparent;
            color: white;
            border: 1px solid #607080;
            padding: 10px 20px;
            border-radius: 8px;
            font-family: "Times New Roman", serif;
            font-size: 16px;
            cursor: pointer;
        }

        .back-btn:hover {
            background: #263442;
        }

        .main-container {
            width: 90%;
            max-width: 1200px;
            margin: 40px auto;
        }

        .page-title {
            text-align: center;
            font-size: 38px;
            margin-bottom: 8px;
        }

        .page-subtitle {
            text-align: center;
            color: #aeb8c2;
            font-size: 18px;
            margin-bottom: 35px;
        }

        .requests-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 25px;
        }

        .request-card {
            background: #151d26;
            border: 1px solid #2b3947;
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.25);
            transition: 0.3s;
        }

        .request-card:hover {
            transform: translateY(-5px);
            border-color: #e53935;
        }

        .request-type {
            color: #ff5252;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .request-description {
            color: #d6dde4;
            font-size: 17px;
            line-height: 1.5;
            margin-bottom: 18px;
        }

        .details {
            background: #10161d;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
        }

        .details p {
            margin: 8px 0;
            color: #c8d0d8;
            font-size: 16px;
        }

        .details strong {
            color: white;
        }

        .status {
            display: inline-block;
            padding: 7px 14px;
            border-radius: 20px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .pending {
            background: #5a4215;
            color: #ffd166;
            border: 1px solid #80611d;
        }

        .supported {
            background: #173d2a;
            color: #66e39a;
            border: 1px solid #2b7048;
        }

        .support-btn {
            width: 100%;
            padding: 13px;
            border: none;
            border-radius: 9px;
            background: #e53935;
            color: white;
            font-family: "Times New Roman", serif;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
        }

        .support-btn:hover {
            background: #ff4b47;
        }

        .already-supported {
            width: 100%;
            padding: 13px;
            border-radius: 9px;
            background: #173d2a;
            color: #66e39a;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
        }

        .no-requests {
            text-align: center;
            background: #151d26;
            border: 1px solid #2b3947;
            border-radius: 15px;
            padding: 40px;
            color: #aeb8c2;
            font-size: 20px;
        }

        @media (max-width: 600px) {

            .header {
                padding: 18px 20px;
            }

            .logo {
                font-size: 24px;
            }

            .main-container {
                width: 94%;
            }

            .page-title {
                font-size: 30px;
            }
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <!-- HEADER -->
    <div class="header">

        <div class="logo">
            AR<span>AN</span>
        </div>

        <asp:Button
            ID="btnBack"
            runat="server"
            Text="← Dashboard"
            CssClass="back-btn"
            CausesValidation="false"
            OnClick="btnBack_Click" />

    </div>


    <!-- MAIN CONTENT -->
    <div class="main-container">

        <div class="page-title">
            Emergency Support Requests
        </div>

        <div class="page-subtitle">
            Stand together. Support someone in need. ❤️
        </div>


        <!-- REQUESTS -->
        <div class="requests-grid">

            <asp:Repeater
                ID="rptRequests"
                runat="server"
                OnItemCommand="rptRequests_ItemCommand"
                OnItemDataBound="rptRequests_ItemDataBound">

                <ItemTemplate>

                    <div class="request-card">

                        <!-- Emergency Type -->
                        <div class="request-type">
                            🚨 <%# Eval("EmergencyType") %>
                        </div>


                        <!-- Description -->
                        <div class="request-description">
                            <%# Eval("Description") %>
                        </div>


                        <!-- Request Details -->
                        <div class="details">

                            <p>
                                <strong>👤 Name:</strong>
                                <%# Eval("Name") %>
                            </p>

                            <p>
                                <strong>📍 Location:</strong>
                                <%# Eval("Location") %>
                            </p>

                            <p>
                                <strong>📞 Phone:</strong>
                                <%# Eval("Phone") %>
                            </p>

                        </div>


                        <!-- STATUS -->
                        <asp:Label
                            ID="lblStatus"
                            runat="server"
                            Text='<%# Eval("Status") %>'
                            CssClass="status">
                        </asp:Label>


                        <!-- SUPPORT BUTTON -->
                        <asp:Button
                            ID="btnSupport"
                            runat="server"
                            Text="❤️ Support This Signal"
                            CssClass="support-btn"
                            CommandName="SupportRequest"
                            CommandArgument='<%# Eval("RequestID") %>'
                            CausesValidation="false" />


                        <!-- ALREADY SUPPORTED -->
                        <asp:Label
                            ID="lblAlreadySupported"
                            runat="server"
                            Text="✓ Already Supported"
                            CssClass="already-supported"
                            Visible="false">
                        </asp:Label>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>


        <!-- NO REQUESTS MESSAGE -->
        <asp:Panel
            ID="pnlNoRequests"
            runat="server"
            CssClass="no-requests"
            Visible="false">

            No emergency support requests are currently available. ❤️

        </asp:Panel>

    </div>

</form>

</body>
</html>