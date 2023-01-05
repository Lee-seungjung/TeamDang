package com.project.dang.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangDto;

@Repository
public class DangDaoImpl implements DangDao {

	@Autowired
	private SqlSession sqlSession;
	
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
}
