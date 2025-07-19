package com.example.jobapp.model;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

/**
 * Represents a Job posting in the system.
 * This is a JPA Entity mapped to the 'job' table in the database.
 */
@Entity
public class Job {

    // 🔑 Primary key with auto-increment strategy
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    // 🏷️ Job title (e.g., Software Engineer)
    private String title;

    // 🏢 Company name (e.g., Google, TCS)
    private String company;

    // 🌍 Job location (e.g., Bangalore, Remote)
    private String location;

    // 📝 Job description with max length 1000 characters
    @Column(length = 1000)
    private String description;

    // 📅 Date when the job was posted
    private LocalDate datePosted;

    // 🧱 Default constructor (required by JPA)
    public Job() {}

    // 🎯 Custom constructor for quick object creation
    public Job(int id, String title, String company, String location, String description) {
        this.id = id;
        this.title = title;
        this.company = company;
        this.location = location;
        this.description = description;
    }

    // 🔧 Getters and Setters for all fields
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDate getDatePosted() {
        return datePosted;
    }

    public void setDatePosted(LocalDate datePosted) {
        this.datePosted = datePosted;
    }
}
