package com.project.dang.repository;

public interface DangReplyDao {
	/**
	 * 내가 쓴 댓글 수
	 * @param memberNo
	 * @return 댓글 수(int)
	 */
	int ReplyWriteCount(int memberNo);
}
