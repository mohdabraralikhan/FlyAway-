package com.flyaway.service;

public class PaymentGateway {
    int balance = 1000;

    int checkout(int amount){
        return balance-amount;
    }
    int getBalance(){
        return balance;
    }

}
