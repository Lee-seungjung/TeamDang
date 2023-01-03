package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.DangScheduleDto;

public interface DangScheduleDao {
	
	/**
	 * 일정 조회
	 * @param scheduleNo
	 */
	List<DangScheduleDto> scheduleList(int scheduleNo);	
	
	/**
	 * 댕모임 회원이 일정등록
	 * @param DangScheduleDto
	 */
	public void insert(DangScheduleDto dangScheduleDto);
	
	/**
	 * 일정 등록을 위한 시퀀스 번호 발행
	 * 	 @return scheduleSequence
	 */
	public int scheduleSequence();
	
	/**
	 * 일정 수정
	 * 	 @param DangScheduleDto
	 */
	public boolean update(DangScheduleDto dangScheduleDto);
	
	/**
	 * 일정 삭제
	 * 	 @param scheduleNo
	 */
	public boolean delete(int scheduleNo);

	/**
	 * 일정 상세
	 * 	 @param scheduleNo
	 */
	public DangScheduleDto selectOne(int scheduleNo);

}
