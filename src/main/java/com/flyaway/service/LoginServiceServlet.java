package com.flyaway.service;

import com.flyaway.model.User;
import com.flyaway.repository.LoginRepository;

public class LoginServiceServlet {

    private final LoginRepository loginRepository;
    public LoginServiceServlet(LoginRepository loginRepository) {
        this.loginRepository = loginRepository;
    }


    public User getUser(String name,String email,String password){
    return loginRepository.getUser(name,email,password);
    }

}