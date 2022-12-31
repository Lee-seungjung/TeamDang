package com.project.dang.websocket;

import java.util.Date;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.dang.dto.DangChatDto;
import com.project.dang.repository.DangChatDao;
import com.project.dang.repository.DangMemberDao;
import com.project.dang.vo.channel.ChannelVO;
import com.project.dang.vo.channel.MessageVO;
import com.project.dang.vo.channel.ReceiveVO;
import com.project.dang.vo.channel.UserVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ChatWebSocketServer extends TextWebSocketHandler{
	
	@Autowired
	private DangMemberDao dangMemberDao;
	@Autowired
	private DangChatDao dangChatDao;
	
	//채널
	private ChannelVO channel = new ChannelVO();

	//채팅유저 저장소(set 중복방지)
	private Set<WebSocketSession> users = new CopyOnWriteArraySet<>();
		
	@Override
	public void afterConnectionEstablished(WebSocketSession session)  {
		users.add(session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.debug("message : {}",message);
		log.debug("session : {}",session);

		//사용자 정보 꺼내기 -> 메시지 종류별로 구분하기
		Map<String, Object> attr = session.getAttributes();
		log.debug("attr : {}",attr);
		UserVO user = UserVO.builder()
								.userNo(String.valueOf(attr.get("loginNo")))
								.session(session)
								.build();
		
		//메세지 해석 변환 도구 생성
		ObjectMapper mapper = new ObjectMapper();
		ReceiveVO receiveVO = mapper.readValue(message.getPayload(), ReceiveVO.class);
		log.debug("receiveVO : {}",receiveVO);
		
		if(receiveVO.getType() == 1) {
			//사용자가 입장하려고 하는 경우(방이름을 사용자가 보냄-jsp화면에서 넘겨줬음)
			//- 해당하는 방에 사용자(user)를 입장시킨다
			channel.join(user, receiveVO.getRoom());
		}
		else if(receiveVO.getType() == 2) {
			//사용자가 채팅을 보내는 경우(채팅내용을 사용자가 보냄-jsp화면에서 넘겨줬음)
			//- 해당하는 방의 모든 사용자에게 메세지를 전송
			
			//화면에 뿌려줄 메세지 정보 준비(메시지 내용, 시간)
			MessageVO vo = MessageVO.builder()
					.userNo(user.getUserNo())
					.chatContent(receiveVO.getChatContent())
					.chatDate(new Date())
					.build();
			log.debug("MessageVO : {}",vo);
			log.debug("user : {}",user);
			String payload= mapper.writeValueAsString(vo); //payload 형태로 변경
			TextMessage jsonMessage = new TextMessage(payload); //textmessage에 payload 넣기
			channel.send(user, jsonMessage);
			
			//DB저장 준비
			String memberNick = dangMemberDao.findNick(Integer.parseInt(user.getUserNo()));
			
			//채팅메세지(dang_chat) DB 저장
			DangChatDto dto = DangChatDto.builder()
					.roomNo(receiveVO.getRoom())
					.userNo(Integer.parseInt(user.getUserNo()))
					.memberNick(memberNick)
					.chatType("text")
					.chatContent(vo.getChatContent())
					.chatStatus(1)
					.build();
			dangChatDao.chatInsert(dto);
			
		}

	}
}
	

