package com.project.dang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class JoinMemberVO {
	private int userNo;
	private int attachmentNo;
	private int memberNo;
	private int dangNo;
	private int scheduleNo;
	private String memberNick;

}
