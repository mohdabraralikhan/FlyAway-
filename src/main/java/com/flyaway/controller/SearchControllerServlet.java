package com.flyaway.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.flyaway.model.Flight;
import com.flyaway.repository.SearchRepository;
import com.flyaway.repository.SearchRepositoryImpl;
import com.flyaway.service.SearchServiceServlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/search")
public class SearchControllerServlet extends HttpServlet {

    
	private static final long serialVersionUID = 1L;
	private final SearchServiceServlet searchServiceServlet;
    private static final Logger logger = Logger.getLogger(SearchControllerServlet.class.getName());

    public SearchControllerServlet() {
        SearchServiceServlet searchService = null;
        try {
            String Url = "jdbc:mysql://localhost:3306/flyaway";
            String User = "root";
            String Password = "8499908716";
            SearchRepository searchRepository = new SearchRepositoryImpl(Url, User, Password);
            searchService = new SearchServiceServlet(searchRepository);
        } catch (Exception e) {
            logger.log(Level.SEVERE, "An exception occurred.", e);
        }
        searchServiceServlet = searchService;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String Source = request.getParameter("source");
        String Destination = request.getParameter("destination");
        Date date = Date.valueOf(request.getParameter("date"));
        int Travellers = Integer.parseInt(request.getParameter("travellers"));

        List<Flight> availableFlights = searchServiceServlet.getAvailableFlights(Source, Destination, date, Travellers);
        request.setAttribute("flights", availableFlights);
        RequestDispatcher dispatcher = request.getRequestDispatcher("AvailableFlights.jsp");
        dispatcher.forward(request, response);
    }
}