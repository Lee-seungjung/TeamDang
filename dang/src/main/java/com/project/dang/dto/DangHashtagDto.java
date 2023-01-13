package com.project.dang.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DangHashtagDto {

	private Integer hashtagNo;
	private String dangNo;
	private String hashtagContent;
}
