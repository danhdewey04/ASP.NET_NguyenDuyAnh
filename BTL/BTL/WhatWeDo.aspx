<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WhatWeDo.aspx.cs" Inherits="BTL.WhatWeDo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Oxfam - What We Do to Fight Inequality and Poverty in Vietnam</title>
    <meta name="description" content="Discover Oxfam's work in Vietnam to tackle inequality, empower citizens, promote gender equality, and create resilient communities."/>
    <meta name="keywords" content="Oxfam Vietnam, fight inequality, gender equality, human economy, resilient communities, social accountability"/>
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
            <img src="Images/what-we-do.jpg" alt="What Oxfam Does in Vietnam" />
        </div>
        <h2 style="color: #4CAF50; font-family: Arial, sans-serif;">What We Do</h2>
        <p style="font-family: Arial, sans-serif; color: #333;">
            We are committed to building a people-centred development model that is feminist and values what truly matters to society. 
            We aim to enable the voices and agency of citizens to strengthen accountable governance. And we work for inclusive, participatory decision-making 
            in efforts to tackle climate change, end inequality, and bring long-term sustainable change. These broad aims are realised through one approach and 
            three specific goals:
        </p>

        <h3 style="font-family: Arial, sans-serif; color: #4CAF50; font-weight: bold;">
            <a href="#" style="color: #4CAF50; text-decoration: underline;">Human Economy</a>
        </h3>
        <p style="font-family: Arial, sans-serif; color: #333;">
            Globally, the way we run our economies needs to change. The over-reliance on GDP growth has paved the way to rigged policies that benefit the richest 
            individuals and corporations, instead of measures that ensure sustainable development and the people’s welfare. This economic model is exacerbating 
            inequality, perpetuating poverty, and trapping many millions in poorly paid and precarious work.
        </p>
        <p style="font-family: Arial, sans-serif; color: #333;">
            Oxfam urges governments and policymakers to work together towards building a “Human Economy” that is people-centred instead of a “for-profit economy” 
            that is disrupting social cohesion in many countries. A Human Economy, built for the many - not the few, can bring an end to inequality and eradicate 
            poverty for good. A Human Economy is also to save the environment for the next generations. <a href="#" style="text-decoration: underline; color: #4CAF50;">Read more</a>
        </p>

        <h3 style="font-family: Arial, sans-serif; color: #4CAF50; font-weight: bold;">
            <a href="#" style="color: #4CAF50; text-decoration: underline;">Goal 1: Gender Equality and Women’s Agency</a>
        </h3>
        <p style="font-family: Arial, sans-serif; color: #333;">
            Despite a strong legal framework on gender equality, women in Vietnam continue to experience discrimination and often lack economic and political 
            opportunities. Gender-based violence remains widespread; <a href="#" style="text-decoration: underline; color: #4CAF50;">about 58% of ever-married women 
            aged 18-60 experience some form of violence</a> at the hands of their husbands or intimate partners at least once in their lifetime.
        </p>
        <p style="font-family: Arial, sans-serif; color: #333;">
            To tackle these issues, we aim to embrace diversity and influence policy to ensure women’s full participation and equal opportunities for leadership 
            at all levels of decision-making in political, economic, and public life. We work for inclusive growth and equal rights to economic resources, as well 
            as access to ownership and control over land and other forms of property, financial services, inheritance, and natural resources. By challenging and 
            changing social norms, we fight to end gender-based violence.
        </p>
        <p style="font-family: Arial, sans-serif; color: #333;">
            While <a href="#" style="text-decoration: underline; color: #8B008B;">feminist principles</a> underpin all our activities, Oxfam in Vietnam is currently 
            implementing projects with a specific focus on gender equality and women’s agency.
        </p>
        <p style="font-family: Arial, sans-serif; color: #333;">
            Review summaries of these projects <a href="#" style="text-decoration: underline; color: #4CAF50;">here</a>.
        </p>

        <h3 style="font-family: Arial, sans-serif; color: #4CAF50; font-weight: bold;">
            <a href="#" style="color: #4CAF50; text-decoration: underline;">Goal 2: Social Accountability and Empowered Citizens</a>
        </h3>
        <p style="font-family: Arial, sans-serif; color: #333;">
            We support decision-making processes that are fair, transparent, and enable citizens to participate effectively. Supporting a vibrant and dynamic 
            civil society is a key element of our governance work. We connect civil society actors and the private sector to create new networks and shared civic 
            space. We also work with the business community to ensure fair and inclusive financing for development activities, and towards improved corporate 
            governance.
        </p>
        <p style="font-family: Arial, sans-serif; color: #333;">
            Oxfam in Vietnam is currently implementing projects that focus on social accountability and empowering citizens. Summaries of current Goal 2 projects 
            can be reviewed <a href="#" style="text-decoration: underline; color: #4CAF50;">here</a>.
        </p>

        <h3 style="font-family: Arial, sans-serif; color: #4CAF50; font-weight: bold;">
            <a href="#" style="color: #4CAF50; text-decoration: underline;">Goal 3: Secured Livelihoods and Resilient Communities</a>
        </h3>
        <p style="font-family: Arial, sans-serif; color: #333;">
            Our aim is to protect and secure the livelihoods of smallholder farmers and vulnerable people. We achieve this by working with small-scale producers 
            and the private sector to improve access to resources, such as land, water, and finance. To ensure vulnerable groups are able to benefit from economic 
            development, we engage with our government partners to ensure development policies are inclusive and sustainable.
        </p>
        <p style="font-family: Arial, sans-serif; color: #333;">
            We also work to enhance the resilience of vulnerable communities in high-risk areas. This means they are better able to adapt to disasters and 
            mitigate the effects of climate change, and are less impacted by extreme weather events. When natural disasters occur, resilient communities are 
            able to recover more quickly.
        </p>
        <p style="font-family: Arial, sans-serif; color: #333;">
            Oxfam in Vietnam is currently implementing projects with a focus on securing livelihoods and building resilient communities. Summaries of Goal 3 
            projects are available for review <a href="#" style="text-decoration: underline; color: #4CAF50;">here</a>.
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