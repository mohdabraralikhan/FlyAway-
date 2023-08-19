package com.flyaway.service;

import com.flyaway.model.Flight;
import com.flyaway.repository.SearchRepository;

import java.sql.Date;
import java.util.List;

public class SearchServiceServlet {

    private final SearchRepository searchRepository;

    public SearchServiceServlet(SearchRepository searchRepository) {
        this.searchRepository = searchRepository;
    }

    public List<Flight> getAvailableFlights(String source, String destination, Date date, int travellers) {

        return searchRepository.findFlightsByCriteria(source, destination, String.valueOf(date), travellers);
    }

}
