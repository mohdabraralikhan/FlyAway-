package com.flyaway.controller;

import com.flyaway.model.Flight;
import com.flyaway.repository.MasterListRepositoryImpl;
import com.flyaway.repository.MasterListRepository;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
@WebServlet(name = "MasterListControllerServlet", value = "/dashboard")
public class MasterListControllerServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(MasterListControllerServlet.class.getName());
    private MasterListRepository masterListRepository;
    @Override
    public void init() throws ServletException {
        super.init();
        String url = "jdbc:mysql://localhost:3306/flyaway";
        String username = "root";
        String password = "";
        masterListRepository = new MasterListRepositoryImpl(url, username, password);
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Flight> details = masterListRepository.getAllDetails();
            request.setAttribute("flyaway", details);

            Set<String> distinctAirlines = new HashSet<>();
            for (Flight flight : details) {
                String airline = flight.getAirline();
                if (airline != null) {
                    distinctAirlines.add(airline);
                }
            }

            HttpSession session = request.getSession();
            session.setAttribute("distinctAirlines", distinctAirlines);


            LOGGER.info("Master list data fetched and stored in request attribute.");

            RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "An error occurred while fetching data.", e);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("An error occurred while processing your request.");
        }
    }
}
