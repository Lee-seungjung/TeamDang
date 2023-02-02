package com.project.dang.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class UserListRequestDto {

	private String reportState = "가입자수"; 
	private String type; 
	private String keyword;
	
	// 페이징 관련
	// 1. 현재 페이지의 열(row) 관련
	// 필드
	private int p = 1; // 현재 페이지 번호 (기본값 1)
	private int cntRow = 5; // 한 페이지에 표시할 열 갯수
	
	private int rownumStart;
	private int rownumEnd;
	
	// 메소드
	// - 현재 페이지 열 시작 번호 반환
	public int rownumStart() {
		return (rownumEnd() - cntRow) + 1;
	}
	
	// - 현재 페이지 열 끝 번호 반환
	public int rownumEnd() {
		return p * cntRow;
	}
	
	// 2. 현재 페이지의 페이지 블럭 관련
	// 필드
	private int cntBlock = 5; // 한 페이지에 표시할 페이지 블럭 갯수
	
	// 메소드
	// - 현재 페이지의 페이지 블럭 시작 번호 반환
	public int blockStart() {
		return (p - 1) / cntBlock * cntBlock + 1;
	}
	
	// - 현재 페이지의 페이지 블럭 끝 번호 반환
	public int blockEnd() {
		int value = blockStart() + cntBlock - 1;
		return Math.min(value, blockLast());
	}
	
	// 3. 전체 페이지의 페이지 블럭 관련
	// 필드
	private int total;	// 게시글 총 갯수
	
	// 메소드
	// - 전체 페이지의 첫 페이지 블럭 번호 반환
	public int blockFirst() {
		return 1;
	}
	
	// - 전체 페이지에 대한 페이지 블럭 총 갯수 반환
	public int blockCount() {
		return (total + (cntRow - 1)) / cntRow;
	}
	
	// - 전체 페이지의 마지막 페이지 블럭 번호 반환
	public int blockLast() {
		return blockCount();
	}
	
	// 4. 페이지 이동 관련
	// 메소드
	// - 이전 페이지 블럭 번호 반환
	public int blockPrev() {
		return blockStart() - 1;
	}
	
	// - 다음 페이지 블럭 번호 반환
	public int blockNext() {
		return blockEnd() + 1;
	}
}
