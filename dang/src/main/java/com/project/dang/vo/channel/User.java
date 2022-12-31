package com.project.dang.vo.channel;

import java.io.IOException;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 사용자 1명의 정보를 저장하는 클래스
 * - 사용자에게 메세지를 보내는 기능
 */
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class User {
	//변수
	private String userNo; //일반 회원 번호
	private String memberNick; //댕모임 회원 닉네임
	private WebSocketSession session; //웹소켓 세션
	
	//매개변수 userNo와 User의 userNo가 일치하는지 검사
	public boolean is(String userNo) {
		if(userNo == null) return false;
		if(this.userNo ==null) return false;
		return this.userNo.equals(userNo);
	}
	
	//메세지  보내는 기능
	public void send(TextMessage message) throws IOException {
		session.sendMessage(message);
	}
}
