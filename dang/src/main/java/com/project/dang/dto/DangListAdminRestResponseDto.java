package com.project.dang.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DangListAdminRestResponseDto {
	
	private List<DangListAdminDto> dangListAdmin;
	private Integer blockStart;
	private Integer blockEnd;
	private Integer blockPrev;
	private Integer blockNext;
	private Integer blockFirst;
	private Integer blockLast; 
}
