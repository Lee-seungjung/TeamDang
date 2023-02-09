package com.project.dang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.project.dang.repository.DangMemberDao;

@Service
public class SchedulerServiceImpl implements SchedulerService{
	
	@Autowired
	private DangMemberDao dangMemberDao;

	@Scheduled(cron = "0 0 0 1 * *") // 초 분 시 일 월 요일 //매달 1일에 등급 자동설정
	@Override
	public boolean upgrade() {
		return dangMemberDao.upgrade();
	}
	
}
