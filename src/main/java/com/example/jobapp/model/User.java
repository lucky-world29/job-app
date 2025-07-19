package com.example.jobapp.model;

import jakarta.persistence.*;

/**
 * Represents a registered user in the system.
 * Supports roles: ADMIN or USER.
 */
@Entity
@Table(name = "users") // optional but explicit
public class User {

    // 🔑 Primary Key - Auto-generated ID
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    // 👤 Username - must be unique
    @Column(nullable = false, unique = true)
    private String username;

    // 🔒 Password (stored as plain for now, hash later)
    @Column(nullable = false)
    private String password;

    // 🧑‍💼 Role: either ADMIN or USER
    @Column(nullable = false)
    private String role;

    // 🧱 Default constructor (required by JPA)
    public User() {}

    // 🎯 Constructor with fields
    public User(String username, String password, String role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }

    // 🔧 Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}

