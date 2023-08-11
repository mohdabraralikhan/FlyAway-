<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ page import="com.flyaway.model.Flight"%>
<!Doctype html>
<html lang="en">
<head>
<title>Admin</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<b>Admin name:</b>${sessionScope.user.getName()}<br>
<b>Email:</b>${sessionScope.user.getEmail()}<br>
<b>Password:</b>${sessionScope.user.getPassword()}<br>
<a href="change-password.jsp">Change Password</a>

</body>
</html>