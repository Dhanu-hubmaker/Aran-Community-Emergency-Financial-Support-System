<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AranCommunitySupport.Pages.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>ARAN | Login</title>

    <style type="text/css">

        /* ================= GLOBAL ================= */

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Times New Roman", Times, serif;
            min-height: 100vh;
            color: white;

            background:
                radial-gradient(circle at 15% 20%, rgba(255,79,97,0.20), transparent 25%),
                radial-gradient(circle at 85% 80%, rgba(120,85,255,0.22), transparent 25%),
                linear-gradient(135deg, #070a16, #12183a, #090b18);

            display: flex;
            align-items: center;
            justify-content: center;

            padding: 30px 15px;
        }


        /* ================= BACKGROUND SHAPES ================= */

        .background-circle {
            position: fixed;
            border-radius: 50%;
            border: 1px solid rgba(255,255,255,0.05);
            pointer-events: none;
        }

        .circle-one {
            width: 450px;
            height: 450px;
            top: -150px;
            left: -150px;
        }

        .circle-two {
            width: 550px;
            height: 550px;
            bottom: -250px;
            right: -180px;
        }


        /* ================= MAIN CONTAINER ================= */

        .login-container {
            width: 100%;
            max-width: 1050px;
            min-height: 620px;

            display: grid;
            grid-template-columns: 1fr 1fr;

            border-radius: 30px;
            overflow: hidden;

            background: rgba(15, 20, 48, 0.95);

            border: 1px solid rgba(255,255,255,0.10);

            box-shadow: 0 30px 80px rgba(0,0,0,0.45);

            position: relative;
            z-index: 2;
        }


        /* ================= LEFT SIDE ================= */

        .brand-section {

            padding: 65px 55px;

            display: flex;
            flex-direction: column;
            justify-content: center;

            background:
                radial-gradient(circle at 30% 20%, rgba(255,255,255,0.10), transparent 20%),
                linear-gradient(135deg, #25205b, #431e48, #7e2c50);

            position: relative;
            overflow: hidden;
        }

        .brand-section:before {

            content: "";
            position: absolute;

            width: 350px;
            height: 350px;

            border-radius: 50%;

            border: 1px solid rgba(255,255,255,0.10);

            right: -150px;
            top: -120px;
        }


        .brand-logo {

            font-size: 45px;
            font-weight: bold;

            letter-spacing: 5px;

            margin-bottom: 45px;
        }

        .brand-logo span {
            color: #ff8794;
        }


        .shield {

            font-size: 110px;

            margin-bottom: 25px;

            animation: floatShield 3s ease-in-out infinite;
        }

        @keyframes floatShield {

            0% {
                transform: translateY(0);
            }

            50% {
                transform: translateY(-12px);
            }

            100% {
                transform: translateY(0);
            }

        }


        .brand-section h1 {

            font-size: 42px;

            line-height: 1.25;

            margin-bottom: 20px;
        }

        .brand-section h1 span {
            color: #ff9ba6;
        }


        .brand-section p {

            color: #f0dfe5;

            font-size: 18px;

            line-height: 1.8;

            max-width: 420px;
        }


        .brand-quote {

            margin-top: 35px;

            padding-left: 18px;

            border-left: 3px solid #ff9aa6;

            color: #f5e8ed;

            font-style: italic;

            line-height: 1.7;
        }


        /* ================= LOGIN SIDE ================= */

        .login-section {

            padding: 65px 55px;

            display: flex;
            flex-direction: column;
            justify-content: center;
        }


        .mobile-logo {
            display: none;
        }


        .login-header h2 {

            font-size: 38px;

            margin-bottom: 10px;
        }

        .login-header p {

            color: #aeb6d3;

            margin-bottom: 35px;

            font-size: 16px;
        }


        /* ================= FORM ================= */

        .form-group {

            display: flex;
            flex-direction: column;

            margin-bottom: 22px;
        }


        .form-group label {

            margin-bottom: 9px;

            color: #e7e9f6;

            font-weight: bold;

            font-size: 16px;
        }


        .form-control {

            width: 100%;

            padding: 15px 18px;

            background: #0b1027;

            border: 1px solid #303961;

            border-radius: 12px;

            color: white;

            font-family: "Times New Roman", Times, serif;

            font-size: 16px;

            outline: none;

            transition: 0.3s;
        }


        .form-control::placeholder {
            color: #737b9d;
        }


        .form-control:focus {

            border-color: #ff5a6b;

            box-shadow: 0 0 0 3px rgba(255,90,107,0.10);
        }


        /* ================= PASSWORD ================= */

        .password-wrapper {

            position: relative;
        }


        .show-password {

            position: absolute;

            right: 15px;

            top: 50%;

            transform: translateY(-50%);

            cursor: pointer;

            color: #aeb6d3;

            font-size: 14px;

            font-weight: bold;

            user-select: none;
        }

        .show-password:hover {
            color: #ff8c98;
        }


        /* ================= OPTIONS ================= */

        .login-options {

            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 28px;

            font-size: 14px;
        }


        .remember {

            display: flex;

            align-items: center;

            gap: 8px;

            color: #b5bdd9;
        }

        .remember input {

            accent-color: #ff5668;

            width: 16px;
            height: 16px;
        }


        .forgot-password {

            color: #ff7886;

            text-decoration: none;

            font-weight: bold;
        }

        .forgot-password:hover {
            color: #ffffff;
        }


        /* ================= BUTTON ================= */

        .login-btn {

            width: 100%;

            padding: 17px;

            border: none;

            border-radius: 13px;

            cursor: pointer;

            color: white;

            font-family: "Times New Roman", Times, serif;

            font-size: 18px;

            font-weight: bold;

            background:
                linear-gradient(135deg, #ff4f61, #8b56ff);

            transition: 0.3s;

            box-shadow: 0 15px 35px rgba(255,79,97,0.18);
        }


        .login-btn:hover {

            transform: translateY(-4px);

            box-shadow: 0 20px 45px rgba(255,79,97,0.28);
        }


        /* ================= REGISTER ================= */

        .register-text {

            margin-top: 30px;

            text-align: center;

            color: #aeb6d3;
        }

        .register-text a {

            color: #ff7b89;

            text-decoration: none;

            font-weight: bold;
        }

        .register-text a:hover {
            color: white;
        }


        /* ================= FOOTER ================= */

        .login-footer {

            margin-top: 40px;

            text-align: center;

            color: #747d9e;

            font-size: 13px;
        }


        /* ================= RESPONSIVE ================= */

        @media (max-width: 850px) {

            .login-container {
                grid-template-columns: 1fr;
                max-width: 550px;
            }


            .brand-section {
                display: none;
            }


            .mobile-logo {

                display: block;

                text-align: center;

                font-size: 35px;

                font-weight: bold;

                letter-spacing: 4px;

                margin-bottom: 30px;
            }

            .mobile-logo span {
                color: #ff6d7c;
            }


            .login-section {
                padding: 50px 30px;
            }

        }


        @media (max-width: 450px) {

            .login-options {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .login-header h2 {
                font-size: 32px;
            }

        }

    </style>

</head>


<body>


    <div class="background-circle circle-one"></div>

    <div class="background-circle circle-two"></div>


    <form id="form1" runat="server">


        <div class="login-container">


            <!-- ================= BRAND SECTION ================= -->

            <div class="brand-section">


                <div class="brand-logo">
                    🛡️ AR<span>AN</span>
                </div>


                <div class="shield">
                    🛡️
                </div>


                <h1>
                    A Community That
                    <span>Stands Together.</span>
                </h1>


                <p>
                    ARAN connects people during emergencies
                    and creates a digital safety net powered
                    by community support.
                </p>


                <div class="brand-quote">

                    “No one should face an emergency alone
                    when a community can stand together.”

                </div>


            </div>


            <!-- ================= LOGIN SECTION ================= -->

            <div class="login-section">


                <div class="mobile-logo">

                    🛡️ AR<span>AN</span>

                </div>


                <div class="login-header">

                    <h2>
                        Welcome Back 👋
                    </h2>

                    <p>
                        Login to continue supporting your community.
                    </p>

                </div>


                <!-- EMAIL -->

                <div class="form-group">

                    <label>
                        Email Address
                    </label>

                    <asp:TextBox ID="txtEmail" runat="server"
    CssClass="form-control"
    placeholder="Enter your email"
    TextMode="Email">
</asp:TextBox>

                </div>


                <!-- PASSWORD -->

                <div class="form-group">

                    <label>
                        Password
                    </label>


                    <div class="password-wrapper">

                       <asp:TextBox ID="txtPassword" runat="server"
    ClientIDMode="Static"
    CssClass="form-control"
    placeholder="Enter your password"
    TextMode="Password">
</asp:TextBox>

                        <span
                            class="show-password"
                            onclick="togglePassword()">

                            SHOW

                        </span>

                    </div>

                </div>


                <!-- OPTIONS -->

                <div class="login-options">


                    <label class="remember">

                        <input type="checkbox" />

                        Remember me

                    </label>


                    <a href="#" class="forgot-password">

                        Forgot Password?

                    </a>


                </div>


                <!-- LOGIN BUTTON -->

                <asp:Button ID="btnLogin"
    runat="server"
    Text="🔐 Login to ARAN"
    CssClass="login-btn"
    OnClick="btnLogin_Click" />


                <!-- REGISTER -->

                <div class="register-text">

                    Don't have an account?

                    <a href="Register.aspx">

                        Create Account

                    </a>

                </div>


                <div class="login-footer">

                    © 2026 ARAN Community Emergency Support System

                </div>


            </div>


        </div>


    </form>


    <script type="text/javascript">

        function togglePassword() {

            var password = document.getElementById("txtPassword");

            if (password.type === "password") {

                password.type = "text";

            }

            else {

                password.type = "password";

            }

        }

    </script>


</body>

</html>