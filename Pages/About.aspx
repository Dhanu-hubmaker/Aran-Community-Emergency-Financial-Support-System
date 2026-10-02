<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="AranCommunitySupport.Pages.About" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>ARAN | About Us</title>

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
            background: rgba(10, 14, 35, 0.97);
            border-bottom: 1px solid rgba(255,255,255,0.08);
        }

        .logo {
            font-size: 34px;
            font-weight: bold;
            letter-spacing: 4px;
        }

        .logo span {
            color: #ff4d61;
        }

        .nav-links {
            display: flex;
            gap: 25px;
            align-items: center;
        }

        .nav-links a {
            color: #d8dbeb;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            transition: 0.3s;
        }

        .nav-links a:hover {
            color: #ff7180;
        }

        .nav-home {
            padding: 10px 22px;
            border: 1px solid rgba(255,255,255,0.15);
            border-radius: 25px;
        }


        /* ================= HERO ================= */

        .hero {
            min-height: 550px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 80px 8%;

            background:
                radial-gradient(circle at 20% 30%, rgba(255,79,97,0.18), transparent 25%),
                radial-gradient(circle at 80% 20%, rgba(116,86,255,0.20), transparent 25%),
                linear-gradient(135deg, #080b18, #151b3f, #090d22);
        }

        .hero-content {
            max-width: 900px;
        }

        .hero-badge {
            display: inline-block;
            padding: 11px 25px;
            margin-bottom: 25px;
            border-radius: 30px;
            background: rgba(255,79,97,0.12);
            border: 1px solid rgba(255,79,97,0.30);
            color: #ff99a4;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .hero h1 {
            font-size: 55px;
            margin-bottom: 20px;
            line-height: 1.2;
        }

        .hero h1 span {
            color: #ff6676;
        }

        .hero p {
            color: #bec5e1;
            font-size: 19px;
            line-height: 1.8;
        }


        /* ================= STORY ================= */

        .story-section {
            padding: 100px 8%;
        }

        .story-container {
            max-width: 1150px;
            margin: auto;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 50px;
            align-items: center;
        }

        .story-icon-box {
            min-height: 350px;
            display: flex;
            align-items: center;
            justify-content: center;

            background:
                radial-gradient(circle, rgba(255,79,97,0.20), transparent 55%),
                linear-gradient(135deg, #161d42, #251b45);

            border-radius: 35px;
            border: 1px solid rgba(255,255,255,0.08);
        }

        .story-icon {
            font-size: 140px;
        }

        .story-content h2 {
            font-size: 42px;
            margin-bottom: 20px;
        }

        .story-content h2 span {
            color: #ff6575;
        }

        .story-content p {
            color: #abb3d1;
            font-size: 17px;
            line-height: 1.9;
            margin-bottom: 18px;
        }


        /* ================= MISSION VISION ================= */

        .mission-section {
            padding: 30px 8% 100px;
        }

        .mission-grid {
            max-width: 1150px;
            margin: auto;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 28px;
        }

        .mission-card {
            padding: 40px;
            border-radius: 25px;
            background: #121834;
            border: 1px solid rgba(255,255,255,0.08);
            transition: 0.3s;
        }

        .mission-card:hover {
            transform: translateY(-8px);
            border-color: rgba(255,79,97,0.30);
        }

        .mission-card .icon {
            font-size: 50px;
            margin-bottom: 20px;
        }

        .mission-card h3 {
            font-size: 30px;
            margin-bottom: 15px;
        }

        .mission-card p {
            color: #aeb6d3;
            font-size: 16px;
            line-height: 1.8;
        }


        /* ================= HOW IT WORKS ================= */

        .how-section {
            padding: 100px 8%;
            background: #0b1025;
            text-align: center;
        }

        .section-heading {
            font-size: 42px;
            margin-bottom: 12px;
        }

        .section-heading span {
            color: #ff6575;
        }

        .section-subtext {
            max-width: 700px;
            margin: auto;
            color: #9da6c8;
            line-height: 1.8;
            margin-bottom: 55px;
        }

        .steps-grid {
            max-width: 1150px;
            margin: auto;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }

        .step-card {
            padding: 38px 28px;
            border-radius: 25px;
            background: #121834;
            border: 1px solid rgba(255,255,255,0.08);
        }

        .step-number {
            width: 58px;
            height: 58px;
            margin: auto auto 22px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 50%;

            background: linear-gradient(135deg, #ff4f61, #8b56ff);
            font-size: 22px;
            font-weight: bold;
        }

        .step-card h3 {
            font-size: 24px;
            margin-bottom: 12px;
        }

        .step-card p {
            color: #aeb6d3;
            line-height: 1.7;
        }


        /* ================= UNIQUE ================= */

        .unique-section {
            padding: 100px 8%;
        }

        .unique-grid {
            max-width: 1150px;
            margin: auto;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }

        .unique-card {
            padding: 35px 28px;
            border-radius: 25px;
            background: #121834;
            border: 1px solid rgba(255,255,255,0.08);
            transition: 0.3s;
        }

        .unique-card:hover {
            transform: translateY(-7px);
            border-color: rgba(139,86,255,0.35);
        }

        .unique-card .icon {
            font-size: 45px;
            margin-bottom: 18px;
        }

        .unique-card h3 {
            font-size: 23px;
            margin-bottom: 12px;
        }

        .unique-card p {
            color: #aeb6d3;
            line-height: 1.7;
        }


        /* ================= QUOTE ================= */

        .quote-section {
            margin: 0 8% 100px;
            padding: 80px 35px;
            text-align: center;
            border-radius: 35px;

            background:
                radial-gradient(circle at 20% 20%, rgba(255,255,255,0.12), transparent 25%),
                linear-gradient(135deg, #2b215f, #5c244b, #b33c56);
        }

        .quote-icon {
            font-size: 55px;
            margin-bottom: 20px;
        }

        .quote-section h2 {
            max-width: 850px;
            margin: auto;
            font-size: 38px;
            line-height: 1.5;
        }

        .quote-section p {
            margin-top: 22px;
            color: #f2e8ed;
            font-size: 18px;
        }


        /* ================= FOOTER ================= */

        footer {
            padding: 45px 8%;
            text-align: center;
            background: #050713;
            border-top: 1px solid rgba(255,255,255,0.06);
        }

        footer h2 {
            font-size: 30px;
            letter-spacing: 4px;
            margin-bottom: 12px;
        }

        footer h2 span {
            color: #ff5263;
        }

        footer p {
            color: #8f98ba;
            margin-top: 8px;
        }


        /* ================= RESPONSIVE ================= */

        @media (max-width: 900px) {

            .navbar {
                padding: 20px;
                flex-direction: column;
                gap: 18px;
            }

            .nav-links {
                flex-wrap: wrap;
                justify-content: center;
            }

            .hero h1 {
                font-size: 40px;
            }

            .story-container {
                grid-template-columns: 1fr;
            }

            .mission-grid,
            .steps-grid,
            .unique-grid {
                grid-template-columns: 1fr;
            }

            .section-heading {
                font-size: 35px;
            }

            .quote-section h2 {
                font-size: 28px;
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

            <a href="Home.aspx" class="nav-home">← Home</a>
            <a href="EmergencyRequest.aspx">Send a Signal</a>
            <a href="SupportRequests.aspx">Answer a Signal</a>

        </div>

    </div>


    <!-- HERO -->

    <section class="hero">

        <div class="hero-content">

            <div class="hero-badge">
                🛡️ ABOUT ARAN
            </div>

            <h1>
                Protection Begins When
                <span>People Stand Together.</span>
            </h1>

            <p>
                ARAN is a community-driven digital emergency support
                platform created to connect people in difficult situations
                with those who are ready to help.
            </p>

        </div>

    </section>


    <!-- OUR STORY -->

    <section class="story-section">

        <div class="story-container">

            <div class="story-icon-box">
                <div class="story-icon">🛡️❤️</div>
            </div>

            <div class="story-content">

                <h2>
                    The Meaning of <span>ARAN</span>
                </h2>

                <p>
                    ARAN represents protection, safety, and support.
                    It is inspired by the belief that a strong community
                    can become a safety net for people during unexpected
                    emergencies.
                </p>

                <p>
                    Instead of facing difficult situations alone,
                    individuals can send an emergency signal and connect
                    with a community capable of offering meaningful support.
                </p>

            </div>

        </div>

    </section>


    <!-- MISSION & VISION -->

    <section class="mission-section">

        <div class="mission-grid">

            <div class="mission-card">

                <div class="icon">🎯</div>

                <h3>Our Mission</h3>

                <p>
                    To build a transparent and accessible platform where
                    people can communicate emergency needs and receive
                    timely support from a caring community.
                </p>

            </div>


            <div class="mission-card">

                <div class="icon">🌍</div>

                <h3>Our Vision</h3>

                <p>
                    To create a future where technology strengthens
                    human connection and no individual has to face
                    an emergency without support.
                </p>

            </div>

        </div>

    </section>


    <!-- HOW IT WORKS -->

    <section class="how-section">

        <h2 class="section-heading">
            How <span>ARAN Works</span>
        </h2>

        <p class="section-subtext">
            A simple community-powered process designed to connect
            emergencies with meaningful support.
        </p>


        <div class="steps-grid">


            <div class="step-card">

                <div class="step-number">1</div>

                <h3>Send a Signal</h3>

                <p>
                    A person experiencing an emergency shares
                    their situation and support requirements.
                </p>

            </div>


            <div class="step-card">

                <div class="step-number">2</div>

                <h3>Community Sees</h3>

                <p>
                    Emergency requests are presented to the
                    community for awareness and possible support.
                </p>

            </div>


            <div class="step-card">

                <div class="step-number">3</div>

                <h3>Support Creates Impact</h3>

                <p>
                    Community members respond and contribute
                    towards helping people during difficult moments.
                </p>

            </div>

        </div>

    </section>


    <!-- WHY UNIQUE -->

    <section class="unique-section">

        <h2 class="section-heading" style="text-align:center;">
            Why <span>ARAN is Different</span>
        </h2>

        <p class="section-subtext" style="text-align:center;">
            Designed not just as a platform, but as a digital
            bridge between people who need help and people
            who want to make a difference.
        </p>


        <div class="unique-grid">


            <div class="unique-card">

                <div class="icon">🚨</div>

                <h3>Emergency Focused</h3>

                <p>
                    ARAN is specifically designed around urgent
                    situations where timely support matters.
                </p>

            </div>


            <div class="unique-card">

                <div class="icon">❤️</div>

                <h3>Community Powered</h3>

                <p>
                    Every individual has the opportunity to
                    contribute and become part of someone's
                    journey toward recovery.
                </p>

            </div>


            <div class="unique-card">

                <div class="icon">🔒</div>

                <h3>Responsible Support</h3>

                <p>
                    The platform promotes transparency and
                    responsible sharing of emergency information.
                </p>

            </div>

        </div>

    </section>


    <!-- QUOTE -->

    <section class="quote-section">

        <div class="quote-icon">💬</div>

        <h2>
            “No one should face an emergency alone when a community can stand together.”
        </h2>

        <p>
            — ARAN Community Emergency Support System
        </p>

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