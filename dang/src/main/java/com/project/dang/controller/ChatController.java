package com.project.dang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	@RequestMapping("/chat")
	public String chat() {
		return "chat-test";
	}
	
	@RequestMapping("/chat2")
	public String chat2() {
		return "chat-test2";
	}

}
