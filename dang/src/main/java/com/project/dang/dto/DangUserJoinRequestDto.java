package com.project.dang.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DangUserJoinRequestDto {

	private Integer userNo;
	
	// 페이징 관련
	// 1. 현재 페이지의 열(row) 관련
	// 필드
	private Integer p = 1; // 현재 페이지 번호 (기본값 1)
	private int cnt = 4; // 한 페이지에 표시할 열 갯수
	
	// 메소드
	// - 현재 페이지 열 시작 번호 반환
	public int rownumStart() {
		// ex) 한 페이지에 10개의 열을 표시할 때 
		// 3페이지의 열 시작 번호는 (끝 번호 - 열 표시 갯수) + 1 = 21
		return (rownumEnd() - cnt) + 1;
	}
	
	// - 현재 페이지 열 끝 번호 반환
	public int rownumEnd() {
		// ex) 한 페이지에 10개의 열을 표시할 때 
		// 3페이지의 열 끝 번호는 3 * 10 = 30
		return p * cnt;
	}
	
	// 2. 현재 페이지의 페이지 블럭 관련
	// 필드
	private int cntBlock = 10; // 한 페이지에 표시할 페이지 블럭 갯수
	
	// 메소드
	// - 현재 페이지의 페이지 블럭 시작 번호 반환
	public int blockStart() {
		// ex) 한 페이지에 10개의 페이지 블럭을 표시할 때
		// 3페이지의 페이지 블럭 시작 번호는 (3 - 1) / 10 * 10 + 1 = 1이므로 1번부터 시작
		// 30페이지의 페이지 블럭 시작 번호는 (30 - 1) / 10 * 10 + 1 = 21이므로 21번부터 시작
		return (p - 1) / cntBlock * cntBlock + 1;
	}
	
	// - 현재 페이지의 페이지 블럭 끝 번호 반환
	public int blockEnd() {
		// ex) 한 페이지에 10개의 페이지 블럭을 표시할 때 전체 페이지의 페이지 블럭 총 갯수가 63개이면 총 게시글 갯수는 630개
		// 60번 이하의 페이지 블럭에서는 문제가 없지만 그 다음 10개의 페이지 블럭을 표시할 때 문제 발생
		// 62번 페이지 블럭에 대하여 
		// value = ((62 - 1) / 10 * 10 + 1) + 10 - 1 = 70과
		// blockLast()의 반환값인 (630 + (10 - 1)) / 10 = 63 둘 중 작은 값을 페이지 블럭 끝 번호로 해야 한다
		int value = blockStart() + cntBlock - 1;
		return Math.min(value, blockLast());
	}
	
	// 3. 전체 페이지의 페이지 블럭 관련
	// 필드
	private int total;	// 게시글 총 갯수
	
	// 메소드
	// - 전체 페이지의 첫 페이지 블럭 번호 반환
	public int blockFirst() {
		// 전체 페이지에 대한 첫 페이지 블럭 번호는 1번으로 한다
		return 1;
	}
	
	// - 전체 페이지에 대한 페이지 블럭 총 갯수 반환
	public int blockCount() {
		// ex) 총 게시글의 갯수가 630개일 때 페이지 블럭의 총 갯수 (630 + (10 - 1)) / 10 = 63개
		return (total + (cnt - 1)) / cnt;
	}
	
	// - 전체 페이지의 마지막 페이지 블럭 번호 반환
	public int blockLast() {
		// ex) 총 게시글의 갯수가 630개일 때 마지막 페이지 블럭 번호 (630 + (10 - 1)) / 10 = 63이므로
		// 전체 페이지에 대한 페이지 블록은 1번부터 63번까지 존재
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
	
	// - 현재 페이지 블럭이 전체 페이지의 첫 페이지 블럭인지 여부 반환
	public boolean isFirst() {
		return p == 1;
	}
	
	// - 현재 페이지 블럭이 전체 페이지의 마지막 페이지 블럭인지 여부 반환
	public boolean isLast() {
		return blockEnd() == blockLast();
	}
	
	// - 이전 페이지 블럭 번호 존재 여부 반환
	public boolean hasPrev() {
		// 현재 페이지의 페이지 블럭 시작 번호가 1(전체 페이지의 첫 페이지 블럭 번호)보다 크면 반드시 이전 페이지가 존재하므로 true 반환
		return blockStart() > 1;
	}
	
	// - 다음 페이지 블럭 번호 존재 여부 반환
	public boolean hasNext() {
		// 현재 페이지의 페이지 블럭 끝 번호가 blockLast()의 반환값(전체 페이지의 끝 페이지 블럭 번호)보다 작으면 반드시 다음 페이지가 존재하므로 true 반환
		return blockEnd() < blockLast();
	}
}
