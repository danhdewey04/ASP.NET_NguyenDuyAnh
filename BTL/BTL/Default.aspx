<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BTL.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Oxfam Vietnam - Relief Efforts, Inequality Reduction, and Empowerment Initiatives</title>
    <meta name="description" content="Learn about Oxfam's projects in Vietnam, including disaster relief, commitment to reducing inequality, and empowerment of female farmers post-COVID."/>
    <meta name="keywords" content="Oxfam, Vietnam, Relief Efforts, Reducing Inequality, Empowerment, Female Farmers"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="Style.css"/>
    <style>

        /* Rest of your existing styles */
        .articles {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            padding: 20px;
        }

        .article {
            flex: 0 1 350px;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            background: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .article img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            display: block;
        }

        .article p {
            padding: 10px;
            margin: 0;
        }

        .article button {
            margin: 10px;
            padding: 8px 16px;
            background-color: #61A534;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        /* Styling for search results */
        .search-results {
            position: relative;
            background: white;
            border: 1px solid #ddd;
            width: 200px;
            max-height: 300px;
            overflow-y: auto;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }

        .search-results a {
            display: block;
            padding: 20px;
            color: #333;
            text-decoration: none;
        }

        .search-results a:hover {
            background-color: #f0f0f0;
            color: #4CAF50;
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
            <div class="search-bar">
            <input type="text" id="searchInput" placeholder="Search" onkeyup="performSearch()" />
            <div id="searchResults" class="search-results" style="display: none;"></div>
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
    </div>
        <div id="menu-items" class="mobile-nav">
            <a href="WhoWeAre.aspx">Who We Are</a>
            <a href="WhatWeDo.aspx">What We Do</a>
            <a href="TakeAction.aspx">Take Action</a>
            <a href="Latest.aspx">Latest</a>
            <a href="Contact.aspx">Contact</a>
        </div>
        <main class="featured">
            <h1>Oxfam's Featured Initiatives in Vietnam</h1>
            <div class="articles">
                <article class="article">
                    <img src="Images/flood.jpg" alt="Oxfam Vietnam Supports 5 Billion VND Relief" />
                    <p>[Report] Oxfam in Vietnam supports 5 billion VND for relief and recovery after typhoon Yagi</p>
                    <p>21st Oct 2024</p>
                    <button type="button" onclick="location.href='flood.aspx'">Read more</button>
                </article>
                <article class="article">
                    <img src="Images/the-commitment.png" alt="Reducing Inequality Index 2024 Report" />
                    <p>[Report] The commitment to reducing inequality index 2024</p>
                    <p>21st Oct 2024</p>
                    <button type="button" onclick="location.href='The-commitment.aspx'">Read more</button>
                </article>
                <article class="article">
                    <img src="Images/chan-nuoi.jpg" alt="Empowering Female Farmers Post-COVID" />
                    <p>From Recovery to Resilience: Empowering 1,500 Female Farmers Post-COVID</p>
                    <p>21st Oct 2024</p>
                    <button type="button" onclick="location.href='chan-nuoi.aspx'">Read more</button>
                </article>
            </div>
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

    function performSearch() {
        const searchInput = document.getElementById('searchInput').value.toLowerCase();
        const searchResults = document.getElementById('searchResults');
        const pages = [
            { name: 'Empowering female farmers', url: 'chan-nuoi.aspx' },
            { name: 'Commitment', url: 'the-commitment.aspx' },
            { name: 'Typhoon Yagi', url: 'flood.aspx' }
        ];

        searchResults.innerHTML = '';
        if (searchInput.trim() !== '') {
            const filteredPages = pages.filter(page => page.name.toLowerCase().includes(searchInput));
            if (filteredPages.length > 0) {
                filteredPages.forEach(page => {
                    const link = document.createElement('a');
                    link.href = page.url;
                    link.textContent = page.name;
                    link.style.display = 'block';
                    link.style.padding = '5px';
                    searchResults.appendChild(link);
                });
                searchResults.style.display = 'block';
            } else {
                searchResults.style.display = 'none';
            }
        } else {
            searchResults.style.display = 'none';
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