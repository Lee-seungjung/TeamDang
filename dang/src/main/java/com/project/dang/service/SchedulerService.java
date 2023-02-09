package com.project.dang.service;

public interface SchedulerService {
	
	/**
	 * 댕회원 활동점수 충족 시 레벨 증가(한 달에 한 번)
	 * @return
	 */
	boolean upgrade();
}
