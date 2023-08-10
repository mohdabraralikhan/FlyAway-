package com.flyaway.service;

public class PaymentGateway {
    private int balance = 1000;

    public int checkout(int amount){
        return balance-amount;
    }
    public int getBalance(){
        return balance;
    }

}
