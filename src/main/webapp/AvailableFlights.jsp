<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="com.flyaway.model.Flight" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<!Doctype html>
<html lang="en">
<head>
<title>Available Flights</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<h1>Welcome to FlyAway</h1>
<c:if test="${not empty flights}">
        <c:forEach var="flight" items="${flights}">
            <p>${flight.getAirline()} - ${flight.getSource()} to ${flight.getDestination()}, Price: $${flight.getPrice()}, Date: ${flight.getDepartureDate()}</p>
            <input type="submit" name="booknow" id="booknow" value="Book Now">
        </c:forEach>
    </c:if>
    <c:if test="${empty flights}">
        <p>No flights available.</p>
    </c:if>
</body>
</html>
