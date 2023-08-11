package com.flyaway.repository;
import com.flyaway.model.User;
public interface LoginRepository {
    User getUser(String name,String email, String password);

    void updatePassword(String username, String email, String newPassword);
}
