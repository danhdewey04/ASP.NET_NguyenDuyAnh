<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BTL.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login to Your Account - Oxfam Vietnam</title>
    <meta name="description" content="Login to your Oxfam Vietnam account to access personalized content and manage your profile. Secure and easy access for registered users."/>
    <meta name="keywords" content="Oxfam login, user login, account access, Oxfam Vietnam"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
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

        .login-container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            margin-bottom: 10px;
        }

        button:hover {
            background-color: #45a049;
        }

        #logoutBtn {
            background-color: #f44336;
        }

        #logoutBtn:hover {
            background-color: #da190b;
        }

        .register-link {
            text-align: center;
            margin-top: 20px;
        }

        .register-link a {
            color: #4CAF50;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Login</h2>
            <label for="username">Username:</label>
            <input type="text" id="username" runat="server" /><br />
            <label for="password">Password:</label>
            <input type="password" id="password" runat="server" /><br />
            <button type="button" onclick="loginUser()">Login</button>
            <button type="button" id="logoutBtn" style="display:none;" onclick="logoutUser()">Logout</button>
            <p>If you don't have an account, <a href="Register.aspx">Register here</a>.</p>
        </div>
    </form>

    <script>
        function loginUser() {
            var username = document.getElementById('username').value;
            var password = document.getElementById('password').value;

            if (username === 'ADMIN' && password === '1234') {
                sessionStorage.setItem('userLoggedIn', true);
                sessionStorage.setItem('username', username);
                sessionStorage.setItem('isAdmin', true);
                alert('Admin login successful!');
                window.location.href = 'Admin.aspx';
                return;
            }

            var passwordRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{6,}$/;

            if (!passwordRegex.test(password)) {
                alert('Password must be at least 6 characters long, contain at least one uppercase letter, one number, and one special character.');
                return;
            }

            if (username && password) {
                // Here you can add a backend call to validate credentials
                sessionStorage.setItem('userLoggedIn', true);
                sessionStorage.setItem('username', username);
                sessionStorage.setItem('isAdmin', false);
                alert('Login successful!');
                window.location.href = 'Default.aspx';
            } else {
                alert('Please enter both username and password.');
            }
        }


        function logoutUser() {
            sessionStorage.removeItem('userLoggedIn');
            sessionStorage.removeItem('username');
            sessionStorage.removeItem('isAdmin');
            alert('You have been logged out.');
            window.location.href = 'Login.aspx';
        }

        window.onload = function () {
            if (sessionStorage.getItem('userLoggedIn')) {
                document.getElementById('logoutBtn').style.display = 'inline';
            }
        }
    </script>
</body>
</html>
