package com.project.dang.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.project.dang.interceptor.DangMemberCheckInterceptor;
import com.project.dang.interceptor.DangUserLoginInterceptor;

@Configuration
public class InterceptorConfiguration implements WebMvcConfigurer {

	// 로그인 인터셉터
	@Autowired
	private DangUserLoginInterceptor dangUserLoginInterceptor;
	
	// 댕모임 회원 인터셉터
	@Autowired
	private DangMemberCheckInterceptor dangMemberCheckInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 로그인 인터셉터 감시 경로
		registry.addInterceptor(dangUserLoginInterceptor)
			.addPathPatterns(
					"/dang/**", 
					"/user/*"
					) 
			.excludePathPatterns(
					"/dang/search",
					"/user/join", 
					"/user/join_success", 
					"/user/login", 
					"/user/logout",
					"/user/close_user_result",
					"/user/find_id",
					"/user/find_id_result",
					"/user/find_pw",
					"/user/find_pw_change",
					"/user/find_pw_success"
					);
		// 댕모임 회원 감시 경로
		registry.addInterceptor(dangMemberCheckInterceptor)
			.addPathPatterns("/dang/**")
			.excludePathPatterns(
					"/dang/create",
					"/dang/search",
					"/dang/not_found"
					);
	}
}
