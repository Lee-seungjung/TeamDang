package com.project.dang.dto;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MemberListDto {
	private int dangNo;
	private String dangName;
	private String memberNick;
	private String userId;
	private String memberGrade;
	private int memberScore;
	private Date memberJoindate;

}
