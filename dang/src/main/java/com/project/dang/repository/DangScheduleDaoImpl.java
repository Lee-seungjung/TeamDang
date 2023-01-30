package com.project.dang.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangJoinDto;
import com.project.dang.dto.DangScheduleDto;
import com.project.dang.vo.JoinMemberVO;
import com.project.dang.vo.ScheduleEditVO;
import com.project.dang.vo.ScheduleOneVO;
import com.project.dang.vo.ScheduleVO;
import com.project.dang.vo.SimpleScheduleVO;

@Repository
public class DangScheduleDaoImpl implements DangScheduleDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//우측 스케줄 심플일정 조회(다가오는 날짜 가까운순 5개)
	@Override
	public List<SimpleScheduleVO> simpleList() {
		return sqlSession.selectList("schedule.simpleList");
	}
	
	//캘린더내 댕모임별 일정 조회
	@Override
	public List<ScheduleVO> list(Integer dangNo) {
		return sqlSession.selectList("schedule.list", dangNo);		
	}
	
	//일정 상세보기 조회
	@Override
	public ScheduleVO detail(int scheduleNo, Integer dangNo) {
		Map<String, String> param = new HashMap<>();
		param.put("scheduleNo", String.valueOf(scheduleNo));
		param.put("dangNo", String.valueOf(dangNo));		
		return sqlSession.selectOne("schedule.detail",  param);
	}
	
	//일정 간단정보 조회
	@Override
	public ScheduleOneVO scheduleOne(int scheduleNo, Integer dangNo) {
		Map<String, String> param = new HashMap<>();
		param.put("scheduleNo", String.valueOf(scheduleNo));
		param.put("dangNo", String.valueOf(dangNo));
		return sqlSession.selectOne("schedule.scheduleOne", param);
	}
	
	//일정 참여인원수 조회
	@Override
	public int countJoin(int scheduleNo) {
		return sqlSession.selectOne("schedule.countJoin", scheduleNo);	
	}
	
	//일정상세 내 참여인원 프로필 사진 출력
	@Override
	public List<JoinMemberVO> joinMemberList(int scheduleNo) {
		return sqlSession.selectList("schedule.joinMemberList", scheduleNo);	
	}
	
	//일정 등록
	@Override
	public void insert(DangScheduleDto dangScheduleDto) {	
		sqlSession.insert("schedule.scheduleInsert", dangScheduleDto);		
	}

	//일정 등록관련 시퀀스 발행
	@Override
	public int scheduleSequence() {
		return sqlSession.selectOne("schedule.scheduleSequence");
	}

	
	//일정 참여
	@Override
	public void memberJoin(DangJoinDto dangJoinDto) {
		sqlSession.insert("schedule.memberJoin", dangJoinDto);		
		
	}
	
	//일정 참여취소
	@Override
	public  boolean memberJoinCancel(int scheduleNo, int memberNo) {
		Map<String, String> param = new HashMap<>();
		param.put("scheduleNo", String.valueOf(scheduleNo));
		param.put("memberNo", String.valueOf(memberNo));	
		return sqlSession.delete("schedule.memberJoinCancel", param)>0;
	}
	
	//일정 개설자 확인용 조회
	@Override
	public List<JoinMemberVO> checkMemberList(int scheduleNo, int memberNo) {
		Map<String, String> param = new HashMap<>();
		param.put("scheduleNo", String.valueOf(scheduleNo));
		param.put("memberNo", String.valueOf(memberNo));
		return sqlSession.selectList("schedule.checkMemberList", param);
	}
	
	//일정 수정에 필요한 정보 조회
	@Override
	public ScheduleEditVO selectScheduleInfo(int scheduleNo, Integer dangNo) {
		Map<String, String> param = new HashMap<>();
		param.put("scheduleNo", String.valueOf(scheduleNo));
		param.put("dangNo", String.valueOf(dangNo));
		return sqlSession.selectOne("schedule.selectScheduleInfo", param);
	}
	
	//일정 수정
	@Override
	public boolean scheduleEdit(ScheduleEditVO scheduleEditVO) {
		//수정하기
		return sqlSession.update("schedule.scheduleEdit", scheduleEditVO)>0;

	}
	
	//일정 삭제
		@Override
	public boolean scheduleDelete(int scheduleNo, int memberNo) {	
		Map<String, String> param = new HashMap<>();
		param.put("scheduleNo", String.valueOf(scheduleNo));
		param.put("memberNo", String.valueOf(memberNo));		
		return sqlSession.delete("schedule.scheduleDelete", param)>0;
	}



}
