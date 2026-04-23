<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.studentDataStore.Student" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Display</title>

<style>
    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        font-family: 'Segoe UI', sans-serif;
        background: linear-gradient(135deg, #36d1dc, #5b86e5);
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        color: white;
    }

    .container {
        width: 85%;
        max-width: 950px;
        background: rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(12px);
        padding: 30px;
        border-radius: 20px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        text-align: center;
        animation: fadeIn 0.8s ease-in-out;
    }

    h1 {
        margin-bottom: 20px;
    }

    .btn {
        padding: 10px 25px;
        font-size: 16px;
        border: none;
        border-radius: 25px;
        background: linear-gradient(to right, #ff7b00, #ffb347);
        color: white;
        cursor: pointer;
        transition: 0.3s;
        margin-bottom: 20px;
    }

    .btn:hover {
        transform: scale(1.08);
        box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    }

    table {
        margin: 20px auto;
        border-collapse: collapse;
        width: 100%;
        background: white;
        color: black;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 8px 20px rgba(0,0,0,0.2);
    }

    th, td {
        padding: 14px;
        text-align: center;
    }

    th {
        background: #5b86e5;
        color: white;
        font-size: 17px;
    }

    tr:nth-child(even) {
        background: #f2f2f2;
    }

    tr:hover {
        background: #e6e6e6;
    }

    /* Action Buttons */
    .action-btn {
        text-decoration: none;
        padding: 6px 12px;
        border-radius: 15px;
        font-size: 13px;
        margin: 0 5px;
        display: inline-block;
        transition: 0.3s;
        color: white;
    }

    .edit-btn {
        background: linear-gradient(to right, #00c853, #64dd17);
    }

    .delete-btn {
        background: linear-gradient(to right, #ff1744, #d50000);
    }

    .action-btn:hover {
        transform: scale(1.1);
    }

    .empty {
        margin-top: 20px;
        font-size: 16px;
        color: #eee;
    }

    .back-link {
        display: block;
        margin-top: 15px;
        color: #ddd;
        text-decoration: none;
        font-size: 14px;
    }

    .back-link:hover {
        color: white;
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

    <h1>📋 Student Records</h1>

    <form action="studDisplay">
        <input type="submit" value="Display Data" class="btn">
    </form>

    <%
        String str = (String) request.getAttribute("stable");

        if(str == null || str.trim().isEmpty()){
    %>
        <div class="empty">No student data available. Click "Display Data" to load.</div>
    <%
        } else {
            out.print(str);  // Your table will appear here
        }
    %>

    <a href="studWelcome.jsp" class="back-link">← Back to Home</a>

</div>

</body>
</html>