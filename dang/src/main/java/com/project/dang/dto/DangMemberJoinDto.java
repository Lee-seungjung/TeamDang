package com.project.dang.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@NoArgsConstructor 
@AllArgsConstructor 
@Builder
public class DangMemberJoinDto {

	private Integer memberNo;
	private Integer dangNo;
	private Integer userNo;
	private String memberNick;
	private String memberMessage;
}
