package com.project.dang.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ReplyHistoryVO {
	private int replyNo;
	private int boardNo;
	private int memberNo;
	private String replyContent;
	private Date replyWriteDate;
	private Date replyUpdateDate;
	private String replyState;
	private String memberNick; //댓글 작성자
	private String boardMemberNick; //게시글 작성자
	private String memberOwner; //방장 여부
	private Integer attachmentNo; //댓글 작성자 프로필사진	
	
}
