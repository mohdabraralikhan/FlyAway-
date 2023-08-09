<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="java.util.List" %>
<%@ page import="com.flyaway.service.PaymentGateway" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<!Doctype html>
<html>
<body>
<h1>Checkout</h1>
<%=PaymentGateway gateway = new PaymentGateway();>
Balance:${gateway.getBalance()}
Amount Payable:${gateway.checkout((${applicationScope.passengers})*flight.getPrice()))}
<a href="FlightDetails.jsp"Checkout</a>

</body>
</html>
<!-- HTML comments are seen by clients, JSP aren't -->
