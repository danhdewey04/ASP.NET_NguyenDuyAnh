<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Latest.aspx.cs" Inherits="BTL.Latest" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Oxfam Latest Updates</title>
    <link rel="stylesheet" href="Style.css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .section-title {
            color: #4CAF50;
            font-size: 24px;
            font-weight: bold;
        }
        .subsection-title {
            color: #E87722;
            font-size: 20px;
            font-weight: bold;
        }
        .highlight {
            color: #800080;
            font-size: 18px;
            font-weight: bold;
        }
        .card {
            background-color: #F5F5F5;
            padding: 15px;
            margin: 15px 0;
            border-radius: 5px;
            display: flex;
            align-items: center;
        }
        .card img {
            width: 150px;
            height: 100px;
            margin-right: 15px;
            border-radius: 5px;
        }
        .card-content {
            max-width: 500px;
        }
        .card-content h4 {
            color: #4CAF50;
            margin: 0;
        }
        .card-content p {
            margin: 5px 0;
        }
        a {
            color: #4CAF50;
            text-decoration: underline;
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
        <div class="header">
    <div class="left-section">
        <div class="logo">
            <img src="Images/logo.png" alt="Oxfam Logo" onclick="window.location='Default.aspx'" />
        </div>
        <div class="nav-buttons">
            <button type="button" onclick="location.href='WhoWeAre.aspx'">Who we are</button>
            <button type="button" onclick="location.href='WhatWeDo.aspx'">What we do</button>
            <button type="button" onclick="location.href='TakeAction.aspx'">Take action</button>
            <button type="button" onclick="location.href='Latest.aspx'">Latest</button>
            <button type="button" onclick="location.href='Contact.aspx'">Contact</button>
        </div>
        
        <div class="mobile-menu-icon">
            <button onclick="toggleMenu()" type="button">
                <img src="Images/icon.png" alt="Menu Icon" />
            </button>
        </div>
        <div class="login-container">
    <img src="Images/login-icon.jpg" alt="Login Icon" class="login-icon" onclick="toggleLoginStatus()" />
    <button type="button" class="logout-button" onclick="logoutUser()">Đăng xuất</button>
        </div>
    </div>
</div>
<div id="menu-items" class="mobile-nav">
    <a href="WhoWeAre.aspx">Who we are</a>
    <a href="WhatWeDo.aspx">What we do</a>
    <a href="TakeAction.aspx">Take action</a>
    <a href="Latest.aspx">Latest</a>
    <a href="Contact.aspx">Contact</a>
</div>

    <!-- Main Content -->
    <main style="padding: 20px;">

        <h2 class="section-title">Latest</h2>
        <p class="highlight">Read the latest stories about Oxfam in Vietnam and its work</p>
        <p>Learn about how Oxfam is empowering women and communities to create a future that is secure, just and free from poverty. Download our latest research and reports. For further inquiries, <a href="#">get in touch</a> with us.</p>

        <!-- Stories Section -->
        <h3 class="subsection-title">Stories</h3>
        
        <div class="card">
            <img src="Images/the-flame-keeper.jpg" alt="The Flame Keeper of La Bang Tea Village">
            <div class="card-content">
                <h4>The Flame Keeper of La Bang Tea Village</h4>
                <p>"Using a wood stove used to be so tough, but switching to this biomass gasifier stove has really made life easier. I have more time for myself now, and our family's finances have improved too,"…</p>
                <a href="WebForm1.aspx">Read more</a>
            </div>
        </div>

        <div class="card">
            <img src="Images/work-oppotunities.jpg" alt="Legal Access Changing Lives through Community Initiatives">
            <div class="card-content">
                <h4>Legal Access Changing Lives through Community Initiatives</h4>
                <p>"Through legal assistance, we are witnessing change and empowerment in our communities, which fosters hope and resilience."…</p>
                <a href="#">Read more</a>
            </div>
        </div>

        <!-- Publications Section -->
        <h3 class="subsection-title">Publications</h3>
        
        <div class="card">
            <img src="Images/the-commitment.png" alt="The Commitment to Reducing Inequality Index 2024">
            <div class="card-content">
                <h4>[Report] The commitment to reducing inequality index 2024</h4>
                <p>21st Oct 2024 - This report assesses the actions across the three CRI pillars of public services, taxation and labour rights. It makes recommendations for how the IMF and World Bank should stop promoting policies…</p>
                <a href="#">Read more</a>
            </div>
        </div>

        <div class="card">
            <img src="Images/through-the-storm.png" alt="Through the storms toward resilience: Stories of inspiring women">
            <div class="card-content">
                <h4>[Book] Through the storms toward resilience: Stories of inspiring women</h4>
                <p>22nd Jul 2024 - This publication documents short stories about the women with whom the Project was fortunate to support, and witness significant transformations in enhancing resilient livelihoods after the Covid-19…</p>
                <a href="#">Read more</a>
            </div>
        </div>

        <!-- Press Releases Section -->
        <h3 class="subsection-title">Press Releases</h3>
        
        <div class="card">
            <img src="Images/flood.jpg" alt="Education and health cuts by World Bank and IMF programs">
            <div class="card-content">
                <h4>“Dispiriting, dangerous, anti-development” education and health cuts by nearly every country under World Bank and IMF programs</h4>
                <p>21st Oct 2024 - New global index reveals that nine out of ten countries worldwide are pursuing policies that are likely to increase levels of economic inequality.</p>
                <a href="#">Read more</a>
            </div>
        </div>

        <div class="card">
            <img src="Images/thong-cao-bao-chi.jpg" alt="Press release">
            <div class="card-content">
                <h4>THÔNG CÁO BÁO CHÍ: Thanh niên, doanh nghiệp và báo chí cùng tham gia thay đổi định kiến giới tại Việt Nam</h4>
                <p>29th Jul 2024 - Hà Nội, 26/3/2024: Oxfam tại Việt Nam và Viện Tư vấn Phát triển Kinh tế Xã hội Nông thôn và Miền núi (CISDOMA) tổ chức hội thảo tổng kết Dự án ‘Thanh niên tham gia thay đổi định kiến giới và thúc đẩy…</p>
                <a href="#">Read more</a>
            </div>
        </div>

    </main>

    <div class="footer">
    <p>Copyright © 2024 Oxfam International. All rights reserved.</p>
    <div class="social-links">
        <a href="#"><img src="Images/facebook.png" alt="Facebook" /></a>
        <a href="#"><img src="Images/twitter.png" alt="Twitter" /></a>
    </div>
</div>

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
            alert('Vui lòng nhập nội dung bình luận.');
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