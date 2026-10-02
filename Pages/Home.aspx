<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AranCommunitySupport.Pages.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>ARAN | A Digital Safety Net for Communities</title>

    <!-- Google Fonts: Playfair Display + Nunito Sans -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@400;500;600;700;800&family=Playfair+Display:wght@500;600;700;800&display=swap"
          rel="stylesheet" />

    <style type="text/css">

        /* ================= GLOBAL ================= */

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: 'Nunito Sans', Arial, sans-serif;
            background: #f6f7ff;
            color: #172033;
            overflow-x: hidden;
        }

        h1, h2, h3, h4 {
            font-family: 'Playfair Display', Georgia, serif;
        }


        /* ================= NAVBAR ================= */

        .navbar {
            width: 100%;
            min-height: 80px;
            padding: 0 8%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: rgba(255,255,255,0.96);
            box-shadow: 0 5px 25px rgba(20,30,70,0.08);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .logo {
            font-family: 'Playfair Display', Georgia, serif;
            font-size: 32px;
            font-weight: 800;
            letter-spacing: 3px;
            color: #141a3d;
        }

        .logo span {
            color: #ff4f61;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 28px;
        }

        .nav-links a {
            font-family: 'Nunito Sans', Arial, sans-serif;
            text-decoration: none;
            color: #333b56;
            font-weight: 700;
            font-size: 14px;
            transition: 0.3s;
        }

        .nav-links a:hover {
            color: #6d55ff;
        }

        .nav-login {
            padding: 11px 22px;
            border-radius: 30px;
            background: #141a3d;
            color: white !important;
            transition: 0.3s;
        }

        .nav-login:hover {
            background: #6d55ff;
            transform: translateY(-2px);
        }


        /* ================= HERO ================= */

        .hero {
            min-height: 680px;
            padding: 90px 8%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 60px;
            position: relative;
            overflow: hidden;

            background:
                radial-gradient(circle at 80% 25%, rgba(112,85,255,0.40), transparent 24%),
                radial-gradient(circle at 15% 95%, rgba(255,79,97,0.30), transparent 30%),
                linear-gradient(135deg, #0d1230, #20275c, #11183d);

            color: white;
        }

        .hero:before {
            content: "";
            position: absolute;
            width: 500px;
            height: 500px;
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 50%;
            right: -180px;
            top: 50px;
        }

        .hero:after {
            content: "";
            position: absolute;
            width: 350px;
            height: 350px;
            border: 1px solid rgba(255,255,255,0.07);
            border-radius: 50%;
            right: -100px;
            top: 130px;
        }

        .hero-content {
            width: 60%;
            position: relative;
            z-index: 2;
        }

        .hero-tag {
            display: inline-block;
            padding: 10px 18px;
            border-radius: 30px;
            background: rgba(255,255,255,0.10);
            border: 1px solid rgba(255,255,255,0.16);
            color: #d8ddff;
            font-size: 14px;
            font-weight: 700;
            margin-bottom: 25px;
            letter-spacing: 1px;
        }

        .hero h1 {
            font-size: 55px;
            line-height: 1.18;
            font-weight: 800;
            max-width: 750px;
            margin-bottom: 25px;
        }

        .highlight {
            color: #ff9aa3;
        }

        .hero p {
            color: #d4d9f2;
            font-size: 18px;
            line-height: 1.8;
            max-width: 650px;
            margin-bottom: 35px;
        }

        .hero-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }

        .hero-buttons a {
            font-family: 'Nunito Sans', Arial, sans-serif;
            text-decoration: none;
            padding: 16px 25px;
            border-radius: 15px;
            font-weight: 800;
            transition: 0.3s;
        }

        .primary-btn {
            color: white;
            background: linear-gradient(135deg, #ff4f61, #ff8054);
            box-shadow: 0 15px 35px rgba(255,79,97,0.25);
        }

        .secondary-btn {
            color: white;
            border: 1px solid rgba(255,255,255,0.25);
            background: rgba(255,255,255,0.10);
        }

        .hero-buttons a:hover {
            transform: translateY(-5px);
        }


        /* ================= ANIMATED SHIELD ================= */

        .signal-container {
            width: 380px;
            height: 380px;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 2;
        }

        .ring {
            position: absolute;
            border-radius: 50%;
            border: 1px solid rgba(255,255,255,0.22);
        }

        .ring-one {
            width: 170px;
            height: 170px;
        }

        .ring-two {
            width: 260px;
            height: 260px;
        }

        .ring-three {
            width: 350px;
            height: 350px;
            animation: pulse 3s infinite;
        }

        .shield-box {
            width: 135px;
            height: 135px;
            border-radius: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 65px;
            background: linear-gradient(135deg, #ff4f61, #7457ff);
            box-shadow: 0 25px 70px rgba(0,0,0,0.35);
            z-index: 5;
            animation: floating 4s ease-in-out infinite;
        }

        @keyframes pulse {
            0% {
                transform: scale(0.92);
                opacity: 0.4;
            }

            50% {
                transform: scale(1.05);
                opacity: 1;
            }

            100% {
                transform: scale(0.92);
                opacity: 0.4;
            }
        }

        @keyframes floating {
            0%, 100% {
                transform: translateY(0);
            }

            50% {
                transform: translateY(-18px);
            }
        }


        /* ================= TRUST STRIP ================= */

        .intro-strip {
            padding: 25px 8%;
            background: white;
            display: flex;
            justify-content: center;
            gap: 50px;
            flex-wrap: wrap;
            box-shadow: 0 5px 20px rgba(20,30,70,0.05);
        }

        .intro-item {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 800;
            color: #28314d;
        }

        .intro-icon {
            font-size: 24px;
        }


        /* ================= COMMON SECTION ================= */

        .section {
            padding: 100px 8%;
        }

        .section-header {
            max-width: 750px;
            margin: auto;
            text-align: center;
            margin-bottom: 60px;
        }

        .section-label {
            color: #7158ff;
            font-size: 14px;
            font-weight: 800;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        .section-header h2 {
            color: #141a3d;
            font-size: 42px;
            margin: 12px 0;
        }

        .section-header p {
            color: #6e748c;
            line-height: 1.8;
        }


        /* ================= RESPONSE JOURNEY ================= */

        .journey-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 22px;
        }

        .journey-card {
            background: white;
            border-radius: 25px;
            padding: 32px 28px;
            box-shadow: 0 15px 40px rgba(28,38,82,0.07);
            border: 1px solid #eef0f8;
            transition: 0.35s;
            position: relative;
            overflow: hidden;
        }

        .journey-card:before {
            content: "";
            position: absolute;
            width: 90px;
            height: 90px;
            border-radius: 50%;
            background: rgba(112,85,255,0.05);
            top: -35px;
            right: -35px;
        }

        .journey-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 25px 55px rgba(28,38,82,0.14);
        }

        .step-number {
            color: #ff5262;
            font-size: 12px;
            font-weight: 800;
            letter-spacing: 1px;
        }

        .journey-icon {
            font-size: 45px;
            margin: 20px 0;
        }

        .journey-card h3 {
            color: #151b3d;
            margin-bottom: 12px;
            font-size: 24px;
        }

        .journey-card p {
            color: #727991;
            font-size: 14px;
            line-height: 1.7;
        }


        /* ================= COMMUNITY PULSE ================= */

        .community-section {
            padding: 100px 8%;

            background:
                radial-gradient(circle at 15% 20%, rgba(255,79,97,0.15), transparent 25%),
                linear-gradient(135deg, #101634, #242d67);

            color: white;
        }

        .community-title {
            text-align: center;
            margin-bottom: 55px;
        }

        .community-title h2 {
            font-size: 42px;
            margin-bottom: 12px;
        }

        .community-title p {
            color: #cbd2f3;
            line-height: 1.7;
        }

        .pulse-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 22px;
        }

        .pulse-card {
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.13);
            border-radius: 22px;
            padding: 32px;
            transition: 0.3s;
        }

        .pulse-card:hover {
            transform: translateY(-8px);
            background: rgba(255,255,255,0.13);
        }

        .pulse-card .number {
            font-family: 'Playfair Display', Georgia, serif;
            font-size: 38px;
            font-weight: 800;
            color: #ff9da5;
        }

        .pulse-card p {
            margin-top: 10px;
            color: #d5dbf6;
            font-weight: 600;
        }


        /* ================= TRANSPARENCY TRACKER ================= */

        .tracker {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-wrap: wrap;
            gap: 15px;
        }

        .tracker-box {
            padding: 20px 25px;
            border-radius: 18px;
            background: white;
            box-shadow: 0 12px 30px rgba(25,35,75,0.08);
            color: #29314e;
            font-weight: 800;
        }

        .tracker-arrow {
            font-size: 24px;
            color: #7359ff;
            font-weight: bold;
        }


        /* ================= FINAL CTA ================= */

        .cta-section {
            margin: 90px 8%;
            padding: 70px 30px;
            text-align: center;
            border-radius: 35px;

            background:
                radial-gradient(circle at 80% 20%, rgba(255,255,255,0.18), transparent 25%),
                linear-gradient(135deg, #ff4f61, #7658ff);

            color: white;
        }

        .cta-section h2 {
            font-size: 42px;
            margin-bottom: 15px;
        }

        .cta-section p {
            color: rgba(255,255,255,0.9);
            margin-bottom: 30px;
            font-size: 17px;
        }

        .cta-section a {
            display: inline-block;
            font-family: 'Nunito Sans', Arial, sans-serif;
            background: white;
            color: #2b255d;
            text-decoration: none;
            padding: 16px 30px;
            border-radius: 15px;
            font-weight: 800;
            transition: 0.3s;
        }

        .cta-section a:hover {
            transform: translateY(-5px);
        }


        /* ================= FOOTER ================= */

        footer {
            padding: 55px 8%;
            background: #090d22;
            color: white;
            text-align: center;
        }

        footer h2 {
            font-family: 'Playfair Display', Georgia, serif;
            font-size: 32px;
            margin-bottom: 12px;
        }

        footer p {
            color: #9fa8cd;
            margin: 10px 0;
            font-size: 14px;
        }


        /* ================= RESPONSIVE ================= */

        @media (max-width: 1100px) {

            .journey-grid,
            .pulse-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .hero-content {
                width: 100%;
            }

            .signal-container {
                display: none;
            }
        }


        @media (max-width: 750px) {

            .navbar {
                padding: 20px;
                flex-direction: column;
                gap: 18px;
            }

            .nav-links {
                justify-content: center;
                flex-wrap: wrap;
                gap: 15px;
            }

            .hero {
                padding: 70px 8%;
                min-height: auto;
            }

            .hero h1 {
                font-size: 38px;
            }

            .section-header h2,
            .community-title h2,
            .cta-section h2 {
                font-size: 30px;
            }

            .journey-grid,
            .pulse-grid {
                grid-template-columns: 1fr;
            }

            .intro-strip {
                gap: 20px;
                flex-direction: column;
                align-items: center;
            }

            .cta-section {
                margin: 60px 5%;
            }
        }

    </style>
</head>


<body>

<form id="form1" runat="server">

    <!-- ================= NAVBAR ================= -->

    <div class="navbar">

        <div class="logo">
            🛡️ AR<span>AN</span>
        </div>

        <div class="nav-links">
            <a href="Home.aspx">Home</a>
            <a href="EmergencyRequest.aspx">Send a Signal</a>
            <a href="SupportRequests.aspx">Answer a Signal</a>
            <a href="About.aspx">About</a>
            <a href="Login.aspx" class="nav-login">Login</a>
        </div>

    </div>


    <!-- ================= HERO ================= -->

    <section class="hero">

        <div class="hero-content">

            <div class="hero-tag">
                🛡️ A DIGITAL SAFETY NET FOR COMMUNITIES
            </div>

            <h1>
                No one should face an emergency alone when a
                <span class="highlight">
                    community can stand together.
                </span>
            </h1>

            <p>
                ARAN connects people facing urgent financial emergencies
                with a caring community ready to provide transparent,
                timely and meaningful support.
            </p>

            <div class="hero-buttons">

                <a href="EmergencyRequest.aspx" class="primary-btn">
                    🚨 Send a Signal
                </a>

                <a href="SupportRequests.aspx" class="secondary-btn">
                    ❤️ Answer a Signal
                </a>

            </div>

        </div>


        <!-- ANIMATED SHIELD -->

        <div class="signal-container">

            <div class="ring ring-one"></div>
            <div class="ring ring-two"></div>
            <div class="ring ring-three"></div>

            <div class="shield-box">
                🛡️
            </div>

        </div>

    </section>


    <!-- ================= TRUST STRIP ================= -->

    <section class="intro-strip">

        <div class="intro-item">
            <span class="intro-icon">🔒</span>
            Safe & Transparent
        </div>

        <div class="intro-item">
            <span class="intro-icon">⚡</span>
            Timely Emergency Support
        </div>

        <div class="intro-item">
            <span class="intro-icon">🤝</span>
            Community Powered
        </div>

    </section>


    <!-- ================= RESPONSE JOURNEY ================= -->

    <section class="section">

        <div class="section-header">

            <div class="section-label">
                HOW ARAN RESPONDS
            </div>

            <h2>The ARAN Response Journey</h2>

            <p>
                Every emergency follows a clear path from requesting help
                to receiving meaningful community support.
            </p>

        </div>


        <div class="journey-grid">

            <div class="journey-card">

                <div class="step-number">STEP 01</div>

                <div class="journey-icon">🆘</div>

                <h3>Send a Signal</h3>

                <p>
                    Share your emergency financial requirement
                    quickly and securely.
                </p>

            </div>


            <div class="journey-card">

                <div class="step-number">STEP 02</div>

                <div class="journey-icon">🔍</div>

                <h3>Trust Check</h3>

                <p>
                    Requests are reviewed to maintain
                    trust and transparency.
                </p>

            </div>


            <div class="journey-card">

                <div class="step-number">STEP 03</div>

                <div class="journey-icon">🤝</div>

                <h3>Strength Circle</h3>

                <p>
                    Community members discover verified
                    people who need support.
                </p>

            </div>


            <div class="journey-card">

                <div class="step-number">STEP 04</div>

                <div class="journey-icon">🌱</div>

                <h3>Recovery Path</h3>

                <p>
                    Track progress and move towards
                    stability and recovery.
                </p>

            </div>

        </div>

    </section>


    <!-- ================= COMMUNITY PULSE ================= -->

    <section class="community-section">

        <div class="community-title">

            <h2>❤️ The Community Pulse</h2>

            <p>
                A connected community can turn urgent moments
                into shared strength.
            </p>

        </div>


        <div class="pulse-grid">

            <div class="pulse-card">
                <div class="number">24/7</div>
                <p>Emergency Access</p>
            </div>

            <div class="pulse-card">
                <div class="number">FAST</div>
                <p>Support Connection</p>
            </div>

            <div class="pulse-card">
                <div class="number">CLEAR</div>
                <p>Transparent Tracking</p>
            </div>

            <div class="pulse-card">
                <div class="number">ONE</div>
                <p>United Community</p>
            </div>

        </div>

    </section>


    <!-- ================= TRANSPARENCY JOURNEY ================= -->

    <section class="section">

        <div class="section-header">

            <div class="section-label">
                TRANSPARENCY JOURNEY
            </div>

            <h2>Every Signal Has a Clear Path</h2>

            <p>
                ARAN helps users understand exactly where their request
                is in the support journey.
            </p>

        </div>


        <div class="tracker">

            <div class="tracker-box">📡 Submitted</div>
            <div class="tracker-arrow">→</div>

            <div class="tracker-box">🔍 Reviewed</div>
            <div class="tracker-arrow">→</div>

            <div class="tracker-box">✅ Verified</div>
            <div class="tracker-arrow">→</div>

            <div class="tracker-box">❤️ Support Active</div>
            <div class="tracker-arrow">→</div>

            <div class="tracker-box">🌱 Goal Reached</div>

        </div>

    </section>


    <!-- ================= FINAL CTA ================= -->

    <section class="cta-section">

        <h2>One Community. One Safety Net.</h2>

        <p>
            Every act of support can become someone's path
            through an emergency.
        </p>

        <a href="Register.aspx">
            Join ARAN Today →
        </a>

    </section>


    <!-- ================= FOOTER ================= -->

    <footer>

        <h2>🛡️ ARAN</h2>

        <p>A Digital Safety Net for Communities</p>

        <p>
            “No one should face an emergency alone when a community can stand together.”
        </p>

        <p>
            © 2026 ARAN Community Emergency Financial Support System
        </p>

    </footer>

</form>

</body>
</html>