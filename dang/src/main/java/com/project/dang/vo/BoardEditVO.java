package com.project.dang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class BoardEditVO {
	private int boardNo;
	private String boardContent;
	private String boardCategory;
}
