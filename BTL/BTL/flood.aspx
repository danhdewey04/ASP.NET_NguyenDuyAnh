<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="flood.aspx.cs" Inherits="BTL.flood" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Oxfam Vietnam Supports 5 Billion VND for Relief and Recovery After Typhoon Yagi</title>
    <meta name="description" content="Oxfam Vietnam provides 5 billion VND for emergency relief and recovery after Typhoon Yagi. Learn more about our efforts in Lao Cai and Yen Bai provinces."/>
    <meta name="keywords" content="Oxfam Vietnam, Typhoon Yagi, disaster relief, recovery efforts, Lao Cai, Yen Bai"/>
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
        <main class="report-content">
            <div class="report-image">
                <img src="Images/flood.jpg" alt="Oxfam Vietnam Supports Flood Relief" />
            </div>
            <h1>Oxfam in Vietnam Supports 5 Billion VND for Relief and Recovery After Typhoon Yagi</h1>
            <p>
                This fund will be directed to Lao Cai and Yen Bai, the two provinces most severely affected by the floods following the typhoon. In collaboration with the Red Cross Society of these provinces, local authorities, and the community, Oxfam will implement emergency response and recovery efforts to support those impacted.
            </p>
            <p>
                To ensure the aid is effective, all planning and execution will be guided by the needs of the people. Additionally, Oxfam continues to seek further funding to help communities rebuild their livelihoods and stabilize their lives after the disaster.
            </p>
            <p>
                Having been present in Vietnam since 1955 through humanitarian work, Oxfam remains committed to disaster relief and risk reduction. These efforts are central to our mission. We hope to join hands with the Government of Vietnam and all relevant stakeholders to carry out timely and efficient relief and reconstruction activities, helping those affected recover as quickly as possible.
            </p>
            <section class="comments-section">
    <h2>Comments</h2>
    <textarea id="commentBox" class="comment-box" placeholder="Write your comment..." rows="4"></textarea>
    <button type="button" id="submitCommentBtn" class="submit-button" onclick="submitComment()">Submit Comment</button>

    <div id="commentsDisplay">
        <!-- Comments will be displayed here -->
    </div>
</section>
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
