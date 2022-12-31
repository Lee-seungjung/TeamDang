package com.project.dang.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangUserDto;

@Repository
public class DangUserDaoImpl implements DangUserDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int userNo() {
		return sqlSession.selectOne("dangUser.userNo");
	}
	
	@Override
	public void join(DangUserDto dangUserDto) {
		sqlSession.insert("dangUser.join", dangUserDto);
	}
}
