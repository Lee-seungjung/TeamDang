package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.DangScheduleDto;
import com.project.dang.vo.ScheduleVO;
import com.project.dang.vo.SimpleScheduleVO;

public interface DangScheduleDao {
	
	/**
	 * 우측 심플 스케줄 조회
	 * @return List<SimpleScheduleVO>
	 */
	List<SimpleScheduleVO> simpleList();
	
	/**
	 * 달력 클릭하면 일정 조회
	 * @return List<ScheduleVO>
	 */
	List<ScheduleVO> list();
	
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
