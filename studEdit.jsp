<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Student</title>

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
    }

    .container {
        background: rgba(255,255,255,0.15);
        backdrop-filter: blur(15px);
        padding: 35px;
        border-radius: 20px;
        width: 350px;
        color: white;
        box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        animation: fadeIn 0.8s ease-in-out;
    }

    h1 {
        text-align: center;
        font-size: 20px;
        margin-bottom: 20px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        display: block;
        margin-bottom: 5px;
        font-size: 14px;
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
        background: linear-gradient(to right, #ff9800, #ff5722);
        color: white;
        font-size: 15px;
        cursor: pointer;
        transition: 0.3s;
        margin-top: 10px;
    }

    input[type="submit"]:hover {
        transform: scale(1.05);
        box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    }

    .error-message {
        margin-top: 15px;
        color: #ffcccc;
        text-align: center;
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

<div class="container">
    <h1>✏️ Edit Student Details</h1>

    <form action="edit">
        <div class="form-group">
            <label>🆔 Enter ID</label>
            <input type="text" name="id" placeholder="Enter ID">
        </div>

        <div class="form-group">
            <label>👤 Update Name</label>
            <input type="text" name="name" placeholder="Enter Name">
        </div>

        <div class="form-group">
            <label>🎂 Update Age</label>
            <input type="text" name="age" placeholder="Enter Age">
        </div>

        <input type="submit" value="UPDATE">
    </form>

    <% 
        String invalid = (String)request.getAttribute("invalid");
        if(invalid != null) {
    %>
        <div class="error-message"><%= invalid %></div>
    <% } %>
</div>

</body>
</html>