package com.flyaway.controller;

import com.flyaway.model.Flight;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "RegistrationControllerServlet", value = "/register")
public class RegistrationControllerServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create a Flight object and set its attributes
        Flight flight = new Flight();
        flight.setAirline(request.getParameter("airline"));
        flight.setSource(request.getParameter("source"));
        flight.setDestination(request.getParameter("destination"));
        try {
            flight.setTravellers(Integer.parseInt(request.getParameter("seats")));
        }catch(Exception e){
            System.out.println(e + "\n" + "seats");
        }
        flight.setPrice(Integer.parseInt(request.getParameter("price").trim()));
        LocalDate departureDate = LocalDate.parse(request.getParameter("date"));
        flight.setDepartureDate(departureDate);


        HttpSession session = request.getSession();
        session.setAttribute("selectedFlight", flight);


        response.sendRedirect("register.jsp");

    }
}
