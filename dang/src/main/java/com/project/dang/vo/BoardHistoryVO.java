package com.project.dang.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class BoardHistoryVO {
	// 필요한 정보!!!
	//1. 댕모임 게시글 전체
	//2. 작성자 회원 방장 여부
	//3. 작성자 회원 프로필사진(user_img)
	//4. 게시글 첨부파일 수
	//5. 게시글 댓글 수
	
	private int boardNo;
	private int memberNo;
	private String boardContent;
	private int boardLike;
	private Date boardWriteDate;
	private Date boardUpdateDate;
	private String boardState;
	private String boardCategory;
	private int dangNo;
	private String memberNick;
	
	private String memberOwner; //방장여부
	private Integer attachmentNo; //프로필사진
	private Integer boardAttachmentCnt; //게시글 첨부파일 개수
	private Integer replyCnt; //댓글수
	
	//private Integer boardAttachmentNo; //게시글 첨부파일
	
	
	
}
