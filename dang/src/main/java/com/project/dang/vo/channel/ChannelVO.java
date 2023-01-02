package com.project.dang.vo.channel;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.TextMessage;

/*
 * 채팅방 전체를 관리하는 채널 클래스(제일 상위)
 */

public class ChannelVO {
	//방들을 이름으로 관리할 수 있는 저장소- Map으로 구현(그냥 Map은 동기화가 안됨)
	
	Map<Integer, RoomOneVO> rooms = Collections.synchronizedMap(new HashMap<>());

	//입장 - 누가, 어느 방(번호 no)에 
	public void join(UserVO user, int roomNo) { 
		if(!rooms.containsKey(roomNo)) {//방이 없으면
			rooms.put(roomNo, new RoomOneVO());//방을 만든다
		}
		rooms.get(roomNo).enter(user); //유저 입장		
	}
	
	
	
	//검색(해당회원이 어느방에 있는지 방번호 검색)
	public int find(UserVO user) {
		for(int roomNo : rooms.keySet()) {//모든 방을 반복해서 뒤져서
			RoomOneVO room = rooms.get(roomNo);//방 하나를 꺼냄
			if(room.search(user.getUserNo()) != null) {//방에 해당 사용자가 있으면
				return roomNo;
			}
		}
		return 0;
	}
	
	//퇴장
	public void exit(UserVO user) {
		int roomNo = this.find(user);
		if(roomNo == 0) return;
		rooms.get(roomNo).leave(user); //방을 나감
		
		if(rooms.get(roomNo).size() == 0) { //방이 비었으면 삭제
			rooms.remove(roomNo);
		}
	}
	
	//방에 메세지를 전송하는 기능
	//- (방 또는 사용자) 와 메세지를 알아야 한다
	public void send(UserVO user, TextMessage message) throws IOException {
		int roomNo = this.find(user);
		if(roomNo != 0) {
			//System.out.println("message : "+message);
			rooms.get(roomNo).sendAll(message);
		}
	}
	
	//해당방의 인원수
	public int roomSize(int roomNo) {
		return rooms.size();
	}
}
