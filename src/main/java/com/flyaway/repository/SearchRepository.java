package com.flyaway.repository;

import com.flyaway.model.Flight;

import java.util.List;

public interface SearchRepository {
    List<Flight> findFlightsByCriteria(String source, String destination, String date, int passengers);


}

