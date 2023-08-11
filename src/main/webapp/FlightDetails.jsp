<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>Flight Details</title>
    <link rel="stylesheet" href="style.css">
</head>
<body style="text-align:center;">
    <h1>Congratulations Your Flight Booking Has Been Confiremd Successfully!</h1>

    <hr>
     <h2>Booking Details</h2>
    <c:choose>
            <c:when test="${not empty sessionScope.selectedFlight}">
                <c:set var="selectedFlight" value="${sessionScope.selectedFlight}" />

    <p><b>Airline:</b> ${sessionScope.selectedFlight.airline}</p>
    <p><b>Source:</b> ${sessionScope.selectedFlight.source}</p>
    <p><b>Destination:</b> ${sessionScope.selectedFlight.destination}</p>
    <p><b>Travellers:</b> ${sessionScope.passengers}</p>
    <p><b>Ticket Price:</b> $${sessionScope.selectedFlight.price}</p>
    <p><b>Total Ticket Price:</b>$${sessionScope.selectedFlight.price *sessionScope.passengers }
    <p><b>Departure Date:</b> ${sessionScope.selectedFlight.departureDate}</p>
    </c:when>
        <c:otherwise>
            <p>No flight selected.</p>
        </c:otherwise>
    </c:choose>
</body>
</html>
