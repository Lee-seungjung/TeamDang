package com.project.dang.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangPuppyDto;
import com.project.dang.dto.DangPuppyInfoDto;
import com.project.dang.dto.DangPuppyListDto;

@Repository
public class DangPuppyDaoImpl implements DangPuppyDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 댕댕이 번호 반환
	@Override
	public int puppyNo() {
		return sqlSession.selectOne("dangPuppy.puppyNo");
	}

	// 댕댕이 정보 등록
	@Override
	public void insertPuppy(DangPuppyDto dangPuppyDto) {
		sqlSession.insert("dangPuppy.insertPuppy", dangPuppyDto);
	}

	// 댕댕이 특이사항 등록
	@Override
	public void insertPuppyCharacter(int puppyNo, String characterContent) {
		Map<String, String> param = new HashMap<>();
		param.put("puppyNo", String.valueOf(puppyNo));
		param.put("characterContent", characterContent);
		sqlSession.insert("dangPuppy.insertPuppyCharacter", param);
	}

	// 댕댕이 프로필 이미지 정보 등록
	@Override
	public void insertPuppyImg(int puppyNo, int attachmentNo) {
		Map<String, String> param = new HashMap<>();
		param.put("puppyNo", String.valueOf(puppyNo));
		param.put("attachmentNo", String.valueOf(attachmentNo));
		sqlSession.insert("dangPuppy.insertPuppyImg", param);
	}

	// 특정 회원의 댕댕이 목록
	@Override
	public List<DangPuppyListDto> selectPuppyList(int userNo) {
		return sqlSession.selectList("dangPuppy.selectPuppyList", userNo);
	}

	// 댕댕이 정보 변경
	@Override
	public boolean updatePuppy(DangPuppyInfoDto dangPuppyInfoDto) {
		return sqlSession.update("dangPuppy.updatePuppy", dangPuppyInfoDto) > 0;
	}

	// 댕댕이 특이사항 삭제
	@Override
	public boolean deletePuppyCharacter(int puppyNo) {
		return sqlSession.delete("dangPuppy.deletePuppyCharacter", puppyNo) > 0;
	}

	// 댕댕이 첨부파일 번호 조회
	@Override
	public Integer findPuppyImgNo(int puppyNo) {
		return sqlSession.selectOne("dangPuppy.findPuppyImg", puppyNo);
	}

	// 댕댕이 정보 삭제
	@Override
	public boolean deletePuppy(int puppyNo) {
		return sqlSession.delete("dangPuppy.deletePuppy", puppyNo) > 0;
	}

	@Override
	public int dangCount() {
		return sqlSession.selectOne("dangPuppy.dangCount");
	}
}
