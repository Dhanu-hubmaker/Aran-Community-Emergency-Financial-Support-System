<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="AranCommunitySupport.Pages.Contact" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>ARAN | Contact & Help</title>

    <style type="text/css">

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Times New Roman", Times, serif;
            background:
                radial-gradient(circle at 15% 20%, rgba(255,79,97,0.18), transparent 25%),
                radial-gradient(circle at 85% 80%, rgba(120,85,255,0.20), transparent 25%),
                linear-gradient(135deg, #070a16, #12183a, #090b18);
            color: white;
            overflow-x: hidden;
        }


        /* ================= NAVBAR ================= */

        .navbar {
            width: 100%;
            min-height: 82px;
            padding: 0 8%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: rgba(8, 12, 30, 0.96);
            border-bottom: 1px solid rgba(255,255,255,0.08);
        }

        .logo {
            font-size: 34px;
            font-weight: bold;
            letter-spacing: 4px;
        }

        .logo span {
            color: #ff5f70;
        }

        .nav-links {
            display: flex;
            gap: 22px;
            align-items: center;
        }

        .nav-links a {
            color: #d8dbeb;
            text-decoration: none;
            font-weight: bold;
            font-size: 16px;
            transition: 0.3s;
        }

        .nav-links a:hover {
            color: #ff7886;
        }


        /* ================= HERO ================= */

        .hero {
            padding: 90px 8% 70px;
            text-align: center;
        }

        .hero-badge {
            display: inline-block;
            padding: 10px 24px;
            border-radius: 25px;
            margin-bottom: 25px;
            color: #ff9ba6;
            font-weight: bold;
            background: rgba(255,79,97,0.12);
            border: 1px solid rgba(255,79,97,0.25);
        }

        .hero h1 {
            font-size: 52px;
            margin-bottom: 20px;
        }

        .hero h1 span {
            color: #ff6374;
        }

        .hero p {
            max-width: 720px;
            margin: auto;
            color: #b5bdd8;
            font-size: 18px;
            line-height: 1.8;
        }


        /* ================= CONTACT CARDS ================= */

        .contact-section {
            padding: 20px 8% 80px;
        }

        .contact-grid {
            max-width: 1150px;
            margin: auto;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }

        .contact-card {
            padding: 35px 28px;
            border-radius: 25px;
            background: rgba(18, 24, 52, 0.95);
            border: 1px solid rgba(255,255,255,0.08);
            text-align: center;
            transition: 0.3s;
        }

        .contact-card:hover {
            transform: translateY(-8px);
            border-color: rgba(255,79,97,0.35);
        }

        .contact-icon {
            font-size: 48px;
            margin-bottom: 18px;
        }

        .contact-card h3 {
            font-size: 25px;
            margin-bottom: 12px;
        }

        .contact-card p {
            color: #aeb6d3;
            line-height: 1.7;
            font-size: 16px;
        }

        .contact-card strong {
            color: #ff8b97;
            display: block;
            margin-top: 15px;
            font-size: 17px;
        }


        /* ================= MAIN CONTACT ================= */

        .main-contact {
            padding: 30px 8% 100px;
        }

        .contact-container {
            max-width: 1150px;
            margin: auto;
            display: grid;
            grid-template-columns: 1fr 1.1fr;
            gap: 40px;
        }


        /* ================= INFO ================= */

        .help-info {
            padding: 50px 40px;
            border-radius: 30px;
            background:
                radial-gradient(circle at 20% 10%, rgba(255,255,255,0.08), transparent 25%),
                linear-gradient(135deg, #251e55, #4c234a, #7d304f);
        }

        .help-info h2 {
            font-size: 38px;
            margin-bottom: 20px;
        }

        .help-info h2 span {
            color: #ffb0b9;
        }

        .help-info p {
            color: #f0dfe5;
            line-height: 1.8;
            font-size: 17px;
            margin-bottom: 28px;
        }

        .help-list div {
            margin-bottom: 18px;
            color: #f7e9ed;
            font-size: 16px;
        }


        /* ================= FORM ================= */

        .contact-form-box {
            padding: 50px 40px;
            border-radius: 30px;
            background: #101632;
            border: 1px solid rgba(255,255,255,0.08);
        }

        .contact-form-box h2 {
            font-size: 36px;
            margin-bottom: 10px;
        }

        .contact-form-box p {
            color: #aeb6d3;
            margin-bottom: 30px;
            line-height: 1.7;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 9px;
            font-weight: bold;
            color: #e8eaf7;
        }

        .form-control {
            width: 100%;
            padding: 15px 16px;
            border-radius: 12px;
            border: 1px solid #303961;
            background: #090e23;
            color: white;
            font-family: "Times New Roman", Times, serif;
            font-size: 16px;
            outline: none;
        }

        .form-control:focus {
            border-color: #ff5f70;
            box-shadow: 0 0 0 3px rgba(255,95,112,0.10);
        }

        textarea.form-control {
            resize: none;
            height: 130px;
        }

        .send-btn {
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
        }

        .send-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 18px 35px rgba(255,79,97,0.22);
        }


        /* ================= EMERGENCY NOTICE ================= */

        .notice-section {
            padding: 0 8% 90px;
        }

        .notice-box {
            max-width: 1150px;
            margin: auto;
            padding: 35px;
            border-radius: 25px;
            text-align: center;
            background: rgba(255,79,97,0.10);
            border: 1px solid rgba(255,79,97,0.28);
        }

        .notice-box h2 {
            font-size: 28px;
            margin-bottom: 12px;
            color: #ff8a97;
        }

        .notice-box p {
            color: #d8dced;
            line-height: 1.7;
            font-size: 16px;
        }


        /* ================= FOOTER ================= */

        footer {
            background: #050713;
            padding: 40px 8%;
            text-align: center;
            border-top: 1px solid rgba(255,255,255,0.06);
        }

        footer h2 {
            font-size: 30px;
            letter-spacing: 4px;
            margin-bottom: 10px;
        }

        footer h2 span {
            color: #ff5668;
        }

        footer p {
            color: #8992b4;
            margin-top: 8px;
        }


        /* ================= RESPONSIVE ================= */

        @media (max-width: 900px) {

            .navbar {
                flex-direction: column;
                padding: 20px;
                gap: 18px;
            }

            .nav-links {
                flex-wrap: wrap;
                justify-content: center;
            }

            .contact-grid {
                grid-template-columns: 1fr;
            }

            .contact-container {
                grid-template-columns: 1fr;
            }

            .hero h1 {
                font-size: 40px;
            }
        }

        @media (max-width: 500px) {

            .help-info,
            .contact-form-box {
                padding: 35px 22px;
            }

            .hero {
                padding-top: 60px;
            }

            .hero h1 {
                font-size: 34px;
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

        <div class="nav-links">
            <a href="Home.aspx">Home</a>
            <a href="EmergencyRequest.aspx">Emergency</a>
            <a href="SupportRequests.aspx">Support</a>
            <a href="About.aspx">About</a>
        </div>

    </div>


    <!-- HERO -->

    <section class="hero">

        <div class="hero-badge">
            💬 CONTACT & HELP CENTER
        </div>

        <h1>
            We're Here When
            <span>You Need Support.</span>
        </h1>

        <p>
            Have a question, need assistance, or want to learn more about ARAN?
            Reach out to us and become part of a community that believes
            support should always be within reach.
        </p>

    </section>


    <!-- CONTACT CARDS -->

    <section class="contact-section">

        <div class="contact-grid">

            <div class="contact-card">

                <div class="contact-icon">📧</div>

                <h3>Email Support</h3>

                <p>
                    Send us your questions and we will help you
                    with the information you need.
                </p>

                <strong>support@aran.com</strong>

            </div>


            <div class="contact-card">

                <div class="contact-icon">📞</div>

                <h3>Community Help</h3>

                <p>
                    Connect with our support team for guidance
                    regarding the ARAN platform.
                </p>

                <strong>Community Support Center</strong>

            </div>


            <div class="contact-card">

                <div class="contact-icon">🛡️</div>

                <h3>Safety Guidance</h3>

                <p>
                    Learn how to use ARAN responsibly while
                    sharing and responding to emergency requests.
                </p>

                <strong>Stay Safe • Stay Connected</strong>

            </div>

        </div>

    </section>


    <!-- MAIN CONTACT -->

    <section class="main-contact">

        <div class="contact-container">


            <!-- HELP INFO -->

            <div class="help-info">

                <h2>
                    Every Message Can
                    <span>Create a Connection.</span>
                </h2>

                <p>
                    ARAN is built around the idea that communication
                    can become the first step toward meaningful support.
                    If you need guidance, our help space is always open.
                </p>

                <div class="help-list">

                    <div>🤝 Community support and guidance</div>
                    <div>📌 Help using ARAN features</div>
                    <div>🛡️ Responsible emergency communication</div>
                    <div>💡 Suggestions to improve ARAN</div>

                </div>

            </div>


            <!-- CONTACT FORM -->

            <div class="contact-form-box">

                <h2>Send Us a Message 💬</h2>

                <p>
                    Share your question, feedback or suggestion.
                </p>


                <div class="form-group">

                    <label>Your Name</label>

                   <asp:TextBox 
    ID="txtName"
    runat="server"
    CssClass="form-control"
    placeholder="Enter your name">
</asp:TextBox>

                </div>


                <div class="form-group">

                    <label>Email Address</label>

                    <asp:TextBox 
    ID="txtEmail"
    runat="server"
    TextMode="Email"
    CssClass="form-control"
    placeholder="Enter your email">
</asp:TextBox>

                </div>


                <div class="form-group">

                    <label>Subject</label>

                    <asp:TextBox 
    ID="txtSubject"
    runat="server"
    CssClass="form-control"
    placeholder="What is your message about?">
</asp:TextBox>

                </div>


                <div class="form-group">

                    <label>Your Message</label>

                   <asp:TextBox 
    ID="txtMessage"
    runat="server"
    TextMode="MultiLine"
    CssClass="form-control"
    placeholder="Write your message here...">
</asp:TextBox>
                </div>


                <asp:Button 
    ID="btnSend"
    runat="server"
    Text="📩 Send Message"
    CssClass="send-btn"
    OnClick="btnSend_Click" />
            </div>

        </div>

    </section>


    <!-- NOTICE -->

    <section class="notice-section">

        <div class="notice-box">

            <h2>🚨 In an Immediate Life-Threatening Emergency</h2>

            <p>
                Please contact your local emergency services immediately.
                ARAN is designed as a community support platform and should
                not replace official emergency services.
            </p>

        </div>

    </section>


    <!-- FOOTER -->

    <footer>

        <h2>
            🛡️ AR<span>AN</span>
        </h2>

        <p>
            A Digital Safety Net for Communities
        </p>

        <p>
            © 2026 ARAN Community Emergency Support System
        </p>

    </footer>

</form>

</body>

</html>