package com.project.dang.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class DangUserLoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// HttpSession 반환
		HttpSession session = request.getSession();
		// HttpSession에서 로그인 중인 회원번호 반환
		if(session.getAttribute("loginNo") == null) { // 반환값이 없다면
			// 로그인 Mapping으로 redirect
			response.sendRedirect("/user/login");
			return false; // 차단
		}
		// 그 외에는 통과
		return true;
	}
}
