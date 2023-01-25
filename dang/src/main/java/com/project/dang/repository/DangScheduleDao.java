package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.DangJoinDto;
import com.project.dang.dto.DangScheduleDto;
import com.project.dang.vo.JoinMemberVO;
import com.project.dang.vo.ScheduleOneVO;
import com.project.dang.vo.ScheduleVO;
import com.project.dang.vo.SimpleScheduleVO;

public interface DangScheduleDao {

	/**
	 * 우측 심플 스케줄 조회
	 * 
	 * @return List<SimpleScheduleVO>
	 */
	List<SimpleScheduleVO> simpleList();

	/**
	 * 달력 내 일정 조회
	 * 
	 * @return List<ScheduleVO>
	 */
	List<ScheduleVO> list(Integer dangNo);

	/**
	 * 달력 내 날짜별 상세 조회
	 * 
	 * @return <ScheduleVO>
	 */
	ScheduleVO detail(int scheduleNo, Integer dangNo);

	/**
	 * 달력 내 날짜별 일정 간단조회
	 * 
	 * @return <ScheduleOneVO>
	 */
	ScheduleOneVO scheduleOne(int scheduleNo, Integer dangNo);

	/**
	 * 상세조회 중 참여인원수 조회
	 * 
	 * @return <DangJoinDto>
	 */
	int countJoin(int scheduleNo);

	/**
	 * 상세조회 중 참여인원에 대한 프로필 사진 출력
	 * 
	 * @return <JoinMemberVO>
	 */
	List<JoinMemberVO> joinMemberList(int scheduleNo);
	
	/**
	* 댕모임 회원이 일정등록
	* *
	* @param DangScheduleDto
	*/
	public void insert(DangScheduleDto dangScheduleDto);
	
	/**
	 * 일정 등록을 위한 시퀀스 번호 발행
	 * 	 @return scheduleSequence
	 * 
	 */
	public int scheduleSequence();


	/**
	* 댕모임 참여
	 * 
	* @param scehduleNo : 일정 번호
	 * @param memberNo   : 댕모임 멤버 번호
	* @return Integer : 참여인원수 증가 후 상태
	 */
		  public void memberJoin(DangJoinDto dangJoinDto);
	
		  /**
	 * 댕모임 참여 취소
	 * 
	 * @param scehduleNo : 일정 번호
	 * @param memberNo   : 댕모임 멤버 번호
	 * @return Integer : 참여인원수 감소 후 상태
	 */
		  public boolean memberJoinCancle(DangJoinDto dangJoinDto);
		  
  	/**
	 * 댕모임 일정 참여 확인
	 * 
	 * @param scehduleNo : 일정 번호
	 * @param memberNo   : 댕모임 멤버 번호
	 * @return JoinMemberVO : 일정 참여자가 맞는지 체크
	 */
		  public JoinMemberVO checkMember(int scheduleNo, int memberNo);
			 


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

}
