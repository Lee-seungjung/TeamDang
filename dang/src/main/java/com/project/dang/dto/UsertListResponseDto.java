package com.project.dang.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class UsertListResponseDto {

	List<DangUserListDto> userList;
	
	private Integer blockStart;
	private Integer blockEnd;
	private Integer blockPrev;
	private Integer blockNext;
	private Integer blockFirst;
	private Integer blockLast;
}
