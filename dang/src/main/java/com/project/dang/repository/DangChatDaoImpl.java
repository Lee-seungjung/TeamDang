package com.project.dang.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangChatDto;
import com.project.dang.dto.RoomDto;

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
	
	//방번호 조회
	@Override
	public int findRoomNo(int dangNo) {
		return sqlSession.selectOne("chat.findRoomNo",dangNo);
	}

	// dang_chat 등록
	@Override
	public void chatInsert(DangChatDto dto) {
		sqlSession.insert("chat.chatInsert",dto);
		
	}

	
	
}
