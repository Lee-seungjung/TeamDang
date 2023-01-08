package com.project.dang.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class DangUserMypageVO {

	private Integer userNo;
	private String userId;
	private String userEmail;
	private String userNick;
	private String userTel;
	private Date userJoindate;
	private Date userLogindate;
	private Integer attachmentNo;
}
