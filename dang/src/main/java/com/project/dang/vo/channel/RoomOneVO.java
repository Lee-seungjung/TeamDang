package com.project.dang.vo.channel;

import java.io.IOException;
import java.sql.Date;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 채팅방 클래스
 * - 사용자(UserVO)를 저장할 수 있도록 구성
 * - 입장, 퇴장, 검색, 메세지 기능 필요
 */
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class RoomOneVO {

	//저장소 준비(set) 중복x
	private Set<UserVO> users = new CopyOnWriteArraySet<>();
	
	//채팅방 입장
	public void enter(UserVO user) {
		users.add(user);
	}
	
	//채팅방 퇴장
	public void leave(UserVO user) {
		users.remove(user);
	}
	
	//채팅방 회원검색
	public UserVO search(String userNo) {
		for(UserVO user : users) {
			//User 메소드 사용(채팅방에 해당회원이 있는지 검색 후 있으면 회원 반환)
			if(user.is(userNo)) return user;
		}
		return null;
	}
	
	//채팅방에 있는 사람들 전체에게 메세지 전송
	public void sendAll(TextMessage message) throws IOException {
		for(UserVO user : users) {
			user.send(message);
		}
	}
	
	//(+채팅방 인원 수)
	public int size() {
		return users.size();
	}
	
}
