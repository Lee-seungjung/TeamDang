package com.project.dang.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangPuppyDto;

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
}
