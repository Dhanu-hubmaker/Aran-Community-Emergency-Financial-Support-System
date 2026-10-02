<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AdminLogin.aspx.cs"
    Inherits="AranCommunitySupport.Pages.AdminLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Admin Login - ARAN</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: "Times New Roman", serif;
            background: linear-gradient(135deg, #0b0f14, #171321, #24131a);
            color: white;
        }

        .login-container {
            width: 420px;
            padding: 40px;
            background: rgba(21, 29, 38, 0.97);
            border: 1px solid #3b4654;
            border-radius: 20px;
            box-shadow: 0 15px 45px rgba(0,0,0,0.5);
        }

        .logo {
            text-align: center;
            font-size: 38px;
            font-weight: bold;
            letter-spacing: 4px;
            margin-bottom: 10px;
        }

        .logo span {
            color: #e53935;
        }

        .admin-icon {
            text-align: center;
            font-size: 55px;
            margin-bottom: 10px;
        }

        .title {
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .subtitle {
            text-align: center;
            color: #aeb8c2;
            font-size: 16px;
            margin-bottom: 30px;
        }

        .input-label {
            display: block;
            margin-bottom: 8px;
            font-size: 17px;
            font-weight: bold;
        }

        .input-box {
            width: 100%;
            padding: 13px;
            margin-bottom: 20px;
            background: #10161d;
            border: 1px solid #394756;
            border-radius: 9px;
            color: white;
            font-family: "Times New Roman", serif;
            font-size: 16px;
            outline: none;
        }

        .input-box:focus {
            border-color: #e53935;
        }

        .login-btn {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 9px;
            background: #e53935;
            color: white;
            font-family: "Times New Roman", serif;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 5px;
        }

        .login-btn:hover {
            background: #ff4b47;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 22px;
            color: #aeb8c2;
            text-decoration: none;
            font-size: 16px;
        }

        .back-link:hover {
            color: white;
        }

        .admin-note {
            text-align: center;
            margin-top: 25px;
            padding: 12px;
            background: #241b1b;
            border: 1px solid #493333;
            border-radius: 9px;
            color: #ffb4b4;
            font-size: 14px;
        }

        @media (max-width: 500px) {
            .login-container {
                width: 92%;
                padding: 30px 25px;
            }
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="login-container">

        <div class="logo">
            AR<span>AN</span>
        </div>

        <div class="admin-icon">
            👨‍💼
        </div>

        <div class="title">
            Admin Login
        </div>

        <div class="subtitle">
            Secure access to ARAN administration
        </div>

        <label class="input-label">
            Email Address
        </label>

        <asp:TextBox
            ID="txtEmail"
            runat="server"
            CssClass="input-box"
            placeholder="Enter admin email">
        </asp:TextBox>

        <label class="input-label">
            Password
        </label>

        <asp:TextBox
            ID="txtPassword"
            runat="server"
            CssClass="input-box"
            TextMode="Password"
            placeholder="Enter admin password">
        </asp:TextBox>

        <asp:Button
            ID="btnAdminLogin"
            runat="server"
            Text="🔐 Admin Login"
            CssClass="login-btn"
            CausesValidation="false"
            OnClick="btnAdminLogin_Click" />

        <a href="Login.aspx" class="back-link">
            ← Back to User Login
        </a>

        <div class="admin-note">
            ⚠️ This area is restricted to authorized administrators only.
        </div>

    </div>

</form>

</body>
</html>