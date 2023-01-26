package com.project.dang.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class MemberListVO {
	private int memberNo;
	private String memberNick;
	private String memberMessage;
	private String memberOwner;
	private Integer attachmentNo;
}
