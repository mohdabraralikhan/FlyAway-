<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="com.flyaway.model.Flight" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<html>
<head>
<title>Register</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

<form action="register" method=POST>
<h2>Flyaway Registration </h2>
<label>Username:<input type="text" name="name" id="name"></label>
<label>Email:<input type="text" name="name" id="name"></label>
<label>Password:<input type="text" name="name" id="name"></label>
<input type="submit" value="Login">
</form>
</body>
</html>