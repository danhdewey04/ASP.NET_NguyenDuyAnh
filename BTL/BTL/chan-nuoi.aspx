<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chan-nuoi.aspx.cs" Inherits="BTL.chan_nuoi" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>From Recovery to Resilience: Empowering 1,500 Female Farmers Post-COVID</title>
    <meta name="description" content="Learn how Oxfam and partners empower female farmers in disadvantaged communities to recover from COVID-19 with sustainable livelihoods initiatives."/>
    <meta name="keywords" content="Oxfam, female farmers, COVID-19 recovery, sustainable livelihoods, Vietnam"/>
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
                <img src="Images/chan-nuoi.jpg" alt="Empowering Female Farmers Post-COVID Report" />
            </div>
            <h1>From Recovery to Resilience: Empowering 1,500 Female Farmers Post-COVID</h1>
            <p>
                On July 20, 2024, the closing workshop of the project "Restoring and enhancing resilient livelihoods after the COVID-19 pandemic for poor and near poor female farmers in disadvantaged communes in Thua Thien Hue province" took place in Thua Thien Hue, with the participation of over 100 participants including female farmers, representatives from the Red Cross at all levels, government agencies, and the New Zealand Ambassador to Vietnam.
            </p>
            <p>
                The project "Restoring and enhancing resilient livelihoods after the COVID-19 pandemic for poor and near poor female farmers in disadvantaged communes in Thua Thien Hue province" was implemented in six communes: Phu Gia, Phu Dien, Giang Hai, Vinh Hung, Phong Chuong, Dien Huong across three districts: Phu Vang, Phu Loc, and Phong Dien, with a budget of over 4.94 billion VND. The project was funded by the New Zealand Government and implemented by the Red Cross Society of Thua Thien Hue province in collaboration with Oxfam in Vietnam, from September 1, 2023, to July 31, 2024.
            </p>
            <p>
                During and after the COVID-19 pandemic, women and girls were the hardest hit. They lack support in terms of resources, have limited technical capacity for their livelihoods, and shoulder many responsibilities, including taking care of their families. "In this project, we focused on supporting poor and near-poor women farmers to not only overcome the immediate effects of the pandemic, but also enhance their ability to adapt and be resilient in crises," said Vu Thi Quynh Hoa, National Director of Oxfam in Vietnam, at the workshop.
            </p>
            <p>
                After almost one year, the project has effectively supported 1,511 poor and near-poor women farmers, of whom 221 are people with disabilities, helping them and their families to recover and develop sustainable livelihoods. The women farmers participating in the project attended 30 agricultural technical training courses tailored to their needs. 1,000 women farmers received direct cash assistance of 3.2 million VND/person to restore their livelihoods. This assistance was provided in accordance with a family livelihood recovery plan which was appraised by the project for implementation feasibility.
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
