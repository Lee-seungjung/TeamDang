package com.project.dang.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class UserListSearchDto {
	private String type;//컬럼명
	private String keyword;//검색어

	private int p=1;//다른 일 없으면 1페이지부터 보여줌

	private int size=10;//게시글은 10개씩 보여줌
	private int count;//총 게시글 수

	private int blockSize = 10;//무한스크롤 페이징은 어떻게 하는거징..? 최종 갯수가없어서 임의값 줬어요

	public int startRow() {//화면에 보여주는 게시글 처음 번호
		return endRow() - (size - 1);
	}

	public int endRow() {//화면에 보여주는 게시글 마지막 번호
		return p * size;
	}

	public int pageCount() {//총 페이지 개수 구하기
		return (count + size - 1) / size;
	}

	public int startBlock() {
		return (p - 1) / blockSize * blockSize + 1;
	}

	public int endBlock() {
		int value = startBlock() + blockSize - 1;
		return Math.min(value, lastBlock());
	}

	public int prevBlock() {
		return startBlock() - 1;
	}

	public int nextBlock() {
		return endBlock() + 1;
	}

	public int firstBlock() {
		return 1;
	}

	public int lastBlock() {
		return pageCount();
	}

	public boolean isFirst() {
		return p == 1;
	}

	public boolean isLast() {
		return endBlock() == lastBlock();
	}

	public boolean hasPrev() {
		return startBlock() > 1;
	}

	public boolean hasNext() {
		return endBlock() < lastBlock();
	}

}
