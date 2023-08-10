<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>Flight Details</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1><u>Flight Details</u></h1>
    <c:choose>
            <c:when test="${not empty sessionScope.selectedFlight}">
                <c:set var="selectedFlight" value="${sessionScope.selectedFlight}" />

    <p><b>Airline:</b> ${sessionScope.selectedFlight.airline}</p>
    <p><b>Source:</b> ${sessionScope.selectedFlight.source}</p>
    <p><b>Destination:</b> ${sessionScope.selectedFlight.destination}</p>
    <p><b>Travellers:</b> ${sessionScope.selectedFlight.travellers}</p>
    <p><b>Price:</b> $${sessionScope.selectedFlight.price}</p>
    <p><b>Departure Date:</b> ${sessionScope.selectedFlight.departureDate}</p>
    </c:when>
        <c:otherwise>
            <p>No flight selected.</p>
        </c:otherwise>
    </c:choose>
</body>
</html>
