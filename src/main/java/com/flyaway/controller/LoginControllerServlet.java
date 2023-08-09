package com.flyaway.controller;

import com.flyaway.model.User;
import com.flyaway.repository.LoginRepository;
import com.flyaway.repository.LoginRepositoryImpl;
import com.flyaway.service.LoginServiceServlet;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginControllerServlet", value = "/login")
public class LoginControllerServlet extends HttpServlet {

   private final LoginServiceServlet login;
   public LoginControllerServlet(){
    System.out.println("Login Controller Initialized");
    LoginServiceServlet loginServiceServlet = null;
    try{
        String Url = "jdbc:mysql://localhost:3306/flyaway";
        String User = "root";
        String Password = "8499908716";
        LoginRepository loginRepository = new LoginRepositoryImpl(Url,User,Password);
        login = new LoginServiceServlet(loginRepository);
    } catch (Exception e) {
        throw new RuntimeException(e);
    }

   }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = login.getUser(name,email,password);
        request.setAttribute("user",user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("AdminLoggedIn.jsp");
        dispatcher.forward(request,response);
    }
}