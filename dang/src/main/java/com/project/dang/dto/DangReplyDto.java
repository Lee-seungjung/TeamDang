package com.project.dang.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class DangReplyDto {
	private int replyNo;
	private int boardNo;
	private int memberNo;
	private String replyContent;
	private Date replyWriteDate;
	private Date replyUpdateDate;
	private String replyState;
}
