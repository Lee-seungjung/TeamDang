package com.project.dang.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.vo.DangLikeVO;

@Repository
public class DangLikeDaoImpl implements DangLikeDao {

	@Autowired
	private SqlSession sqlSession;

	// 댕모임 좋아요 등록
	@Override
	public void insertDangLike(DangLikeVO dangLikeVO) {
		sqlSession.insert("dangLike.insert", dangLikeVO);
	}

	// 댕모임 좋아요 취소
	@Override
	public boolean deleteDangLike(DangLikeVO dangLikeVO) {
		int result = sqlSession.insert("dangLike.delete", dangLikeVO);
		return result > 0;
	}

	// 회원이 좋아요 한 댕모임 조회
	@Override
	public List<Integer> selectDangLike(int userNo) {
		return sqlSession.selectList("dangLike.select", userNo);
	}
	
	
}
