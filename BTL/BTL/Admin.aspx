<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="BTL.Admin" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel - View User Messages</title>
    <meta name="description" content="Admin panel to view user messages submitted via contact form." />
    <meta name="keywords" content="admin, contact messages, user feedback" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="Style.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #61A534;
            color: white;
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
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
    <div class="header">
    <div class="left-section">
        <div class="logo">
            <img src="Images/logo.png" alt="Oxfam Logo" onclick="window.location='Default.aspx'" />
        </div>
        <nav class="nav-buttons">
            <button type="button" onclick="location.href='WhoWeAre.aspx'">Who We Are</button>
            <button type="button" onclick="location.href='WhatWeDo.aspx'">What We Do</button>
            <button type="button" onclick="location.href='TakeAction.aspx'">Take Action</button>
            <button type="button" onclick="location.href='Latest.aspx'">Latest</button>
            <button type="button" onclick="location.href='Contact.aspx'">Contact</button>
        </nav>
        <div class="mobile-menu-icon">
            <button onclick="toggleMenu()" type="button">
                <img src="Images/icon.png" alt="Menu Icon" />
            </button>
        </div>
        <div class="login-container">
            <img src="Images/login-icon.jpg" alt="Login Icon" class="login-icon" onclick="toggleLoginStatus()" />
            <button type="button" class="logout-button" onclick="logoutUser()">Logout</button>
        </div>
    </div>
</div>
    <div id="menu-items" class="mobile-nav">
        <a href="WhoWeAre.aspx">Who We Are</a>
        <a href="WhatWeDo.aspx">What We Do</a>
        <a href="TakeAction.aspx">Take Action</a>
        <a href="Latest.aspx">Latest</a>
        <a href="Contact.aspx">Contact</a>
    </div>
        <div class="container">
            <h2>User Messages</h2>
            <asp:GridView ID="MessagesGridView" runat="server" AutoGenerateColumns="False" GridLines="Both">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                    <asp:BoundField DataField="Timestamp" HeaderText="TimeStamp" SortExpression="TimeStamp" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
    <script>

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

    window.onload = function () {
        if (!sessionStorage.getItem('userLoggedIn')) {
            document.getElementById('submitCommentBtn').disabled = true;
        }
        loadComments();
    }
    </script>
</body>
</html>