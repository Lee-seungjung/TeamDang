package com.project.dang.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DangLikeDaoImpl implements DangLikeDao {

	@Autowired
	private SqlSession sqlSession;

	// 댕모임 좋아요 등록
	@Override
	public Integer insertDangLike(int userNo, int dangNo) {
		Map<String, String> param = new HashMap<>();
		param.put("userNo", String.valueOf(userNo));
		param.put("dangNo", String.valueOf(dangNo));
		sqlSession.insert("dangLike.insert", param);
		return 1; // 좋아요 취소 상태를 반환
	}

	// 댕모임 좋아요 취소
	@Override
	public Integer deleteDangLike(int userNo, int dangNo) {
		Map<String, String> param = new HashMap<>();
		param.put("userNo", String.valueOf(userNo));
		param.put("dangNo", String.valueOf(dangNo));
		sqlSession.delete("dangLike.delete", param);
		return 0; // 좋아요 상태를 반환
	}
	
	// 특정 댕모임의 좋아요 갯수
	@Override
	public int countDangLike(int dangNo) {
		return sqlSession.selectOne("dangLike.countDangLike", dangNo);
	}

	// 회원이 좋아요 한 댕모임 조회
	@Override
	public List<Integer> selectDangLike(int userNo) {
		return sqlSession.selectList("dangLike.select", userNo);
	}
}
