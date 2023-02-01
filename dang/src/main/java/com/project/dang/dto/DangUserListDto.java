package com.project.dang.dto;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class DangUserListDto {
	private int userNo;
	private String userId;
	private String userNick;
	private Date userJoindate;	

}
