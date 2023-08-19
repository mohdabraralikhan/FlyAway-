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
    <h1>Congratulations Your Flight Booking Has Been Confirmed Successfully!</h1>

    <hr>
     <h2>Booking Details</h2>
     <table>
    <c:choose>
            <c:when test="${not empty sessionScope.selectedFlight}">
                <c:set var="selectedFlight" value="${sessionScope.selectedFlight}" />
<thead><tr>
<th>Airline</th>
<th>Source</th>
<th>Destination</th>
<th>Travellers</th>
<th>Ticket Price</th>
<th>Total Ticket Price</th>
<th> Departure Date</th>
</tr></thead>
<tbody>
<tr>
<td> ${sessionScope.selectedFlight.airline}</td>
    <td>${sessionScope.selectedFlight.source}</td>
    <td>${sessionScope.selectedFlight.destination}</td>
    <td>${sessionScope.passengers}</td>
    <td> $${sessionScope.selectedFlight.price}</td>
    <td>$${sessionScope.selectedFlight.price *sessionScope.passengers }</td>
   <td>${sessionScope.selectedFlight.departureDate}</td>
   </tr>
   </tbody>
   <table>
    </c:when>
        <c:otherwise>
            <p>No flight selected.</p>
        </c:otherwise>
    </c:choose>
</body>
</html>
