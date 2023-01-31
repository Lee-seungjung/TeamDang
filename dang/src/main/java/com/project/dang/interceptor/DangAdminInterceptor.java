package com.project.dang.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.project.dang.repository.AdminDao;

@Component
public class DangAdminInterceptor implements HandlerInterceptor {

	@Autowired
	private AdminDao adminDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// HttpSession 반환
		HttpSession session = request.getSession();
		// HttpSession에서 로그인 중인 회원 번호 반환
		Integer userNo = (Integer)session.getAttribute("loginNo");
		// 관리자 여부 반환
		boolean isAdmin = adminDao.isAdmin(userNo);
		if(isAdmin == true) { // 관리자라면
			return true; // 통과
		}
		// 그 외 모두 차단
		response.sendRedirect("/dang/not_found");
		return false; 
	}
}
