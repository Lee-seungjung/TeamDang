package com.project.dang.repository;

import java.util.List;

import com.project.dang.vo.DangGroupRegionVO;

public interface AdminDao {
	
	/**
	 * 관리자 여부 조회
	 * @param userNo : 회원 번호
	 * @return
	 */
	public boolean isAdmin(int userNo);
	
	/**
	 * 최근 일주일 로그인 수 조회
	 * @return int
	 */
	int recentLogin();
	
	/**
	 * 최근 일주일 회원가입 수 조회
	 * @return int
	 */
	int recentJoin();
	
	/**
	 * 최근 일주일 댕모임 개설수 조회
	 * @return int
	 */
	int recentDang();
	
	/**
	 * 최근 일주일 일정 개설수 조회
	 * @return int
	 */
	int recentSchdule();
	
	/**
	 * 지역별 댕모임 이용현황 조회
	 * @return List<DangGroupRegionVO>
	 */
	List<DangGroupRegionVO> dangGroupRegion();
}
