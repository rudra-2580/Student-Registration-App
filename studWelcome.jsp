<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Home</title>

<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', sans-serif;
        background: linear-gradient(135deg, #667eea, #764ba2);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .container {
        text-align: center;
        padding: 50px;
        border-radius: 20px;
        backdrop-filter: blur(15px);
        background: rgba(255, 255, 255, 0.15);
        box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        color: white;
        animation: fadeIn 1s ease-in-out;
        width: 350px;
    }

    h1 {
        margin-bottom: 10px;
        font-size: 28px;
    }

    p {
        margin-bottom: 25px;
        font-size: 15px;
        opacity: 0.9;
    }

    .btn {
        display: inline-block;
        margin: 10px;
        padding: 12px 25px;
        font-size: 15px;
        border-radius: 30px;
        text-decoration: none;
        color: white;
        transition: all 0.3s ease;
    }

    .register {
        background: linear-gradient(to right, #00c853, #64dd17);
    }

    .display {
        background: linear-gradient(to right, #2196f3, #21cbf3);
    }

    .btn:hover {
        transform: scale(1.1);
        box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    }

    .footer {
        margin-top: 20px;
        font-size: 12px;
        opacity: 0.7;
    }

    /* Success message styling */
    .success-msg {
        background: rgba(0, 255, 0, 0.2);
        border: 1px solid #00ff88;
        color: #eaffea;
        padding: 10px;
        border-radius: 10px;
        margin-bottom: 15px;
        font-size: 14px;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>

</head>
<body>

<%
String success = (String) request.getAttribute("success");
if(success == null) success = "";
%>

<div class="container">

    <% if(!success.isEmpty()) { %>
        <div class="success-msg">
            <%= success %>
        </div>
    <% } %>

    <h1>🎓 Student Management System</h1>
    <p>Register and manage student records easily</p>

    <a href="studRegister.jsp" class="btn register">➕ Register Student</a>
    <a href="studDisplay.jsp" class="btn display">📋 View Students</a>

    <div class="footer">
        © 2026 Student App
    </div>
</div>

</body>
</html>