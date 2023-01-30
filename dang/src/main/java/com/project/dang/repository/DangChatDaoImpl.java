package com.project.dang.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.ChatImgDto;
import com.project.dang.dto.DangChatDto;
import com.project.dang.dto.RoomDto;
import com.project.dang.vo.ChatHistoryVO;

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
	
	//dang_chat 시퀀스 조회
	@Override
	public int chatSequence() {
		return sqlSession.selectOne("chat.chatSequence");
	}

	// dang_chat 등록
	@Override
	public void chatInsert(DangChatDto dto) {
		sqlSession.insert("chat.chatInsert",dto);
		
	}

	//채팅 내역 기본 20개씩 조회
	@Override
	public List<ChatHistoryVO> listAll(int roomNo) {
		return sqlSession.selectList("chat.chatHistory", roomNo);
	}
	
	//채팅 내역 무한스크롤 20개씩 조회
	@Override
	public List<ChatHistoryVO> scrollList(int roomNo, int chatNo) {
		Map<String, Integer> param = new HashMap<>();
		param.put("roomNo", roomNo);
		param.put("chatNo", chatNo);
		return sqlSession.selectList("chat.scrollHistory", param);
	}

	//채팅 이미지 테이블 등록
	@Override
	public void chatImgInsert(ChatImgDto dto) {
		sqlSession.insert("chat.imgInsert",dto);
	}

	//기존 채팅 내역 닉네임 변경
	@Override
	public boolean updateNick(DangChatDto dto) {
		return sqlSession.insert("chat.updateNick",dto)>0;
	}

	//탈퇴한 회원의 채팅내역 삭제
	@Override
	public boolean deleteChatList(int roomNo, int userNo) {
		Map<String, Integer> param = new HashMap<>();
		param.put("roomNo", roomNo);
		param.put("userNo", userNo);
		return sqlSession.delete("chat.deleteChatList",param)>0;
	}

	

	
	
}
