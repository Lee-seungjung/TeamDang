package com.project.dang.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DangMemberDaoImpl implements DangMemberDao{
	
	@Autowired
	private SqlSession sqlSession;

	// 댕모임 닉네임 찾기
	@Override
	public String findNick(int userNo) {
		return sqlSession.selectOne("dangMember.findNick",userNo);
	}

}
