package com.project.dang.repository;

import com.project.dang.entity.DangChatDto;
import com.project.dang.entity.RoomDto;

public interface DangChatDao {
	//Room관련
	//등록
	void roomInsert(RoomDto dto);
	
	//조회
	//시퀀스 선발급
	int roomSequence();
	
	
	//DangChat 관련
	//등록
	void chatInsert(DangChatDto dto);
}
