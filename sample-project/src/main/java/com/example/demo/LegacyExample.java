package com.example.demo;

import javax.validation.Valid;
import javax.servlet.Filter;
import javax.annotation.PostConstruct;
import javax.jms.ConnectionFactory;

public class LegacyExample {
    @PostConstruct
    public void init() { System.out.println("Legacy startup path"); }
    public String hello(@Valid String input) { return input; }
    public Filter filter() { return null; }
    public ConnectionFactory mqConnectionFactory() { return null; }
}
