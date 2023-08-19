<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ page import="com.flyaway.model.Flight" %>
<%@ page import="java.util.Set" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
<table>
<caption><h2>Admin login details</h2></caption>

<tr><td>Admin User Name</td><td>${sessionScope.user.getName()}</td></tr>
<tr><td>Email</td><td>${sessionScope.user.getEmail()}</td></tr>
<tr><td>Password <a href="change-password.jsp">Change Password</a></td><td>${sessionScope.user.getPassword()} </td></tr>

</table>

<a href="http://localhost:${pageContext.request.serverPort}/Flyaway/dashboard"><h4>Flyaway Dashboard</h4></a>
</body>
</html>
