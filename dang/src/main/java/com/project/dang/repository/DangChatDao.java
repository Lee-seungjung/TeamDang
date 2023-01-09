package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.ChatImgDto;
import com.project.dang.dto.DangChatDto;
import com.project.dang.dto.RoomDto;
import com.project.dang.vo.ChatHistoryVO;


public interface DangChatDao {
	//Room관련
	/**
	 * room 등록
	 * @param dto
	 */
	void roomInsert(RoomDto dto);
	
	/**
	 * room 시퀀스 조회
	 */
	int roomSequence();
	
	/**
	 * 방번호 조회
	 * @param dangNo
	 * @return roomNo
	 */
	int findRoomNo(int dangNo);
	
	
	//DangChat 관련
	/**
	 * chat 시퀀스 조회
	 */
	int chatSequence();
	
	/**
	 * DangChat 등록
	 * @param dto
	 */
	void chatInsert(DangChatDto dto);
	
	/**
	 * 채팅 내역 기본 10개씩 조회
	 * @param roomNo
	 * @return List<ChatHistoryVO>
	 */
	List<ChatHistoryVO> listAll(int roomNo);
	
	/**
	 * 채팅 내역 무한스크롤 20개씩 조회
	 * @param roomNo, chatNo
	 * @return List<ChatHistoryVO>
	 */
	List<ChatHistoryVO> scrollList(int roomNo, int chatNo);
	
	/**
	 * DangImg 등록
	 * @param ChatImgDto
	 */
	void chatImgInsert(ChatImgDto dto);
}
