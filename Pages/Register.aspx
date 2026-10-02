<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AranCommunitySupport.Pages.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>ARAN | Create Account</title>
    <q></q>
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
            padding: 40px 15px;

            background:
                radial-gradient(circle at 15% 15%, rgba(255,79,97,0.20), transparent 25%),
                radial-gradient(circle at 85% 85%, rgba(120,85,255,0.22), transparent 25%),
                linear-gradient(135deg, #070a16, #12183a, #090b18);

            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* ================= BACKGROUND ================= */

        .background-circle {
            position: fixed;
            border-radius: 50%;
            border: 1px solid rgba(255,255,255,0.06);
            pointer-events: none;
        }

        .circle-one {
            width: 500px;
            height: 500px;
            top: -250px;
            left: -180px;
        }

        .circle-two {
            width: 600px;
            height: 600px;
            bottom: -300px;
            right: -200px;
        }

        /* ================= MAIN CARD ================= */

        .register-container {
            width: 100%;
            max-width: 1120px;
            min-height: 680px;

            display: grid;
            grid-template-columns: 1fr 1.25fr;

            border-radius: 30px;
            overflow: hidden;

            background: rgba(15, 20, 48, 0.96);
            border: 1px solid rgba(255,255,255,0.10);

            box-shadow: 0 30px 80px rgba(0,0,0,0.45);

            position: relative;
            z-index: 2;
        }

        /* ================= LEFT BRAND ================= */

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
            width: 380px;
            height: 380px;
            border-radius: 50%;
            border: 1px solid rgba(255,255,255,0.10);
            right: -180px;
            top: -150px;
        }

        .brand-logo {
            font-size: 44px;
            font-weight: bold;
            letter-spacing: 5px;
            margin-bottom: 45px;
        }

        .brand-logo span {
            color: #ff8a97;
        }

        .brand-icon {
            font-size: 105px;
            margin-bottom: 25px;
        }

        .brand-section h1 {
            font-size: 42px;
            line-height: 1.25;
            margin-bottom: 20px;
        }

        .brand-section h1 span {
            color: #ff9aa6;
        }

        .brand-section p {
            color: #f0dfe5;
            font-size: 18px;
            line-height: 1.8;
        }

        .brand-points {
            margin-top: 30px;
        }

        .brand-points div {
            margin-bottom: 14px;
            color: #f5e9ee;
            font-size: 16px;
        }

        /* ================= REGISTER SECTION ================= */

        .register-section {
            padding: 55px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .mobile-logo {
            display: none;
        }

        .register-header h2 {
            font-size: 38px;
            margin-bottom: 10px;
        }

        .register-header p {
            color: #aeb6d3;
            margin-bottom: 30px;
            font-size: 16px;
            line-height: 1.6;
        }

        /* ================= FORM ================= */

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #e7e9f6;
            font-weight: bold;
            font-size: 16px;
        }

        .form-control {
            width: 100%;
            padding: 14px 16px;
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

        select.form-control option {
            background: #101632;
            color: white;
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
            font-size: 13px;
            font-weight: bold;
            user-select: none;
        }

        .show-password:hover {
            color: #ff8c98;
        }

        /* ================= TERMS ================= */

        .terms {
            display: flex;
            align-items: flex-start;
            gap: 10px;
            margin: 5px 0 24px;
            color: #aeb6d3;
            font-size: 14px;
            line-height: 1.5;
        }

        .terms input {
            margin-top: 3px;
            accent-color: #ff5668;
            width: 16px;
            height: 16px;
        }

        .terms a {
            color: #ff7886;
            text-decoration: none;
            font-weight: bold;
        }

        /* ================= BUTTON ================= */

        .register-btn {
            width: 100%;
            padding: 16px;
            border: none;
            border-radius: 13px;
            cursor: pointer;
            color: white;
            font-family: "Times New Roman", Times, serif;
            font-size: 18px;
            font-weight: bold;

            background: linear-gradient(135deg, #ff4f61, #8b56ff);

            transition: 0.3s;
            box-shadow: 0 15px 35px rgba(255,79,97,0.18);
        }

        .register-btn:hover {
            transform: translateY(-4px);
            box-shadow: 0 20px 45px rgba(255,79,97,0.28);
        }

        /* ================= LOGIN ================= */

        .login-text {
            margin-top: 25px;
            text-align: center;
            color: #aeb6d3;
        }

        .login-text a {
            color: #ff7b89;
            text-decoration: none;
            font-weight: bold;
        }

        .login-text a:hover {
            color: white;
        }

        .register-footer {
            margin-top: 28px;
            text-align: center;
            color: #747d9e;
            font-size: 13px;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 900px) {

            .register-container {
                grid-template-columns: 1fr;
                max-width: 600px;
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
                margin-bottom: 25px;
            }

            .mobile-logo span {
                color: #ff6d7c;
            }

            .register-section {
                padding: 45px 30px;
            }
        }

        @media (max-width: 550px) {

            .form-row {
                grid-template-columns: 1fr;
                gap: 0;
            }

            .register-header h2 {
                font-size: 32px;
            }

            .register-section {
                padding: 40px 22px;
            }
        }

    </style>

</head>

<body>

    <div class="background-circle circle-one"></div>
    <div class="background-circle circle-two"></div>

    <form id="form1" runat="server">

        <div class="register-container">

            <!-- BRAND SECTION -->

            <div class="brand-section">

                <div class="brand-logo">
                    🛡️ AR<span>AN</span>
                </div>

                <div class="brand-icon">
                    🤝
                </div>

                <h1>
                    Join a Community
                    That <span>Stands Together.</span>
                </h1>

                <p>
                    Create your ARAN account and become part of a
                    digital community that connects people during
                    difficult and unexpected emergencies.
                </p>

                <div class="brand-points">

                    <div>🛡️ Share emergency signals responsibly</div>
                    <div>❤️ Support people in difficult moments</div>
                    <div>🤝 Build a stronger community together</div>

                </div>

            </div>


            <!-- REGISTER SECTION -->

            <div class="register-section">

                <div class="mobile-logo">
                    🛡️ AR<span>AN</span>
                </div>

                <div class="register-header">

                    <h2>
                        Create Account ✨
                    </h2>

                    <p>
                        Join ARAN and become part of a stronger,
                        safer and more connected community.
                    </p>

                </div>


                <!-- NAME & PHONE -->

                <div class="form-row">

                    <div class="form-group">

                        <label>Full Name</label>

                       <asp:TextBox ID="txtName"
    runat="server"
    CssClass="form-control"
    placeholder="Enter your full name">
</asp:TextBox>
                    </div>


                    <div class="form-group">

                        <label>Phone Number</label>

                       <asp:TextBox ID="txtPhone"
    runat="server"
    CssClass="form-control"
    placeholder="Enter your phone number"
    TextMode="Phone">
</asp:TextBox>

                    </div>

                </div>


                <!-- EMAIL -->

                <div class="form-group">

                    <label>Email Address</label>

                   <asp:TextBox ID="txtEmail"
    runat="server"
    CssClass="form-control"
    placeholder="Enter your email address"
    TextMode="Email">
</asp:TextBox>

                </div>


                <!-- ROLE -->

                <div class="form-group">

                    <label>Join As</label>

                   <asp:DropDownList ID="ddlRole"
    runat="server"
    CssClass="form-control">

    <asp:ListItem Value="">
        Select your role
    </asp:ListItem>

    <asp:ListItem Value="Community Member">
        Community Member
    </asp:ListItem>

    <asp:ListItem Value="Volunteer">
        Volunteer
    </asp:ListItem>

    <asp:ListItem Value="Emergency Coordinator">
        Emergency Coordinator
    </asp:ListItem>

</asp:DropDownList>

                </div>


                <!-- PASSWORD -->

                <div class="form-row">

                    <div class="form-group">

                        <label>Password</label>

                        <div class="password-wrapper">

                           <asp:TextBox ID="txtPassword"
    runat="server"
    CssClass="form-control"
    placeholder="Create password"
    TextMode="Password">
</asp:TextBox>
                            <span class="show-password"
                                  onclick="togglePassword('txtPassword', this)">
                                SHOW
                            </span>

                        </div>

                    </div>


                    <div class="form-group">

                        <label>Confirm Password</label>

                        <div class="password-wrapper">

                           <asp:TextBox ID="txtConfirmPassword"
    runat="server"
    CssClass="form-control"
    placeholder="Confirm password"
    TextMode="Password">
</asp:TextBox>

                            <span class="show-password"
                                  onclick="togglePassword('txtConfirmPassword', this)">
                                SHOW
                            </span>

                        </div>

                    </div>

                </div>


                <!-- TERMS -->

               <label class="terms">

    <asp:CheckBox ID="chkTerms" runat="server" />

    <span>
        I agree to the
        <a href="#">Terms of Use</a>
        and
        <a href="#">Privacy Policy</a>.
    </span>

</label>

                <!-- REGISTER BUTTON -->

              <asp:Button ID="btnRegister"
    runat="server"
    Text="🛡️ Create My ARAN Account"
    CssClass="register-btn"
    OnClick="btnRegister_Click" />


                <!-- LOGIN -->

                <div class="login-text">

                    Already have an account?

                    <a href="Login.aspx">
                        Login Here
                    </a>

                </div>


                <div class="register-footer">

                    © 2026 ARAN Community Emergency Support System

                </div>

            </div>

        </div>

    </form>


    <script type="text/javascript">

        function togglePassword(inputId, element) {

            var password = document.getElementById(inputId);

            if (password.type === "password") {

                password.type = "text";
                element.innerHTML = "HIDE";

            }
            else {

                password.type = "password";
                element.innerHTML = "SHOW";

            }

        }

    </script>

</body>

</html>