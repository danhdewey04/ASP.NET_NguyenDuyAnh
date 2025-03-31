<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TakeAction.aspx.cs" Inherits="BTL.TakeAction" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Take Action with Oxfam - Join Our Fight Against Poverty</title>
    <meta name="description" content="Join Oxfam Vietnam to fight poverty and inequality. Discover how you can campaign, volunteer, educate, donate, and make a real difference."/>
    <meta name="keywords" content="Oxfam take action, fight poverty, volunteer, campaign, donate, Vietnam"/>
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
    <<form id="form1" runat="server">
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
            <div class="search-bar">
            <input type="text" id="searchInput" placeholder="Search" onkeyup="performSearch()" />
             <div id="searchResults" class="search-results" style="display: none;"></div>
            </div>
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
            <img src="Images/take-action.jpg" alt="Take Action with Oxfam" />
        </div>
        <h2 style="color: #800040; font-family: Arial, sans-serif; font-weight: bold;">
            Join Oxfam in amplifying the voices of the vulnerable in Vietnam. Discover how we campaign for a future free from poverty.
        </h2>
        
        <p style="font-family: Arial, sans-serif; color: #333;">
            There are many ways you can support our fight against inequality and injustice. Campaign, volunteer, educate, discuss, donate 
            <a href="#" style="text-decoration: underline; color: #006400;">internationally</a> - get involved in any way that suits you.
        </p>
        
        <p style="font-family: Arial, sans-serif; color: #333;">
            Learn about our <a href="#" style="text-decoration: underline; color: #8B008B;">campaigns for change</a>, and then head to our 
            <a href="#" style="text-decoration: underline; color: #8B008B;">Facebook</a> or 
            <a href="#" style="text-decoration: underline; color: #8B008B;">Instagram</a> to share our message and get regular updates 
            on Oxfam in Vietnam's work and the work of our <a href="#" style="text-decoration: underline; color: #8B008B;">affiliates</a>.
        </p>
        
        <p style="font-family: Arial, sans-serif; color: #333;">
            Together we can make a real difference to the lives of vulnerable people living in poverty 
            <a href="#" style="text-decoration: underline; color: #006400;">around the world</a>. If you have further questions or want to get 
            more involved, please be in touch.
        </p>
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
                <a href="TakeAction.aspx">TakeAction.aspx</a>
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
