package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.DangAttendanceDto;
import com.project.dang.dto.DangMemberDto;

public interface DangMemberDao {
	
	/**
	 * 댕모임 회원 번호 반환
	 * @return int (댕모임 회원 번호)
	 */
	public int memberNo();

	/**
	 * 댕모임 개설자로 가입
	 * @param dangMemberDto
	 */
	public void createDang(DangMemberDto dangMemberDto);
	
	/**
	 * 댕모임 내 닉네임 찾기
	 * @param dto
	 * @return memberNick
	 */
	String findNick(DangMemberDto dto);
	
	/**
	 * 댕모임 회원 단일조회
	 * @param DangMemberDto
	 * @return DangMemberDto
	 */
	DangMemberDto selectOne(DangMemberDto dto);
	
	/**
	 * 댕모임 회원 등급포인트 증가
	 * (코드 재사용 위해 변수값 dto로 넣음!)
	 * @param DangMemberDto
	 * @return true 또는 false
	 */
	boolean plusScore(DangMemberDto dto);
	
	/**
	 * 댕모임 회원 포인트 조회
	 * @param memberNo
	 * @return 포인트 점수(int)
	 */
	int findScore(int memberNo);
	
	/**
	 * 오늘 출석 여부
	 * @param memberNo
	 * @return DangAttendanceDto 또는 null
	 */
	DangAttendanceDto isAttendance(int memberNo);
	
	/**
	 * 출석 테이블 insert
	 * @param DangAttendanceDto
	 */
	void attendanceInsert(DangAttendanceDto dto);
	
	/**
	 * 출석 목록 조회(한달 기준)
	 * @param memberNo
	 * @return List<DangAttendanceDto>
	 */
	List<DangAttendanceDto> attendanceList(int memberNo);
	
	/**
	 * 참여 모임 수
	 * @param userNo
	 * @return 모임 수(int)
	 */
	int joinDangCount(int userNo);
	
	
}
