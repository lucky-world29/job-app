package com.example.jobapp.controller;

import com.example.jobapp.model.User;
import com.example.jobapp.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {

    @Autowired
    private UserRepository userRepository;

    // ==================== LOGIN ====================
    @GetMapping("/login")
    public String showLogin() {
        return "login"; // login.jsp
    }

    @PostMapping("/login")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        HttpSession session) {

        System.out.println("🔐 Attempting login for: " + username);

        // ✅ Hardcoded admin check
        if ("admin".equalsIgnoreCase(username) && "admin123".equals(password)) {
            session.setAttribute("username", username);
            session.setAttribute("role", "ADMIN");
            session.removeAttribute("error");
            System.out.println("✅ Hardcoded admin logged in");
            return "redirect:/admin";
        }

        // ✅ DB check
        User user = userRepository.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            session.setAttribute("username", user.getUsername());
            session.setAttribute("role", user.getRole());
            session.removeAttribute("error");
            System.out.println("✅ DB user logged in with role: " + user.getRole());

            if ("ADMIN".equalsIgnoreCase(user.getRole())) {
                return "redirect:/admin";
            } else {
                return "redirect:/viewalljobs";
            }
        }

        // ❌ Invalid login
        session.setAttribute("error", "❌ Invalid username or password");
        System.out.println("❌ Login failed for user: " + username);
        return "redirect:/login";
    }

    // ==================== LOGOUT ====================
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        System.out.println("👋 Logged out");
        return "redirect:/home";
    }

    // ==================== REGISTER ====================
    @GetMapping("/register")
    public String showRegisterForm() {
        return "register"; // register.jsp
    }

    @PostMapping("/register")
    public String register(@RequestParam String username,
                           @RequestParam String password,
                           HttpSession session) {

        // Check if user already exists
        if (userRepository.findByUsername(username) != null) {
            session.setAttribute("error", "⚠️ Username already taken!");
            return "redirect:/register";
        }

        // Save new user
        User newUser = new User(username, password, "USER");
        userRepository.save(newUser);

        session.setAttribute("username", newUser.getUsername());
        session.setAttribute("role", "USER");
        session.removeAttribute("error");

        System.out.println("✅ Registered new user: " + username);
        return "redirect:/viewalljobs";
    }
}
