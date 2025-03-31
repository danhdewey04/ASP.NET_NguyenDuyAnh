<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BTL.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Oxfam - Commitment to Reducing Inequality Index 2024</title>
    <meta name="description" content="Explore Oxfam's Commitment to Reducing Inequality Index 2024, assessing the efforts of 164 countries in tackling inequality through public services, fair taxation, and labor rights."/>
    <meta name="keywords" content="Oxfam, Inequality Index 2024, reducing inequality, CRI, public services, fair taxation, labor rights"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="Style.css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .grid-container {
            display: grid;
            gap: 20px;
            padding: 20px;
        }

        /* Grid layout for desktop */
        @media (min-width: 1025px) {
            .grid-container {
                grid-template-columns: repeat(3, 1fr);
                grid-template-areas: 
                    'header header header'
                    'nav main sidebar'
                    'footer footer footer';
            }
        }

        /* Grid layout for mobile */
        @media (max-width: 1024px) {
            .grid-container {
                grid-template-columns: 1fr 1fr;
                grid-template-areas: 
                    'header header'
                    'nav nav'
                    'main main'
                    'footer footer';
            }

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

        .header {
            grid-area: header;
            background-color: #61A534;
            padding: 20px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .nav-buttons {
            grid-area: nav;
            display: flex;
            flex-direction: column;
            background-color: #fff;
            padding: 15px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .report-content {
            grid-area: main;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .footer {
            grid-area: footer;
            text-align: center;
            padding: 20px;
            background-color: #333;
            color: white;
        }

        .mobile-menu-icon {
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="grid-container">
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
            <main class="report-content">
                <div class="report-image">
                    <img src="Images/flood.jpg" alt="Commitment to Reducing Inequality Report 2024" />
                </div>
                <h1>The Commitment to Reducing Inequality Index 2024</h1>
                <p>
                    Now in its fifth edition, the Commitment to Reducing Inequality Index (CRI) assesses the commitment of 164 countries and regions to fighting inequality. The CRI 2024 offers powerful new evidence on whether governments are acting to reduce inequality through policies on public services, fair taxation, and labor rights.
                </p>
                <p>
                    It reveals negative trends in the vast majority of countries since 2022. Four in five have cut the share of their budgets going to education, health, and/or social protection; four in five have backtracked on progressive taxation; and nine in ten have regressed on labor rights and minimum wages. Without urgent policy actions, economic inequality will continue to rise in 90% of countries.
                </p>
                <p>
                    Despite some progress, the IMF and the World Bank could do far more to prioritize the fight to reduce inequality. This report makes recommendations for how they should stop promoting policies that increase inequality and instead support those that reduce it.
                </p>

                <h2>Comments</h2>
                <textarea id="commentBox" class="comment-box" placeholder="Write your comment..." rows="4"></textarea>
                <label for="verificationCode">Verification Code:</label>
                <input type="text" id="verificationCode" class="verification-code" placeholder="e.g., 12AB@" /><br />
                <button type="button" id="submitCommentBtn" class="submit-button" onclick="submitComment()">Submit Comment</button>

                <div id="commentsDisplay">
                    <!-- Comments will be displayed here -->
                </div>
                <div class="comment-count">
                    <p>Total Comments: <span id="commentCount">0</span></p>
                </div>
            </main>
            
            <footer class="footer">
                <p>Copyright &copy; 2024 Oxfam International. All rights reserved.</p>
                <div class="social-links">
                    <a href="https://www.facebook.com/Oxfam"><img src="Images/facebook.png" alt="Oxfam on Facebook" /></a>
                    <a href="https://twitter.com/Oxfam"><img src="Images/twitter.png" alt="Oxfam on Twitter" /></a>
                </div>
            </footer>
        </div>
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

        var commentCount = 0;

        function submitComment() {
            var comment = document.getElementById('commentBox').value;
            var verificationCode = document.getElementById('verificationCode').value;
            var verificationCodeRegex = /^[0-9]{2}[A-Z]{2}[!@#$%^&*]$/;

            if (!verificationCodeRegex.test(verificationCode)) {
                alert('Verification code must contain 2 digits, 2 uppercase letters, and 1 special character (e.g., 12AB@).');
                return;
            }

            if (comment.trim() !== "") {
                var username = sessionStorage.getItem('username');
                PageMethods.SaveComment(username, comment, function () {
                    loadComments();  // Load comments again after submitting a new one
                    document.getElementById('commentBox').value = "";  // Clear the comment box
                    document.getElementById('verificationCode').value = "";  // Clear the verification code box
                    commentCount++;  // Increment the comment count
                    document.getElementById('commentCount').innerText = commentCount;  // Update the count display
                });
            } else {
                alert('Please enter a comment.');
            }
        }

        function loadComments() {
            PageMethods.GetComments(function (comments) {
                var commentsDisplay = document.getElementById('commentsDisplay');
                commentsDisplay.innerHTML = '';
                commentCount = comments.length;  // Set the comment count based on the number of comments loaded
                document.getElementById('commentCount').innerText = commentCount;  // Update the count display
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
