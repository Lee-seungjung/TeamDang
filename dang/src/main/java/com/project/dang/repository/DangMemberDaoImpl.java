package com.project.dang.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangAttendanceDto;
import com.project.dang.dto.DangMemberDto;
import com.project.dang.dto.DangMemberJoinDto;
import com.project.dang.vo.MemberEditVO;
import com.project.dang.vo.MemberListVO;

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
	public String findNick(DangMemberDto dto) {
		return sqlSession.selectOne("dangMember.findNick",dto);
	}
	
	//memberNo 조회
	@Override
	public int findMemberNo(int userNo, int dangNo) {
		Map<String, Integer> param = new HashMap<>();
		param.put("userNo", userNo);
		param.put("dangNo", dangNo);
		return sqlSession.selectOne("dangMember.findMemberNo",param);
	}

	//댕모임 회원 찾기
	@Override
	public DangMemberDto selectOne(DangMemberDto dto) {
		return sqlSession.selectOne("dangMember.findMember",dto);
	}
	
	//특정 댕모임 회원 리스트 조회
	@Override
	public List<MemberListVO> memberList(int dangNo) {
		return sqlSession.selectList("dangMember.memberList",dangNo);
	}
	
	//ajax 댕모임 회원 찾기
	@Override
	public DangMemberDto restSelectOne(int memberNo) {
		return sqlSession.selectOne("dangMember.restFindMember",memberNo);
	}
	
	//댕모임 회원 등급포인트 증가
	@Override
	public boolean plusScore(DangMemberDto dto) {
		return sqlSession.update("dangMember.plusScore",dto)>0;
	}
	
	//댕모임 회원 등급포인트 감소
	@Override
	public boolean minusScore(int memberScore, int memberNo) {
		Map<String, Integer> param = new HashMap<>();
		param.put("memberScore", memberScore);
		param.put("memberNo", memberNo);
		return sqlSession.update("dangMember.minusScore",param)>0;
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

	//프로필 첨부파일 번호 조회
	@Override
	public Integer findAttachmentNo(int userNo) {
		return sqlSession.selectOne("dangMember.findAttachmetNo",userNo);
	}

	//댕모임 내 닉네임 중복확인
	@Override
	public DangMemberDto checkNick(int dangNo, String memberNick) {
		Map<String, String> param = new HashMap<>();
		param.put("dangNo", String.valueOf(dangNo));
		param.put("memberNick", memberNick);
		return sqlSession.selectOne("dangMember.checkNick",param);
	}

	//댕모임 프로필 수정
	@Override
	public boolean editProfile(MemberEditVO vo) {
		return sqlSession.update("dangMember.editProfile",vo)>0;
	}

	// 특정 회원이 가입한 댕모임 목록을 번호로 조회
	@Override
	public List<Integer> searchDangAlreadyJoin(int userNo) {
		return sqlSession.selectList("dangMember.searchDangAlreadyJoin", userNo);
	}

	// 댕모임 가입
	@Override
	public void joinDang(DangMemberJoinDto dangMemberJoinDto) {
		sqlSession.insert("dangMember.join", dangMemberJoinDto);
	}
	
	// 특정 댕모임의 회원수 조회
	@Override
	public Integer countMember(int dangNo) {
		return sqlSession.selectOne("dangMember.countMember", dangNo);
	}

	// 특정 회원이 특정 댕모임의 회원인지 조회
	@Override
	public boolean isDangMember(int userNo, int dangNo) {
		Map<String, String> param = new HashMap<>();
		param.put("userNo", String.valueOf(userNo));
		param.put("dangNo", String.valueOf(dangNo));
		int result = sqlSession.selectOne("dangMember.isDangMember", param);
		return result > 0;
	}

	//댕모임 회원 탈퇴
	@Override
	public boolean deleteDangMember(int dangNo, int memberNo) {
		Map<String, Integer> param = new HashMap<>();
		param.put("dangNo", dangNo);
		param.put("memberNo", memberNo);
		return sqlSession.delete("dangMember.deleteMember",param)>0;
	}

	@Override
	public boolean closeDangMember(int dangNo, int userNo) {
		Map<String, String> param = new HashMap<>();
		param.put("dangNo", String.valueOf(dangNo));
		param.put("userNo", String.valueOf(userNo));
		return sqlSession.delete("dangMember.closeDangMember", param) > 0;
	}
}
