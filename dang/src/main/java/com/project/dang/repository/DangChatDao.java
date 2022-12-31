package com.project.dang.repository;

import com.project.dang.dto.DangChatDto;
import com.project.dang.dto.RoomDto;


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
	 * DangChat 등록
	 * @param dto
	 */
	void chatInsert(DangChatDto dto);
}
