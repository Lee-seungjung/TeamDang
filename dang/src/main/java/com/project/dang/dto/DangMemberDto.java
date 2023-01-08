package com.project.dang.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@NoArgsConstructor 
@AllArgsConstructor 
@Builder
public class DangMemberDto {
	private int memberNo;
	private int dangNo;
	private int userNo;
	private String memberNick;
	private String memberGrade;
	private int memberScore;
	private Date memberJoinDate;
	private String memberOwner;
	private String memberMessage;

}
