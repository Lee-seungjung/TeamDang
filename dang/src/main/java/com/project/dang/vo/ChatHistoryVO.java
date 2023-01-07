package com.project.dang.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ChatHistoryVO {
	private int chatNo;
	private int roomNo;
	private int userNo;
	private String memberNick;
	private String chatType;
	private String chatContent;
	private Date chatDate;
	private int chatStatus;
	
	private int attachmentNo; //회원 프로필
	private int imgAttachmentNo; //채팅 이미지
}
