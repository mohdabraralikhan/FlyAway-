package com.flyaway.controller;
import com.flyaway.model.User;
import com.flyaway.repository.LoginRepository;
import com.flyaway.repository.LoginRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ChangePasswordControllerServlet", value = "/changepassword")
public class ChangePasswordControllerServlet extends HttpServlet {
    private LoginRepository loginRepository;
    @Override
    public void init() throws ServletException {
        super.init();
        // Initialize your LoginRepository here
        String Url = "jdbc:mysql://localhost:3306/flyaway";
        String User = "root";
        String Password = "";
        loginRepository = new LoginRepositoryImpl(Url, User, Password);
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");

        if (user != null) {
            String newPassword = request.getParameter("newPassword");
            String username = user.getName();
            String email = user.getEmail();

            // Update the user's password in the database
            loginRepository.updatePassword(username, email, newPassword);

            // Redirect back to the AdminLoggedIn.jsp page or wherever you want
            response.sendRedirect("admin.jsp");
        } else {
            // Handle the case where the user is not logged in
            response.sendRedirect("admin.jsp"); // Or wherever you want to redirect
        }

    }


}