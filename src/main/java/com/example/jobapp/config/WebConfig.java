package com.example.jobapp.config;

import com.example.jobapp.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns(
                        "/", "/home", "/login", "/register",
                        "/css/**", "/js/**", "/images/**", "/webjars/**",
                        "/**/*.css", "/**/*.js", "/**/*.png", "/**/*.woff2", "/**/*.jpg", "/**/*.jpeg"
                );
    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/home").setViewName("home");
    }
}
