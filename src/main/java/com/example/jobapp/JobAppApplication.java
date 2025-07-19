// File: src/main/java/com/example/jobapp/JobAppApplication.java
package com.example.jobapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication // 👈 This triggers component scanning for subpackages
public class JobAppApplication {
    public static void main(String[] args) {
        SpringApplication.run(JobAppApplication.class, args);
    }
}
