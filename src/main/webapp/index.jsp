<%@ page language="Java" contentType="text/html charset=UTF=8" pageEncoding="UTF-8" isELIgnored="false"%>
<!Doctype html>
<html lang="en">
<head>
<title>Flyaway</title>
<style>

*{font-family:Montserrat;}

body{display:flex;padding:0;margin:0;}

a,.user,.admin{width:100%;height:100vh;}

a{display:flex;text-decoration:none;color:inherit;text-align:center;justify-content: center;align-items: center;}
.user{background-color:#121212;color:#ffffff;}
.admin{background-color:#ffffff;color:#121212;}
h1{margin:0;}
</style></head>

<body>
<h1 class="user"><a  href="http://localhost:${pageContext.request.serverPort}/Flyaway/User.jsp">User</a></h1>
<h1 class="admin"><a href="http://localhost:${pageContext.request.serverPort}/Flyaway/admin.jsp">Admin</a></h1>
</body>
</html>
