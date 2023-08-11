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
            System.out.println("Name:" + name + "\nEmail:" + email + "\nPassword:" + password + "\nThis is user input");
            String query = "Select username, email, password from admin Where username=? AND email=? AND password=?;";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, password);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                user = new User();
                user.setName(resultSet.getString("username"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                System.out.println("(repo)Name:" + user.getName() + "\nEmail:" + user.getEmail() + "\nPassword:" + user.getPassword() + "\nThis is from database");

            }
            else {
                user = null;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);

        }
        return user;
    }

    @Override
    public void updatePassword(String username, String email, String newPassword) {
        try (Connection connection = DriverManager.getConnection(Url, User, Password)) {
            String updateQuery = "UPDATE admin SET password = ? WHERE username = ? AND email = ?";
            PreparedStatement updateStatement = connection.prepareStatement(updateQuery);
            updateStatement.setString(1, newPassword);
            updateStatement.setString(2, username);
            updateStatement.setString(3, email);
            updateStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}