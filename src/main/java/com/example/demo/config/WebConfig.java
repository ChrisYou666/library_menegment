package com.example.demo.config;

import com.example.demo.filter.JwtAuthenticationFilter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    // 配置JWT过滤器
    @Bean
    public JwtAuthenticationFilter jwtAuthenticationFilter() {
        return new JwtAuthenticationFilter();
    }

    // 读取配置文件里的上传路径
    @Value("${file.upload-path}")
    private String uploadPath;

    @Bean
    public FilterRegistrationBean<JwtAuthenticationFilter> jwtAuthFilter(JwtAuthenticationFilter filter) {
        FilterRegistrationBean<JwtAuthenticationFilter> reg = new FilterRegistrationBean<>(filter);
        reg.addUrlPatterns(
                "/api/*",
                "/index",
                "/empty",
                "/welcome"
        );
        reg.setOrder(1);
        return reg;
    }

    // 关键：静态资源映射，解决图片无法访问的问题
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String resourceLocation = "file:" + (uploadPath.endsWith("/") ? uploadPath : uploadPath + "/");
        System.out.println("=== 静态资源映射: /uploads/** --> " + resourceLocation);
        registry.addResourceHandler("/uploads/**")
                .addResourceLocations(resourceLocation);
    }
}