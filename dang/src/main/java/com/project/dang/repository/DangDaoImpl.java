package com.project.dang.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangDto;
import com.project.dang.vo.DangInfoVO;

@Repository
public class DangDaoImpl implements DangDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 댕모임 회원인지 여부 반환
	@Override
	public boolean isDangMember(int dangNo, int userNo) {
		Map<String,String> param = new HashMap<>();
		param.put("dangNo", String.valueOf(dangNo));
		param.put("userNo", String.valueOf(userNo));
		Integer result = sqlSession.selectOne("dang.isDangMember", param);
		if(result == null) result = 0; 
		return result > 0;
	}
	
	// 댕모임 번호 반환
	@Override
	public int dangNo() {
		return sqlSession.selectOne("dang.dangNo");
	}
	
	// 댕모임 개설
	@Override
	public void createDang(DangDto dangDto) {
		// 공개 / 비공개 여부에 따라 다른 처리를 하도록 설정
		if(dangDto.getDangPrivate() == null) {
			createDangPublic(dangDto);
		} else {
			createDangPrivate(dangDto);
		}
	}

	// 댕모임 개설 (공개)
	@Override
	public void createDangPublic(DangDto dangDto) {
		sqlSession.insert("dang.createPublic", dangDto);
	}

	// 댕모임 개설 (비공개)
	@Override
	public void createDangPrivate(DangDto dangDto) {
		sqlSession.insert("dang.createPrivate", dangDto);
	}

	// 댕모임 프로필 정보 등록
	@Override
	public void insertDangImg(int dangNo, int attachmentNo) {
		Map<String, String> param = new HashMap<>();
		param.put("dangNo", String.valueOf(dangNo));
		param.put("attachmentNo", String.valueOf(attachmentNo));
		sqlSession.insert("dang.insertDangImg", param);
	}

	// 댕모임 수정에 필요한 정보 조회
	@Override
	public DangInfoVO selectDangEditInfo(int dangNo) {
		return sqlSession.selectOne("dang.selectDangEditInfo", dangNo);
	}

	// 댕모임 수정
	@Override
	public boolean editDangInfo(DangInfoVO dangInfoVO) {
		int result;
		if(dangInfoVO.getDangPrivate().equals("Y")) {
			result = sqlSession.update("dang.editDangInfoPrivate", dangInfoVO);
		} else {
			result = sqlSession.update("dang.editDangInfoPublic", dangInfoVO);
		}
		return result > 0;
	}

	// 댕모임 프로필 첨부파일 번호 조회
	@Override
	public int selectDangImg(int dangNo) {
		return sqlSession.selectOne("dang.selectDangImg", dangNo);
	}
}
