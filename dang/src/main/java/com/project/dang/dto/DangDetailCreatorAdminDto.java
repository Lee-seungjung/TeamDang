package com.project.dang.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DangDetailCreatorAdminDto {

	private Integer memberNo;
	private String memberNick;
	private String memberGrade;
	private Integer memberScore;
	private Integer userNo;
	private String userId;
	private	String userEmail;
	private String userTel;
	private String userGender;
	private Date userJoindate;
	private Date userLogindate;
	private Integer attachmentNo;
}
