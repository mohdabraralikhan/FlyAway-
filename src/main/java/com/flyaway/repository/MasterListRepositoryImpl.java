package com.flyaway.repository;

import com.flyaway.model.Flight;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class MasterListRepositoryImpl implements MasterListRepository{

    private final String url;
    private final String username;
    private final String password;



    public MasterListRepositoryImpl(String url, String username, String password) {
        this.url = url;
        this.username = username;
        this.password = password;
try{
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        throw new RuntimeException("Error registering MySQL JDBC driver", e);
    }
    }

    public List<Flight> getAllDetails(){
        List<Flight> list = new LinkedList<>();
        try(Connection connection = DriverManager.getConnection(url,username,password)){
        String query = "SELECT Source,Destination,Airline,Price From flights;";
        PreparedStatement statement = connection.prepareStatement(query);

        ResultSet resultSet = statement.executeQuery();
        while(resultSet.next()){
            Flight flight = new Flight();
            flight.setAirline(resultSet.getString("Airline"));
            flight.setSource(resultSet.getString("Source"));
            flight.setDestination(resultSet.getString("Destination"));
            flight.setPrice(resultSet.getInt("Price"));
            list.add(flight);
}

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

}



