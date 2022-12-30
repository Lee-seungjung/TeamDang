package com.project.dang.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.project.dang.websocket.ChatWebSocketServer;

@Configuration
@EnableWebSocket //웹소켓 활성화-서버에 무리가 많이가기 때문에 어노테이션으로 활성화 시켜야함
public class WebSocketServerConfiguration implements WebSocketConfigurer{
	
	@Autowired
	private ChatWebSocketServer chatWebSocketServer;
	
	@Override
	public void registerWebSocketHandlers(
							WebSocketHandlerRegistry registry) {			
				
		//HttpSessionHandshakeInterceptor는 HttpSession을 WebSocketSession으로 넘겨준다
		registry.addHandler(chatWebSocketServer, "/ws/chat")				
					.addInterceptors(new HttpSessionHandshakeInterceptor())
					.withSockJS();  //SockJS사용
	}
}
