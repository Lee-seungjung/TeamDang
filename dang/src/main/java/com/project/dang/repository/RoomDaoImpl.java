package com.project.dang.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.entity.RoomDto;

@Repository
public class RoomDaoImpl implements RoomDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(RoomDto dto) {
		sqlSession.insert("chat.insert",dto);
	}
	
}
