package com.project.dang.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.HandlerMapping;

import com.project.dang.repository.DangMemberDao;

@Component
public class DangMemberCheckInterceptor implements HandlerInterceptor {
	
	@Autowired
	private DangMemberDao dangMemberDao;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// HttpSession 반환
		HttpSession session = request.getSession();
		// HttpSession에서 로그인 중인 회원 번호 반환
		Integer userNo = (Integer)session.getAttribute("loginNo");
		// HttpSession에서 로그인 중인 회원 등급 반환
		String userGrade = (String)session.getAttribute("loginGrade");
		// 관리자인지 여부
		if(userGrade.equals("관리자")) {
			return true; // 통과
		}
		
		// PathVariable에서 dangNo 반환
		Map<String, String> pathVariables = (Map<String, String>) request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);
		Integer dangNo = Integer.valueOf(pathVariables.get("dangNo"));
		
		// 댕모임 회원인지 여부
		boolean isDangMember = dangMemberDao.isDangMember(userNo, dangNo);
		if(isDangMember) { 
			return true; // 통과
		}
		response.sendError(403); // 403 에러
		return false; // 차단
	}
}
