package com.project.dang.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class BoardInsertVO {
	private int boardNo;
	private int memberNo;
	private int dangNo;
	private String memberNick;
	private String boardContent;
	private String boardCategory;
}
