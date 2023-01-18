package com.project.dang.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DangLikeRestRequestDto {

	private Integer userNo;
	private Integer dangNo;
	private Integer isLike;
}
