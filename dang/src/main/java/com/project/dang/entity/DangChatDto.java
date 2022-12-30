package com.project.dang.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class DangChatDto {
	private int chatNo;
	private int roomNo;
	private int userNo;
	private String memberNick;
	private String chatType;
	private String chatContent;
	private Date chatDate;
	private int chatStatus;
	
}
