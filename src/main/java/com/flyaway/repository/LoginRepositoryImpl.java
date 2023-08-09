package com.flyaway.repository;

import com.flyaway.model.User;

import java.sql.*;

public class LoginRepositoryImpl implements LoginRepository {
    private final String Url;
    private final String User;
    private final String Password;

    public LoginRepositoryImpl(String Url, String User, String Password) {
        this.Url = Url;
        this.User = User;
        this.Password = Password;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Error registering MySQL JDBC driver", e);
        }

    }

    @Override
    public User getUser(String name, String email, String password) {
        User user;
        try (Connection connection = DriverManager.getConnection(Url, User, Password)) {
            String query = "Select Name, Email, Password from users Where Name=? AND Email=? AND Password=?;";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, password);
            ResultSet resultSet = statement.executeQuery();
            user = new User();
            user.setName(resultSet.getString("Name"));
            user.setName(resultSet.getString("Email"));
            user.setName(resultSet.getString("Password"));

        } catch (SQLException e) {
            throw new RuntimeException(e);

        }
        return user;
    }
}