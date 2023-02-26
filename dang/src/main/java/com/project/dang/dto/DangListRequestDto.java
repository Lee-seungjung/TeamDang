package com.project.dang.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DangListRequestDto {
	// 좋아요 표시용 필드
	private Integer userNo;

	// 검색용 필드
	private String searchName;
	private List<String> searchArea;
	
	// 정렬용 필드
	private String sort = "dang_like desc, dang_head desc";
	
	// 페이징용 필드
	private Integer p = 1;
	private Integer cnt = 6;
	
	// - 마지막 페이지 블럭을 구하기 위한 게시글 총 수
	private int total;
	
	// 페이징용 메소드 결과 필드
	private Integer rownumStart = this.rownumStart();
	private Integer rownumEnd = this.rownumEnd();
	private Integer blockLast = this.blockLast();
	
	// 페이징용 메소드
	// - 표시할 열 시작 번호
	public int rownumStart() {
		return (rownumEnd() - cnt) + 1;
	}
	
	// - 표시할 열 끝 번호
	public int rownumEnd() {
		return p * cnt;
	}
	
	// - 마지막 페이지 블럭
	public int blockLast() {
		return (total + (cnt - 1)) / cnt;
	}
}
