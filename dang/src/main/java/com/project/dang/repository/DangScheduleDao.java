package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.DangScheduleDto;
import com.project.dang.vo.ScheduleOneVO;
import com.project.dang.vo.ScheduleVO;
import com.project.dang.vo.SimpleScheduleVO;

public interface DangScheduleDao {
	
	/**
	 * 우측 심플 스케줄 조회
	 * @return List<SimpleScheduleVO>
	 */
	List<SimpleScheduleVO> simpleList();
	
	/**
	 * 달력 내  일정 조회
	 * @return List<ScheduleVO>
	 */
	List<ScheduleVO> list(int DangNo);
	
	/**
	 * 달력 내  날짜별 상세 조회
	 * @return List<ScheduleVO>
	 */
	ScheduleVO detail(int scheduleNo, int DangNo);
	
	/**
	 * 달력 내  날짜별 일정 간단조회
	 * @return List<ScheduleVO>
	 */
	ScheduleOneVO scheduleOne(int scheduleNo, int DangNo);
//	/**
//	 * 댕모임 회원이 일정등록
//	 * @param DangScheduleDto
//	 */
//	public void insert(DangScheduleDto dangScheduleDto);
//	
//	/**
//	 * 일정 등록을 위한 시퀀스 번호 발행
//	 * 	 @return scheduleSequence
//	 */
//	public int scheduleSequence();
//	
//	/**
//	 * 일정 수정
//	 * 	 @param DangScheduleDto
//	 */
//	public boolean update(DangScheduleDto dangScheduleDto);
//	
//	/**
//	 * 일정 삭제
//	 * 	 @param scheduleNo
//	 */
//	public boolean delete(int scheduleNo);
//
//	/**
//	 * 일정 상세
//	 * 	 @param scheduleNo
//	 */
//	public DangScheduleDto selectOne(int scheduleNo);

}
