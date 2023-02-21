package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.DangJoinDto;
import com.project.dang.dto.DangScheduleDto;
import com.project.dang.dto.HistoryListRequestDto;
import com.project.dang.vo.JoinMemberVO;
import com.project.dang.vo.JoinScheduleListVO;
import com.project.dang.vo.ScheduleEditVO;
import com.project.dang.vo.ScheduleOneVO;
import com.project.dang.vo.ScheduleVO;
import com.project.dang.vo.SimpleScheduleVO;

public interface DangScheduleDao {

	/**
	 * 우측 심플 스케줄 조회
	 * 
	 * @return List<SimpleScheduleVO>
	 */
	List<SimpleScheduleVO> simpleList(int dangNo);

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
	 * 달력 내 날짜별 일정 간단조회(일정막대별)
	 * 
	 * @return <ScheduleOneVO>
	 */
	ScheduleOneVO scheduleOne(int scheduleNo, Integer dangNo);
	
	/**
	 * 달력 내 날짜별 일정 간단조회(날짜별)
	 * 
	 * @return <ScheduleOneVO>
	 */
	ScheduleOneVO scheduleDate(String scheduleStart, Integer dangNo);

	/**
	 * 상세조회 중 참여인원수 조회
	 * @param scheduleNo
	 * @@return <DangJoinDto>
	 */
	int countJoin(int scheduleNo);

	/**
	 * 상세조회 중 참여인원에 대한 프로필 사진 출력
	 * 
	 * @return <JoinMemberVO>
	 */
	List<JoinMemberVO> joinMemberList(int scheduleNo, int dangNo);

	/**
	 * 댕모임 회원이 일정등록 *
	 * 
	 * @param DangScheduleDto
	 */
	public void insert(DangScheduleDto dangScheduleDto);

	/**
	 * 일정 등록을 위한 시퀀스 번호 발행
	 * 
	 * @return scheduleSequence
	 * 
	 */
	public int scheduleSequence();

	/**
	 * 댕모임 참여(일정 등록한 멤버)
	 * 
	 * @param scehduleNo : 일정 번호
	 * @param memberNo   : 댕모임 멤버 번호
	 * @return Integer : 참여인원수 증가 후 상태
	 */
	public void memberJoin(DangJoinDto dangJoinDto);
	

	/**
	 * 
	 * @param scheduleNo
	 * @param scheduleHead
	 * @return boolean : 수정 성공여부
	 */
	public boolean joinPlus(int scheduleNo, int scheduleHead);

	/**
	 * 댕모임 참여 취소
	 * 
	 * @param scehduleNo : 일정 번호
	 * @param memberNo   : 댕모임 멤버 번호
	 * @return Integer : 참여인원수 감소 후 상태
	 */
	public boolean memberJoinCancel(int scheduleNo, int memberNo);

	/**
	 * 댕모임 일정 참여 확인
	 * 
	 * @param scehduleNo : 일정 번호
	 * @param memberNo   : 댕모임 멤버 번호
	 * @return JoinMemberVO 
	 */
	public List<JoinMemberVO> checkMemberList(int scheduleNo, int memberNo);

	/**
	 * 댕모임 일정 수정에 필요한 정보 조회
	 * @param scheduluNo  : 댕모임 일정 번호
	 * @return ScheduleEditVO : 일정명, 일정내용, 일정 최대참여인원, 참여인원, 장소번호, 일정 날짜, 일정 시간, 참여 회비
	 */
	public ScheduleEditVO selectScheduleInfo(int scheduleNo, Integer dangNo);
	
	/**
	 * 댕모임 일정 수정
	 * @param scheduleEditVO  : 일정명, 일정내용, 일정 최대참여인원 ,장소번호, 일정 날짜, 일정 시간, 참여 회비
	 * @return boolean: 수정 여부
	 */
	public boolean scheduleEdit(ScheduleEditVO scheduleEditVO);

	/**
	 * 일정 삭제
	 * 
	 * @param scheduleNo :댕모임 스케줄 번호
	 * @param memberNo : 댕모임 멤버 번호
	 */
	 public boolean scheduleDelete(int scheduleNo, int memberNo);
	 
	/**
	 * (마이페이지) 참여일정 목록 조회
	 * @param userNo:회원 번호
	 * @return List<JoinScheduleListVO>
	 */
	public List<JoinScheduleListVO> historyList();
	 
	/**
	 * 마이페이지내 참여일정 히스토리 리스트 조회
	 * 
	 * @param dangNo : 댕모임 번호	 
	 */
	 public List<JoinScheduleListVO> joinScheduleList(HistoryListRequestDto historyListRequestDto);
	 
}
