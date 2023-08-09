<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>Flight Details</title>
</head>
<body>
    <h1>Flight Details</h1>
    <p>Airline: ${sessionScope.selectedFlight.airline}</p>
    <p>Source: ${sessionScope.selectedFlight.source}</p>
    <p>Destination: ${sessionScope.selectedFlight.destination}</p>
    <p>Travellers: ${sessionScope.selectedFlight.travellers}</p>
    <p>Price: $${sessionScope.selectedFlight.price}</p>
    <p>Departure Date: ${sessionScope.selectedFlight.departureDate}</p>

</body>
</html>
