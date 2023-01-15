package com.project.dang.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DangListResponseDto {

	private DangInfoDto dangInfo;
	private List<DangHashtagInfoDto> dangHashtag;
}
