<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Registration</title>

<style>
    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        font-family: 'Segoe UI', sans-serif;
        background: linear-gradient(135deg, #667eea, #764ba2);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        position: relative;
    }

    /* Background circles */
    body::before, body::after {
        content: "";
        position: absolute;
        border-radius: 50%;
        background: rgba(255,255,255,0.1);
        z-index: 0;
    }

    body::before {
        width: 200px;
        height: 200px;
        top: 10%;
        left: 10%;
    }

    body::after {
        width: 300px;
        height: 300px;
        bottom: 10%;
        right: 10%;
    }

    .form-container {
        position: relative;
        z-index: 1;
        background: rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(15px);
        padding: 40px 30px;
        border-radius: 20px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        width: 350px;
        color: white;
        text-align: center;
        animation: fadeIn 0.8s ease-in-out;
    }

    h2 {
        margin-bottom: 20px;
    }

    .form-group {
        margin-bottom: 18px;
        text-align: left;
    }

    label {
        font-size: 14px;
        display: block;
        margin-bottom: 5px;
    }

    input[type="text"] {
        width: 100%;
        padding: 10px;
        border-radius: 10px;
        border: none;
        outline: none;
        font-size: 14px;
    }

    input[type="text"]:focus {
        box-shadow: 0 0 8px rgba(255,255,255,0.7);
    }

    input[type="submit"] {
        width: 100%;
        padding: 12px;
        border-radius: 25px;
        border: none;
        background: linear-gradient(to right, #00c853, #64dd17);
        color: white;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
        margin-top: 10px;
    }

    input[type="submit"]:hover {
        transform: scale(1.05);
        box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    }

    .back-link {
        display: block;
        margin-top: 15px;
        text-align: center;
        text-decoration: none;
        color: #ddd;
        font-size: 13px;
    }

    .back-link:hover {
        color: white;
    }

    .error-message {
        margin-top: 15px;
        color: #ffcccc;
        font-size: 14px;
        text-align: center;
        background-color: red;
        border-radius: 5px;
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

<div class="form-container">
    <h2>🎓 Register Student</h2>

    <form action="studRegister">
        <div class="form-group">
            <label>🆔 Enter ID</label>
            <input type="text" name="id" placeholder="Enter ID">
        </div>

        <div class="form-group">
            <label>👤 Enter Name</label>
            <input type="text" name="name" placeholder="Enter Name">
        </div>

        <div class="form-group">
            <label>🎂 Enter Age</label>
            <input type="text" name="age" placeholder="Enter Age">
        </div>

        <input type="submit" value="REGISTER">
    </form>

    <a href="studWelcome.jsp" class="back-link">← Back to Home</a>

    <% 
        String invalid = (String)request.getAttribute("invalid");
        if(invalid != null) {
    %>
        <div class="error-message"><%= invalid %></div>
    <% } %>
</div>

</body>
</html>