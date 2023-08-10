<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="com.flyaway.model.Flight" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ page import="com.flyaway.service.PaymentGateway" %>

<!Doctype html>
<html>
<head><link rel="stylesheet" href="style.css"></head>
<body>

<%
  PaymentGateway gateway = new PaymentGateway();
      Flight selectedFlight = (Flight) session.getAttribute("selectedFlight");
      int balance = gateway.getBalance();
      int passengers = (int) session.getAttribute("passengers");

    out.println("selectedFlight: " + selectedFlight);
    out.println("balance: " + balance);
    out.println("passengers: " + passengers);

      int flightPrice = selectedFlight.getPrice();
      int total = passengers * flightPrice;
%>

<h1>Checkout</h1>
<ul><li>Balance: <%=balance%></li>
<li>Passengers: <%=passengers%></li>
<li>Total Amount: <%=total%></li></ul>
<a href="FlightDetails.jsp">Checkout</a>
</body>
</html>
