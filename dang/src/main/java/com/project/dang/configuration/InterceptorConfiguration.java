package com.project.dang.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.project.dang.interceptor.DangUserLoginInterceptor;

@Configuration
public class InterceptorConfiguration implements WebMvcConfigurer {

	// 로그인 인터셉터
	@Autowired
	private DangUserLoginInterceptor dangUserLoginInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 로그인 인터셉터 감시 경로
		registry.addInterceptor(dangUserLoginInterceptor)
			.addPathPatterns(
					"/dang/**", 
					"/user/*"
					) 
			.excludePathPatterns(
					"/user/join", 
					"/user/join_success", 
					"/user/login", 
					"/user/logout"
					);
	}
}
