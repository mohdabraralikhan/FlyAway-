<%@ page language="Java" contentType="text/html charset=UTF=8" pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
<title>Admin Login</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

<form action="login" method="POST">
<c:if test="${not empty warningMessage}">
    <p style="color: red;">${warningMessage}</p>
</c:if>
<h2>Flyaway Administrator </h2>
<label>Admin Name:<input type="text" name="name" id="name"></label>
<label>Email:<input type="text" name="mail" id="mail"></label>
<label>Password:<input type="text" name="pass" id="pass"></label>
<input type="submit" value="Login">
</form>
</body>
</html>
