package com.flyaway.model;

import java.time.LocalDate;
import java.util.List;

public class Flight {
    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public LocalDate getDepartureDate() {
        return date;
    }

    public void setDepartureDate(LocalDate date) {
        this.date = date;
    }

    public int getTravellers() {
        return travellers;
    }

    public void setTravellers(int travellers) {
        this.travellers = travellers;
    }

    public String getAirline() {
        return airline;
    }

    public void setAirline(String airline) {
        this.airline = airline;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    private String source;
    private String destination;
    private LocalDate date;
    private int travellers;
    private String airline;
    private int price;
    public Flight() {
    }
    }
