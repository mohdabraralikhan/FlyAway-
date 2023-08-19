<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="com.flyaway.model.Flight"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ page import="java.util.Set, java.util.HashSet, java.util.List" %>


<!Doctype html>
<html>
<head>
<link rel="stylesheet" href="style.css"></head>
<body>


<h4>List of places for Travelling</h4>
<table>
        <thead><tr>
                    <th>Source</th>
                     <th>Destination</th>
                </tr>
         </thead>
         <tbody>
               <c:forEach items="${flyaway}" var="flight">
                   <tr>
                       <td>${flight.source}</td>
                       <td>${flight.destination}</td>

                   </tr>
               </c:forEach>


         </tbody>
</table>

<h4>Available Airlines</h4>
<%
   Set<String> distinctAirlines = (Set<String>) session.getAttribute("distinctAirlines");
%>
<table>
<thead>
<tr>
<th>Airlines</th></tr>
</thead>
    <c:forEach var="airline" items="${distinctAirlines}">
        <tr>
            <td>${airline}</td>
        </tr>
    </c:forEach>
</table>


<h4>List of Flights</h4>
<table>
    <thead>
        <tr>
            <th>Source</th>
            <th>Destination</th>
            <th>Airline</th>
            <th>Price</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${flyaway}" var="flight">
            <tr>
                <td>${flight.source}</td>
                <td>${flight.destination}</td>
                <td>${flight.airline}</td>
                <td>${flight.price}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
