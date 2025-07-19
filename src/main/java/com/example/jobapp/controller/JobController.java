package com.example.jobapp.controller;

import com.example.jobapp.model.Job;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Controller
public class JobController {

    private final List<Job> jobList = new ArrayList<>();
    private int nextId = 1;

    // ✅ Public home page
    @GetMapping("/")
    public String home() {
        return "home";
    }

    // 🔒 View all jobs — requires login
    @GetMapping("/viewalljobs")
    public String viewAllJobs(HttpSession session, Model model,
                              @RequestParam(required = false) String sort) {
        if (!isLoggedIn(session)) return "redirect:/login";

        List<Job> sortedList = new ArrayList<>(jobList);
        if ("date".equals(sort)) {
            sortedList.sort(Comparator.comparing(Job::getDatePosted).reversed());
        }
        model.addAttribute("jobs", sortedList);
        return "viewalljobs";
    }

    // 🔒 Show Add Job form — only for ADMIN
    @GetMapping("/addjob")
    public String addJob(HttpSession session) {
        String role = (String) session.getAttribute("role");
        if (!"ADMIN".equals(role)) return "redirect:/home";
        return "addjob";
    }

    // 🔒 Save new or edited job
    @PostMapping("/saveJob")
    public String saveJob(@ModelAttribute Job job, HttpSession session) {
        if (!isLoggedIn(session)) return "redirect:/login";

        if (job.getId() == 0) {
            job.setId(nextId++);
            job.setDatePosted(LocalDate.now());
            jobList.add(job);
        } else {
            for (int i = 0; i < jobList.size(); i++) {
                if (jobList.get(i).getId() == job.getId()) {
                    job.setDatePosted(jobList.get(i).getDatePosted());
                    jobList.set(i, job);
                    break;
                }
            }
        }
        return "redirect:/viewalljobs?toast=success";
    }

    // 🔒 Edit job by ID — logged in required
    @GetMapping("/editjob")
    public String editJob(@RequestParam int id, HttpSession session, Model model) {
        if (!isLoggedIn(session)) return "redirect:/login";

        for (Job job : jobList) {
            if (job.getId() == id) {
                model.addAttribute("job", job);
                return "editjob";
            }
        }
        return "redirect:/viewalljobs";
    }

    // 🔒 Delete job by ID — logged in required
    @GetMapping("/deletejob")
    public String deleteJob(@RequestParam int id, HttpSession session) {
        if (!isLoggedIn(session)) return "redirect:/login";

        jobList.removeIf(job -> job.getId() == id);
        return jobList.isEmpty() ? "redirect:/addjob" : "redirect:/viewalljobs?toast=deleted";
    }

    // ✅ Helper method — checks if user is logged in
    private boolean isLoggedIn(HttpSession session) {
        String role = (String) session.getAttribute("role");
        return role != null && (role.equals("ADMIN") || role.equals("PUBLIC"));
    }
}
