package com.project.dang.dto;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class DangUserDetailDto {
	private int userNo;
	private String userId;
	private String userNick;
	private String userEmail;
	private String userTel;
	private String userGender;
	private Date userJoindate;	
	private Date userLogindate;

}
