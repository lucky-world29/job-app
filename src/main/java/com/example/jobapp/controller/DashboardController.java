package com.example.jobapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    @GetMapping("/admin")
    public String showAdminDashboard() {
        return "admindashboard"; // maps to admindashboard.jsp
    }
}
