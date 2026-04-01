package com.example.learntracker;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.example.learntracker.mapper")
public class LearnTrackerApplication {
    
    public static void main(String[] args) {
        SpringApplication.run(LearnTrackerApplication.class, args);
    }
}