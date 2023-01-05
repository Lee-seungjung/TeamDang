package com.project.dang.repository;

import com.project.dang.dto.AttachmentDto;

public interface AttachmentDao {

	/**
	 * 파일번호 선발급
	 * @return attachmentNo
	 */
	int sequence();
	
	/**
	 * 파일 등록
	 * @param AttachmentDto
	 */
	void insert(AttachmentDto dto);
	
	/**
	 * 단일 조회
	 * @param attachmentNo
	 * @return AttachmentDto
	 */
	AttachmentDto selectOne(int attachmentNo);
	
	/**
	 * 파일 삭제
	 * @param attachmentNo
	 * @return true 또는 false
	 */
	boolean delete(int attachmentNo);
	
	
}
