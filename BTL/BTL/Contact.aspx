<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="BTL.Contact" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Oxfam - Get in Touch for Enquiries and Support</title>
    <meta name="description" content="Contact Oxfam Vietnam for inquiries, support, or to report issues. Reach us by email or visit us in Hanoi, Vietnam."/>
    <meta name="keywords" content="Oxfam contact, Oxfam Vietnam, support, enquiries, Hanoi"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="Style.css"/>
    <style>
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="email"], textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            background-color: #61A534;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #4e8c29;
        }

        /* Responsive breakpoint */
        @media (max-width: 1024px) {
            .nav-buttons {
                display: none;
            }

            .mobile-menu-icon {
                display: block;
            }

            .mobile-menu.show {
                display: block;
            }
        }

        @media (min-width: 1025px) {
            .mobile-menu-icon {
                display: none;
            }

            .mobile-menu {
                display: none;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" method="post">
        <div class="header">
            <div class="left-section">
                <div class="logo">
                    <img src="Images/logo.png" alt="Oxfam Logo" onclick="window.location='Default.aspx'" style="cursor:pointer;" />
                </div>
                <nav class="nav-buttons">
                    <button type="button" onclick="location.href='WhoWeAre.aspx'">Who We Are</button>
                    <button type="button" onclick="location.href='WhatWeDo.aspx'">What We Do</button>
                    <button type="button" onclick="location.href='TakeAction.aspx'">Take Action</button>
                    <button type="button" onclick="location.href='Latest.aspx'">Latest</button>
                    <button type="button" onclick="location.href='Contact.aspx'">Contact</button>
                </nav>
                </div>
                <div class="mobile-menu-icon">
                    <button onclick="toggleMenu()" type="button">
                        <img src="Images/icon.png" alt="Menu Icon" />
                    </button>
                </div>
                <div class="login-container">
                    <img src="Images/login-icon.jpg" alt="Login Icon" class="login-icon" onclick="toggleLoginStatus()" />
                    <button type="button" class="logout-button" onclick="logoutUser()">Logout</button>
                </div>
                <div id="menu-items" class="mobile-nav">
                    <a href="WhoWeAre.aspx">Who We Are</a>
                    <a href="WhatWeDo.aspx">What We Do</a>
                    <a href="TakeAction.aspx">Take Action</a>
                    <a href="Latest.aspx">Latest</a>
                    <a href="Contact.aspx">Contact</a>
                </div>
            </div>
        <main class="contact-content">
            <h1>Contact Us</h1>
            <p>
                <strong>Email:</strong><br />
                <a href="mailto:oxfam.vietnam@oxfam.org">oxfam.vietnam@oxfam.org</a><br />
                22 Lê Đại Hành, Hà Nội, Việt Nam<br />
                For reports on any abuse, fraud, or corruption, email us at: <a href="mailto:whistleblowing.vietnam@oxfam.org">whistleblowing.vietnam@oxfam.org</a><br />
                For human resource matters, email us at: <a href="mailto:HR.vietnam@oxfam.org">HR.vietnam@oxfam.org</a>
            </p>
            <div class="form-group">
                <label for="name">Your Name:</label>
                <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="email">Your Email:</label>
                <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="message">Message:</label>
                <asp:TextBox ID="MessageTextBox" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="SendMessageButton" runat="server" Text="Send Message" CssClass="btn" OnClick="SendMessageButton_Click" />
        </main>
        <footer class="footer">
            <p>Copyright &copy; 2024 Oxfam International. All rights reserved.</p>
            <div class="social-links">
                <a href="https://www.facebook.com/Oxfam"><img src="Images/facebook.png" alt="Oxfam on Facebook" /></a>
                <a href="https://twitter.com/Oxfam"><img src="Images/twitter.png" alt="Oxfam on Twitter" /></a>
            </div>
        </footer>
    </form>

<script>
    function toggleMenu() {
        var menu = document.getElementById("menu-items");
        if (menu.style.display === "none" || menu.style.display === "") {
            menu.style.display = "block";
        } else {
            menu.style.display = "none";
        }
    }

    function toggleLoginStatus() {
        if (sessionStorage.getItem('userLoggedIn')) {
            var logoutButton = document.querySelector('.logout-button');
            logoutButton.style.display = logoutButton.style.display === 'block' ? 'none' : 'block';
        } else {
            window.location.href = 'Login.aspx';
        }
    }

    function logoutUser() {
        PageMethods.LogoutUser(function () {
            sessionStorage.removeItem('userLoggedIn');
            sessionStorage.removeItem('username');
            document.querySelector('.logout-button').style.display = 'none';
            document.getElementById('submitCommentBtn').disabled = true;
            window.location.reload();
        });
    }

    function saveContactData() {
        var name = document.getElementById('<%= NameTextBox.ClientID %>').value;
        var email = document.getElementById('<%= EmailTextBox.ClientID %>').value;
        var message = document.getElementById('<%= MessageTextBox.ClientID %>').value;

        if (name && email && message) {
            var contactData = {
                name: name,
                email: email,
                message: message,
                timestamp: new Date().toISOString()
            };

            var jsonData = JSON.stringify(contactData);
            var fileName = 'Contact_' + new Date().getTime() + '.json';

            // Save file with dynamic filename to a specific folder
            var blob = new Blob([jsonData], { type: "application/json" });
            var link = document.createElement('a');
            link.href = window.URL.createObjectURL(blob);
            link.download = fileName;
            link.click();

            alert('Your message has been saved.');
        } else {
            alert('Please fill in all fields before submitting.');
        }
    }

    window.onload = function () {
        if (!sessionStorage.getItem('userLoggedIn')) {
            document.getElementById('submitCommentBtn').disabled = true;
        }
        loadComments();
    }
</script>

</body>
</html>
