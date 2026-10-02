<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="EmergencyRequest.aspx.cs"
    Inherits="AranCommunitySupport.Pages.EmergencyRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>ARAN | Emergency Request</title>

    <style type="text/css">

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Times New Roman", Times, serif;
            color: white;
            min-height: 100vh;

            background:
                radial-gradient(circle at 10% 10%, rgba(255,79,97,0.18), transparent 25%),
                radial-gradient(circle at 90% 90%, rgba(120,85,255,0.20), transparent 25%),
                linear-gradient(135deg, #070a16, #12183a, #090b18);
        }

        /* NAVBAR */

        .navbar {
            width: 100%;
            padding: 20px 7%;
            display: flex;
            align-items: center;
            justify-content: space-between;

            background: rgba(7,10,22,0.96);
            border-bottom: 1px solid rgba(255,255,255,0.08);
        }

        .logo {
            font-size: 32px;
            font-weight: bold;
            letter-spacing: 4px;
        }

        .logo span {
            color: #ff6273;
        }

        .nav-links {
            display: flex;
            gap: 20px;
        }

        .nav-links a {
            color: #c9cde0;
            text-decoration: none;
            font-weight: bold;
        }

        .nav-links a:hover {
            color: #ff7886;
        }


        /* MAIN */

        .main-container {
            max-width: 1000px;
            margin: auto;
            padding: 50px 20px;
        }

        .page-header {
            text-align: center;
            margin-bottom: 35px;
        }

        .page-header h1 {
            font-size: 38px;
            margin-bottom: 12px;
        }

        .page-header span {
            color: #ff7b89;
        }

        .page-header p {
            color: #b8c0dc;
            font-size: 17px;
            line-height: 1.6;
        }


        /* FORM CONTAINER */

        .form-container {

            background: rgba(15,20,48,0.96);

            border: 1px solid rgba(255,255,255,0.08);

            border-radius: 25px;

            overflow: hidden;

            box-shadow: 0 25px 70px rgba(0,0,0,0.35);
        }


        /* FORM HEADER */

        .form-header {

            padding: 35px;

            background:
                radial-gradient(circle at 90% 10%, rgba(255,255,255,0.10), transparent 20%),
                linear-gradient(135deg, #24205a, #432047, #742f4d);
        }

        .form-header h2 {
            font-size: 30px;
            margin-bottom: 10px;
        }

        .form-header p {
            color: #f0dfe5;
            line-height: 1.6;
        }


        /* FORM BODY */

        .form-body {
            padding: 40px;
        }


        .section-title {

            font-size: 23px;

            margin-top: 15px;

            margin-bottom: 25px;

            color: #ff9ba6;
        }


        .form-grid {

            display: grid;

            grid-template-columns: repeat(2, 1fr);

            gap: 22px;

            margin-bottom: 40px;
        }


        .form-group {

            display: flex;

            flex-direction: column;
        }


        .full-width {

            grid-column: 1 / -1;
        }


        .form-group label {

            margin-bottom: 8px;

            font-size: 16px;

            font-weight: bold;

            color: #e8e9f4;
        }


        .form-group label span {
            color: #ff6374;
        }


        .form-control {

            width: 100%;

            padding: 14px 16px;

            background: #0b1027;

            border: 1px solid #303961;

            border-radius: 10px;

            color: white;

            font-family: "Times New Roman", Times, serif;

            font-size: 16px;

            outline: none;
        }


        .form-control:focus {

            border-color: #ff6273;

            box-shadow:
                0 0 0 3px rgba(255,98,115,0.12);
        }


        textarea.form-control {

            min-height: 130px;

            resize: vertical;
        }


        /* URGENCY */

        .urgency-options {

            display: grid;

            grid-template-columns: repeat(3, 1fr);

            gap: 15px;
        }


        .urgency-option {

            background: #0b1027;

            border: 1px solid #303961;

            border-radius: 12px;

            padding: 15px;

            display: flex;

            align-items: center;

            gap: 10px;
        }


        .urgency-option input {

            width: 18px;

            height: 18px;

            accent-color: #ff6273;
        }


        .urgency-option label {

            margin: 0;

            cursor: pointer;

            font-weight: normal;
        }


        .urgency-option small {

            color: #9ca6c9;
        }


        /* UPLOAD */

        .upload-box {

            border: 2px dashed #38426c;

            border-radius: 18px;

            padding: 35px;

            text-align: center;

            margin-bottom: 35px;

            background: rgba(11,16,39,0.55);
        }


        .upload-icon {

            font-size: 42px;

            margin-bottom: 12px;
        }


        .upload-box h3 {

            margin-bottom: 10px;
        }


        .upload-box p {

            color: #aeb6d3;

            line-height: 1.6;

            margin-bottom: 20px;
        }


        /* SECURITY */

        .security-info {

            display: flex;

            gap: 18px;

            padding: 25px;

            border-radius: 16px;

            background: rgba(255,79,97,0.08);

            border: 1px solid rgba(255,79,97,0.15);

            margin-bottom: 35px;
        }


        .security-icon {
            font-size: 35px;
        }


        .security-info h4 {

            font-size: 18px;

            margin-bottom: 8px;
        }


        .security-info p {

            color: #b9c0d8;

            line-height: 1.6;
        }


        /* BUTTON */

        .submit-area {

            text-align: center;
        }


        .emergency-btn {

            width: 100%;

            padding: 18px;

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

            box-shadow:
                0 15px 35px rgba(255,79,97,0.20);
        }


        .emergency-btn:hover {

            transform: translateY(-3px);

            box-shadow:
                0 20px 40px rgba(255,79,97,0.30);
        }


        .submit-note {

            margin-top: 15px;

            color: #8e98bb;

            font-size: 14px;
        }


        /* FOOTER */

        footer {

            text-align: center;

            padding: 40px 20px;

            color: #9da6c4;

            border-top: 1px solid rgba(255,255,255,0.08);
        }


        footer h2 {

            color: white;

            margin-bottom: 10px;

            letter-spacing: 3px;
        }


        footer h2 span {

            color: #ff6273;
        }


        footer p {

            margin-top: 8px;
        }


        /* RESPONSIVE */

        @media (max-width: 750px) {

            .form-grid {
                grid-template-columns: 1fr;
            }

            .full-width {
                grid-column: auto;
            }

            .urgency-options {
                grid-template-columns: 1fr;
            }

            .navbar {
                flex-direction: column;
                gap: 15px;
            }

            .nav-links {
                flex-wrap: wrap;
                justify-content: center;
            }

            .form-body {
                padding: 25px;
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

            <a href="Dashboard.aspx">Dashboard</a>

            <a href="SupportRequests.aspx">Support</a>

            <a href="Contact.aspx">Contact</a>

        </div>

    </div>



    <!-- MAIN -->

    <div class="main-container">


        <div class="page-header">

            <h1>

                🚨 Request <span>Emergency Support</span>

            </h1>


            <p>

                Share your emergency details with the ARAN community.
                Your request can help connect you with people and
                volunteers who may provide immediate assistance.

            </p>

        </div>



        <div class="form-container">


            <!-- FORM HEADER -->

            <div class="form-header">

                <h2>

                    Emergency Support Request

                </h2>


                <p>

                    Please provide accurate information so that the
                    community can understand and respond to your situation.

                </p>

            </div>



            <!-- FORM BODY -->

            <div class="form-body">


                <!-- PERSONAL INFORMATION -->

                <h3 class="section-title">

                    👤 Personal Information

                </h3>


                <div class="form-grid">


                    <!-- NAME -->

                    <div class="form-group">

                        <label>

                            Full Name <span>*</span>

                        </label>


                        <asp:TextBox
                            ID="txtName"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter your name">
                        </asp:TextBox>

                    </div>



                    <!-- EMAIL -->

                    <div class="form-group">

                        <label>

                            Email Address <span>*</span>

                        </label>


                        <asp:TextBox
                            ID="txtEmail"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter your email address"
                            TextMode="Email">
                        </asp:TextBox>

                    </div>



                    <!-- PHONE -->

                    <div class="form-group">

                        <label>

                            Phone Number <span>*</span>

                        </label>


                        <asp:TextBox
                            ID="txtPhone"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter your phone number"
                            TextMode="Phone">
                        </asp:TextBox>

                    </div>



                    <!-- CONTACT METHOD -->

                    <div class="form-group">

                        <label>

                            Preferred Contact Method

                        </label>


                        <asp:DropDownList
                            ID="ddlContactMethod"
                            runat="server"
                            CssClass="form-control">

                            <asp:ListItem Value="">
                                Select contact method
                            </asp:ListItem>

                            <asp:ListItem>
                                Phone Call
                            </asp:ListItem>

                            <asp:ListItem>
                                WhatsApp
                            </asp:ListItem>

                            <asp:ListItem>
                                Email
                            </asp:ListItem>

                        </asp:DropDownList>

                    </div>


                </div>



                <!-- EMERGENCY DETAILS -->

                <h3 class="section-title">

                    🚨 Emergency Details

                </h3>


                <div class="form-grid">


                    <!-- EMERGENCY TYPE -->

                    <div class="form-group">

                        <label>

                            Emergency Category <span>*</span>

                        </label>


                        <asp:DropDownList
                            ID="ddlEmergencyType"
                            runat="server"
                            CssClass="form-control">

                            <asp:ListItem Value="">
                                Select emergency type
                            </asp:ListItem>

                            <asp:ListItem>
                                Medical Emergency
                            </asp:ListItem>

                            <asp:ListItem>
                                Accident
                            </asp:ListItem>

                            <asp:ListItem>
                                Fire Emergency
                            </asp:ListItem>

                            <asp:ListItem>
                                Safety Threat
                            </asp:ListItem>

                            <asp:ListItem>
                                Other
                            </asp:ListItem>

                        </asp:DropDownList>

                    </div>



                    <!-- LOCATION -->

                    <div class="form-group">

                        <label>

                            Location <span>*</span>

                        </label>


                        <asp:TextBox
                            ID="txtLocation"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter your current location">
                        </asp:TextBox>

                    </div>



                    <!-- DESCRIPTION -->

                    <div class="form-group full-width">

                        <label>

                            Describe Your Emergency <span>*</span>

                        </label>


                        <asp:TextBox
                            ID="txtDescription"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Describe the emergency..."
                            TextMode="MultiLine">
                        </asp:TextBox>

                    </div>


                </div>



                <!-- URGENCY -->

                <h3 class="section-title">

                    ⚠️ Urgency Level

                </h3>


                <div class="form-grid">


                    <div class="form-group full-width">


                        <div class="urgency-options">


                            <div class="urgency-option">

                                <input
                                    type="radio"
                                    id="low"
                                    name="urgency" />

                                <label for="low">

                                    🟢 Low<br />

                                    <small>
                                        Within a few days
                                    </small>

                                </label>

                            </div>



                            <div class="urgency-option">

                                <input
                                    type="radio"
                                    id="medium"
                                    name="urgency" />

                                <label for="medium">

                                    🟡 Medium<br />

                                    <small>
                                        Within 24–48 hours
                                    </small>

                                </label>

                            </div>



                            <div class="urgency-option">

                                <input
                                    type="radio"
                                    id="high"
                                    name="urgency" />

                                <label for="high">

                                    🔴 Critical<br />

                                    <small>
                                        Immediate support needed
                                    </small>

                                </label>

                            </div>


                        </div>


                    </div>


                </div>



                <!-- DOCUMENT -->

                <h3 class="section-title">

                    📎 Supporting Documents

                </h3>


                <div class="upload-box">

                    <div class="upload-icon">

                        📁

                    </div>


                    <h3>

                        Upload Supporting Proof

                    </h3>


                    <p>

                        Upload relevant documents such as medical bills,
                        emergency certificates, or other supporting proof.

                    </p>


                    <input type="file" />

                </div>



                <!-- SECURITY -->

                <div class="security-info">


                    <div class="security-icon">

                        🔒

                    </div>


                    <div>

                        <h4>

                            Your Information Matters

                        </h4>


                        <p>

                            ARAN is designed to maintain transparency
                            and responsible community support. Your
                            emergency request will be reviewed before
                            being shared with the support community.

                        </p>

                    </div>


                </div>



                <!-- SUBMIT BUTTON -->

                <div class="submit-area">


                    <asp:Button
                        ID="btnEmergency"
                        runat="server"
                        Text="🚨 Send Emergency Request"
                        CssClass="emergency-btn"
                        OnClick="btnEmergency_Click" />


                    <div class="submit-note">

                        By sending this signal, you confirm that the
                        information provided is accurate.

                    </div>


                </div>


            </div>


        </div>


    </div>



    <!-- FOOTER -->

    <footer>

        <h2>

            🛡️ AR<span>AN</span>

        </h2>


        <p>

            A Digital Safety Net for Communities

        </p>


        <p>

            No one should face an emergency alone when a
            community can stand together.

        </p>


        <p>

            © 2026 ARAN Community Emergency Support System

        </p>


    </footer>


</form>


</body>

</html>