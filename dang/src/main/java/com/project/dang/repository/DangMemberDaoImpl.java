package com.project.dang.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangAttendanceDto;
import com.project.dang.dto.DangMemberDto;

@Repository
public class DangMemberDaoImpl implements DangMemberDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int memberNo() {
		return sqlSession.selectOne("dangMember.memberNo");
	}

	// 댕모임 개설자로 가입
	@Override
	public void createDang(DangMemberDto dangMemberDto) {
		sqlSession.insert("dangMember.createDang", dangMemberDto);
	}
	
	//오늘 출석여부 확인
	@Override
	public DangAttendanceDto isAttendance(int memberNo) {
		return sqlSession.selectOne("dangMember.isAttendance",memberNo);
	}

	//출석 insert
	@Override
	public void attendanceInsert(DangAttendanceDto dto) {
		sqlSession.insert("dangMember.attendanceInsert",dto);
	}

	//출석 목록 조회(한달 기준)
	 @Override 
	 public List<DangAttendanceDto> attendanceList(int memberNo) { 
		 return sqlSession.selectList("dangMember.attendanceList",memberNo); 
	 }
		 
	// 댕모임 닉네임 찾기
	@Override
	public String findNick(int userNo) {
		return sqlSession.selectOne("dangMember.findNick",userNo);
	}

	//댕모임 회원 찾기
	@Override
	public DangMemberDto selectOne(DangMemberDto dto) {
		return sqlSession.selectOne("dangMember.fintMember",dto);
	}
	
	//댕모임 회원 등급포인트 증가
	@Override
	public boolean plusScore(DangMemberDto dto) {
		return sqlSession.update("dangMember.plusScore",dto)>0;
	}
	
	//댕모임 회원 등급포인트 확인
	@Override
	public int findScore(int memberNo) {
		return sqlSession.selectOne("dangMember.findScore",memberNo);
	}

	//참여 모임 수
	@Override
	public int joinDangCount(int userNo) {
		return sqlSession.selectOne("dangMember.joinDangCount",userNo);
	}

	

	

	


}
