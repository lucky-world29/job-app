package com.example.jobapp.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {

        String uri = request.getRequestURI();
        HttpSession session = request.getSession(false);

        System.out.println("Request URI: " + uri);

        // Public resources and pages
        if (
            uri.equals("/") ||
            uri.endsWith("/home") ||
            uri.endsWith("/login") ||
            uri.endsWith("/register") ||
            uri.contains("/css/") || uri.contains("/js/") || uri.contains("/images/") ||
            uri.endsWith(".css") || uri.endsWith(".js") || uri.endsWith(".png") ||
            uri.endsWith(".jpg") || uri.endsWith(".jpeg") || uri.endsWith(".woff2")
        ) {
            return true;
        }

        // No session -> redirect to login
        if (session == null || session.getAttribute("username") == null) {
            System.out.println("Session is null or username not found. Redirecting to /login");
            response.sendRedirect("/login");
            return false;
        }

        // Check user role
        String role = (String) session.getAttribute("role");

        System.out.println("User role: " + role);

        // Only admin can access /addjob
        if (uri.contains("/addjob") && !"ADMIN".equals(role)) {
            System.out.println("Unauthorized access to /addjob. Redirecting to /home");
            response.sendRedirect("/home");
            return false;
        }

        // All other URIs are allowed if session exists
        System.out.println("Access allowed to: " + uri);
        return true;
    }
}
