package com.project.dang.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangInterestDto;

@Repository
public class DangInterestDaoImpl implements DangInterestDao {

	@Autowired
	private SqlSession sqlSession;

	// 관심지역 등록
	@Override
	public void insertInterest(DangInterestDto dangInterestDto) {
		sqlSession.insert("dangInterest.insert", dangInterestDto);
	}

	// 관심지역 조회
	@Override
	public List<String> selectInterest(int userNo) {
		return sqlSession.selectList("dangInterest.select", userNo);
	}

	// 관심지역 전체 삭제
	@Override
	public boolean deleteInterest(int userNo) {
		int result = sqlSession.delete("dangInterest.delete", userNo);
		return result > 0;
	}
}
