package com.project.dang.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class DangBoardLikeDto {
	private int boardNo;
	private int memberNo;
}
