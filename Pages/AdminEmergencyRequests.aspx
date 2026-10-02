<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AdminEmergencyRequests.aspx.cs"
    Inherits="AranCommunitySupport.Pages.AdminEmergencyRequests" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>ARAN | Emergency Requests</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: "Times New Roman", serif;
            background: #080b18;
            color: #ffffff;
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
            font-size: 19px;
            font-weight: bold;
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
            max-width: 1250px;
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
            text-decoration: none;
            border: 1px solid #343850;
            background: #15182a;
            color: #ffffff;
            padding: 12px 20px;
            border-radius: 10px;
            font-family: inherit;
            font-size: 15px;
            cursor: pointer;
        }

        .back-btn:hover {
            background: #20243b;
        }

        .request-card {
            background: #101426;
            border: 1px solid #292d47;
            border-radius: 18px;
            padding: 25px;
            margin-bottom: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,.20);
        }

        .request-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .request-id {
            color: #9d7cff;
            font-size: 15px;
            font-weight: bold;
        }

        .status {
            padding: 7px 14px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
        }

        .status-pending {
            background: rgba(255, 174, 0, .12);
            color: #ffc247;
            border: 1px solid rgba(255, 194, 71, .3);
        }

        .status-supported {
            background: rgba(54, 211, 153, .12);
            color: #36d399;
            border: 1px solid rgba(54, 211, 153, .3);
        }

        .person-name {
            font-size: 25px;
            font-weight: bold;
            margin-bottom: 18px;
        }

        .details-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
            margin-bottom: 18px;
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
            margin-bottom: 6px;
        }

        .detail-value {
            color: #ffffff;
            font-size: 16px;
            word-break: break-word;
        }

        .emergency-type {
            color: #ff5b79;
            font-weight: bold;
        }

        .description {
            background: #0c0f1d;
            border-left: 4px solid #8b3dff;
            padding: 16px;
            border-radius: 8px;
            margin-bottom: 20px;
            color: #c9ccda;
            line-height: 1.6;
        }

        .bottom-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
        }

        .date {
            color: #858ba8;
            font-size: 14px;
        }

        .status-update {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .status-dropdown {
            background: #171a2d;
            color: #ffffff;
            border: 1px solid #363b58;
            padding: 10px 14px;
            border-radius: 9px;
            font-family: inherit;
            font-size: 15px;
            outline: none;
        }

        .update-btn {
            background: linear-gradient(135deg, #ff3158, #8b3dff);
            border: none;
            color: white;
            padding: 11px 18px;
            border-radius: 9px;
            font-family: inherit;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
        }

        .update-btn:hover {
            opacity: .88;
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

        @media(max-width: 850px) {

            .topbar {
                padding: 0 20px;
            }

            .container {
                width: 94%;
            }

            .details-grid {
                grid-template-columns: 1fr;
            }

            .header {
                flex-direction: column;
                align-items: flex-start;
                gap: 20px;
            }

            .bottom-row {
                flex-direction: column;
                align-items: flex-start;
            }

            .status-update {
                width: 100%;
                flex-wrap: wrap;
            }
        }

    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="topbar">

        <div class="logo">
            <div class="shield">A</div>
            <div class="logo-text">ARAN</div>
        </div>

        <div class="admin-badge">
            🛡️ Administrator
        </div>

    </div>

    <div class="container">

        <div class="header">

            <div>
                <h1>🚨 Emergency Requests</h1>
                <p>Monitor and manage community emergency support requests.</p>
            </div>

            <asp:Button
                ID="btnBack"
                runat="server"
                Text="← Admin Dashboard"
                CssClass="back-btn"
                OnClick="btnBack_Click" />

        </div>


        <asp:Repeater
            ID="rptRequests"
            runat="server"
            OnItemDataBound="rptRequests_ItemDataBound"
            OnItemCommand="rptRequests_ItemCommand">

            <ItemTemplate>

                <div class="request-card">

                    <div class="request-top">

                        <div class="request-id">
                            REQUEST #<%# Eval("RequestID") %>
                        </div>

                        <asp:Label
                            ID="lblStatus"
                            runat="server"
                            CssClass="status">
                        </asp:Label>

                    </div>


                    <div class="person-name">
                        <%# Eval("Name") %>
                    </div>


                    <div class="details-grid">

                        <div class="detail-box">
                            <span class="detail-label">📞 Phone</span>
                            <span class="detail-value">
                                <%# Eval("Phone") %>
                            </span>
                        </div>

                        <div class="detail-box">
                            <span class="detail-label">✉ Email</span>
                            <span class="detail-value">
                                <%# Eval("Email") %>
                            </span>
                        </div>

                        <div class="detail-box">
                            <span class="detail-label">📍 Location</span>
                            <span class="detail-value">
                                <%# Eval("Location") %>
                            </span>
                        </div>

                        <div class="detail-box">
                            <span class="detail-label">🚨 Emergency Type</span>
                            <span class="detail-value emergency-type">
                                <%# Eval("EmergencyType") %>
                            </span>
                        </div>

                    </div>


                    <div class="description">

                        <strong>Description</strong>
                        <br /><br />

                        <%# Eval("Description") %>

                    </div>


                    <div class="bottom-row">

                        <div class="date">
                            🕒 <%# Eval("RequestDate", "{0:dd MMM yyyy, hh:mm tt}") %>
                        </div>


                        <div class="status-update">

                            <asp:DropDownList
                                ID="ddlStatus"
                                runat="server"
                                CssClass="status-dropdown">

                                <asp:ListItem Text="Pending" Value="Pending" />
                                <asp:ListItem Text="Supported" Value="Supported" />

                            </asp:DropDownList>


                            <asp:Button
                                ID="btnUpdate"
                                runat="server"
                                Text="Update Status"
                                CssClass="update-btn"
                                CommandName="UpdateStatus"
                                CommandArgument='<%# Eval("RequestID") %>' />

                        </div>

                    </div>

                </div>

            </ItemTemplate>

        </asp:Repeater>


        <asp:Panel
            ID="pnlEmpty"
            runat="server"
            CssClass="empty"
            Visible="false">

            <div style="font-size:50px; margin-bottom:15px;">
                🕊️
            </div>

            <div>
                No emergency requests found.
            </div>

        </asp:Panel>

    </div>

</form>

</body>
</html>