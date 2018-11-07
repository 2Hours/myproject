package com.hzq.ssmboot.manage;

import com.hzq.ssmboot.manage.model.User;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Configuration
public class WebSecurityConfig extends WebMvcConfigurerAdapter {

    public static final String SESSION_KEY="name";

    /*资源处理器*/
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/"+"/images/");
        registry.addResourceHandler("/scripts/**").addResourceLocations("/WEB-INF/"+"/scripts/");
        registry.addResourceHandler("/style/**").addResourceLocations("/WEB-INF/"+"/style/");
    }

}