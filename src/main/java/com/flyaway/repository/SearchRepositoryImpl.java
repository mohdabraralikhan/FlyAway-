package com.flyaway.repository;

import com.flyaway.model.Flight;

import java.sql.*;
import java.time.LocalDate;
import java.util.LinkedList;
import java.util.List;

public class SearchRepositoryImpl implements SearchRepository{
    private final String url;
    private final String username;
    private final String password;

    public SearchRepositoryImpl(String url,String username, String password){
        this.url = url;
        this.username = username;
        this.password = password;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Error registering MySQL JDBC driver", e);
        }
    }

        @Override
        public List<Flight> findFlightsByCriteria(String source, String destination, String date, int travellers) {
            List<Flight> flights = new LinkedList<>();

            try (Connection connection = DriverManager.getConnection(url, username, password)) {
                System.out.println("(repo)Established a MySQL Database Connection the query parameters are:"
                        + "\nSource:" + source
                        +"\nDestination:"+destination
                        +"\nDate:"+date
                        +"\nTravellers:"+travellers);
                String query = "SELECT * FROM flights WHERE Source = ? AND Destination = ? AND DepartureDate = ? AND Travellers >= ? ";
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setString(1, source);
                statement.setString(2, destination);
                statement.setString(3, date);
                statement.setInt(4, travellers);

                // Execute the query and populate the flights list
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {

                    Flight flight = new Flight();
                    flight.setAirline(resultSet.getString("Airline"));
                    flight.setSource(resultSet.getString("Source"));
                    flight.setDestination(resultSet.getString("Destination"));
                    flight.setDepartureDate(LocalDate.parse(resultSet.getString("DepartureDate")));
                    flight.setTravellers(resultSet.getInt("Travellers"));
                    flight.setPrice(resultSet.getInt("Price"));

                    flights.add(flight);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return flights;
        }


    }
