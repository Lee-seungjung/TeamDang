package com.project.dang.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DangUserDto {

	// 필드
	private int userNo;
	private String userId;
	private String userPw;
	private String userEmail;
	private String userNick;
	private String userTel;
	private String userGender;
}
