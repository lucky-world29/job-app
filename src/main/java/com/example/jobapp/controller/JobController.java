package com.example.jobapp.controller;

import com.example.jobapp.model.Job;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class JobController {

    private final List<Job> jobList = new ArrayList<>();

    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/addjob")
    public String showAddForm() {
        return "addjob";
    }

    @PostMapping("/saveJob")
    public String saveJob(@ModelAttribute Job job) {
        jobList.add(job); // ✅ This stores in memory
        return "success";
    }

    @GetMapping("/viewalljobs")
    public String viewAllJobs(Model model) {
        model.addAttribute("jobs", jobList); // ✅ Send list to JSP
        return "viewalljobs";
    }
}
