<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WhoWeAre.aspx.cs" Inherits="BTL.WhoWeAre" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Oxfam - Who We Are: Fighting Inequality and Ending Poverty Globally</title>
    <meta name="description" content="Learn about Oxfam, a global movement fighting inequality and ending poverty through impactful programs, people power, and systemic change."/>
    <meta name="keywords" content="Oxfam, who we are, fight inequality, end poverty, people power, feminist principles, systemic change"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="Style.css"/>
    <style>
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
    <div class="header">
        <div class="left-section">
            <div class="logo">
                <img src="Images/logo.png" alt="Oxfam Logo" onclick="window.location='Default.aspx'" />
            </div>
            <div class="nav-buttons">
                <button type="button" onclick="location.href='WhoWeAre.aspx'">Who We Are</button>
                <button type="button" onclick="location.href='WhatWeDo.aspx'">What We Do</button>
                <button type="button" onclick="location.href='TakeAction.aspx'">Take Action</button>
                <button type="button" onclick="location.href='Latest.aspx'">Latest</button>
                <button type="button" onclick="location.href='Contact.aspx'">Contact</button>
            </div>
            
            <div class="mobile-menu-icon">
                <button onclick="toggleMenu()" type="button">
                    <img src="Images/icon.png" alt="Menu Icon" />
                </button>
            </div>
            <div class="search-bar">
            <input type="text" id="searchInput" placeholder="Search" onkeyup="performSearch()" />
            <div id="searchResults" class="search-results" style="display: none;"></div>
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
    <div class="report-content">
        <div class="report-image">
            <img src="Images/who-are-we.jpg" alt="Oxfam Team Working Together" />
        </div>
        <h1>Who We Are</h1>
        <p>
            Oxfam is a global movement of people working together to end the injustice of poverty. There are currently 21 member organizations working in 79 countries.
        </p>
        <h2 style="font-weight: bold; color: orange;">
            Our Vision
        </h2>
        <p>
            We fight inequality to end poverty and injustice.
        </p>
        <h2 style="color: #E87722; font-family: Arial, sans-serif;">Our Mission</h2>
        <p style="font-family: Arial, sans-serif; color: #333;">
            We fight inequality to end poverty and injustice.
        </p>

        <h2 style="color: #E87722; font-family: Arial, sans-serif;">How We Work</h2>
        <p style="font-family: Arial, sans-serif; color: #333;">
            How we work is as important as what we do. A combination of six approaches makes us and our impact distinctive. 
            <strong style="color: #8B008B;">Feminist principles</strong> guide us in all our work, helping to ensure our programmes uphold the dignity and rights of everyone. 
            We believe in <strong>people power</strong>; we amplify the voices and actions of people that experience poverty and injustice, and work with those who fight for their causes. 
            <strong>Thinking and acting locally and globally</strong>, we build coalitions within and between regions and from the local to the global level.
        </p>

        <p style="font-family: Arial, sans-serif; color: #333;">
            We provide <strong>enhanced humanitarian action</strong>, working with communities at risk of conflict and disasters before, during, and after crises. 
            Our work to ensure <strong>digital rights and space for all</strong> offers new ways for people, communities, and decision-makers to connect, learn, and mobilize. 
            And we seek <strong>systemic change</strong>; we tackle not the symptoms of injustice but the systems that sustain them. We campaign for genuine, durable change.
        </p>
    </div>
    <footer class="footer">
        <p>Copyright &copy; 2024 Oxfam International. All rights reserved.</p>
        <div class="social-links">
            <a href="https://www.facebook.com/Oxfam"><img src="Images/facebook.png" alt="Follow Oxfam on Facebook" /></a>
            <a href="https://twitter.com/Oxfam"><img src="Images/twitter.png" alt="Follow Oxfam on Twitter" /></a>
        </div>
    </footer>

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

    function performSearch() {
        const searchInput = document.getElementById('searchInput').value.toLowerCase();
        const searchResults = document.getElementById('searchResults');
        const pages = [
            { name: 'Empowering female farmers', url: 'chan-nuoi.aspx' },
            { name: 'Commitment', url: 'the-commitment.aspx' },
            { name: 'Typhoon Yagi', url: 'flood.aspx' }
        ];
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

    function submitComment() {
        var comment = document.getElementById('commentBox').value;
        if (comment.trim() !== "") {
            var username = sessionStorage.getItem('username');
            PageMethods.SaveComment(username, comment, function () {
                loadComments();
                document.getElementById('commentBox').value = "";
            });
        } else {
            alert('Please enter a comment.');
        }
    }

    function loadComments() {
        PageMethods.GetComments(function (comments) {
            var commentsDisplay = document.getElementById('commentsDisplay');
            commentsDisplay.innerHTML = '';
            comments.forEach(function (comment) {
                var commentDiv = document.createElement('div');
                commentDiv.className = 'comment-display';
                commentDiv.innerHTML = `
                    <div class="comment-header">${comment.Username}</div>
                    <div class="comment-content">${comment.Content}</div>
                `;
                commentsDisplay.appendChild(commentDiv);
            });
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
