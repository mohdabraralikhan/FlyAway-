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
<h1>Available Flights</h1>

<table>
<thead>
<tr>
<th>Airline</th>
<th>Source</th>
<th>Destination</th>
<th>Price</th>
<th>Seats</th>
<th>Date</th>
<th>Booking</th>
</tr>
</thead>

<tbody>

<c:if test="${not empty flights}">

        <c:forEach var="flight" items="${flights}">
        <tr>
            <td>${flight.getAirline()}</td>
             <td>${flight.getSource()}</td>
              <td>${flight.getDestination()}</td>
               <td> $${flight.getPrice()}</td>
               <td>${flight.getTravellers()}</td>
               <td> ${flight.getDepartureDate()}</td>
               <td><a href="register.jsp?
               airline=${flight.getAirline()}
               &source=${flight.getSource()}
               &destination=${flight.getDestination()}
               &price=${flight.getPrice()}
               &seats=${flight.getTravellers()}
               &date=${flight.getDepartureDate()}
               &passengers=${passengers}">Book Now</a></td>
</tr>
        </c:forEach>
    </c:if>
    </tbody>
    </table>
    <c:if test="${empty flights}">
        <p>No flights available.</p>
    </c:if>
</body>
</html>
