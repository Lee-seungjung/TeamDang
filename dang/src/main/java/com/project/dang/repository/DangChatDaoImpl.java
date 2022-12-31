package com.project.dang.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.entity.DangChatDto;
import com.project.dang.entity.RoomDto;

@Repository
public class DangChatDaoImpl implements DangChatDao{
	
	@Autowired
	private SqlSession sqlSession;

	// room 등록
	@Override
	public void roomInsert(RoomDto dto) {
		sqlSession.insert("chat.roomInsert",dto);
	}

	// room 시퀀스 선발급
	@Override
	public int roomSequence() {
		return sqlSession.selectOne("chat.roomSequence");
	}

	// dang_chat 등록
	@Override
	public void chatInsert(DangChatDto dto) {
		sqlSession.insert("chat.chatInsert",dto);
		
	}
	
}
