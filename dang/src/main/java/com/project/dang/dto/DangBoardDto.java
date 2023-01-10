package com.project.dang.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class DangBoardDto {
	private int boardNo;
	private int memberNo;
	private int dangNo;
	private String memberNick;
	private String boardContent;
	private int boardLike;
	private Date boardWriteDate;
	private Date boardUpdateDate;
	private String boardState;
	private String boardCategory;
}
